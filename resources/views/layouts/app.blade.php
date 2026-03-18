<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>DTI | Employee Locator</title>
    <link rel="icon" type="image/png" href="{{ asset('dti-logo.png') }}">
    <!-- PWA -->
    <link rel="manifest" href="{{ asset('manifest.json') }}">
    <meta name="theme-color" content="#6366f1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <link rel="apple-touch-icon" href="{{ asset('icons/icon-192.png') }}">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600&display=swap" rel="stylesheet">
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <style>
        :root {
            --primary: #6366f1;
            --primary-hover: #4f46e5;
            --bg-dark: #0f172a;
            --glass: rgba(30, 41, 59, 0.7);
            --glass-border: rgba(255, 255, 255, 0.1);
            --text-light: #f8fafc;
            --text-muted: #94a3b8;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Outfit', sans-serif;
            background-color: var(--bg-dark);
            background-image: 
                radial-gradient(at 0% 0%, rgba(99, 102, 241, 0.15) 0, transparent 50%), 
                radial-gradient(at 100% 100%, rgba(168, 85, 247, 0.15) 0, transparent 50%);
            color: var(--text-light);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        nav {
            padding: 1.5rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: var(--glass);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid var(--glass-border);
            position: sticky;
            top: 0;
            z-index: 100;
            flex-wrap: nowrap; /* Keep it in row even if it's tight */
        }

        .nav-hamburger {
            display: none;
            background: none;
            border: none;
            color: var(--text-light);
            font-size: 1.5rem;
            cursor: pointer;
            padding: 0.25rem;
            line-height: 1;
            box-shadow: none;
        }
        .nav-hamburger:hover {
            background: rgba(99, 102, 241, 0.15);
            transform: none;
            box-shadow: none;
        }

        .logo-container {
            display: flex;
            align-items: center;
            gap: 1rem;
            text-decoration: none;
            flex-shrink: 0;
            margin-right: auto; /* Push links to the right */
        }
        
        .logo-img {
            height: 48px; /* Slightly larger for better visibility */
            width: auto;
            object-fit: contain;
            display: block;
        }

        .logo-text {
            font-size: 1.5rem;
            font-weight: 600;
            letter-spacing: -0.025em;
            background: linear-gradient(to right, #818cf8, #c084fc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            white-space: nowrap;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .nav-links.mobile-open {
            display: flex;
        }

        .nav-links a {
            color: var(--text-light);
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            font-weight: 400;
            transition: all 0.2s ease;
            font-size: 0.9rem;
        }

        .nav-links a:hover {
            background: rgba(99, 102, 241, 0.15);
            color: #a5b4fc;
        }

        .nav-links a.active {
            background: rgba(99, 102, 241, 0.2);
            color: #a5b4fc;
        }

        .nav-badge {
            display: inline-block;
            background: var(--primary);
            color: white;
            font-size: 0.65rem;
            padding: 0.15rem 0.5rem;
            border-radius: 1rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            margin-left: 0.5rem;
            vertical-align: middle;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .nav-badge:hover {
            background: var(--primary-hover);
            transform: scale(1.05);
        }

        /* Modal Styles */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(8px);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .modal-overlay.active {
            display: flex;
            opacity: 1;
        }

        .modal-content {
            background: var(--glass);
            backdrop-filter: blur(24px);
            border: 1px solid var(--glass-border);
            border-radius: 1.5rem;
            width: 100%;
            max-width: 450px;
            padding: 2.5rem;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            transform: scale(0.9);
            transition: transform 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
        }

        .modal-overlay.active .modal-content {
            transform: scale(1);
        }

        .form-group {
            margin-bottom: 1.25rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-size: 0.85rem;
            color: var(--text-muted);
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border-radius: 0.75rem;
            background: rgba(0, 0, 0, 0.2);
            border: 1px solid var(--glass-border);
            color: white;
            font-family: 'Outfit', sans-serif;
            font-size: 0.95rem;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
        }

        main {
            flex: 1;
            padding: 2rem;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .container {
            width: 100%;
            max-width: 1200px;
        }

        .glass-card {
            background: var(--glass);
            backdrop-filter: blur(16px);
            border: 1px solid var(--glass-border);
            border-radius: 1.5rem;
            padding: 2.5rem;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
        }

        button, .btn {
            background: var(--primary);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 0.75rem;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            text-decoration: none;
            display: inline-block;
        }

        button:hover, .btn:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(99, 102, 241, 0.4);
        }

        .alert-success {
            background: rgba(74, 222, 128, 0.15);
            border: 1px solid rgba(74, 222, 128, 0.3);
            color: #4ade80;
            padding: 0.75rem 1.25rem;
            border-radius: 0.75rem;
            margin-bottom: 1.5rem;
            font-size: 0.9rem;
        }

        .alert-error {
            background: rgba(244, 63, 94, 0.15);
            border: 1px solid rgba(244, 63, 94, 0.3);
            color: #f43f5e;
            padding: 0.75rem 1.25rem;
            border-radius: 0.75rem;
            margin-bottom: 1.5rem;
            font-size: 0.9rem;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .animate-fade-in {
            animation: fadeIn 0.6s ease-out forwards;
        }

        /* ===== Mobile Responsive ===== */
        @media (max-width: 768px) {
            nav {
                padding: 1rem 1.25rem;
            }
            .nav-hamburger {
                display: block;
            }
            .nav-links {
                display: none;
                width: 100%;
                flex-direction: column;
                align-items: stretch;
                gap: 0;
                margin-top: 0.75rem;
                padding-top: 0.75rem;
                border-top: 1px solid var(--glass-border);
            }
            .nav-links.mobile-open {
                display: flex;
            }
            .nav-links a {
                padding: 0.75rem 0.5rem;
                border-radius: 0.5rem;
            }
            .nav-links form {
                width: 100%;
            }
            .nav-links form a {
                display: block;
                padding: 0.75rem 0.5rem;
            }
            .nav-badge {
                align-self: flex-start;
                margin-left: 0;
                margin-top: 0.25rem;
            }
            main {
                padding: 1rem;
            }
            .glass-card {
                padding: 1.25rem;
                border-radius: 1rem;
            }
            .modal-content {
                margin: 1rem;
                padding: 1.5rem;
                border-radius: 1rem;
            }
            h1 {
                font-size: 1.5rem !important;
            }
        }

        @media (max-width: 480px) {
            main {
                padding: 0.75rem;
            }
            .glass-card {
                padding: 1rem;
            }
        }

        /* ===== Reusable Loading States ===== */
        .page-loading {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 1rem;
            padding: 3rem;
            width: 100%;
        }
        .page-loading.hidden {
            display: none !important;
        }
        .spinner {
            width: 36px; height: 36px;
            border: 3px solid rgba(99, 102, 241, 0.2);
            border-top-color: #6366f1;
            border-radius: 50%;
            animation: spin 0.8s linear infinite;
        }
        .spinner-text {
            color: var(--text-muted);
            font-size: 0.9rem;
        }

        /* Global redirect loading overlay */
        #global-loader {
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(15, 23, 42, 0.85);
            backdrop-filter: blur(8px);
            z-index: 9999;
            display: flex; /* Show by default on load */
            justify-content: center;
            align-items: center;
            flex-direction: column;
            gap: 1.25rem;
            transition: opacity 0.4s ease;
        }
        
        #global-loader.fade-out {
            opacity: 0;
            pointer-events: none;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }
    </style>
    @yield('styles')
</head>
<body>
    <div id="global-loader">
        <div class="spinner" style="width: 48px; height: 48px; border-width: 4px;"></div>
        <div class="spinner-text" style="color: white; font-weight: 500;">Connecting...</div>
    </div>
    <nav>
        <a href="{{ url('/') }}" class="logo-container">
            <picture>
                <source srcset="{{ asset('dti-logo.webp') }}" type="image/webp">
                <img src="{{ asset('dti-logo.png') }}" alt="DTI Logo" class="logo-img" width="40" height="40" decoding="async">
            </picture>
            <span class="logo-text">LocTrack Pro</span>
        </a>
        <button class="nav-hamburger" onclick="document.getElementById('nav-links').classList.toggle('mobile-open')" aria-label="Toggle navigation">☰</button>
        <div class="nav-links" id="nav-links">
            @auth
                @if(auth()->user()->is_admin)
                    <a href="{{ route('admin.dashboard') }}" class="{{ request()->routeIs('admin.dashboard') ? 'active' : '' }}">Dashboard</a>
                    <a href="{{ route('admin.employees') }}" class="{{ request()->routeIs('admin.employees*') ? 'active' : '' }}">Employees</a>
                    <a href="{{ route('admin.map') }}" class="{{ request()->routeIs('admin.map') ? 'active' : '' }}">Map</a>
                    <span class="nav-badge" onclick="toggleProfileModal()">Admin</span>
                @else
                @endif
                <form method="POST" action="{{ route('logout') }}" style="display: inline;">
                    @csrf
                    <a href="{{ route('logout') }}" onclick="event.preventDefault(); this.closest('form').submit();" style="opacity: 0.7;">Logout</a>
                </form>
            @else
                <a href="{{ route('login') }}">Login</a>
            @endauth
        </div>
    </nav>

    @auth
        <!-- Profile Modal -->
        <div id="profile-modal" class="modal-overlay" onclick="if(event.target === this) toggleProfileModal()">
            <div class="modal-content">
                <h2 style="margin-bottom: 1.5rem;">Update Profile</h2>
                <form action="{{ route('admin.profile.update') }}" method="POST">
                    @csrf
                    @method('PUT')
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="name" value="{{ auth()->user()->name }}" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" name="email" value="{{ auth()->user()->email }}" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>New Password (Optional)</label>
                        <input type="password" name="password" class="form-control" autocomplete="new-password">
                    </div>
                    <div class="form-group">
                        <label>Confirm New Password</label>
                        <input type="password" name="password_confirmation" class="form-control" autocomplete="new-password">
                    </div>
                    <div style="display: flex; gap: 1rem; margin-top: 2rem;">
                        <button type="submit" style="flex: 2;">Update Details</button>
                        <button type="button" class="btn btn-ghost" style="flex: 1; background: rgba(255,255,255,0.05); color: var(--text-muted);" onclick="toggleProfileModal()">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    @endauth

    <main>
        <div class="container">
            @if(session('success'))
                <div class="alert-success">{{ session('success') }}</div>
            @endif
            @if($errors->any())
                <div class="alert-error">
                    <ul style="list-style: none; padding: 0;">
                        @foreach($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
            @yield('content')
        </div>
    </main>
    <script>
        // Global loading feedback
        window.addEventListener('load', function() {
            const loader = document.getElementById('global-loader');
            if (loader) {
                loader.classList.add('fade-out');
                setTimeout(() => {
                    loader.style.display = 'none';
                }, 400);
            }
        });

        function toggleProfileModal() {
            const modal = document.getElementById('profile-modal');
            if (modal) {
                modal.classList.toggle('active');
            }
        }

        // PWA Service Worker Registration
        if ('serviceWorker' in navigator) {
            window.addEventListener('load', () => {
                navigator.serviceWorker.register('/sw.js')
                    .then(reg => console.log('SW registered:', reg.scope))
                    .catch(err => console.log('SW registration failed:', err));
            });
        }

        // Show loader on navigation and form submissions
        function showGlobalLoader() {
            const loader = document.getElementById('global-loader');
            if (loader) {
                loader.style.display = 'flex';
                loader.style.opacity = '1';
                loader.classList.remove('fade-out');
            }
        }

        document.addEventListener('submit', function(e) {
            // Wait a tiny bit to see if the event was cancelled by onsubmit="return confirm(...)"
            setTimeout(() => {
                if (!e.defaultPrevented) {
                    showGlobalLoader();
                }
            }, 10);
        });

        document.addEventListener('click', function(e) {
            const link = e.target.closest('a');
            if (link) {
                const href = link.getAttribute('href');
                const target = link.getAttribute('target');
                
                // Conditions for showing redirect loader:
                // 1. Has href
                // 2. Not a hash link
                // 3. Not a javascript: link
                // 4. Not opening in new tab
                // 5. Not a download link
                if (href && 
                    !href.startsWith('#') && 
                    !href.startsWith('javascript:') && 
                    target !== '_blank' && 
                    !link.hasAttribute('download') &&
                    !link.classList.contains('no-loader')) {
                    
                    // Small delay to prevent flashing on very fast links
                    // but most page navigations are slow enough where this is appreciated
                    setTimeout(showGlobalLoader, 50);
                }
            }
        });

        // Handle browser back button (hide loader if it was showing)
        window.addEventListener('pageshow', function(event) {
            if (event.persisted) {
                const loader = document.getElementById('global-loader');
                if (loader) {
                    loader.style.display = 'none';
                }
            }
        });
    </script>
    @yield('scripts')
</body>
</html>
