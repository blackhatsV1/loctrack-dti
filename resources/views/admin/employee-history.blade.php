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
    @media (max-width: 768px) {
        .history-table {
            min-width: 650px;
        }
    }
</style>
@endsection

@section('content')
<div class="animate-fade-in">
    <div style="margin-bottom: 2rem;">
        <a href="{{ route('admin.employees') }}" style="color: var(--text-muted); text-decoration: none; font-size: 0.85rem;">&larr; Back to Employees</a>
    </div>

    <h1 style="font-size: 1.75rem; margin-bottom: 0.5rem;">Location History</h1>
    <p style="color: var(--text-muted); margin-bottom: 2rem;">Tracking history for <strong>{{ $user->name }}</strong> — {{ $locations->total() }} records</p>

    <div class="glass-card" style="padding: 0; overflow-x: auto; position: relative;">
        <table class="history-table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Date & Time</th>
                    <th>Latitude</th>
                    <th>Longitude</th>
                    <th>Address</th>
                    <th>Office</th>
                    <th>Actions</th>
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
                        <td>
                            <button type="button" class="btn btn-small reuse-btn" data-url="{{ route('location.reuse', $loc->id) }}" style="padding: 0.25rem 0.6rem; font-size: 0.75rem;">
                                🔄 Reuse
                            </button>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="7" style="text-align: center; color: var(--text-muted); padding: 2rem;">No location history found.</td>
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

@section('scripts')
<script>
    document.querySelectorAll('.reuse-btn').forEach(function(btn) {
        btn.addEventListener('click', function() {
            var url = this.getAttribute('data-url');
            var token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

            btn.disabled = true;
            btn.textContent = '⏳ Reusing...';
            if (typeof showGlobalLoader === 'function') showGlobalLoader();

            fetch(url, {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': token,
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({})
            })
            .then(function(response) { return response.json(); })
            .then(function(data) {
                if (data.status === 'success') {
                    window.location.reload();
                } else {
                    alert(data.message || 'Failed to reuse location.');
                    btn.disabled = false;
                    btn.textContent = '🔄 Reuse';
                    if (typeof hideGlobalLoader === 'function') hideGlobalLoader();
                }
            })
            .catch(function(err) {
                alert('Error: ' + err.message);
                btn.disabled = false;
                btn.textContent = '🔄 Reuse';
                if (typeof hideGlobalLoader === 'function') hideGlobalLoader();
            });
        });
    });
</script>
@endsection
