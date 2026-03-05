@extends('layouts.app')

@section('styles')
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin=""/>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
    .stat-card {
        cursor: pointer;
        transition: all 0.3s ease;
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
</style>
@endsection

@section('content')
<div class="animate-fade-in">
    <h1 style="font-size: 2rem; margin-bottom: 0.5rem;">Admin Dashboard</h1>
    <p style="color: var(--text-muted); margin-bottom: 2.5rem;">Real-time workforce distribution and analytics.</p>

    <div class="stat-grid">
        <div class="glass-card stat-card" id="card-employees" onclick="window.location.href='{{ route('admin.employees') }}'">
            <div style="font-size: 2.5rem; font-weight: 600; color: #818cf8;">
                {{ $totalEmployees }}
            </div>
            <div style="color: var(--text-muted); margin-top: 0.5rem; font-size: 0.9rem;">Total Personnel</div>
        </div>
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
        <div class="glass-card stat-card" id="card-map" onclick="window.location.href='{{ route('admin.map') }}'">
            <div style="font-size: 2.5rem; font-weight: 600;">🌍</div>
            <div style="color: var(--text-muted); margin-top: 0.5rem; font-size: 0.9rem;">Global View</div>
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
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
<script>
        const hideLoading = () => {
            document.getElementById('office-chart-loading')?.classList.add('hidden');
            document.getElementById('type-chart-loading')?.classList.add('hidden');
            document.getElementById('table-loading')?.classList.add('hidden');
        };

        // Standard timeout fallback
        const safetyTimeout = setTimeout(hideLoading, 5000); 

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
</script>
@endsection
