[← Back to README](README.md) | [← Previous: Functional Requirements](3_Functional_Requirements.md) | [Next: Database Documentation →](5_Database_Documentation.md)

# System Architecture: Loctrack DTI

This document describes the high-level architecture and technology stack of the Employee Location Tracking System.

## Architecture Pattern
The application follows the **Model-View-Controller (MVC)** architectural pattern.

- **Model**: Eloquent ORM (e.g., `User.php`, `EmployeeLocation.php`) manages data logic and MySQL interactions.
- **View**: Responsive Blade templates enhanced with **Tailwind CSS** and **Alpine.js**.
- **Controller**: Logic handlers (e.g., `LocationController`, `AdminController`) managing input validation and response routing.

## Technology Stack

### Core Frameworks
- **Backend**: Laravel 12 (PHP 8.2+)
- **Frontend**: Blade, Tailwind CSS v4
- **Database**: MySQL (optimized with indexed time-series data)

### Specialized Integrations
- **Maps**: Leaflet.js for interactive geographical plotting.
- **Charts**: Chart.js for dashboard visualizations.
- **API**: HTML5 Geolocation API for coordinate capture.
- **Build System**: Vite for modern asset bundling.

## Infrastructure & Ops
- **Containerization**: Docker-ready (via Sail/Dockerfile).
- **Deployment**: Configured for PaaS platforms (e.g., Northflank/Render) via Nixpacks.
- **Environment**: Managed through `.env` for secure configuration.

## Key System Components

### 1. Geolocation Terminal
A RESTful interface (`/api/location`) that validates and persists GPS data. Includes built-in throttling for stability.

### 2. Admin Command Center
Protected by `AdminMiddleware`, this layer provides the visualization engine for map plotting and record auditing.

### 3. Logic & Data Flow
Employee Dashboard -> Browser Geolocation -> POST /api/location -> Laravel Controller -> MySQL Storage -> Admin Map View (Leaflet)

