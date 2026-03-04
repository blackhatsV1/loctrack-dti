<?php

namespace App\Http\Controllers;

use App\Models\EmployeeLocation;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    /**
     * List all employees (non-admin users).
     */
    public function index(Request $request)
    {
        $query = User::where('is_admin', false);

        if ($search = $request->input('search')) {
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                  ->orWhere('email', 'like', "%{$search}%");
            });
        }

        if ($office = $request->input('office')) {
            $query->whereHas('locations', function ($q) use ($office) {
                $q->where('office', $office);
            });
        }

        $employees = $query->with(['locations' => function ($q) {
            $q->latest('id')->limit(1);
        }])
        ->orderByRaw('id = ? DESC', [auth()->id()])
        ->orderBy('name')
        ->paginate(20);

        // Get unique offices for filter dropdown
        $offices = EmployeeLocation::select('office')
            ->distinct()
            ->whereNotNull('office')
            ->orderBy('office')
            ->pluck('office');

        return view('admin.employees', compact('employees', 'offices'));
    }

    /**
     * Show edit form for an employee.
     */
    public function edit(User $user)
    {
        $location = EmployeeLocation::where('user_id', $user->id)->latest('id')->first();
        return view('admin.employee-edit', compact('user', 'location'));
    }

    /**
     * Update employee details.
     */
    public function update(Request $request, User $user)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email,' . $user->id,
            'address' => 'nullable|string|max:500',
            'mobile_no' => 'nullable|string|max:100',
            'office' => 'nullable|string|max:255',
            'employee_id_no' => 'nullable|string|max:50',
            'employee_type' => 'nullable|string|max:50',
            'latitude' => 'nullable|numeric',
            'longitude' => 'nullable|numeric',
        ]);

        // Update user
        $user->update([
            'name' => $request->name,
            'email' => $request->email,
        ]);

        // Update or create location record
        $location = EmployeeLocation::where('user_id', $user->id)->latest('id')->first();

        if ($location) {
            $location->update([
                'address' => $request->address,
                'mobile_no' => $request->mobile_no,
                'office' => $request->office,
                'employee_id_no' => $request->employee_id_no,
                'employee_type' => $request->employee_type,
                'latitude' => $request->latitude ?? $location->latitude,
                'longitude' => $request->longitude ?? $location->longitude,
            ]);
        }

        return redirect()->route('admin.employees')->with('success', "Employee '{$user->name}' updated successfully.");
    }

    /**
     * Show location history for an employee.
     */
    public function locationHistory(User $user)
    {
        $locations = EmployeeLocation::where('user_id', $user->id)
            ->orderBy('recorded_at', 'desc')
            ->paginate(25);

        return view('admin.employee-history', compact('user', 'locations'));
    }

    /**
     * Admin dashboard overview.
     */
    public function dashboard()
    {
        $totalEmployees = User::where('is_admin', false)->count();
        \Log::info("Dashboard: Total Employees count in DB: " . $totalEmployees);
        
        $totalLocations = EmployeeLocation::whereHas('user', function($q) {
                $q->where('is_admin', false);
            })
            ->distinct('user_id')
            ->count();
        $recentUpdatesCount = EmployeeLocation::whereHas('user', function($q) {
                $q->where('is_admin', false);
            })
            ->where('recorded_at', '>=', now()->subDay())
            ->count();
        
        // Get latest location for each non-admin user
        // Using a more efficient join-based approach for "latest per group"
        $latestLocations = EmployeeLocation::whereHas('user', function($q) {
                $q->where('is_admin', false);
            })
            ->with('user')
            ->join(
                \DB::raw('(select max(id) as max_id from employee_locations group by user_id) as latest'),
                'employee_locations.id', '=', 'latest.max_id'
            )
            ->get();

        $offices = $latestLocations->pluck('office')->unique()->filter()->values();
        $totalOffices = $offices->count();

        // Data for Office Distribution Chart (Non-Admins only)
        $officeDistribution = $latestLocations->groupBy('office')
            ->map(function($group) {
                return $group->count();
            })
            ->filter(function($count, $office) {
                return !empty($office);
            });

        // Data for Employee Type Distribution Chart (Non-Admins only)
        $typeDistribution = $latestLocations->groupBy('employee_type')
            ->map(function($group) {
                return $group->count();
            })
            ->filter(function($count, $type) {
                return !empty($type);
            });

        // Get recent location records for non-admins
        $recentLocations = EmployeeLocation::whereHas('user', function($q) {
                $q->where('is_admin', false);
            })
            ->with('user')
            ->latest('id')
            ->limit(100)
            ->get();

        return view('admin.dashboard', compact(
            'totalEmployees', 
            'totalLocations', 
            'totalOffices', 
            'recentUpdatesCount',
            'latestLocations', 
            'recentLocations',
            'offices',
            'officeDistribution',
            'typeDistribution'
        ));
    }

    /**
     * Update current admin profile.
     */
    public function updateProfile(Request $request)
    {
        $user = auth()->user();

        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email,' . $user->id,
            'password' => 'nullable|string|min:8|confirmed',
        ]);

        $data = [
            'name' => $request->name,
            'email' => $request->email,
        ];

        if ($request->filled('password')) {
            $data['password'] = Hash::make($request->password);
        }

        $user->update($data);

        return back()->with('success', 'Profile updated successfully.');
    }
}
