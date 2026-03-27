@extends('layouts.app')

@section('styles')
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
<style>
    .stat-grid {
        display: flex;
        gap: 1.5rem;
        margin-bottom: 2rem;
    }
    
    .stat-card {
        padding: 1.5rem;
        text-align: center;
        transition: all 0.3s ease;
    }
    
    .stat-card:hover {
        transform: translateY(-5px);
        background: rgba(30, 41, 59, 0.85);
    }
    
    .stat-value {
        font-size: 2rem;
        font-weight: 700;
        color: var(--primary);
        margin-bottom: 0.25rem;
    }
    
    .stat-label {
        font-size: 0.85rem;
        color: var(--text-muted);
        text-transform: uppercase;
        letter-spacing: 0.05em;
    }

    .geography-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 1.5rem;
        margin-bottom: 1.5rem;
    }

    .address-column {
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }

    .address-item {
        padding: 1.25rem;
        background: rgba(0, 0, 0, 0.15);
        border: 1px solid var(--glass-border);
        border-radius: 1rem;
        cursor: pointer;
        transition: all 0.2s ease;
        position: relative;
    }

    .address-item:hover {
        background: rgba(99, 102, 241, 0.05);
        border-color: var(--primary);
    }

    .address-item.active {
        background: rgba(99, 102, 241, 0.1);
        border-color: var(--primary);
        box-shadow: 0 0 20px rgba(99, 102, 241, 0.1);
    }

    .address-label {
        font-size: 0.75rem;
        color: var(--primary);
        text-transform: uppercase;
        font-weight: 600;
        margin-bottom: 0.5rem;
        display: block;
    }

    .address-text {
        font-size: 1rem;
        color: var(--text-light);
        line-height: 1.5;
        margin-bottom: 1rem;
    }

    .minimap-container {
        height: 400px;
        width: 100%;
        border-radius: 1.5rem;
        border: 1px solid var(--glass-border);
        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
        background: #111;
        overflow: hidden;
    }

    .analytics-grid {
        display: grid;
        grid-template-columns: 1.2fr 1fr;
        gap: 1.5rem;
        margin-top: 2rem;
    }

    .chart-container {
        height: 300px;
        position: relative;
    }

    .history-table-container {
        max-height: 300px;
        overflow-y: auto;
        border-radius: 1rem;
        background: rgba(0, 0, 0, 0.1);
        border: 1px solid var(--glass-border);
    }

    .data-table {
        width: 100%;
        border-collapse: collapse;
    }

    .data-table th {
        text-align: left;
        padding: 0.75rem 1rem;
        border-bottom: 1px solid var(--glass-border);
        color: var(--text-muted);
        font-size: 0.75rem;
        text-transform: uppercase;
        position: sticky;
        top: 0;
        background: #1e293b;
        z-index: 5;
    }

    .data-table td {
        padding: 0.85rem 1rem;
        border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        font-size: 0.85rem;
    }

    .status-badge {
        font-size: 0.65rem;
        padding: 0.2rem 0.5rem;
        border-radius: 0.5rem;
        text-transform: uppercase;
        font-weight: 700;
    }

    .badge-home { background: rgba(99, 102, 241, 0.1); color: #818cf8; }
    .badge-office { background: rgba(192, 132, 252, 0.1); color: #c084fc; }
    .badge-checkin { background: rgba(16, 185, 129, 0.1); color: #10b981; }

    @media (max-width: 1024px) {
        .analytics-grid { grid-template-columns: 1fr; }
    }

    @media (max-width: 768px) {
        .stat-grid { flex-direction: column; }
        .geography-grid { grid-template-columns: 1fr; }
    }


    .instruction-overlay {
        position: absolute;
        bottom: 2rem;
        left: 50%;
        transform: translateX(-50%);
        background: var(--primary);
        color: white;
        padding: 0.75rem 1.5rem;
        border-radius: 2rem;
        box-shadow: 0 10px 25px rgba(0,0,0,0.5);
        z-index: 1000;
        display: none;
        white-space: nowrap;
        font-weight: 500;
        pointer-events: none;
    }

    /* Profile Card Redesign */
    .profile-header {
        display: flex;
        align-items: center;
        gap: 1.75rem;
        margin-bottom: 2rem;
        padding-bottom: 2rem;
        border-bottom: 1px solid rgba(255, 255, 255, 0.06);
    }

    .profile-avatar {
        width: 90px;
        height: 90px;
        border-radius: 50%;
        background: linear-gradient(135deg, #6366f1, #a855f7, #ec4899);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 2rem;
        font-weight: 700;
        color: white;
        flex-shrink: 0;
        box-shadow: 0 8px 25px rgba(99, 102, 241, 0.35),
                    0 0 0 4px rgba(99, 102, 241, 0.15);
        letter-spacing: 0.05em;
    }

    .profile-header-info h2 {
        font-size: 1.5rem;
        font-weight: 700;
        margin-bottom: 0.3rem;
        letter-spacing: -0.01em;
    }

    .profile-header-info .profile-email {
        font-size: 0.9rem;
        color: var(--text-muted);
        margin-bottom: 0.6rem;
    }

    .profile-role-badge {
        display: inline-flex;
        align-items: center;
        gap: 0.35rem;
        font-size: 0.7rem;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.08em;
        padding: 0.3rem 0.85rem;
        border-radius: 2rem;
        background: rgba(99, 102, 241, 0.12);
        color: #a5b4fc;
        border: 1px solid rgba(99, 102, 241, 0.2);
    }

    .profile-info-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 1rem;
    }

    .profile-info-item {
        display: flex;
        align-items: flex-start;
        gap: 1rem;
        padding: 1.15rem;
        background: rgba(0, 0, 0, 0.15);
        border: 1px solid rgba(255, 255, 255, 0.05);
        border-radius: 1rem;
        transition: all 0.25s ease;
    }

    .profile-info-item:hover {
        background: rgba(99, 102, 241, 0.05);
        border-color: rgba(99, 102, 241, 0.15);
        transform: translateY(-2px);
    }

    .profile-info-icon {
        width: 42px;
        height: 42px;
        border-radius: 0.75rem;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.15rem;
        flex-shrink: 0;
    }

    .profile-info-icon.icon-id {
        background: rgba(99, 102, 241, 0.12);
        color: #818cf8;
    }
    .profile-info-icon.icon-phone {
        background: rgba(16, 185, 129, 0.12);
        color: #34d399;
    }
    .profile-info-icon.icon-office {
        background: rgba(192, 132, 252, 0.12);
        color: #c084fc;
    }
    .profile-info-icon.icon-type {
        background: rgba(251, 191, 36, 0.12);
        color: #fbbf24;
    }

    .profile-info-details {
        display: flex;
        flex-direction: column;
        gap: 0.2rem;
        min-width: 0;
    }

    .profile-info-label {
        font-size: 0.7rem;
        color: var(--text-muted);
        text-transform: uppercase;
        font-weight: 600;
        letter-spacing: 0.06em;
    }

    .profile-info-value {
        font-size: 1rem;
        color: var(--text-light);
        font-weight: 500;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .profile-info-value.empty {
        color: var(--text-muted);
        font-style: italic;
        font-weight: 400;
    }

    /* Profile Edit Form */
    .profile-edit-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 1.25rem;
    }

    .profile-edit-group {
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
    }

    .profile-edit-group label {
        font-size: 0.75rem;
        color: var(--text-muted);
        text-transform: uppercase;
        font-weight: 600;
        letter-spacing: 0.05em;
    }

    .profile-edit-group .form-control {
        background: rgba(0, 0, 0, 0.25);
        border: 1px solid rgba(255, 255, 255, 0.08);
        transition: border-color 0.2s, box-shadow 0.2s;
    }

    .profile-edit-group .form-control:focus {
        border-color: var(--primary);
        box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.15);
    }

    .profile-edit-actions {
        grid-column: 1 / -1;
        display: flex;
        gap: 1rem;
        margin-top: 0.75rem;
    }

    .btn-save-profile {
        flex: 1;
        padding: 0.8rem;
        background: linear-gradient(135deg, #6366f1, #8b5cf6);
        border: none;
        color: white;
        font-weight: 600;
        border-radius: 0.75rem;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .btn-save-profile:hover {
        background: linear-gradient(135deg, #4f46e5, #7c3aed);
        transform: translateY(-2px);
        box-shadow: 0 8px 20px rgba(99, 102, 241, 0.35);
    }

    .btn-cancel-profile {
        flex: 1;
        padding: 0.8rem;
        background: rgba(255, 255, 255, 0.05);
        border: 1px solid rgba(255, 255, 255, 0.1);
        color: var(--text-muted);
        font-weight: 500;
        border-radius: 0.75rem;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .btn-cancel-profile:hover {
        background: rgba(255, 255, 255, 0.08);
        color: var(--text-light);
        transform: none;
        box-shadow: none;
    }

    .btn-edit-profile {
        padding: 0.5rem 1.25rem;
        font-size: 0.8rem;
        background: rgba(99, 102, 241, 0.15);
        color: #a5b4fc;
        border: 1px solid rgba(99, 102, 241, 0.25);
        border-radius: 2rem;
        cursor: pointer;
        transition: all 0.25s ease;
        font-weight: 500;
    }

    .btn-edit-profile:hover {
        background: var(--primary);
        color: white;
        border-color: var(--primary);
        transform: translateY(-1px);
        box-shadow: 0 4px 12px rgba(99, 102, 241, 0.3);
    }

    /* Metadata Section Styles */
    .profile-meta-section {
        margin-top: 2.5rem;
        padding-top: 2rem;
        border-top: 1px solid rgba(255, 255, 255, 0.06);
    }

    .meta-title {
        font-size: 0.85rem;
        color: var(--text-muted);
        text-transform: uppercase;
        font-weight: 700;
        letter-spacing: 0.1em;
        margin-bottom: 1.25rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .profile-meta-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 1.5rem;
    }

    .meta-item {
        display: flex;
        flex-direction: column;
        gap: 0.35rem;
    }

    .meta-label {
        font-size: 0.65rem;
        color: var(--text-muted);
        text-transform: uppercase;
        font-weight: 600;
    }

    .meta-value {
        font-size: 0.9rem;
        color: var(--text-light);
        font-family: monospace;
    }

    .status-pill {
        display: inline-flex;
        align-items: center;
        gap: 0.3rem;
        font-size: 0.6rem;
        font-weight: 700;
        padding: 0.15rem 0.5rem;
        border-radius: 0.4rem;
        text-transform: uppercase;
    }

    .status-verified { background: rgba(16, 185, 129, 0.1); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.2); }
    .status-pending { background: rgba(245, 158, 11, 0.1); color: #f59e0b; border: 1px solid rgba(245, 158, 11, 0.2); }

    .privilege-badge {
        background: linear-gradient(to right, #f43f5e, #fb7185);
        color: white;
        padding: 0.2rem 0.6rem;
        border-radius: 0.4rem;
        font-size: 0.65rem;
        font-weight: 800;
        margin-left: 0.5rem;
    }

    @media (max-width: 768px) {
        .profile-header { flex-direction: column; text-align: center; gap: 1rem; }
        .profile-info-grid { grid-template-columns: 1fr; }
        .profile-edit-grid { grid-template-columns: 1fr; }
        .profile-avatar { width: 72px; height: 72px; font-size: 1.6rem; }
        .profile-meta-grid { grid-template-columns: 1fr; }
    }
    /* Searchable Select */
    .searchable-select {
        position: relative;
    }
    .searchable-select .ss-input {
        width: 100%;
        padding: 0.65rem 2.25rem 0.65rem 1rem;
        border-radius: 0.5rem;
        background: rgba(0,0,0,0.25);
        border: 1px solid rgba(255,255,255,0.08);
        color: white;
        font-size: 0.9rem;
        font-family: 'Outfit', sans-serif;
        cursor: text;
        transition: border-color 0.2s, box-shadow 0.2s;
    }
    .searchable-select .ss-input:focus {
        outline: none;
        border-color: var(--primary);
        box-shadow: 0 0 0 3px rgba(99,102,241,0.15);
    }
    .searchable-select .ss-input.has-value {
        color: #fff;
    }
    .searchable-select .ss-input:not(.has-value)::placeholder {
        color: rgba(255,255,255,0.35);
    }
    .searchable-select .ss-arrow {
        position: absolute;
        right: 0.75rem;
        top: 50%;
        transform: translateY(-50%);
        pointer-events: none;
        color: rgba(255,255,255,0.4);
        font-size: 0.65rem;
        transition: transform 0.2s;
    }
    .searchable-select.open .ss-arrow {
        transform: translateY(-50%) rotate(180deg);
    }
    .searchable-select .ss-dropdown {
        display: none;
        position: absolute;
        top: calc(100% + 4px);
        left: 0;
        right: 0;
        max-height: 200px;
        overflow-y: auto;
        background: rgba(15,15,30,0.97);
        border: 1px solid var(--glass-border);
        border-radius: 0.5rem;
        z-index: 100;
        backdrop-filter: blur(12px);
        box-shadow: 0 8px 24px rgba(0,0,0,0.4);
    }
    .searchable-select.open .ss-dropdown {
        display: block;
    }
    .searchable-select .ss-option {
        padding: 0.55rem 1rem;
        color: rgba(255,255,255,0.8);
        font-size: 0.85rem;
        cursor: pointer;
        transition: background 0.15s;
    }
    .searchable-select .ss-option:hover,
    .searchable-select .ss-option.highlighted {
        background: rgba(99,102,241,0.2);
        color: #fff;
    }
    .searchable-select .ss-option.selected {
        color: var(--primary);
        font-weight: 500;
    }
    .searchable-select .ss-empty {
        padding: 0.75rem 1rem;
        color: rgba(255,255,255,0.35);
        font-size: 0.85rem;
        text-align: center;
    }
    .searchable-select .ss-dropdown::-webkit-scrollbar {
        width: 4px;
    }
    .searchable-select .ss-dropdown::-webkit-scrollbar-thumb {
        background: rgba(255,255,255,0.15);
        border-radius: 2px;
    }
    .searchable-select .ss-option.others-option {
        border-top: 1px solid rgba(255,255,255,0.08);
        color: #a5b4fc;
        font-style: italic;
    }
    .ss-custom-input {
        width: 100%;
        padding: 0.65rem 1rem;
        border-radius: 0.5rem;
        background: rgba(0,0,0,0.25);
        border: 1px solid rgba(255,255,255,0.08);
        color: white;
        font-size: 0.9rem;
        font-family: 'Outfit', sans-serif;
        margin-top: 0.5rem;
        transition: border-color 0.2s, box-shadow 0.2s;
    }
    .ss-custom-input:focus {
        outline: none;
        border-color: var(--primary);
        box-shadow: 0 0 0 3px rgba(99,102,241,0.15);
    }
    .ss-custom-input::placeholder {
        color: rgba(255,255,255,0.35);
    }
</style>
@endsection

@section('content')
<div class="animate-fade-in">
    <!-- Header -->
    <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 2.5rem; flex-wrap: wrap; gap: 1.5rem;">
        <div>
            <h1 style="font-size: 2.25rem; font-weight: 800; letter-spacing: -0.025em; margin-bottom: 0.5rem;">
                My Dashboard
            </h1>
            <p style="color: var(--text-muted); font-size: 1rem;">
                Welcome back, <span style="color: var(--text-light); font-weight: 600;">{{ $user->name }}</span>. Here is your tracking geography.
            </p>
        </div>
    </div>

    <!-- Stats Row -->
    <div class="stat-grid">
        <div class="glass-card stat-card" style="flex: 1;">
            <div class="stat-value">{{ $totalCheckins }}</div>
            <div class="stat-label">Total Check-ins</div>
        </div>
    </div>

    <!-- My Professional Profile Card -->
    <div class="glass-card" style="margin-bottom: 2rem; padding: 2rem;">
        <div id="profile-display">
            <!-- Profile Header -->
            <div class="profile-header">
                <div class="profile-avatar" id="profile-avatar">
                    {{ strtoupper(substr($user->name, 0, 1)) }}{{ strtoupper(substr(explode(' ', $user->name)[1] ?? '', 0, 1)) }}
                </div>
                <div class="profile-header-info" style="flex:1; min-width: 0;">
                    <div style="display: flex; align-items: center; gap: 0.5rem; flex-wrap: wrap;">
                        <h2 id="disp-name" style="margin-bottom: 0;">{{ $user->name }}</h2>
                        @if($user->is_admin)
                            <span class="privilege-badge">ADMIN</span>
                        @endif
                    </div>
                    <div class="profile-email" id="disp-email" style="margin-top: 0.2rem;">{{ $user->email }}</div>
                    <div style="display: flex; gap: 0.5rem; flex-wrap: wrap; margin-top: 0.5rem;">
                        @if($user->employee_type)
                            <span class="profile-role-badge">
                                <span>⚡</span> {{ $user->employee_type }}
                            </span>
                        @else
                            <span class="profile-role-badge">
                                <span>👤</span> Employee
                            </span>
                        @endif

                        @if($user->email_verified_at)
                            <span class="status-pill status-verified">✓ Verified Account</span>
                        @else
                            <span class="status-pill status-pending">⚠ Pending Verification</span>
                        @endif
                    </div>
                </div>
                <button class="btn-edit-profile" id="edit-profile-btn" onclick="toggleProfileEdit(true)">✏️ Edit Profile</button>
            </div>

            <!-- Info Grid -->
            <div class="profile-info-grid">
                <div class="profile-info-item">
                    <div class="profile-info-icon icon-id">🪪</div>
                    <div class="profile-info-details">
                        <span class="profile-info-label">Employee ID</span>
                        <span class="profile-info-value {{ !($latestLocation->employee_id_no ?? $user->employee_id_no) ? 'empty' : '' }}" id="disp-employee_id_no">{{ $latestLocation->employee_id_no ?? $user->employee_id_no ?? 'Not set' }}</span>
                    </div>
                </div>

                <div class="profile-info-item">
                    <div class="profile-info-icon icon-phone">📱</div>
                    <div class="profile-info-details">
                        <span class="profile-info-label">Mobile Number</span>
                        <span class="profile-info-value {{ !($latestLocation->mobile_no ?? $user->mobile_no) ? 'empty' : '' }}" id="disp-mobile_no">{{ $latestLocation->mobile_no ?? $user->mobile_no ?? 'Not set' }}</span>
                    </div>
                </div>

                <div class="profile-info-item">
                    <div class="profile-info-icon icon-office">🏢</div>
                    <div class="profile-info-details">
                        <span class="profile-info-label">Office Assignment</span>
                        <span class="profile-info-value {{ !($latestLocation->office ?? $user->office) ? 'empty' : '' }}" id="disp-office">{{ $latestLocation->office ?? $user->office ?? 'Not set' }}</span>
                    </div>
                </div>

                <div class="profile-info-item">
                    <div class="profile-info-icon icon-type">💼</div>
                    <div class="profile-info-details">
                        <span class="profile-info-label">Employee Category</span>
                        <span class="profile-info-value {{ !($latestLocation->employee_type ?? $user->employee_type) ? 'empty' : '' }}" id="disp-employee_type">{{ $latestLocation->employee_type ?? $user->employee_type ?? 'Not set' }}</span>
                    </div>
                </div>
            </div>

            <!-- Metadata Section (Everything in Database) -->
            <div class="profile-meta-section">
                <h3 class="meta-title">⚙️ Account System Metadata</h3>
                <div class="profile-meta-grid">
                    <div class="meta-item">
                        <span class="meta-label">System User ID</span>
                        <span class="meta-value">#{{ str_pad($user->id, 5, '0', STR_PAD_LEFT) }}</span>
                    </div>
                    <div class="meta-item">
                        <span class="meta-label">Member Since</span>
                        <span class="meta-value">{{ $user->created_at->format('M d, Y') }}</span>
                    </div>
                    <div class="meta-item">
                        <span class="meta-label">Last Observed Activity</span>
                        <span class="meta-value">{{ $user->last_activity_at ? $user->last_activity_at->diffForHumans() : 'No activity logged' }}</span>
                    </div>
                    <div class="meta-item">
                        <span class="meta-label">Profile Last Updated</span>
                        <span class="meta-value">{{ $user->updated_at->diffForHumans() }}</span>
                    </div>
                    <div class="meta-item">
                        <span class="meta-label">Total Position Logs</span>
                        <span class="meta-value">{{ number_format($totalCheckins) }} records</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Form -->
        <div id="profile-edit" style="display: none;">
            <div style="margin-bottom: 1.75rem;">
                <h2 style="font-size: 1.35rem; margin-bottom: 0.25rem;">✏️ Edit Profile</h2>
                <p style="color: var(--text-muted); font-size: 0.85rem;">Update your official identity and contact details.</p>
            </div>
            <form id="profile-form" onsubmit="saveProfile(event)" class="profile-edit-grid">
                <div class="profile-edit-group">
                    <label>Full Name</label>
                    <input type="text" name="name" class="form-control" value="{{ $user->name }}" required>
                </div>
                <div class="profile-edit-group">
                    <label>Email Address</label>
                    <input type="email" name="email" class="form-control" value="{{ $user->email }}" required>
                </div>
                <div class="profile-edit-group">
                    <label>Employee ID</label>
                    <input type="text" name="employee_id_no" class="form-control" value="{{ $user->employee_id_no ?? $latestLocation?->employee_id_no }}" placeholder="e.g. DTI-2024-001">
                </div>
                <div class="profile-edit-group">
                    <label>Mobile Number</label>
                    <input type="text" name="mobile_no" class="form-control" value="{{ $user->mobile_no ?? $latestLocation?->mobile_no }}" placeholder="e.g. 0917-123-4567">
                </div>
                <div class="profile-edit-group">
                    <label>Office Assignment</label>
                    <div class="searchable-select" id="ss-office-profile">
                        <input type="text" class="ss-input" placeholder="Search office..." autocomplete="off">
                        <input type="hidden" name="office" value="{{ $user->office ?? $latestLocation?->office }}">
                        <span class="ss-arrow">▼</span>
                        <div class="ss-dropdown">
                            @foreach($offices as $office)
                                <div class="ss-option" data-value="{{ $office }}">{{ $office }}</div>
                            @endforeach
                            <div class="ss-option others-option" data-value="__others__">Others (specify manually)</div>
                        </div>
                        <input type="text" class="ss-custom-input" style="display:none;" placeholder="Type custom office name...">
                    </div>
                </div>
                <div class="profile-edit-group">
                    <label>Employee Type</label>
                    <div class="searchable-select" id="ss-type-profile">
                        <input type="text" class="ss-input" placeholder="Search employee type..." autocomplete="off">
                        <input type="hidden" name="employee_type" value="{{ $user->employee_type ?? $latestLocation?->employee_type }}">
                        <span class="ss-arrow">▼</span>
                        <div class="ss-dropdown">
                            @foreach($employeeTypes as $type)
                                <div class="ss-option" data-value="{{ $type }}">{{ $type }}</div>
                            @endforeach
                            @unless($employeeTypes->contains('Intern'))
                                <div class="ss-option" data-value="Intern">Intern</div>
                            @endunless
                            <div class="ss-option others-option" data-value="__others__">Others (specify manually)</div>
                        </div>
                        <input type="text" class="ss-custom-input" style="display:none;" placeholder="Type custom employee type...">
                    </div>
                </div>
                <div class="profile-edit-actions">
                    <button type="submit" class="btn-save-profile">💾 Save Changes</button>
                    <button type="button" class="btn-cancel-profile" onclick="toggleProfileEdit(false)">Cancel</button>
                </div>
            </form>
        </div>
    </div>

    <!-- My Geography Section -->
    <div class="glass-card" style="margin-bottom: 2rem; padding: 2rem;">
        <div style="margin-bottom: 2rem;">
            <h2 style="font-size: 1.5rem; margin-bottom: 0.25rem;">🌍 My Geography</h2>
            <p style="color: var(--text-muted); font-size: 0.9rem;">Manage your permanent locations and focal points.</p>
        </div>

        <div class="geography-grid">
            <!-- Home Column -->
            <div class="address-column">
                <div class="address-item" id="home-item" onclick="focusOnMap('home')">
                    <span class="address-label">🏠 Home Base</span>
                    
                    <div id="home-display">
                        <div class="address-text">{{ $homeLocation?->address ?? 'No home address setup yet.' }}</div>
                        <button class="btn-small btn-secondary" style="width: 100%;" onclick="toggleEdit('home', true, event)">Update Location</button>
                    </div>

                    <div id="home-edit" style="display: none;">
                        <input type="text" id="home-address-input" class="form-control" style="margin-bottom: 1rem;" placeholder="Enter address..." value="{{ $homeLocation?->address ?? '' }}">
                        <div style="display: flex; gap: 0.5rem;">
                            <button class="btn-small" style="background: var(--primary);" onclick="togglePinMode('home', event)">📍 Pin</button>
                            <button class="btn-small" style="flex:1;" onclick="saveAddress('home', event)">Save</button>
                            <button class="btn-small btn-secondary" onclick="toggleEdit('home', false, event)">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Office Column -->
            <div class="address-column">
                <div class="address-item" id="office-item" onclick="focusOnMap('office')">
                    <span class="address-label">🏢 Office Assignment</span>
                    
                    <div id="office-display">
                        <div class="address-text">{{ $officeLocation?->office ?? 'No office assigned yet.' }}</div>
                        <button class="btn-small btn-secondary" style="width: 100%;" onclick="toggleEdit('office', true, event)">Update Role</button>
                    </div>

                    <div id="office-edit" style="display: none;">
                        <input type="text" id="office-address-input" class="form-control" style="margin-bottom: 1rem;" placeholder="Enter office name/address..." value="{{ $officeLocation?->office ?? '' }}">
                        <div style="display: flex; gap: 0.5rem;">
                            <button class="btn-small" style="background: #c084fc;" onclick="togglePinMode('office', event)">📍 Pin</button>
                            <button class="btn-small" style="flex:1;" onclick="saveAddress('office', event)">Save</button>
                            <button class="btn-small btn-secondary" onclick="toggleEdit('office', false, event)">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Integrated Minimap -->
        <div style="position: relative; margin-top: 1rem;">
            <div id="minimap" class="minimap-container"></div>
            <div id="pin-instruction" class="instruction-overlay">
                Click on the map to pin your <span id="pin-type-text"></span>
            </div>
            <button onclick="resetMap()" style="position: absolute; top: 15px; right: 15px; z-index: 1000; background: rgba(0,0,0,0.6); border: 1px solid rgba(255,255,255,0.2); color: white; padding: 0.5rem 1rem; border-radius: 0.75rem; font-size: 0.75rem; cursor: pointer; backdrop-filter: blur(10px);">
                🔄 Show All
            </button>
        </div>
    </div>

    <!-- Analytics & History -->
    <div class="analytics-grid">
        <!-- History Table -->
        <div class="glass-card" style="padding: 1.5rem;">
            <h3 style="font-size: 1.1rem; margin-bottom: 1.5rem;">📍 Recent Check-ins</h3>
            <div class="history-table-container">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Type</th>
                            <th>Address / Context</th>
                            <th>Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($recentHistory as $loc)
                        <tr>
                            <td>
                                <span class="status-badge @if($loc->type == 'home') badge-home @elseif($loc->type == 'office') badge-office @else badge-checkin @endif">
                                    {{ $loc->type ?? 'Check-in' }}
                                </span>
                            </td>
                            <td style="max-width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                {{ $loc->address ?: ($loc->office ?: 'GPS Check-in') }}
                            </td>
                            <td style="color: var(--text-muted); font-size: 0.75rem;">
                                {{ $loc->recorded_at->diffForHumans() }}
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Activity Chart -->
        <div class="glass-card" style="padding: 1.5rem;">
            <h3 style="font-size: 1.1rem; margin-bottom: 1.5rem;">📊 Activity (Last 7 Days)</h3>
            <div class="chart-container">
                <canvas id="activityChart"></canvas>
            </div>
        </div>
    </div>
</div>
@endsection

@section('scripts')
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    let map, homeMarker, officeMarker, currentMarker;
    let pinMode = null;
    let currentCoords = null;

    const homeData = {
        lat: @json($homeLocation?->latitude ?? null),
        lng: @json($homeLocation?->longitude ?? null)
    };
    const officeData = {
        lat: @json($officeLocation?->latitude ?? null),
        lng: @json($officeLocation?->longitude ?? null)
    };

    document.addEventListener('DOMContentLoaded', function() {
        initMap();
        initChart();
        setupGeolocation();
        
        // Default focus
        if (homeData.lat) focusOnMap('home');
        else if (officeData.lat) focusOnMap('office');
    });

    function initMap() {
        const defaultLat = homeData.lat || officeData.lat || 10.7;
        const defaultLng = homeData.lng || officeData.lng || 122.5;
        
        map = L.map('minimap', { scrollWheelZoom: false }).setView([defaultLat, defaultLng], 12);
        
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenStreetMap'
        }).addTo(map);

        if (homeData.lat) {
            homeMarker = L.marker([homeData.lat, homeData.lng], {
                icon: createCustomIcon('🏠', '#6366f1')
            }).addTo(map).bindPopup('<strong>Home Base</strong>');
        }

        if (officeData.lat) {
            officeMarker = L.marker([officeData.lat, officeData.lng], {
                icon: createCustomIcon('🏢', '#c084fc')
            }).addTo(map).bindPopup('<strong>Office Assignment</strong>');
        }

        map.on('click', onMapClick);
    }

    function createCustomIcon(emoji, color) {
        return L.divIcon({
            html: `<div style="background:white; width:34px; height:34px; border-radius:50%; border:3px solid ${color}; display:flex; align-items:center; justify-content:center; font-size:18px; box-shadow:0 4px 10px rgba(0,0,0,0.3)">${emoji}</div>`,
            className: '',
            iconSize: [34, 34],
            iconAnchor: [17, 17],
            popupAnchor: [0, -17]
        });
    }

    function initChart() {
        const activityData = @json($activityData);
        const ctx = document.getElementById('activityChart').getContext('2d');
        
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: Object.keys(activityData),
                datasets: [{
                    label: 'Check-ins',
                    data: Object.values(activityData),
                    borderColor: '#6366f1',
                    backgroundColor: 'rgba(99, 102, 241, 0.1)',
                    borderWidth: 3,
                    tension: 0.4,
                    fill: true,
                    pointBackgroundColor: '#6366f1',
                    pointRadius: 4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    y: { 
                        beginAtZero: true, 
                        grid: { color: 'rgba(255,255,255,0.05)' },
                        ticks: { color: '#94a3b8', stepSize: 1 }
                    },
                    x: { 
                        grid: { display: false },
                        ticks: { color: '#94a3b8' }
                    }
                }
            }
        });
    }

    function setupGeolocation() {
        if ("geolocation" in navigator) {
            navigator.geolocation.getCurrentPosition(function(position) {
                currentCoords = { lat: position.coords.latitude, lng: position.coords.longitude };
                if (!currentMarker) {
                    currentMarker = L.circleMarker([currentCoords.lat, currentCoords.lng], {
                        radius: 8, fillColor: "#10b981", color: "#fff", weight: 2, opacity: 1, fillOpacity: 0.8
                    }).addTo(map).bindPopup("Your Current Position");
                }
            });
        }
    }

    function focusOnMap(type) {
        document.querySelectorAll('.address-item').forEach(el => el.classList.remove('active'));
        document.getElementById(type + '-item').classList.add('active');
        
        const data = type === 'home' ? homeData : officeData;
        const marker = type === 'home' ? homeMarker : officeMarker;
        
        if (data.lat) {
            map.flyTo([data.lat, data.lng], 15);
            if (marker) setTimeout(() => marker.openPopup(), 400);
        }
    }

    function resetMap() {
        const markers = [];
        if (homeMarker) markers.push(homeMarker);
        if (officeMarker) markers.push(officeMarker);
        if (currentMarker) markers.push(currentMarker);
        
        if (markers.length > 0) {
            map.fitBounds(L.featureGroup(markers).getBounds(), { padding: [50, 50] });
        }
    }


    function toggleEdit(type, show, event) {
        if (event) event.stopPropagation();
        document.getElementById(type + '-display').style.display = show ? 'none' : 'block';
        document.getElementById(type + '-edit').style.display = show ? 'block' : 'none';
        if (show) focusOnMap(type);
    }

    function togglePinMode(type, event) {
        event.stopPropagation();
        pinMode = type;
        document.getElementById('pin-type-text').textContent = type;
        document.getElementById('pin-instruction').style.display = 'block';
        map.getContainer().style.cursor = 'crosshair';
    }

    function onMapClick(e) {
        if (!pinMode) return;
        
        const { lat, lng } = e.latlng;
        if (pinMode === 'home') {
            homeData.lat = lat; homeData.lng = lng;
            if (homeMarker) homeMarker.setLatLng(e.latlng);
            else homeMarker = L.marker(e.latlng, { icon: createCustomIcon('🏠', '#6366f1') }).addTo(map);
        } else {
            officeData.lat = lat; officeData.lng = lng;
            if (officeMarker) officeMarker.setLatLng(e.latlng);
            else officeMarker = L.marker(e.latlng, { icon: createCustomIcon('🏢', '#c084fc') }).addTo(map);
        }

        pinMode = null;
        document.getElementById('pin-instruction').style.display = 'none';
        map.getContainer().style.cursor = '';
    }

    function saveAddress(type, event) {
        event.stopPropagation();
        const address = document.getElementById(type + '-address-input').value.trim();
        const lat = type === 'home' ? homeData.lat : officeData.lat;
        const lng = type === 'home' ? homeData.lng : officeData.lng;

        if (!address || !lat) {
            alert('Please provide an address and pin it on the map.');
            return;
        }

        fetch('{{ route("location.updateAddress") }}', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json', 'X-CSRF-TOKEN': '{{ csrf_token() }}' },
            body: JSON.stringify({ type, address, latitude: lat, longitude: lng })
        }).then(r => r.ok ? window.location.reload() : alert('Failed to save.'));
    }

    function toggleProfileEdit(show) {
        document.getElementById('profile-display').style.display = show ? 'none' : 'block';
        document.getElementById('profile-edit').style.display = show ? 'block' : 'none';
    }

    async function saveProfile(event) {
        event.preventDefault();
        const form = event.target;
        const formData = new FormData(form);
        const data = Object.fromEntries(formData.entries());

        const btn = form.querySelector('button[type="submit"]');
        const originalText = btn.innerText;
        btn.innerText = 'Saving...';
        btn.disabled = true;

        try {
            const response = await fetch("{{ route('profile.update') }}", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}',
                    'Accept': 'application/json'
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();

            if (result.status === 'success') {
                // Update display values
                for (const [key, value] of Object.entries(data)) {
                    const dispEl = document.getElementById(`disp-${key}`);
                    if (dispEl) dispEl.innerText = value || '--';
                }
                
                // Update welcome message if name changed
                if (data.name) {
                    const welcomeName = document.querySelector('.welcome-section span');
                    if (welcomeName) welcomeName.innerText = data.name;
                }

                if (typeof showToast === 'function') {
                    showToast('Success', 'Profile updated successfully', 'success');
                }
                toggleProfileEdit(false);
            } else {
                if (typeof showToast === 'function') {
                    showToast('Error', result.message || 'Failed to update profile', 'error');
                }
            }
        } catch (error) {
            console.error('Error updating profile:', error);
            if (typeof showToast === 'function') {
                showToast('Error', 'An unexpected error occurred', 'error');
            }
        } finally {
            btn.innerText = originalText;
            btn.disabled = false;
        }
    }
    // Searchable Select Widget
    document.querySelectorAll('.searchable-select').forEach(function(container) {
        const input = container.querySelector('.ss-input');
        const hidden = container.querySelector('input[type="hidden"]');
        const dropdown = container.querySelector('.ss-dropdown');
        const options = Array.from(dropdown.querySelectorAll('.ss-option'));
        let highlightedIdx = -1;

        if (hidden.value) {
            const matchingOpt = options.find(opt => opt.dataset.value === hidden.value);
            if (matchingOpt) {
                input.value = hidden.value;
                input.classList.add('has-value');
                matchingOpt.classList.add('selected');
            } else if (hidden.value) {
                input.value = 'Others';
                input.classList.add('has-value');
                const ci = container.querySelector('.ss-custom-input');
                if (ci) { ci.style.display = ''; ci.value = hidden.value; }
            }
        }

        function open() { container.classList.add('open'); filterOptions(''); highlightedIdx = -1; }
        function close() {
            container.classList.remove('open');
            const ci = container.querySelector('.ss-custom-input');
            if (ci && ci.style.display !== 'none') { input.value = 'Others'; }
            else { input.value = hidden.value; }
            highlightedIdx = -1;
        }

        const customInput = container.querySelector('.ss-custom-input');

        function selectOption(value, text) {
            if (value === '__others__') {
                hidden.value = '';
                input.value = 'Others';
                input.classList.add('has-value');
                container.classList.remove('open');
                if (customInput) { customInput.style.display = ''; customInput.value = ''; customInput.focus(); }
                return;
            }
            if (customInput) customInput.style.display = 'none';
            hidden.value = value;
            input.value = text;
            input.classList.toggle('has-value', !!value);
            options.forEach(opt => opt.classList.toggle('selected', opt.dataset.value === value));
            close();
        }

        if (customInput) {
            customInput.addEventListener('input', function() { hidden.value = this.value; });
        }

        function filterOptions(query) {
            const q = query.toLowerCase();
            let visibleCount = 0;
            options.forEach(opt => {
                const match = opt.textContent.toLowerCase().includes(q);
                opt.style.display = match ? '' : 'none';
                opt.classList.remove('highlighted');
                if (match) visibleCount++;
            });
            let emptyMsg = dropdown.querySelector('.ss-empty');
            if (visibleCount === 0) {
                if (!emptyMsg) { emptyMsg = document.createElement('div'); emptyMsg.className = 'ss-empty'; emptyMsg.textContent = 'No matches found'; dropdown.appendChild(emptyMsg); }
                emptyMsg.style.display = '';
            } else if (emptyMsg) { emptyMsg.style.display = 'none'; }
            highlightedIdx = -1;
        }

        function getVisibleOptions() { return options.filter(opt => opt.style.display !== 'none'); }

        function highlightOption(idx) {
            const visible = getVisibleOptions();
            visible.forEach(opt => opt.classList.remove('highlighted'));
            if (idx >= 0 && idx < visible.length) { highlightedIdx = idx; visible[idx].classList.add('highlighted'); visible[idx].scrollIntoView({ block: 'nearest' }); }
        }

        input.addEventListener('focus', function() { this.select(); open(); });
        input.addEventListener('input', function() { if (!container.classList.contains('open')) open(); filterOptions(this.value); });
        input.addEventListener('keydown', function(e) {
            const visible = getVisibleOptions();
            if (e.key === 'ArrowDown') { e.preventDefault(); if (!container.classList.contains('open')) open(); highlightOption(Math.min(highlightedIdx + 1, visible.length - 1)); }
            else if (e.key === 'ArrowUp') { e.preventDefault(); highlightOption(Math.max(highlightedIdx - 1, 0)); }
            else if (e.key === 'Enter') { e.preventDefault(); if (highlightedIdx >= 0 && highlightedIdx < visible.length) selectOption(visible[highlightedIdx].dataset.value, visible[highlightedIdx].textContent); }
            else if (e.key === 'Escape') { close(); input.blur(); }
        });
        options.forEach(opt => { opt.addEventListener('mousedown', function(e) { e.preventDefault(); selectOption(this.dataset.value, this.textContent); }); });
        input.addEventListener('blur', function() { setTimeout(() => close(), 150); });
    });
</script>
@endsection
