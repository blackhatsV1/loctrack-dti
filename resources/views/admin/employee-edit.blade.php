@extends('layouts.app')

@section('styles')
<style>
    .form-group {
        margin-bottom: 1.25rem;
    }
    .form-group label {
        display: block;
        margin-bottom: 0.4rem;
        color: var(--text-muted);
        font-size: 0.85rem;
        font-weight: 400;
    }
    .form-group input, .form-group select {
        width: 100%;
        padding: 0.65rem 1rem;
        border-radius: 0.5rem;
        background: rgba(0,0,0,0.25);
        border: 1px solid var(--glass-border);
        color: white;
        font-size: 0.9rem;
        font-family: 'Outfit', sans-serif;
    }
    .form-group input:focus {
        outline: none;
        border-color: var(--primary);
        box-shadow: 0 0 0 2px rgba(99,102,241,0.2);
    }
    .form-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 0 1.5rem;
    }
    .form-actions {
        display: flex;
        gap: 1rem;
        margin-top: 1.5rem;
    }
    .btn-secondary {
        background: rgba(255,255,255,0.1);
        border: 1px solid var(--glass-border);
    }
    .btn-secondary:hover {
        background: rgba(255,255,255,0.15);
        box-shadow: none;
        transform: none;
    }
    @media (max-width: 768px) {
        .form-grid {
            grid-template-columns: 1fr;
        }
        .form-actions {
            flex-direction: column;
        }
    }
</style>
@endsection

@section('content')
<div class="animate-fade-in" style="max-width: 700px; margin: 0 auto;">
    <div style="margin-bottom: 2rem;">
        <a href="{{ route('admin.employees') }}" style="color: var(--text-muted); text-decoration: none; font-size: 0.85rem;">&larr; Back to Employees</a>
    </div>

    <h1 style="font-size: 1.75rem; margin-bottom: 0.5rem;">Edit Employee</h1>
    <p style="color: var(--text-muted); margin-bottom: 2rem;">Update details for <strong>{{ $user->name }}</strong></p>

    <div class="glass-card">
        <form method="POST" action="{{ route('admin.employees.update', $user) }}">
            @csrf
            @method('PUT')

            <div class="form-grid">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="name" value="{{ old('name', $user->name) }}" required>
                    @error('name') <small style="color: #f43f5e;">{{ $message }}</small> @enderror
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" value="{{ old('email', $user->email) }}" required>
                    @error('email') <small style="color: #f43f5e;">{{ $message }}</small> @enderror
                </div>

                <div class="form-group">
                    <label>Employee ID No.</label>
                    <input type="text" name="employee_id_no" value="{{ old('employee_id_no', $location->employee_id_no ?? '') }}">
                </div>

                <div class="form-group">
                    <label>Employee Type</label>
                    <input type="text" name="employee_type" value="{{ old('employee_type', $location->employee_type ?? '') }}">
                </div>
            </div>

            <div class="form-group">
                <label>Address</label>
                <input type="text" name="address" value="{{ old('address', $location->address ?? '') }}">
            </div>

            <div class="form-grid">
                <div class="form-group">
                    <label>Mobile No.</label>
                    <input type="text" name="mobile_no" value="{{ old('mobile_no', $location->mobile_no ?? '') }}">
                </div>

                <div class="form-group">
                    <label>Office</label>
                    <input type="text" name="office" value="{{ old('office', $location->office ?? '') }}">
                </div>

                <div class="form-group">
                    <label>Latitude</label>
                    <input type="number" step="any" name="latitude" value="{{ old('latitude', $location->latitude ?? '') }}">
                </div>

                <div class="form-group">
                    <label>Longitude</label>
                    <input type="number" step="any" name="longitude" value="{{ old('longitude', $location->longitude ?? '') }}">
                </div>
            </div>

            <div class="form-actions">
                <button type="submit">Save Changes</button>
                <a href="{{ route('admin.employees') }}" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>
@endsection
