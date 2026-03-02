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
</style>
@endsection

@section('content')
<div class="animate-fade-in">
    <h1 style="font-size: 2rem; margin-bottom: 0.5rem;">Employees</h1>
    <p style="color: var(--text-muted); margin-bottom: 2rem;">Manage and track all employees.</p>

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

    <div class="glass-card" style="padding: 0; overflow-x: auto;">
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
                            <div style="font-weight: 500;">{{ $emp->name }}</div>
                            <div style="color: var(--text-muted); font-size: 0.8rem;">{{ $emp->email }}</div>
                        </td>
                        <td>{{ $loc->employee_id_no ?? '—' }}</td>
                        <td>{{ $loc->office ?? '—' }}</td>
                        <td>{{ $loc->mobile_no ?? '—' }}</td>
                        <td style="white-space: nowrap;">
                            <a href="{{ route('admin.employees.edit', $emp) }}" class="action-link">Edit</a>
                            <a href="{{ route('admin.employees.history', $emp) }}" class="action-link">History</a>
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
</div>
@endsection
