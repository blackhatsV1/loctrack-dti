@extends('layouts.app')

@section('content')
<div class="glass-card animate-fade-in" style="max-width: 450px; margin: 0 auto;">
    <h2 style="text-align: center; margin-bottom: 2rem;">Sign In</h2>
    <form method="POST" action="{{ route('login') }}">
        @csrf
        <div style="margin-bottom: 1.5rem;">
            <label style="display: block; margin-bottom: 0.5rem; color: var(--text-muted);">Email Address</label>
            <input type="email" name="email" value="{{ old('email') }}" required autofocus style="width: 100%; padding: 0.75rem; border-radius: 0.5rem; background: rgba(0,0,0,0.2); border: 1px solid var(--glass-border); color: white;">
            @error('email') <small style="color: #f43f5e; margin-top: 0.25rem; display: block;">{{ $message }}</small> @enderror
        </div>

        <div style="margin-bottom: 2rem;">
            <label style="display: block; margin-bottom: 0.5rem; color: var(--text-muted);">Password</label>
            <input type="password" name="password" required style="width: 100%; padding: 0.75rem; border-radius: 0.5rem; background: rgba(0,0,0,0.2); border: 1px solid var(--glass-border); color: white;">
        </div>

        <button type="submit" style="width: 100%; position: relative;" id="login-btn">
            <span id="btn-text">Login</span>
            <div id="btn-spinner" class="spinner" style="display: none; width: 20px; height: 20px; border-width: 2px; position: absolute; left: 50%; top: 50%; margin: -10px 0 0 -10px; border-top-color: white;"></div>
        </button>
    </form>
</div>

@section('scripts')
<script>
    document.querySelector('form').addEventListener('submit', function() {
        const btn = document.getElementById('login-btn');
        const text = document.getElementById('btn-text');
        const spinner = document.getElementById('btn-spinner');
        
        btn.disabled = true;
        text.style.visibility = 'hidden';
        spinner.style.display = 'block';
    });
</script>
@endsection
@endsection
