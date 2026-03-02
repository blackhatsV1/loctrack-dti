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
        }])->paginate(20);

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
        $totalLocations = EmployeeLocation::count();
        
        // Get all employees (non-admins) with their latest location
        $employees = User::where('is_admin', false)
            ->with(['locations' => function($query) {
                $query->latest('id')->limit(1);
            }])
            ->get();

        $latestLocations = EmployeeLocation::with('user')
            ->whereIn('id', function($query) {
                $query->selectRaw('max(id)')
                    ->from('employee_locations')
                    ->groupBy('user_id');
            })
            ->get();

        $offices = $latestLocations->pluck('office')->unique()->filter()->values();
        $totalOffices = $offices->count();

        // Get recent location records for the "Location Records" table
        $recentLocations = EmployeeLocation::with('user')
            ->latest('id')
            ->limit(100)
            ->get();

        return view('admin.dashboard', compact(
            'totalEmployees', 
            'totalLocations', 
            'totalOffices', 
            'employees',
            'latestLocations', 
            'recentLocations',
            'offices'
        ));
    }
}
