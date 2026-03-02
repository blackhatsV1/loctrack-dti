<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Create admin user
        User::firstOrCreate(
            ['email' => 'admin@dti6.gov.ph'],
            [
                'name' => 'DTI6 Admin',
                'password' => Hash::make('admin123'),
                'is_admin' => true,
            ]
        );

        // Import employees from Google My Maps KML
        $this->call(EmployeeLocationSeeder::class);
    }
}
