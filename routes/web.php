<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\LocationController;
use App\Http\Middleware\AdminMiddleware;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    if (auth()->check()) {
        return auth()->user()->is_admin 
            ? redirect()->route('admin.dashboard') 
            : redirect()->route('dashboard');
    }
    return view('welcome');
});

// Employee routes (authenticated)
Route::middleware(['auth'])->group(function () {
    Route::get('/dashboard', function () {
        if (auth()->user()->is_admin) {
            return redirect()->route('admin.dashboard');
        }
        return view('dashboard');
    })->name('dashboard');

    Route::post('/api/location', [LocationController::class, 'store'])
        ->middleware('throttle:30,1')
        ->name('location.store');
});

// Admin routes (authenticated + admin)
Route::middleware(['auth', AdminMiddleware::class])->prefix('admin')->group(function () {
    Route::get('/dashboard', [AdminController::class, 'dashboard'])->name('admin.dashboard');
    Route::get('/map', function () {
        return view('admin.map');
    })->name('admin.map');
    Route::get('/employees', [AdminController::class, 'index'])->name('admin.employees');
    Route::get('/employees/{user}/edit', [AdminController::class, 'edit'])->name('admin.employees.edit');
    Route::put('/employees/{user}', [AdminController::class, 'update'])->name('admin.employees.update');
    Route::get('/employees/{user}/history', [AdminController::class, 'locationHistory'])->name('admin.employees.history');

    Route::get('/api/locations', [LocationController::class, 'index'])->name('location.index');
    Route::put('/profile', [AdminController::class, 'updateProfile'])->name('admin.profile.update');
});

require __DIR__.'/auth.php';
