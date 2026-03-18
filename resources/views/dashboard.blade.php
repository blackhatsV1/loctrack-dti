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
        <div style="display: flex; gap: 1rem;">
            <button type="button" id="checkin-btn" onclick="performCheckin()" class="btn-primary" style="padding: 0.75rem 1.5rem;">
                📍 Quick Check-in
            </button>
        </div>
    </div>

    <!-- Stats Row -->
    <div class="stat-grid">
        <div class="glass-card stat-card" style="flex: 1;">
            <div class="stat-value">{{ $totalCheckins }}</div>
            <div class="stat-label">Total Check-ins</div>
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
                        <div class="address-text">{{ $homeLocation->address ?? 'No home address setup yet.' }}</div>
                        <button class="btn-small btn-secondary" style="width: 100%;" onclick="toggleEdit('home', true, event)">Update Location</button>
                    </div>

                    <div id="home-edit" style="display: none;">
                        <input type="text" id="home-address-input" class="form-control" style="margin-bottom: 1rem;" placeholder="Enter address..." value="{{ $homeLocation->address ?? '' }}">
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
                        <div class="address-text">{{ $officeLocation->office ?? 'No office assigned yet.' }}</div>
                        <button class="btn-small btn-secondary" style="width: 100%;" onclick="toggleEdit('office', true, event)">Update Role</button>
                    </div>

                    <div id="office-edit" style="display: none;">
                        <input type="text" id="office-address-input" class="form-control" style="margin-bottom: 1rem;" placeholder="Enter office name/address..." value="{{ $officeLocation->office ?? '' }}">
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

    function performCheckin() {
        if (!currentCoords) return alert('Acquiring location...');
        const btn = document.getElementById('checkin-btn');
        btn.disabled = true; btn.textContent = 'Updating...';

        fetch('{{ route("location.store") }}', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json', 'X-CSRF-TOKEN': '{{ csrf_token() }}' },
            body: JSON.stringify({ latitude: currentCoords.lat, longitude: currentCoords.lng })
        }).then(r => r.ok ? window.location.reload() : (btn.disabled = false, btn.textContent = 'Retry Check-in'));
    }
</script>
@endsection
