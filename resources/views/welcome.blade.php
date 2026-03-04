@extends('layouts.app')

@section('content')
<div class="animate-fade-in text-center" style="max-width: 800px; margin: 0 auto;">
    <div style="margin-bottom: 2rem;">
        <img src="{{ asset('dti-logo.png') }}" alt="DTI Logo" style="height: 100px; width: auto;">
    </div>
    <h1 style="font-size: 3.5rem; margin-bottom: 1.5rem; font-weight: 600; line-height: 1.1;">
        Track Your Team in <br>
        <span style="background: linear-gradient(to right, #818cf8, #c084fc); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Real-Time</span>
    </h1>
    <p style="color: var(--text-muted); font-size: 1.25rem; margin-bottom: 3rem;">
        The most elegant and reliable way to coordinate your workforce. <br>
        Glassmorphic interface, Leaflet maps, and seamless tracking.
    </p>

    <div style="display: flex; gap: 1.5rem; justify-content: center;">
        <a href="{{ route('login') }}" class="btn" style="padding: 1rem 2.5rem;">Sign In</a>
    </div>

    <div style="margin-top: 6rem; position: relative;">
        <div style="background: var(--glass); padding: 1rem; border-radius: 2rem; border: 1px solid var(--glass-border); opacity: 0.5;">
            <img src="{{ asset('images/world_map_preview.png') }}" alt="Map Preview" style="width: 100%; height: 300px; object-fit: cover; border-radius: 1.5rem; display: block;" loading="lazy" decoding="async">
        </div>
    </div>
</div>

<style>
    .text-center { text-align: center; }
</style>
@endsection
