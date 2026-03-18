@extends('layouts.app')

@section('styles')
@vite(['resources/js/map-bundle.js'])
<style>
    .stat-card {
        cursor: pointer;
        transition: all 0.3s ease;
        display: flex;
        flex-direction: column;
        text-decoration: none;
        color: inherit;
    }
    .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px -5px rgba(0, 0, 0, 0.3);
    }
    .stat-card.active {
        border-color: var(--primary);
    }
    .dashboard-section {
        display: none;
        margin-top: 2rem;
        margin-bottom: 3rem;
    }
    .dashboard-section.active {
        display: block;
    }
    .hidden {
        display: none !important;
    }
    .chart-container {
        position: relative;
        height: 300px;
        width: 100%;
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
    .stat-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 1.5rem;
        margin-bottom: 2rem;
    }
    .analytics-grid {
        display: grid;
        grid-template-columns: 1fr 1.5fr;
        gap: 1.5rem;
        margin-bottom: 2rem;
    }
    @media (max-width: 768px) {
        .stat-grid {
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
        }
        .analytics-grid {
            grid-template-columns: 1fr;
        }
        .chart-container {
            height: 220px;
        }
        .stat-card {
            padding: 1rem !important;
        }
        .stat-card > div:first-child {
            font-size: 2rem !important;
        }
        .data-table {
            min-width: 600px;
        }
    }
    @media (max-width: 480px) {
        .stat-grid {
            grid-template-columns: 1fr;
            gap: 0.75rem;
        }
    }
    .address-card-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 1.5rem;
    }
    .address-column {
        display: flex;
        flex-direction: column;
        gap: 0.75rem;
    }
    .address-list {
        max-height: 350px;
        overflow-y: auto;
        border-radius: 0.75rem;
        background: rgba(0, 0, 0, 0.15);
        border: 1px solid var(--glass-border);
    }
    .address-item {
        padding: 0.85rem 1rem;
        border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        cursor: pointer;
        transition: all 0.2s ease;
        display: flex;
        flex-direction: column;
    }
    .address-item:hover {
        background: rgba(99, 102, 241, 0.1);
        padding-left: 1.25rem;
    }
    .address-item.active {
        background: rgba(99, 102, 241, 0.2);
        border-left: 3px solid var(--primary);
    }
    .address-item .emp-name {
        font-weight: 600;
        color: var(--text-light);
        font-size: 0.95rem;
    }
    .address-item .emp-addr {
        font-size: 0.8rem;
        color: var(--text-muted);
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .minimap-container {
        height: 400px;
        width: 100%;
        border-radius: 1rem;
        margin-top: 1.5rem;
        border: 1px solid var(--glass-border);
        position: relative;
        z-index: 1;
    }
    .custom-leaflet-icon {
        background: transparent !important;
        border: none !important;
        display: flex !important;
        align-items: center;
        justify-content: center;
        font-family: 'Segoe UI Emoji', 'Apple Color Emoji', 'Noto Color Emoji', sans-serif;
    }
    .map-reset-btn {
        position: absolute;
        top: 15px;
        right: 15px;
        z-index: 2000;
        background: rgba(15, 23, 42, 0.9);
        border: 1px solid rgba(255, 255, 255, 0.2);
        color: white;
        padding: 8px 14px;
        border-radius: 10px;
        font-size: 0.75rem;
        font-weight: 600;
        cursor: pointer;
        backdrop-filter: blur(12px);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
        display: flex;
        align-items: center;
        gap: 8px;
        transition: all 0.2s ease;
    }
    .map-reset-btn:hover {
        background: var(--primary);
        transform: scale(1.05);
    }
    .filter-bar {
        display: flex;
        gap: 1rem;
        margin-bottom: 1.5rem;
        flex-wrap: wrap;
    }
    .filter-select {
        flex: 1;
        min-width: 150px;
        padding: 0.75rem;
        border-radius: 0.75rem;
        background: rgba(0, 0, 0, 0.2);
        border: 1px solid var(--glass-border);
        color: white;
        font-family: 'Outfit', sans-serif;
    }
    .no-address-section {
        margin-top: 1.5rem;
        padding-top: 1.5rem;
        border-top: 1px solid var(--glass-border);
    }
    @media (max-width: 768px) {
        .address-card-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
@endsection

@section('content')
<div class="animate-fade-in">
    <h1 style="font-size: 2rem; margin-bottom: 0.5rem;">Admin Dashboard</h1>
    <p style="color: var(--text-muted); margin-bottom: 2.5rem;">Real-time workforce distribution and analytics.</p>

    <div class="stat-grid">
        <a href="{{ route('admin.employees') }}" class="glass-card stat-card" id="card-employees">
            <div style="font-size: 2.5rem; font-weight: 600; color: #818cf8;">
                {{ $totalEmployees }}
            </div>
            <div style="color: var(--text-muted); margin-top: 0.5rem; font-size: 0.9rem;">Total Personnel</div>
        </a>
        <div class="glass-card stat-card" id="card-updates" onclick="toggleDashboardSection('locations')">
            <div style="font-size: 2.5rem; font-weight: 600; color: #34d399;">
                {{ $totalLocations }}
            </div>
            <div style="color: var(--text-muted); margin-top: 0.5rem; font-size: 0.9rem;">Active Locations</div>
        </div>
        <div class="glass-card stat-card" id="card-offices" onclick="toggleDashboardSection('offices')">
            <div style="font-size: 2.5rem; font-weight: 600; color: #f472b6;">
                {{ $totalOffices }}
            </div>
            <div style="color: var(--text-muted); margin-top: 0.5rem; font-size: 0.9rem;">Active Offices</div>
        </div>
        <a href="{{ route('admin.map') }}" class="glass-card stat-card" id="card-map">
            <div style="font-size: 2.5rem; font-weight: 600;">🌍</div>
            <div style="color: var(--text-muted); margin-top: 0.5rem; font-size: 0.9rem;">Global View</div>
        </a>
    </div>

    <!-- Workforce Geography Card -->
    <div class="glass-card animate-fade-in" style="margin-bottom: 2rem;">
        <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 2rem; flex-wrap: wrap; gap: 1rem;">
            <div>
                <h2 style="margin-bottom: 0.25rem;">🌍 Workforce Geography</h2>
                <p style="color: var(--text-muted); font-size: 0.9rem;">Categorized address tracking and distribution.</p>
            </div>
            <div style="display: flex; gap: 0.75rem; flex-grow: 1; justify-content: flex-end; min-width: 300px;">
                <input type="text" id="geo-search" class="search-input" style="margin-bottom: 0; max-width: 300px;" placeholder="Search names or addresses..." onkeyup="filterGeoList()">
                <select id="filter-office" class="filter-select" style="max-width: 200px;" onchange="filterGeoList()">
                    <option value="">All Offices</option>
                    @foreach($allOffices as $office)
                        <option value="{{ $office }}">{{ $office }}</option>
                    @endforeach
                </select>
                <select id="filter-type" class="filter-select" style="max-width: 150px;" onchange="filterGeoList()">
                    <option value="">All Types</option>
                    @foreach($employeeTypes as $type)
                        <option value="{{ $type }}">{{ $type }}</option>
                    @endforeach
                </select>
            </div>
        </div>

        <div class="address-card-grid">
            <!-- Left: Home Addresses -->
            <div class="address-column">
                <h4 style="color: var(--primary); font-size: 0.85rem; text-transform: uppercase; letter-spacing: 0.05em;">🏠 Home Addresses</h4>
                <div class="address-list" id="home-list">
                    @foreach($latestLocations->whereNotNull('address') as $loc)
                    <div class="address-item geo-item" 
                         data-user-id="{{ $loc->user_id }}" 
                         data-name="{{ strtolower($loc->user->name) }}" 
                         data-addr="{{ strtolower($loc->address) }}"
                         data-office="{{ $loc->office }}"
                         data-type="{{ $loc->employee_type }}"
                         onclick="focusOnMap(this, {{ $loc->user_id }}, {{ $loc->latitude }}, {{ $loc->longitude }}, 'home')">
                        <span class="emp-name">{{ $loc->user->name }}</span>
                        <span class="emp-addr" title="{{ $loc->address }}">{{ $loc->address }}</span>
                    </div>
                    @endforeach
                </div>
            </div>

            <!-- Right: Office Addresses -->
            <div class="address-column">
                <h4 style="color: #f472b6; font-size: 0.85rem; text-transform: uppercase; letter-spacing: 0.05em;">🏢 Office Assignments</h4>
                <div class="address-list" id="office-list">
                    @foreach($latestLocations->whereNotNull('office') as $loc)
                    <div class="address-item geo-item" 
                         data-user-id="{{ $loc->user_id }}" 
                         data-name="{{ strtolower($loc->user->name) }}" 
                         data-addr="{{ strtolower($loc->office) }}"
                         data-office="{{ $loc->office }}"
                         data-type="{{ $loc->employee_type }}"
                         onclick="focusOnMap(this, {{ $loc->user_id }}, null, null, 'office', '{{ $loc->office }}')">
                        <span class="emp-name">{{ $loc->user->name }}</span>
                        <span class="emp-addr" title="{{ $loc->office }}">{{ $loc->office }}</span>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>

        <!-- Bottom: Unmapped/No Address Personnel -->
        @php
            $unmapped = $latestLocations->whereNull('address')->whereNull('office');
        @endphp
        @if($unmapped->count() > 0)
        <div class="no-address-section">
            <h4 style="color: #94a3b8; font-size: 0.85rem; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 1rem;">⚠️ Unmapped Personnel (Missing Home & Office)</h4>
            <div style="display: flex; flex-wrap: wrap; gap: 0.5rem;">
                @foreach($unmapped as $loc)
                <div class="glass-card geo-item" 
                     data-user-id="{{ $loc->user_id }}"
                     data-name="{{ strtolower($loc->user->name) }}"
                     style="padding: 0.5rem 0.75rem; font-size: 0.85rem; background: rgba(244, 63, 94, 0.1); border-color: rgba(244, 63, 94, 0.2);">
                    {{ $loc->user->name }}
                </div>
                @endforeach
            </div>
        </div>
        @endif

        <!-- Minimap -->
        <div class="minimap-wrapper" style="position: relative; margin-top: 1.5rem;">
            <div id="minimap" class="minimap-container" style="margin-top: 0;"></div>
            <button onclick="resetMinimap()" class="map-reset-btn">
                <span>🔄</span> Show All
            </button>
        </div>
    </div>

    <!-- Analytics Section -->
    <div class="analytics-grid">
        <div class="glass-card">
            <h3 style="margin-bottom: 1.5rem; font-size: 1.1rem; color: var(--text-light);">Office Distribution</h3>
            <div class="chart-container">
                <div class="page-loading" id="office-chart-loading">
                    <div class="spinner"></div>
                    <div class="spinner-text">Loading distribution...</div>
                </div>
                <canvas id="officeChart"></canvas>
            </div>
        </div>
        <div class="glass-card">
            <h3 style="margin-bottom: 1.5rem; font-size: 1.1rem; color: var(--text-light);">Personnel Type Breakdown</h3>
            <div class="chart-container">
                <div class="page-loading" id="type-chart-loading">
                    <div class="spinner"></div>
                    <div class="spinner-text">Loading breakdown...</div>
                </div>
                <canvas id="typeChart"></canvas>
            </div>
        </div>
    </div>

    <!-- Location Records Section -->
    <div id="section-locations" class="dashboard-section animate-fade-in">
        <div class="glass-card">
            <h2 style="margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.5rem;">
                📍 Location Records
            </h2>
            <input type="text" id="power-search" class="search-input" placeholder="Power Search: Find by name, address, or office..." onkeyup="powerSearch('location-table', 'power-search')">
            <div class="table-container" style="position: relative;">
                <div class="page-loading" id="table-loading" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 10; background: rgba(15, 23, 42, 0.8);">
                    <div class="spinner"></div>
                </div>
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
                            <td class="searchable">
                                {{ $loc->user->name }}
                            </td>
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
            <input type="text" id="office-search" class="search-input" placeholder="Search offices..." onkeyup="powerSearch('office-table', 'office-search')">
            <div class="table-container">
                <table class="data-table" id="office-table">
                    <thead>
                        <tr>
                            <th style="position: sticky; top: 0; background: var(--bg-dark); z-index: 1;">Office Name</th>
                            <th style="position: sticky; top: 0; background: var(--bg-dark); z-index: 1;">Coordinates (Lat, Lng)</th>
                            <th style="position: sticky; top: 0; background: var(--bg-dark); z-index: 1;">Active Personnel</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($offices as $office)
                        <tr class="search-row">
                            <td class="searchable">{{ $office }}</td>
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

</div>
@endsection

@section('scripts')
<script>
        const hideLoading = () => {
            document.getElementById('office-chart-loading')?.classList.add('hidden');
            document.getElementById('type-chart-loading')?.classList.add('hidden');
            document.getElementById('table-loading')?.classList.add('hidden');
        };

        // Standard timeout fallback
        const safetyTimeout = setTimeout(hideLoading, 5000); 

        // Ensure Chart.js is loaded
        function initCharts() {
            if (typeof Chart === 'undefined') {
                console.log('Chart.js not ready, retrying...');
                setTimeout(initCharts, 100);
                return;
            }

            try {
                const officeData = @json($officeDistribution);
                const typeData = @json($typeDistribution);

            console.log('Office Distribution Data:', officeData);
            console.log('Type Distribution Data:', typeData);

            // Common Chart Configuration
            const chartOptions = {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            color: '#94a3b8',
                            font: { family: 'Outfit', size: 12, weight: '500' },
                            padding: 25,
                            usePointStyle: true,
                            pointStyle: 'circle'
                        }
                    },
                    tooltip: {
                        backgroundColor: 'rgba(15, 23, 42, 0.9)',
                        titleColor: '#f8fafc',
                        bodyColor: '#94a3b8',
                        borderColor: 'rgba(255, 255, 255, 0.1)',
                        borderWidth: 1,
                        padding: 12,
                        displayColors: true,
                        usePointStyle: true,
                        cornerRadius: 8,
                        titleFont: { family: 'Outfit', size: 14, weight: '600' },
                        bodyFont: { family: 'Outfit', size: 13 }
                    }
                }
            };

            // Office Distribution Chart
            if (Object.keys(officeData).length > 0) {
                new Chart(document.getElementById('officeChart'), {
                    type: 'doughnut',
                    data: {
                        labels: Object.keys(officeData),
                        datasets: [{
                            data: Object.values(officeData),
                            backgroundColor: [
                                '#6366f1', '#10b981', '#3b82f6', '#8b5cf6', '#f43f5e', '#f59e0b', '#06b6d4'
                            ],
                            borderWidth: 2,
                            borderColor: '#1e293b',
                            hoverOffset: 15,
                            hoverBorderWidth: 4
                        }]
                    },
                    options: {
                        ...chartOptions,
                        cutout: '75%',
                        spacing: 5
                    }
                });
            } else {
                console.warn('No office distribution data available.');
            }

            // Personnel Type Distribution Chart
            if (Object.keys(typeData).length > 0) {
                const ctx = document.getElementById('typeChart').getContext('2d');
                const gradient = ctx.createLinearGradient(0, 0, 0, 400);
                gradient.addColorStop(0, 'rgba(99, 102, 241, 0.8)');
                gradient.addColorStop(1, 'rgba(99, 102, 241, 0.1)');

                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: Object.keys(typeData),
                        datasets: [{
                            label: 'Personnel Count',
                            data: Object.values(typeData),
                            backgroundColor: gradient,
                            borderColor: '#818cf8',
                            borderWidth: 2,
                            borderRadius: 8,
                            borderSkipped: false,
                            barThickness: 40
                        }]
                    },
                    options: {
                        ...chartOptions,
                        scales: {
                            y: {
                                beginAtZero: true,
                                grid: { color: 'rgba(255, 255, 255, 0.05)', drawBorder: false },
                                ticks: { color: '#94a3b8', stepSize: 1, font: { family: 'Outfit' } }
                            },
                            x: {
                                grid: { display: false },
                                ticks: { color: '#94a3b8', font: { family: 'Outfit' } }
                            }
                        },
                        plugins: {
                            ...chartOptions.plugins,
                            legend: { display: false }
                        }
                    }
                });
            } else {
                console.warn('No personnel type distribution data available.');
            }
            
            // Hide loading states immediately after successful initialization
            clearTimeout(safetyTimeout);
            hideLoading();
        } catch (e) {
            console.error('Chart initialization failed:', e);
            hideLoading();
        }
    }

    // Call init on DOM load (Removed, moved to end of script)

    function toggleDashboardSection(sectionId) {
        const sections = ['locations', 'offices'];
        
        sections.forEach(s => {
            const section = document.getElementById('section-' + s);
            const cardId = s === 'locations' ? 'card-updates' : 'card-' + s;
            const card = document.getElementById(cardId);
            
            if (s === sectionId) {
                if (section.classList.contains('active')) {
                    section.classList.remove('active');
                    card.classList.remove('active');
                } else {
                    section.classList.add('active');
                    card.classList.add('active');
                    section.scrollIntoView({ behavior: 'smooth', block: 'start' });
                }
            } else {
                section.classList.remove('active');
                if (card) card.classList.remove('active');
            }
        });
    }

    function powerSearch(tableId, inputId) {
        const input = document.getElementById(inputId);
        const filter = input.value.toLowerCase();
        const table = document.getElementById(tableId);
        const rows = table.querySelectorAll('.search-row');

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

    window.addEventListener('resize', () => {
        // Redraw charts if needed, Chart.js handles most of it via responsive: true
    });

    // --- Workforce Geography Logic ---
    let minimap, markerCluster;
    const employeeMarkers = {};
    const allLocations = @json($latestLocations);

    // Office Coordinate Mapping (DTI Region 6)
    const officeMapping = {
        'regional office': [10.7202, 122.5621],
        'iloilo': [10.7202, 122.5621],
        'negros occidental': [10.6765, 122.9509],
        'bacolod': [10.6765, 122.9509],
        'aklan': [11.7104, 122.3666],
        'kalibo': [11.7104, 122.3666],
        'antique': [10.7410, 121.9442],
        'san jose': [10.7410, 121.9442],
        'capiz': [11.5853, 122.7511],
        'roxas city': [11.5853, 122.7511],
        'guimaras': [10.5925, 122.5878],
        'jordan': [10.5925, 122.5878]
    };

    function getOfficeCoords(officeName) {
        if (!officeName) return [10.7202, 122.5621];
        const lower = officeName.toLowerCase();
        for (const [key, coords] of Object.entries(officeMapping)) {
            if (lower.includes(key)) return coords;
        }
        return [10.7202, 122.5621]; // Default to Regional Office
    }

    function createCustomIcon(emoji) {
        return L.divIcon({
            html: `<div style="font-size: 24px; filter: drop-shadow(0 2px 4px rgba(0,0,0,0.3));">${emoji}</div>`,
            className: 'custom-leaflet-icon',
            iconSize: [30, 30],
            iconAnchor: [15, 15],
            popupAnchor: [0, -15]
        });
    }

    function initMinimap() {
        if (typeof L === 'undefined') {
            setTimeout(initMinimap, 100);
            return;
        }

        try {
            minimap = L.map('minimap', {
                scrollWheelZoom: false
            }).setView([10.7202, 122.5621], 9); 
            
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; OpenStreetMap contributors'
            }).addTo(minimap);

            resetMinimap();
        } catch (e) {
            console.error('Minimap initialization failed:', e);
        }
    }

    function resetMinimap() {
        if (!minimap) return;
        const allIds = new Set(allLocations.map(loc => loc.user_id.toString()));
        syncMapMarkers(allIds);
        minimap.setView([10.7202, 122.5621], 9);
        document.querySelectorAll('.address-item').forEach(el => el.classList.remove('active'));
    }

    function syncMapMarkers(userIds) {
        if (!minimap) return;
        if (markerCluster) minimap.removeLayer(markerCluster);
        
        markerCluster = L.markerClusterGroup({
            showCoverageOnHover: false,
            disableClusteringAtZoom: 16
        });
        
        allLocations.forEach(loc => {
            if (userIds.has(loc.user_id.toString()) && loc.latitude && loc.longitude) {
                const marker = L.marker([loc.latitude, loc.longitude], { icon: createCustomIcon('🏠') })
                    .bindPopup(`<strong>${loc.user.name}</strong><br>Home Address<br><span style="font-size:0.8rem;">${loc.address || ''}</span>`);
                markerCluster.addLayer(marker);
            }
        });

        minimap.addLayer(markerCluster);
    }

    function focusOnMap(clickedEl, userId, lat, lng, type, officeName) {
        // Highlight active items
        document.querySelectorAll('.address-item').forEach(el => el.classList.remove('active'));
        const selector = `.address-item[data-user-id="${userId}"]`;
        const items = document.querySelectorAll(selector);
        
        let relativeOffset = 0;
        if (clickedEl) {
            const container = clickedEl.closest('.address-list');
            if (container) {
                relativeOffset = clickedEl.offsetTop - container.scrollTop;
            }
        }

        items.forEach(el => {
            el.classList.add('active');
            // Relative Sync scrolling: Align the matching item in the other list to the same vertical level
            if (el !== clickedEl) {
                const otherContainer = el.closest('.address-list');
                if (otherContainer) {
                    otherContainer.scrollTo({
                        top: el.offsetTop - relativeOffset,
                        behavior: 'smooth'
                    });
                }
            }
        });

        if (minimap) {
            // Clear existing markers for "show only what is clicked"
            if (markerCluster) minimap.removeLayer(markerCluster);
            
            let focusLat = lat;
            let focusLng = lng;
            let iconEmoji = '🏠';
            let label = 'Home Address';
            let detail = '';

            if (type === 'office') {
                const coords = getOfficeCoords(officeName);
                focusLat = coords[0];
                focusLng = coords[1];
                iconEmoji = '🏢';
                label = 'Office Assignment';
                detail = officeName;
            } else {
                const loc = allLocations.find(l => l.user_id == userId);
                detail = loc ? loc.address : '';
            }

            const emp = allLocations.find(l => l.user_id == userId);
            const name = emp ? emp.user.name : 'Employee';

            const soloMarker = L.marker([focusLat, focusLng], { icon: createCustomIcon(iconEmoji) })
                .addTo(minimap)
                .bindPopup(`<strong>${name}</strong><br>${label}<br><span style="font-size:0.8rem;">${detail}</span>`)
                .openPopup();
            
            // MarkerCluster becomes a simple Group for the solo marker
            markerCluster = L.layerGroup([soloMarker]).addTo(minimap);
            minimap.setView([focusLat, focusLng], 15, { animate: true });
        }
    }

    function filterGeoList() {
        const search = document.getElementById('geo-search').value.toLowerCase();
        const office = document.getElementById('filter-office').value;
        const type = document.getElementById('filter-type').value;

        const items = document.querySelectorAll('.geo-item');
        const visibleUserIds = new Set();

        items.forEach(item => {
            const name = item.dataset.name || '';
            const addr = item.dataset.addr || '';
            const itemOffice = item.dataset.office || '';
            const itemType = item.dataset.type || '';

            const matchSearch = name.includes(search) || addr.includes(search);
            const matchOffice = !office || itemOffice === office;
            const matchType = !type || itemType === type;

            if (matchSearch && matchOffice && matchType) {
                item.style.display = '';
                if(item.dataset.userId) visibleUserIds.add(item.dataset.userId);
            } else {
                item.style.display = 'none';
            }
        });

        // Sync map markers with search results
        syncMapMarkers(visibleUserIds);
    }

    // Call init on DOM load
    document.addEventListener('DOMContentLoaded', () => {
        initCharts();
        initMinimap();
    });
</script>
@endsection
