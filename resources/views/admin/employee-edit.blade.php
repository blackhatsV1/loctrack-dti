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

    /* Searchable Select */
    .searchable-select {
        position: relative;
    }
    .searchable-select .ss-input {
        width: 100%;
        padding: 0.65rem 2.25rem 0.65rem 1rem;
        border-radius: 0.5rem;
        background: rgba(0,0,0,0.25);
        border: 1px solid var(--glass-border);
        color: white;
        font-size: 0.9rem;
        font-family: 'Outfit', sans-serif;
        cursor: text;
    }
    .searchable-select .ss-input:focus {
        outline: none;
        border-color: var(--primary);
        box-shadow: 0 0 0 2px rgba(99,102,241,0.2);
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
        background: rgba(15, 15, 30, 0.97);
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
                    <input type="text" name="employee_id_no" value="{{ old('employee_id_no', $location->employee_id_no ?? $user->employee_id_no ?? '') }}">
                </div>

                <div class="form-group">
                    <label>Employee Type</label>
                    <div class="searchable-select" id="ss-employee-type">
                        <input type="text" class="ss-input" placeholder="Search employee type..." autocomplete="off">
                        <input type="hidden" name="employee_type" value="{{ old('employee_type', $location->employee_type ?? $user->employee_type ?? '') }}">
                        <span class="ss-arrow">▼</span>
                        <div class="ss-dropdown">
                            @foreach($employeeTypes as $type)
                                <div class="ss-option" data-value="{{ $type }}">{{ $type }}</div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label>Address</label>
                <input type="text" name="address" value="{{ old('address', $location->address ?? '') }}">
            </div>

            <div class="form-grid">
                <div class="form-group">
                    <label>Mobile No.</label>
                    <input type="text" name="mobile_no" value="{{ old('mobile_no', $location->mobile_no ?? $user->mobile_no ?? '') }}">
                </div>

                <div class="form-group">
                    <label>Office</label>
                    <div class="searchable-select" id="ss-office">
                        <input type="text" class="ss-input" placeholder="Search office..." autocomplete="off">
                        <input type="hidden" name="office" value="{{ old('office', $location->office ?? $user->office ?? '') }}">
                        <span class="ss-arrow">▼</span>
                        <div class="ss-dropdown">
                            @foreach($offices as $office)
                                <div class="ss-option" data-value="{{ $office }}">{{ $office }}</div>
                            @endforeach
                        </div>
                    </div>
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

@section('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.searchable-select').forEach(initSearchableSelect);

    function initSearchableSelect(container) {
        const input = container.querySelector('.ss-input');
        const hidden = container.querySelector('input[type="hidden"]');
        const dropdown = container.querySelector('.ss-dropdown');
        const options = Array.from(dropdown.querySelectorAll('.ss-option'));
        let highlightedIdx = -1;

        // Set initial display value from hidden input
        if (hidden.value) {
            input.value = hidden.value;
            input.classList.add('has-value');
            options.forEach(opt => {
                opt.classList.toggle('selected', opt.dataset.value === hidden.value);
            });
        }

        function open() {
            container.classList.add('open');
            filterOptions('');
            highlightedIdx = -1;
        }

        function close() {
            container.classList.remove('open');
            // Restore display to selected value
            input.value = hidden.value;
            highlightedIdx = -1;
        }

        function selectOption(value, text) {
            hidden.value = value;
            input.value = text;
            input.classList.toggle('has-value', !!value);
            options.forEach(opt => opt.classList.toggle('selected', opt.dataset.value === value));
            close();
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

            // Show/hide empty message
            let emptyMsg = dropdown.querySelector('.ss-empty');
            if (visibleCount === 0) {
                if (!emptyMsg) {
                    emptyMsg = document.createElement('div');
                    emptyMsg.className = 'ss-empty';
                    emptyMsg.textContent = 'No matches found';
                    dropdown.appendChild(emptyMsg);
                }
                emptyMsg.style.display = '';
            } else if (emptyMsg) {
                emptyMsg.style.display = 'none';
            }
            highlightedIdx = -1;
        }

        function getVisibleOptions() {
            return options.filter(opt => opt.style.display !== 'none');
        }

        function highlightOption(idx) {
            const visible = getVisibleOptions();
            visible.forEach(opt => opt.classList.remove('highlighted'));
            if (idx >= 0 && idx < visible.length) {
                highlightedIdx = idx;
                visible[idx].classList.add('highlighted');
                visible[idx].scrollIntoView({ block: 'nearest' });
            }
        }

        input.addEventListener('focus', function() {
            this.select();
            open();
        });

        input.addEventListener('input', function() {
            if (!container.classList.contains('open')) open();
            filterOptions(this.value);
        });

        input.addEventListener('keydown', function(e) {
            const visible = getVisibleOptions();
            if (e.key === 'ArrowDown') {
                e.preventDefault();
                if (!container.classList.contains('open')) open();
                highlightOption(Math.min(highlightedIdx + 1, visible.length - 1));
            } else if (e.key === 'ArrowUp') {
                e.preventDefault();
                highlightOption(Math.max(highlightedIdx - 1, 0));
            } else if (e.key === 'Enter') {
                e.preventDefault();
                if (highlightedIdx >= 0 && highlightedIdx < visible.length) {
                    selectOption(visible[highlightedIdx].dataset.value, visible[highlightedIdx].textContent);
                }
            } else if (e.key === 'Escape') {
                close();
                input.blur();
            }
        });

        options.forEach(opt => {
            opt.addEventListener('mousedown', function(e) {
                e.preventDefault(); // prevent blur before click registers
                selectOption(this.dataset.value, this.textContent);
            });
        });

        input.addEventListener('blur', function() {
            // Small delay to allow mousedown on option to fire
            setTimeout(() => close(), 150);
        });
    }
});
</script>
@endsection
