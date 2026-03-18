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
        $location = EmployeeLocation::where('user_id', $user->id)->latest('id')->first();
        
        return view('dashboard', compact('user', 'location'));
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
    public function reuse(EmployeeLocation $location)
    {
        $user = Auth::user();
        
        // Admin can reuse for any employee, User can only reuse their own
        if (!$user->is_admin && $location->user_id !== $user->id) {
            return response()->json(['status' => 'error', 'message' => 'Unauthorized'], 403);
        }

        $newLocation = $location->replicate();
        $newLocation->recorded_at = now();
        $newLocation->save();

        return response()->json([
            'status' => 'success',
            'message' => 'Location reused successfully.'
        ]);
    }
}
