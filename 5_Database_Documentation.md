[← Back to README](README.md) | [← Previous: System Architecture](4_System_Architecture.md) | [Next: Deployment Guide →](6_Deployment_Guide.md)

# Database Documentation: Loctrack DTI

This document provides a detailed description of the physical database schema for the Employee Location Tracking System.

## Schema Overview
The system uses a relational schema designed to store user authentication data and associated periodic location telemetry.

---

## 1. `users` Table
Stores profile and login data for all staff and administrators.

| Column | Type | Nullable | Description |
| :--- | :--- | :--- | :--- |
| `id` | bigint | No | Primary Key |
| `name` | string | No | User's full name |
| `email` | string | No | Primary login identifier (Unique) |
| `password` | string | No | Hashed credential storage |
| `is_admin` | boolean | No | Role identifier (True = Admin, False = Employee) |
| `email_verified_at` | timestamp | Yes | Verification timestamp |
| `remember_token` | string | Yes | persistent session token |

---

## 2. `employee_locations` Table
The core repository for geographical tracking data.

| Column | Type | Nullable | Description |
| :--- | :--- | :--- | :--- |
| `id` | bigint | No | Primary Key |
| `user_id` | foreignId | No | Reference to `users.id` (onDelete: cascade) |
| `latitude` | decimal (10,8) | No | GPS Latitude |
| `longitude` | decimal (11,8) | No | GPS Longitude |
| `recorded_at` | timestamp | No | Exact time of location capture |
| `address` | string | Yes | Reverse-geocoded physical location |
| `employee_id_no` | string | Yes | Corporate employee identifier |
| `mobile_no` | string | Yes | Primary contact number |
| `office` | string | Yes | Assigned office or department |
| `employee_type` | string | Yes | Employment status (e.g., Regular, Contract) |

---

## 3. Infrastructure Tables
*   **`cache`**: Standard Laravel cache storage.
*   **`jobs`**: Table for processing background tasks.
*   **`migrations`**: Internal version control for the database schema.

## Key Performance Indexes
- **`employee_locations_recorded_at_index`**: Optimizes dashboard activity feeds and time-range reports.
- **`employee_locations_office_index`**: Speeds up office-based filtering.
- **`employee_locations_employee_type_index`**: Speeds up type-based distribution queries.
- **`employee_locations_user_id_recorded_at_index`**: Composite index for efficient per-user history lookups.
- **`employee_locations_user_id_foreign`**: Foreign key index on `user_id`.

