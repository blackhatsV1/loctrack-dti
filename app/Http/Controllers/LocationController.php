<?php

namespace App\Http\Controllers;

use App\Models\EmployeeLocation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LocationController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'latitude' => 'required|numeric',
            'longitude' => 'required|numeric',
        ]);

        EmployeeLocation::create([
            'user_id' => Auth::id(),
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
            'recorded_at' => now(),
        ]);

        return response()->json(['status' => 'success']);
    }

    public function index()
    {
        // Define admin email to include/exclude
        $adminEmail = 'admin@dti6.gov.ph';
        $adminIds = \App\Models\User::where('is_admin', true)->orWhere('email', $adminEmail)->pluck('id');

        // Get latest location ID for each non-admin user
        $latestLocationIds = EmployeeLocation::whereNotIn('user_id', $adminIds)
            ->selectRaw('MAX(id) as max_id')
            ->groupBy('user_id')
            ->pluck('max_id');

        $locations = EmployeeLocation::whereIn('id', $latestLocationIds)
            ->with('user')
            ->get();

        return response()->json($locations);
    }

    /**
     * Show the employee dashboard.
     */
    public function dashboard()
    {
        $user = Auth::user();
        $homeLocation = EmployeeLocation::where('user_id', $user->id)
            ->where(function ($query) {
                $query->where('type', 'home')
                      ->orWhere(function ($q) {
                          $q->whereNull('type')->whereNotNull('address');
                      });
            })
            ->latest('recorded_at')
            ->first();
            
        $officeLocation = EmployeeLocation::where('user_id', $user->id)
            ->where(function ($query) {
                $query->where('type', 'office')
                      ->orWhere(function ($q) {
                          $q->whereNull('type')->whereNotNull('office');
                      });
            })
            ->latest('recorded_at')
            ->first();

        // Latest overall record for profile info (ID, Mobile, Type, etc.)
        $latestLocation = EmployeeLocation::where('user_id', $user->id)
            ->latest('recorded_at')
            ->first();
        
        // Stats & History for the new "Workforce Geography" style dashboard
        $totalCheckins = EmployeeLocation::where('user_id', $user->id)->count();
        $recentHistory = EmployeeLocation::where('user_id', $user->id)
            ->latest('recorded_at')
            ->take(8)
            ->get();

        // Activity Data (last 7 days)
        $activityData = EmployeeLocation::where('user_id', $user->id)
            ->where('recorded_at', '>=', now()->subDays(7))
            ->selectRaw('DATE_FORMAT(recorded_at, "%b %d") as date, count(*) as count')
            ->groupBy('date')
            ->orderBy('recorded_at')
            ->get()
            ->pluck('count', 'date');

        return view('dashboard', compact(
            'user', 
            'homeLocation', 
            'officeLocation', 
            'latestLocation', 
            'totalCheckins', 
            'recentHistory', 
            'activityData'
        ));
    }

    /**
     * Update employee address (Home or Office).
     */
    public function updateAddress(Request $request)
    {
        $request->validate([
            'address' => 'required|string|max:500',
            'latitude' => 'required|numeric',
            'longitude' => 'required|numeric',
            'type' => 'required|in:home,office',
        ]);

        $user = Auth::user();
        $latest = EmployeeLocation::where('user_id', $user->id)->latest('id')->first();

        $data = [
            'user_id' => $user->id,
            'type' => $request->type,
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
            'recorded_at' => now(),
        ];

        if ($request->type === 'home') {
            $data['address'] = $request->address;
            $data['office'] = $latest ? $latest->office : null;
            $data['employee_id_no'] = $latest ? $latest->employee_id_no : null;
            $data['mobile_no'] = $latest ? $latest->mobile_no : null;
            $data['employee_type'] = $latest ? $latest->employee_type : null;
        } else {
            $data['office'] = $request->address; // Update office location
            $data['address'] = $latest ? $latest->address : null;
            $data['employee_id_no'] = $latest ? $latest->employee_id_no : null;
            $data['mobile_no'] = $latest ? $latest->mobile_no : null;
            $data['employee_type'] = $latest ? $latest->employee_type : null;
        }

        EmployeeLocation::create($data);

        return response()->json([
            'status' => 'success',
            'message' => ucfirst($request->type) . ' address updated successfully.'
        ]);
    }

    /**
     * Show the employee's own location history.
     */
    public function history()
    {
        $user = Auth::user();
        $locations = EmployeeLocation::where('user_id', $user->id)
            ->orderBy('recorded_at', 'desc')
            ->paginate(25);

        return view('history', compact('user', 'locations'));
    }

    /**
     * Reuse a past location to create a new entry.
     */
    public function reuse($id)
    {
        $user = Auth::user();
        $location = EmployeeLocation::find($id);

        if (!$location) {
            return response()->json(['status' => 'error', 'message' => 'Location not found'], 404);
        }
        
        // Admin can reuse for any employee, User can only reuse their own
        if (!$user->is_admin && $location->user_id !== $user->id) {
            return response()->json(['status' => 'error', 'message' => 'Unauthorized'], 403);
        }

        try {
            $newLocation = $location->replicate();
            $newLocation->recorded_at = now();
            $newLocation->save();

            if (request()->expectsJson()) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Location reused successfully.'
                ]);
            }

            return back()->with('success', 'Location reused successfully.');
        } catch (\Exception $e) {
            if (request()->expectsJson()) {
                return response()->json(['status' => 'error', 'message' => 'Database error'], 500);
            }
            return back()->withErrors(['Database error: ' . $e->getMessage()]);
        }
    }

    /**
     * Automatically broadcast current location.
     */
    public function broadcast(Request $request)
    {
        $request->validate([
            'latitude' => 'required|numeric',
            'longitude' => 'required|numeric',
        ]);

        $user = Auth::user();
        $latest = EmployeeLocation::where('user_id', $user->id)->latest('recorded_at')->first();

        EmployeeLocation::create([
            'user_id' => $user->id,
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
            'recorded_at' => now(),
            'address' => $latest?->address,
            'office' => $latest?->office,
            'employee_id_no' => $latest?->employee_id_no,
            'mobile_no' => $latest?->mobile_no,
            'employee_type' => $latest?->employee_type,
            'type' => 'broadcast',
        ]);

        return response()->json(['status' => 'success']);
    }
}
