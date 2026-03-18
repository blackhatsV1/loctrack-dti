@extends('layouts.app')

@section('styles')
<style>
    .search-bar {
        display: flex;
        gap: 1rem;
        margin-bottom: 2rem;
        flex-wrap: wrap;
    }
    .search-bar input, .search-bar select {
        padding: 0.65rem 1rem;
        border-radius: 0.5rem;
        background: rgba(0,0,0,0.25);
        border: 1px solid var(--glass-border);
        color: white;
        font-size: 0.9rem;
        font-family: 'Outfit', sans-serif;
    }
    .search-bar input { flex: 1; min-width: 200px; }
    .search-bar select { min-width: 180px; }
    .search-bar button {
        padding: 0.65rem 1.5rem;
        font-size: 0.9rem;
    }

    .emp-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 0.9rem;
    }
    .emp-table th {
        text-align: left;
        padding: 0.75rem 1rem;
        color: var(--text-muted);
        font-weight: 400;
        border-bottom: 1px solid var(--glass-border);
        white-space: nowrap;
    }
    .emp-table td {
        padding: 0.75rem 1rem;
        border-bottom: 1px solid rgba(255,255,255,0.04);
        vertical-align: middle;
    }
    .emp-table tr:hover td {
        background: rgba(99, 102, 241, 0.06);
    }
    .action-link {
        color: #818cf8;
        text-decoration: none;
        font-weight: 500;
        margin-right: 1rem;
        font-size: 0.85rem;
    }
    .action-link:hover {
        color: #a5b4fc;
        text-decoration: underline;
    }
    .pagination-links {
        margin-top: 1.5rem;
        display: flex;
        justify-content: center;
        gap: 0.25rem;
    }
    .pagination-links a, .pagination-links span {
        padding: 0.4rem 0.75rem;
        border-radius: 0.4rem;
        text-decoration: none;
        font-size: 0.85rem;
        color: var(--text-muted);
        border: 1px solid var(--glass-border);
    }
    .pagination-links a:hover { background: rgba(99,102,241,0.15); color: white; }
    .pagination-links .active { background: var(--primary); color: white; border-color: var(--primary); }
    .emp-count { color: var(--text-muted); font-size: 0.85rem; margin-bottom: 1rem; }
    @media (max-width: 768px) {
        .search-bar {
            flex-direction: column;
        }
        .search-bar input {
            min-width: 100%;
        }
        .search-bar select {
            min-width: 100%;
        }
        .emp-table {
            min-width: 600px;
        }
    }

    /* Modal Styles */
    .modal {
        display: none;
        position: fixed;
        top: 0; left: 0; width: 100%; height: 100%;
        background: rgba(15, 23, 42, 0.82);
        backdrop-filter: blur(8px);
        z-index: 9999;
        align-items: center;
        justify-content: center;
    }
    .modal.active { display: flex; }
    .modal-content {
        width: 90%;
        max-width: 500px;
        max-height: 90vh;
        overflow-y: auto;
    }
    .input-group {
        margin-bottom: 1.25rem;
    }
    .input-label {
        display: block;
        margin-bottom: 0.5rem;
        color: var(--text-muted);
        font-size: 0.9rem;
    }
    .form-input {
        width: 100%;
        padding: 0.75rem 1rem;
        border-radius: 0.75rem;
        background: rgba(0, 0, 0, 0.2);
        border: 1px solid var(--glass-border);
        color: white;
        font-family: 'Outfit', sans-serif;
    }
    .btn-danger {
        background: #ef4444;
        color: white;
    }
    .btn-danger:hover {
        background: #dc2626;
    }
</style>
@endsection

@section('content')
<div class="animate-fade-in">
    <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 2rem;">
        <div>
            <h1 style="font-size: 2rem; margin-bottom: 0.5rem;">Employees</h1>
            <p style="color: var(--text-muted); margin-bottom: 0;">Manage and track all employees.</p>
        </div>
        <button onclick="openAddModal()" class="btn" style="background: var(--primary); display: flex; align-items: center; gap: 0.5rem;">
            <span>➕</span> Add Employee
        </button>
    </div>

    <form method="GET" action="{{ route('admin.employees') }}" class="search-bar">
        <input type="text" name="search" value="{{ request('search') }}" placeholder="Search by name or email...">
        <select name="office">
            <option value="">All Offices</option>
            @foreach($offices as $o)
                <option value="{{ $o }}" {{ request('office') == $o ? 'selected' : '' }}>{{ $o }}</option>
            @endforeach
        </select>
        <button type="submit">Search</button>
        @if(request('search') || request('office'))
            <a href="{{ route('admin.employees') }}" style="color: var(--text-muted); text-decoration: none; padding: 0.65rem 1rem; font-size: 0.9rem;">Clear</a>
        @endif
    </form>

    <div class="emp-count">Showing {{ $employees->count() }} of {{ $employees->total() }} employees</div>

    <div class="glass-card" style="padding: 0; overflow-x: auto; position: relative;">
        <div class="page-loading" id="employees-loading" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 10; background: rgba(15, 23, 42, 0.82);">
            <div class="spinner"></div>
        </div>
        <table class="emp-table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>ID No.</th>
                    <th>Office</th>
                    <th>Mobile</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @forelse($employees as $emp)
                    @php $loc = $emp->locations->first(); @endphp
                    <tr>
                        <td>
                            <div style="display: flex; align-items: center; gap: 0.5rem;">
                                <div style="font-weight: 500;">{{ $emp->name }}</div>
                            </div>
                            <div style="color: var(--text-muted); font-size: 0.8rem;">{{ $emp->email }}</div>
                        </td>
                        <td>{{ $loc->employee_id_no ?? '—' }}</td>
                        <td>{{ $loc->office ?? '—' }}</td>
                        <td>{{ $loc->mobile_no ?? '—' }}</td>
                        <td style="white-space: nowrap;">
                            <a href="{{ route('admin.employees.edit', $emp) }}" class="action-link">Edit</a>
                            <a href="{{ route('admin.employees.history', $emp) }}" class="action-link">History</a>
                            <button onclick="confirmDelete('{{ $emp->id }}', '{{ $emp->name }}')" class="action-link" style="background: none; border: none; cursor: pointer; color: #ef4444;">Delete</button>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="5" style="text-align: center; color: var(--text-muted); padding: 2rem;">No employees found.</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    @if($employees->hasPages())
    <div class="pagination-links">
        @if($employees->onFirstPage())
            <span>&laquo;</span>
        @else
            <a href="{{ $employees->previousPageUrl() }}">&laquo;</a>
        @endif

        @foreach($employees->getUrlRange(1, $employees->lastPage()) as $page => $url)
            @if($page == $employees->currentPage())
                <span class="active">{{ $page }}</span>
            @else
                <a href="{{ $url }}">{{ $page }}</a>
            @endif
        @endforeach

        @if($employees->hasMorePages())
            <a href="{{ $employees->nextPageUrl() }}">&raquo;</a>
        @else
            <span>&raquo;</span>
        @endif
    </div>
    @endif

    <!-- Add Employee Modal -->
    <div id="add-employee-modal" class="modal">
        <div class="glass-card modal-content animate-fade-in">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem;">
                <h2 style="margin: 0;">Add New Employee</h2>
                <button onclick="closeAddModal()" style="background: transparent; border: none; color: white; font-size: 1.5rem; cursor: pointer;">&times;</button>
            </div>

            <form action="{{ route('admin.employees.store') }}" method="POST">
                @csrf
                <div class="input-group">
                    <label class="input-label">Full Name</label>
                    <input type="text" name="name" class="form-input" placeholder="e.g. Juan Dela Cruz" required>
                </div>

                <div class="input-group">
                    <label class="input-label">Email Address</label>
                    <input type="email" name="email" class="form-input" placeholder="e.g. juan@dti6.gov.ph" required>
                </div>

                <div class="input-group">
                    <label class="input-label">Mobile Number</label>
                    <input type="text" name="mobile_no" class="form-input" placeholder="e.g. 09123456789" required>
                </div>

                <div style="display: flex; gap: 1rem; margin-top: 2rem;">
                    <button type="button" onclick="closeAddModal()" class="btn" style="background: rgba(255,255,255,0.1); flex: 1; border: 1px solid var(--glass-border); color: white;">Cancel</button>
                    <button type="submit" class="btn" style="flex: 2; background: var(--primary);">Create Account</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div id="delete-modal" class="modal">
        <div class="glass-card modal-content animate-fade-in" style="max-width: 400px; text-align: center; padding: 2rem;">
            <div style="font-size: 3rem; margin-bottom: 1rem;">⚠️</div>
            <h2 style="margin-bottom: 0.5rem; border: none;">Delete Employee?</h2>
            <p style="color: var(--text-muted); margin-bottom: 2rem;">
                Are you sure you want to delete <strong id="delete-emp-name" style="color: white;"></strong>? 
                This action cannot be undone and all location history will be lost.
            </p>

            <form id="delete-form" method="POST">
                @csrf
                @method('DELETE')
                <div style="display: flex; gap: 1rem;">
                    <button type="button" onclick="closeDeleteModal()" class="btn" style="background: rgba(255,255,255,0.1); flex: 1; border: 1px solid var(--glass-border); color: white;">Cancel</button>
                    <button type="submit" class="btn btn-danger" style="flex: 1;">Delete Account</button>
                </div>
            </form>
        </div>
    </div>
</div>
@section('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        setTimeout(() => {
            document.getElementById('employees-loading')?.classList.add('hidden');
        }, 600);
    });

    function openAddModal() {
        document.getElementById('add-employee-modal').classList.add('active');
    }

    function closeAddModal() {
        document.getElementById('add-employee-modal').classList.remove('active');
    }

    function confirmDelete(id, name) {
        const modal = document.getElementById('delete-modal');
        const form = document.getElementById('delete-form');
        const nameSpan = document.getElementById('delete-emp-name');
        
        nameSpan.innerText = name;
        form.action = `/admin/employees/${id}`;
        modal.classList.add('active');
    }

    function closeDeleteModal() {
        document.getElementById('delete-modal').classList.remove('active');
    }

    // Close modals on escape key
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            closeAddModal();
            closeDeleteModal();
        }
    });

    // Close modals on clicking outside
    window.onclick = function(event) {
        const addModal = document.getElementById('add-employee-modal');
        const deleteModal = document.getElementById('delete-modal');
        if (event.target == addModal) closeAddModal();
        if (event.target == deleteModal) closeDeleteModal();
    }
</script>
@endsection
@endsection
