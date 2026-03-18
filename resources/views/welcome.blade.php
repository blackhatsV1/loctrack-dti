@extends('layouts.app')

@section('content')
<div class="animate-fade-in text-center" style="max-width: 800px; margin: 0 auto;">
    <div style="margin-bottom: 2rem; display: flex; justify-content: center; align-items: center;">
        <picture>
            <source srcset="{{ asset('dti-logo.webp') }}" type="image/webp">
            <img src="{{ asset('dti-logo.png') }}" alt="DTI Logo" style="height: 100px; width: auto;" decoding="async">
        </picture>
    </div>
    <h1 class="hero-title" style="font-size: 3.5rem; margin-bottom: 1.5rem; font-weight: 600; line-height: 1.1;">
        Track Your Team in <br>
        <span style="background: linear-gradient(to right, #818cf8, #c084fc); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Real-Time</span>
    </h1>
    <p class="hero-subtitle" style="color: var(--text-muted); font-size: 1.25rem; margin-bottom: 3rem;">
        Empowering MSMEs across Western Visayas — <br>
        DTI Region VI's smart workforce tracking for a stronger local economy.
    </p>

    <div class="hero-buttons" style="display: flex; gap: 1.5rem; justify-content: center;">
        <a href="{{ route('login') }}" class="btn" style="padding: 1rem 2.5rem;">Sign In</a>
    </div>

    <div style="margin-top: 6rem; position: relative;">
        <div style="background: var(--glass); padding: 1rem; border-radius: 2rem; border: 1px solid var(--glass-border); opacity: 0.5;">
            <picture>
                <source srcset="{{ asset('images/world_map_preview.webp') }}" type="image/webp">
                <img src="{{ asset('images/world_map_preview.png') }}" alt="Map Preview" style="width: 100%; height: 300px; object-fit: cover; border-radius: 1.5rem; display: block;" loading="lazy" decoding="async">
            </picture>
        </div>
    </div>
</div>

<style>
    .text-center { text-align: center; }
    @media (max-width: 768px) {
        .hero-title {
            font-size: 2rem !important;
        }
        .hero-subtitle {
            font-size: 1rem !important;
        }
        .hero-subtitle br {
            display: none;
        }
        .hero-buttons {
            flex-direction: column;
            align-items: center;
        }
    }
</style>
@endsection
