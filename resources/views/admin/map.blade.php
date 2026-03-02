@extends('layouts.app')

@section('styles')
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin=""/>
<style>
    .map-wrapper {
        display: flex;
        gap: 0;
        width: 100%;
        height: 600px;
        border-radius: 1.5rem;
        overflow: hidden;
        border: 1px solid var(--glass-border);
        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
    }
    .filter-sidebar {
        width: 300px;
        min-width: 300px;
        background: var(--glass);
        backdrop-filter: blur(12px);
        border-right: 1px solid var(--glass-border);
        display: flex;
        flex-direction: column;
        overflow: hidden;
    }
    .filter-header {
        padding: 1.25rem;
        border-bottom: 1px solid var(--glass-border);
    }
    .filter-header h3 { font-size: 1rem; font-weight: 600; margin-bottom: 0.25rem; }
    .filter-header small { color: var(--text-muted); font-size: 0.8rem; }
    .filter-list { flex: 1; overflow-y: auto; padding: 0.5rem 0; }
    .filter-list::-webkit-scrollbar { width: 4px; }
    .filter-list::-webkit-scrollbar-thumb { background: rgba(255,255,255,0.15); border-radius: 2px; }
    .filter-item {
        display: flex;
        align-items: center;
        gap: 0.6rem;
        padding: 0.6rem 1.25rem;
        cursor: pointer;
        transition: background 0.15s;
        font-size: 0.85rem;
    }
    .filter-item:hover { background: rgba(99,102,241,0.08); }
    .filter-item input[type="checkbox"] {
        accent-color: var(--primary);
        width: 15px;
        height: 15px;
        cursor: pointer;
    }
    .filter-dot { width: 10px; height: 10px; border-radius: 50%; flex-shrink: 0; }
    .filter-item-label { flex: 1; }
    .filter-count {
        font-size: 0.7rem;
        color: var(--text-muted);
        background: rgba(255,255,255,0.06);
        padding: 0.1rem 0.45rem;
        border-radius: 1rem;
        min-width: 20px;
        text-align: center;
    }
    .filter-actions {
        padding: 0.75rem 1.25rem;
        border-top: 1px solid var(--glass-border);
        display: flex;
        gap: 0.5rem;
    }
    .filter-actions button { flex: 1; padding: 0.45rem 0.5rem; font-size: 0.8rem; border-radius: 0.4rem; }
    .btn-ghost { background: transparent; border: 1px solid var(--glass-border); color: var(--text-muted); }
    .btn-ghost:hover { background: rgba(255,255,255,0.06); transform: none; box-shadow: none; }
    #map { flex: 1; }
    .leaflet-popup-content-wrapper {
        background: var(--bg-dark); color: var(--text-light);
        border: 1px solid var(--glass-border); border-radius: 12px;
        backdrop-filter: blur(8px); box-shadow: 0 10px 25px rgba(0,0,0,0.5); padding: 0;
    }
    .leaflet-popup-content { margin: 0; font-family: 'Outfit', sans-serif; line-height: 1.5; }
    .leaflet-popup-tip { background: var(--bg-dark); }
    .popup-card { padding: 14px 16px; min-width: 240px; max-width: 280px; }
    .popup-name { font-size: 1rem; font-weight: 600; margin-bottom: 2px; }
    .popup-id { font-size: 0.75rem; color: #94a3b8; margin-bottom: 8px; }
    .popup-divider { border: none; border-top: 1px solid rgba(255,255,255,0.1); margin: 8px 0; }
    .popup-row { display: flex; gap: 8px; margin-bottom: 4px; font-size: 0.85rem; }
    .popup-label { color: #64748b; min-width: 60px; flex-shrink: 0; }
    .popup-value { color: #e2e8f0; word-break: break-word; }
    .popup-office-badge { display: inline-block; padding: 2px 8px; border-radius: 6px; font-size: 0.75rem; font-weight: 500; }
    @media (max-width: 768px) {
        .map-wrapper { flex-direction: column; }
        .filter-sidebar { width: 100%; min-width: 100%; max-height: 200px; border-right: none; border-bottom: 1px solid var(--glass-border); }
    }
</style>
@endsection

@section('content')
<div class="animate-fade-in">
    <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 1rem;">
        <div>
            <h1 style="font-size: 1.75rem; margin-bottom: 0.25rem;">Employee Locations</h1>
            <p style="color: var(--text-muted); font-size: 0.9rem;">
                Showing <span id="visible-count">0</span> of <span id="total-count">0</span> employees
            </p>
        </div>
    </div>
    <div class="map-wrapper">
        <div class="filter-sidebar">
            <div class="filter-header">
                <h3 style="display: flex; align-items: center; justify-content: space-between;">
                    🗂️ Layers
                    <div id="search-toggle" style="cursor: pointer; font-size: 0.9rem; color: var(--primary);" onclick="toggleSearch()">🔍 Search</div>
                </h3>
                <small>Toggle employee groups</small>
            </div>
            
            <!-- Power Search Input -->
            <div id="power-search-container" style="padding: 0.75rem 1.25rem; border-bottom: 1px solid var(--glass-border); display: none;">
                <input type="text" id="power-search" placeholder="Search name, ID, or office..." 
                    style="width: 100%; padding: 0.5rem 0.75rem; border-radius: 0.5rem; background: rgba(0,0,0,0.3); border: 1px solid var(--glass-border); color: white; font-size: 0.85rem; font-family: 'Outfit', sans-serif;">
            </div>

            <div class="filter-list" id="filter-list"></div>
            
            <!-- Search Results -->
            <div id="search-results" style="display: none; flex: 1; overflow-y: auto; padding: 0.5rem 0; border-top: 1px solid var(--glass-border); background: rgba(0,0,0,0.1);">
                <div style="padding: 0 1.25rem 0.5rem; font-size: 0.7rem; text-transform: uppercase; color: var(--text-muted); font-weight: 600;">Search Results</div>
                <div id="results-list"></div>
            </div>

            <div class="filter-actions">
                <button class="btn-ghost" onclick="toggleAll(false)">Hide All</button>
                <button onclick="toggleAll(true)">Show All</button>
            </div>
        </div>
        <div id="map"></div>
    </div>
</div>
@endsection

@section('scripts')
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
<script>
    const map = L.map('map').setView([10.69, 122.52], 8);

    L.tileLayer('https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> &copy; <a href="https://carto.com/attributions">CARTO</a>',
        subdomains: 'abcd',
        maxZoom: 20
    }).addTo(map);

    // ─── EXACT 8 FILTERS ───
    const categories = [
        { key: 'NC Negros Occidental',  label: 'NC Negros Occidental', color: '#3b82f6' },
        { key: 'NC Ilolo',              label: 'NC Ilolo',             color: '#800000' },
        { key: 'NC Guimaras',           label: 'NC Guimaras',           color: '#eab308' },
        { key: 'NC Capiz',              label: 'NC Capiz',              color: '#8b5cf6' },
        { key: 'NC Antique',            label: 'NC Antique',            color: '#22c55e' },
        { key: 'NC AKlan',              label: 'NC AKlan',              color: '#f97316' },
        { key: 'DTI6 Regular Employees', label: 'DTI6 Regular Employees', color: '#3b82f6' },
        { key: 'other',                 label: 'other',                 color: '#94a3b8' },
    ];

    function getCategory(loc) {
        const type = (loc.employee_type || '').toLowerCase();

        // NC Negros Occidental
        if (type.includes('negros occidental')) return 'NC Negros Occidental';
        // NC Ilolo / Iloilo
        if (type.includes('iloilo') || type.includes('ilolo')) return 'NC Ilolo';
        // NC Guimaras
        if (type.includes('guimaras')) return 'NC Guimaras';
        // NC Capiz
        if (type.includes('capiz')) return 'NC Capiz';
        // NC Antique
        if (type.includes('antique')) return 'NC Antique';
        // NC AKlan / Aklan
        if (type.includes('aklan')) return 'NC AKlan';

        // DTI6 Regular Employees
        if (type.includes('dti6') || type.includes('regular')) return 'DTI6 Regular Employees';

        return 'other';
    }

    function getCatColor(key) {
        const cat = categories.find(c => c.key === key);
        return cat ? cat.color : '#94a3b8';
    }

    // ─── House marker SVG ───
    function createHouseIcon(color) {
        const svg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 36" width="28" height="32">
            <polygon points="16,2 2,16 7,16 7,30 25,30 25,16 30,16" fill="${color}" stroke="#fff" stroke-width="1.5" stroke-linejoin="round"/>
            <rect x="12" y="20" width="8" height="10" rx="1" fill="#fff" opacity="0.85"/>
        </svg>`;
        return L.divIcon({ html: svg, className: '', iconSize: [28, 32], iconAnchor: [14, 32], popupAnchor: [0, -32] });
    }

    const iconCache = {};
    function getIcon(key) {
        if (!iconCache[key]) iconCache[key] = createHouseIcon(getCatColor(key));
        return iconCache[key];
    }

    // ─── Popup ───
    function buildPopup(loc) {
        const name = loc.user?.name || 'Unknown';
        const isMasterAdmin = loc.user?.is_admin;
        const isKmlAdmin = loc.user?.name === 'Admin' && !isMasterAdmin;
        
        const idNo = loc.employee_id_no || 'N/A';
        const empType = loc.employee_type || '';
        const office = loc.office || 'Unassigned';
        const address = loc.address || '—';
        const mobile = loc.mobile_no || '—';
        const color = getCatColor(getCategory(loc));
        
        let labelHtml = '';
        if (isKmlAdmin) {
            labelHtml = '<span style="font-size: 0.7rem; background: rgba(99, 102, 241, 0.2); color: #a5b4fc; padding: 1px 6px; border-radius: 4px; margin-left: 6px; border: 1px solid rgba(99, 102, 241, 0.3);">KML Entry</span>';
        } else if (isMasterAdmin) {
            labelHtml = '<span style="font-size: 0.7rem; background: rgba(16, 185, 129, 0.2); color: #6ee7b7; padding: 1px 6px; border-radius: 4px; margin-left: 6px; border: 1px solid rgba(16, 185, 129, 0.3);">Master Admin</span>';
        }

        return `
            <div class="popup-card">
                <div class="popup-name">${name}${labelHtml}</div>
                <div class="popup-id">ID: ${idNo}${empType ? ' • ' + empType : ''}</div>
                <hr class="popup-divider">
                <div class="popup-row"><span class="popup-label">Type</span><span class="popup-value"><span class="popup-office-badge" style="background:${color}22;color:${color};border:1px solid ${color}44;">${empType}</span></span></div>
                <div class="popup-row"><span class="popup-label">Office</span><span class="popup-value">${office}</span></div>
                <div class="popup-row"><span class="popup-label">Address</span><span class="popup-value">${address}</span></div>
                <div class="popup-row"><span class="popup-label">Mobile</span><span class="popup-value">${mobile}</span></div>
            </div>
        `;
    }

    // ─── Data ───
    let allMarkers = [];
    let catFilters = {};

    function updateCount() {
        document.getElementById('visible-count').textContent = allMarkers.filter(m => map.hasLayer(m.marker)).length;
    }

    function buildSidebar() {
        const counts = {};
        categories.forEach(c => counts[c.key] = 0);
        allMarkers.forEach(m => counts[m.catKey]++);

        const list = document.getElementById('filter-list');
        list.innerHTML = '';

        categories.forEach(cat => {
            catFilters[cat.key] = true;
            const item = document.createElement('label');
            item.className = 'filter-item';
            item.innerHTML = `
                <input type="checkbox" checked data-key="${cat.key}">
                <span class="filter-dot" style="background:${cat.color}"></span>
                <span class="filter-item-label">${cat.label}</span>
                <span class="filter-count">${counts[cat.key]}</span>
            `;
            item.querySelector('input').addEventListener('change', function() {
                catFilters[cat.key] = this.checked;
                applyFilters();
            });
            list.appendChild(item);
        });
    }

    function applyFilters() {
        allMarkers.forEach(m => {
            if (catFilters[m.catKey]) { if (!map.hasLayer(m.marker)) map.addLayer(m.marker); }
            else { if (map.hasLayer(m.marker)) map.removeLayer(m.marker); }
        });
        updateCount();
    }

    function toggleAll(state) {
        Object.keys(catFilters).forEach(k => catFilters[k] = state);
        document.querySelectorAll('.filter-item input').forEach(cb => cb.checked = state);
        applyFilters();
    }

    // ─── Power Search Functions ───
    function toggleSearch() {
        const container = document.getElementById('power-search-container');
        const list = document.getElementById('filter-list');
        const results = document.getElementById('search-results');
        const toggle = document.getElementById('search-toggle');

        if (container.style.display === 'none') {
            container.style.display = 'block';
            results.style.display = 'block';
            list.style.display = 'none';
            toggle.textContent = '🏠 Layers';
            document.getElementById('power-search').focus();
        } else {
            container.style.display = 'none';
            results.style.display = 'none';
            list.style.display = 'block';
            toggle.textContent = '🔍 Search';
            document.getElementById('power-search').value = '';
            renderResults('');
        }
    }

    function renderResults(query) {
        const list = document.getElementById('results-list');
        list.innerHTML = '';
        
        if (!query) {
            list.innerHTML = '<div style="padding: 1rem 1.25rem; color: var(--text-muted); font-size: 0.85rem;">Type to search employees...</div>';
            return;
        }

        const filtered = allMarkers.filter(m => {
            const name = m.data.user?.name || '';
            const id = m.data.employee_id_no || '';
            const office = m.data.office || '';
            const searchStr = `${name} ${id} ${office}`.toLowerCase();
            return searchStr.includes(query.toLowerCase());
        });

        if (filtered.length === 0) {
            list.innerHTML = '<div style="padding: 1rem 1.25rem; color: var(--text-muted); font-size: 0.85rem;">No employees found.</div>';
            return;
        }

        filtered.slice(0, 50).forEach(m => {
            const isMasterAdmin = m.data.user?.is_admin;
            const isKmlAdmin = m.data.user?.name === 'Admin' && !isMasterAdmin;
            
            let labelHtml = '';
            if (isKmlAdmin) {
                labelHtml = '<span style="font-size: 0.65rem; color: #818cf8; margin-left: 5px;">(KML Entry)</span>';
            } else if (isMasterAdmin) {
                labelHtml = '<span style="font-size: 0.65rem; color: #10b981; margin-left: 5px;">(Master Admin)</span>';
            }

            const item = document.createElement('div');
            item.className = 'filter-item';
            item.style.padding = '0.5rem 1.25rem';
            item.innerHTML = `
                <div style="flex: 1;">
                    <div style="font-weight: 500; font-size: 0.85rem;">${m.data.user?.name}${labelHtml}</div>
                    <div style="font-size: 0.75rem; color: var(--text-muted);">${m.data.office || 'No Office'}</div>
                </div>
            `;
            item.onclick = () => {
                map.setView(m.marker.getLatLng(), 15);
                m.marker.openPopup();
                
                // Ensure marker is visible if it was filtered out
                if (!catFilters[m.catKey]) {
                    catFilters[m.catKey] = true;
                    const checkbox = document.querySelector(`.filter-item input[data-key="${m.catKey}"]`);
                    if (checkbox) checkbox.checked = true;
                    applyFilters();
                }
            };
            list.appendChild(item);
        });

        if (filtered.length > 50) {
            const more = document.createElement('div');
            more.style.padding = '0.5rem 1.25rem';
            more.style.fontSize = '0.7rem';
            more.style.color = 'var(--text-muted)';
            more.textContent = `+ ${filtered.length - 50} more results...`;
            list.appendChild(more);
        }
    }

    document.getElementById('power-search').addEventListener('input', (e) => {
        renderResults(e.target.value);
    });

    // ─── Fetch ───
    fetch('{{ route("location.index") }}')
        .then(r => r.json())
        .then(data => {
            document.getElementById('total-count').textContent = data.length;
            data.forEach(loc => {
                const lat = parseFloat(loc.latitude);
                const lng = parseFloat(loc.longitude);
                const catKey = getCategory(loc);
                const marker = L.marker([lat, lng], { icon: getIcon(catKey) }).addTo(map);
                marker.bindPopup(buildPopup(loc), { maxWidth: 300 });
                allMarkers.push({ marker, catKey, data: loc });
            });
            buildSidebar();
            updateCount();
            renderResults(''); // Initialize search results
        })
        .catch(err => console.error('Error:', err));
</script>
@endsection
