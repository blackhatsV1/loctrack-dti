@extends('layouts.app')

@section('styles')
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin=""/>
<style>
    .stat-card {
        cursor: pointer;
        transition: all 0.2s ease-in-out;
    }
    .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 15px -3px rgba(99, 102, 241, 0.2);
        border-color: rgba(99, 102, 241, 0.4);
    }
    .stat-card.active {
        border-color: var(--primary);
        box-shadow: 0 0 0 2px var(--primary);
    }
    .dashboard-section {
        display: none;
        margin-top: 2rem;
        margin-bottom: 3rem;
    }
    .dashboard-section.active {
        display: block;
    }
    .mini-map {
        height: 300px;
        border-radius: 1rem;
        margin-bottom: 1.5rem;
        border: 1px solid var(--glass-border);
    }
    .table-container {
        max-height: 400px;
        overflow-y: auto;
        border-radius: 0.75rem;
        background: rgba(0, 0, 0, 0.1);
        border: 1px solid var(--glass-border);
    }
    .table-container::-webkit-scrollbar {
        width: 6px;
    }
    .table-container::-webkit-scrollbar-thumb {
        background: rgba(99, 102, 241, 0.3);
        border-radius: 10px;
    }
    .table-container::-webkit-scrollbar-track {
        background: transparent;
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
        font-weight: 600;
        font-size: 0.85rem;
        text-transform: uppercase;
    }
    .data-table td {
        padding: 1rem;
        border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        font-size: 0.9rem;
    }
    .search-input {
        width: 100%;
        padding: 0.75rem 1rem;
        border-radius: 0.75rem;
        background: rgba(0, 0, 0, 0.2);
        border: 1px solid var(--glass-border);
        color: white;
        margin-bottom: 1rem;
        font-family: 'Outfit', sans-serif;
    }
    .search-input:focus {
        outline: none;
        border-color: var(--primary);
    }
    .link-btn {
        color: var(--primary);
        text-decoration: none;
        font-size: 0.85rem;
        font-weight: 500;
    }
    .link-btn:hover {
        text-decoration: underline;
    }
</style>
@endsection

@section('content')
<div class="animate-fade-in">
    <h1 style="font-size: 2rem; margin-bottom: 0.5rem;">Admin Dashboard</h1>
    <p style="color: var(--text-muted); margin-bottom: 2.5rem;">Overview of your workforce tracking system.</p>

    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 1.5rem; margin-bottom: 2rem;">
        <div class="glass-card stat-card" id="card-employees" onclick="window.location.href='{{ route('admin.employees') }}'">
            <div style="font-size: 2.5rem; font-weight: 600; background: linear-gradient(to right, #818cf8, #c084fc); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
                {{ $totalEmployees }}
            </div>
            <div style="color: var(--text-muted); margin-top: 0.5rem;">Total Employees</div>
        </div>
        <div class="glass-card stat-card" id="card-locations" onclick="toggleDashboardSection('locations')">
            <div style="font-size: 2.5rem; font-weight: 600; background: linear-gradient(to right, #34d399, #22d3ee); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
                {{ $totalLocations }}
            </div>
            <div style="color: var(--text-muted); margin-top: 0.5rem;">Location Records</div>
        </div>
        <div class="glass-card stat-card" id="card-offices" onclick="toggleDashboardSection('offices')">
            <div style="font-size: 2.5rem; font-weight: 600; background: linear-gradient(to right, #f472b6, #fb923c); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
                {{ $totalOffices }}
            </div>
            <div style="color: var(--text-muted); margin-top: 0.5rem;">Offices</div>
        </div>
    </div>

    <!-- Total Employees section removed as it now redirects -->

    <!-- Location Records Section -->
    <div id="section-locations" class="dashboard-section animate-fade-in">
        <div class="glass-card">
            <h2 style="margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.5rem;">
                📍 Location Records
            </h2>
            <input type="text" id="power-search" class="search-input" placeholder="Power Search: Find by name, address, or office..." onkeyup="powerSearch()">
            <div class="table-container">
                <table class="data-table" id="location-table">
                    <thead>
                        <tr>
                            <th style="position: sticky; top: 0; background: var(--bg-dark); z-index: 1;">Name</th>
                            <th style="position: sticky; top: 0; background: var(--bg-dark); z-index: 1;">Address</th>
                            <th style="position: sticky; top: 0; background: var(--bg-dark); z-index: 1;">Office</th>
                            <th style="position: sticky; top: 0; background: var(--bg-dark); z-index: 1;">Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($recentLocations as $loc)
                        <tr class="search-row">
                            <td class="searchable">{{ $loc->user->name }}</td>
                            <td class="searchable" style="max-width: 300px;">{{ $loc->address }}</td>
                            <td class="searchable">{{ $loc->office ?? 'N/A' }}</td>
                            <td>{{ $loc->recorded_at->format('M d, Y h:i A') }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Offices Section -->
    <div id="section-offices" class="dashboard-section animate-fade-in">
        <div class="glass-card">
            <h2 style="margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.5rem;">
                🏢 Office Locations
            </h2>
            <div id="map-offices" class="mini-map"></div>
            <div class="table-container">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th style="position: sticky; top: 0; background: var(--bg-dark); z-index: 1;">Office Name</th>
                            <th style="position: sticky; top: 0; background: var(--bg-dark); z-index: 1;">Coordinates (Lat, Lng)</th>
                            <th style="position: sticky; top: 0; background: var(--bg-dark); z-index: 1;">Active Personnel</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($offices as $office)
                        <tr>
                            <td>{{ $office }}</td>
                            <td>
                                @php
                                    $officeLoc = $latestLocations->where('office', $office)->first();
                                @endphp
                                {{ $officeLoc ? round($officeLoc->latitude, 4) . ', ' . round($officeLoc->longitude, 4) : 'N/A' }}
                            </td>
                            <td>{{ $latestLocations->where('office', $office)->count() }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1.5rem; margin-top: 1rem;">
        <a href="{{ route('admin.employees') }}" class="glass-card" style="padding: 2rem; text-decoration: none; color: var(--text-light); transition: transform 0.2s;">
            <h3 style="margin-bottom: 0.5rem;">👥 Manage Employees</h3>
            <p style="color: var(--text-muted); font-size: 0.9rem;">View, search, and edit employee information.</p>
        </a>
        <a href="{{ route('admin.map') }}" class="glass-card" style="padding: 2rem; text-decoration: none; color: var(--text-light); transition: transform 0.2s;">
            <h3 style="margin-bottom: 0.5rem;">🗺️ Real-time Map</h3>
            <p style="color: var(--text-muted); font-size: 0.9rem;">Visualize all employee locations on the map.</p>
        </a>
    </div>
</div>
@endsection

@section('scripts')
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
<script>
    let maps = {
        employees: null,
        offices: null
    };

    const latestLocations = @json($latestLocations);
    const offices = @json($offices);

    function toggleDashboardSection(sectionId) {
        const sections = ['locations', 'offices'];
        
        sections.forEach(s => {
            const section = document.getElementById('section-' + s);
            const card = document.getElementById('card-' + s);
            
            if (s === sectionId) {
                if (section.classList.contains('active')) {
                    section.classList.remove('active');
                    card.classList.remove('active');
                } else {
                    section.classList.add('active');
                    card.classList.add('active');
                    
                    // Initialize map if needed
                    if (s === 'offices' && !maps.offices) {
                        initOfficesMap();
                    }
                }
            } else {
                section.classList.remove('active');
                card.classList.remove('active');
            }
        });
    }

    // initEmployeesMap removed as it's no longer used in dashboard toggles

    function initOfficesMap() {
        maps.offices = L.map('map-offices').setView([10.69, 122.52], 8);
        L.tileLayer('https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png', {
            attribution: '&copy; CARTO'
        }).addTo(maps.offices);

        const markers = [];
        offices.forEach(officeName => {
            const loc = latestLocations.find(l => l.office === officeName);
            if (loc && loc.latitude && loc.longitude) {
                const marker = L.marker([loc.latitude, loc.longitude], {
                    icon: L.divIcon({
                        html: `<div style="background: var(--primary); width: 12px; height: 12px; border-radius: 50%; border: 2px solid white; box-shadow: 0 0 10px var(--primary);"></div>`,
                        className: '',
                        iconSize: [12, 12]
                    })
                }).bindPopup(`<b>Office: ${officeName}</b>`)
                  .addTo(maps.offices);
                markers.push([loc.latitude, loc.longitude]);
            }
        });

        if (markers.length > 0) {
            maps.offices.fitBounds(markers);
        }
    }

    function powerSearch() {
        const input = document.getElementById('power-search');
        const filter = input.value.toLowerCase();
        const rows = document.querySelectorAll('.search-row');

        rows.forEach(row => {
            const text = Array.from(row.querySelectorAll('.searchable'))
                .map(td => td.textContent.toLowerCase())
                .join(' ');
            
            if (text.includes(filter)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    }

    // Delay initialization slightly to ensure container is ready
    window.addEventListener('resize', () => {
        if (maps.employees) maps.employees.invalidateSize();
        if (maps.offices) maps.offices.invalidateSize();
    });
</script>
@endsection
