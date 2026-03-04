<?php

namespace Database\Seeders;

use App\Models\EmployeeLocation;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class EmployeeLocationSeeder extends Seeder
{
    /**
     * Seed the application's database with employee locations from Google My Maps KML.
     *
     * Supports two modes:
     * 1. Local file: Set GOOGLE_MAPS_KML_FILE_PATH in .env to the path of a downloaded KML file.
     * 2. Remote fetch: Set GOOGLE_MAPS_KML_MAP_ID in .env to fetch from Google My Maps.
     *
     * Usage:
     *   php artisan db:seed --class=EmployeeLocationSeeder
     */
    public function run(): void
    {
        $kmlContent = $this->loadKmlContent();

        if ($kmlContent === null) {
            return;
        }

        // Clear existing data before re-seeding (preserve admin users)
        $this->command->info('Clearing existing employee data...');
        EmployeeLocation::query()->delete();
        User::where('is_admin', false)->delete();
        $this->command->info('Existing data cleared.');

        $this->parseAndSeedKml($kmlContent);
    }

    /**
     * Load KML content from local file or remote URL.
     */
    private function loadKmlContent(): ?string
    {
        // Priority 1: Local file
        $localPath = config('services.google_maps.kml_file_path');
        if (!empty($localPath) && file_exists($localPath)) {
            $this->command->info("Reading KML from local file: {$localPath}");
            $content = file_get_contents($localPath);
            if ($content !== false) {
                return $content;
            }
            $this->command->error("Failed to read local KML file: {$localPath}");
        }

        // Priority 2: Remote fetch
        $mapId = config('services.google_maps.kml_map_id');
        if (empty($mapId)) {
            $this->command->error('No KML source configured. Set GOOGLE_MAPS_KML_MAP_ID or GOOGLE_MAPS_KML_FILE_PATH in .env');
            return null;
        }

        $url = "https://www.google.com/maps/d/kml?mid={$mapId}&forcekml=1";
        $this->command->info("Fetching KML data from: {$url}");

        $context = stream_context_create([
            'http' => [
                'timeout' => 60,
                'user_agent' => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36',
            ],
            'ssl' => [
                'verify_peer' => true,
                'verify_peer_name' => true,
            ],
        ]);

        $content = @file_get_contents($url, false, $context);

        if ($content === false) {
            $this->command->error("Failed to fetch KML from URL. Try downloading the file manually:");
            $this->command->info("  1. Open in browser: {$url}");
            $this->command->info("  2. Save the file to: storage/app/kml/dti6_employees.kml");
            $this->command->info("  3. Add to .env: GOOGLE_MAPS_KML_FILE_PATH=storage/app/kml/dti6_employees.kml");
            $this->command->info("  4. Re-run: php artisan db:seed --class=EmployeeLocationSeeder");
            return null;
        }

        return $content;
    }

    /**
     * Parse KML XML and seed the database.
     */
    private function parseAndSeedKml(string $kmlContent): void
    {
        libxml_use_internal_errors(true);

        $xml = simplexml_load_string($kmlContent);

        if ($xml === false) {
            $errors = libxml_get_errors();
            foreach ($errors as $error) {
                $this->command->error("XML Error: {$error->message}");
            }
            libxml_clear_errors();
            return;
        }

        // Register KML namespace
        $xml->registerXPathNamespace('kml', 'http://www.opengis.net/kml/2.2');

        // Find all Placemarks (employees)
        $placemarks = $xml->xpath('//kml:Placemark');

        if (empty($placemarks)) {
            $this->command->warn('No Placemarks found in the KML data.');
            return;
        }

        $this->command->info("Found " . count($placemarks) . " employee placemarks.");

        $created = 0;
        $skipped = 0;

        foreach ($placemarks as $placemark) {
            $name = trim((string)$placemark->name);

            if (empty($name)) {
                $skipped++;
                continue;
            }

            // Extract extended data fields
            $extendedData = [];
            if (isset($placemark->ExtendedData->Data)) {
                foreach ($placemark->ExtendedData->Data as $data) {
                    $key = (string)$data['name'];
                    $value = trim((string)$data->value);
                    $extendedData[$key] = $value;
                }
            }

            // Extract coordinates from Point
            $latitude = null;
            $longitude = null;

            if (isset($placemark->Point->coordinates)) {
                $coords = trim((string)$placemark->Point->coordinates);
                $parts = explode(',', $coords);
                if (count($parts) >= 2) {
                    $longitude = floatval($parts[0]);
                    $latitude = floatval($parts[1]);
                }
            }

            // Fallback to ExtendedData lat/lng
            if ($latitude === null && isset($extendedData['Latitude'])) {
                $latitude = floatval($extendedData['Latitude']);
            }
            if ($longitude === null && isset($extendedData['Longitude'])) {
                $longitude = floatval($extendedData['Longitude']);
            }

            if ($latitude === null || $longitude === null) {
                $this->command->warn("Skipping '{$name}': missing coordinates.");
                $skipped++;
                continue;
            }

            $employeeIdNo = $extendedData['ID NO.'] ?? null;

            // Generate a unique email from the employee name and ID
            $emailSlug = Str::slug($name, '.');
            $email = $emailSlug . ($employeeIdNo ? '.' . Str::slug($employeeIdNo) : '') . '@dti6.gov.ph';

            // Create or find the user
            $user = User::firstOrCreate(
                ['email' => $email],
                [
                    'name' => $name,
                    'password' => Hash::make('dti6-' . Str::random(8)),
                ]
            );

            // Create the employee location record
            EmployeeLocation::updateOrCreate(
                [
                    'user_id' => $user->id,
                    'employee_id_no' => $employeeIdNo,
                ],
                [
                    'address' => $extendedData['Address'] ?? null,
                    'latitude' => $latitude,
                    'longitude' => $longitude,
                    'mobile_no' => $extendedData['Mobile No.'] ?? null,
                    'office' => $extendedData['Office'] ?? null,
                    'employee_type' => $extendedData['Type'] ?? null,
                    'recorded_at' => now(),
                ]
            );

            $created++;
        }

        $this->command->info("Seeding complete: {$created} employees created/updated, {$skipped} skipped.");
    }
}
