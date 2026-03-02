@extends('layouts.app')

@section('styles')
<style>
    .history-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 0.9rem;
    }
    .history-table th {
        text-align: left;
        padding: 0.75rem 1rem;
        color: var(--text-muted);
        font-weight: 400;
        border-bottom: 1px solid var(--glass-border);
    }
    .history-table td {
        padding: 0.75rem 1rem;
        border-bottom: 1px solid rgba(255,255,255,0.04);
    }
    .history-table tr:hover td {
        background: rgba(99, 102, 241, 0.06);
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
    .coord-mono { font-family: monospace; font-size: 0.85rem; color: var(--text-muted); }
</style>
@endsection

@section('content')
<div class="animate-fade-in">
    <div style="margin-bottom: 2rem;">
        <a href="{{ route('admin.employees') }}" style="color: var(--text-muted); text-decoration: none; font-size: 0.85rem;">&larr; Back to Employees</a>
    </div>

    <h1 style="font-size: 1.75rem; margin-bottom: 0.5rem;">Location History</h1>
    <p style="color: var(--text-muted); margin-bottom: 2rem;">Tracking history for <strong>{{ $user->name }}</strong> — {{ $locations->total() }} records</p>

    <div class="glass-card" style="padding: 0; overflow-x: auto;">
        <table class="history-table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Date & Time</th>
                    <th>Latitude</th>
                    <th>Longitude</th>
                    <th>Address</th>
                    <th>Office</th>
                </tr>
            </thead>
            <tbody>
                @forelse($locations as $index => $loc)
                    <tr>
                        <td style="color: var(--text-muted);">{{ $locations->firstItem() + $index }}</td>
                        <td>{{ \Carbon\Carbon::parse($loc->recorded_at)->format('M d, Y — h:i A') }}</td>
                        <td class="coord-mono">{{ $loc->latitude }}</td>
                        <td class="coord-mono">{{ $loc->longitude }}</td>
                        <td>{{ $loc->address ?? '—' }}</td>
                        <td>{{ $loc->office ?? '—' }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="6" style="text-align: center; color: var(--text-muted); padding: 2rem;">No location history found.</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    @if($locations->hasPages())
    <div class="pagination-links">
        @if($locations->onFirstPage())
            <span>&laquo;</span>
        @else
            <a href="{{ $locations->previousPageUrl() }}">&laquo;</a>
        @endif

        @foreach($locations->getUrlRange(1, $locations->lastPage()) as $page => $url)
            @if($page == $locations->currentPage())
                <span class="active">{{ $page }}</span>
            @else
                <a href="{{ $url }}">{{ $page }}</a>
            @endif
        @endforeach

        @if($locations->hasMorePages())
            <a href="{{ $locations->nextPageUrl() }}">&raquo;</a>
        @else
            <span>&raquo;</span>
        @endif
    </div>
    @endif
</div>
@endsection
