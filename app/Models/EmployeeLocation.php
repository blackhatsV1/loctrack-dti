<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmployeeLocation extends Model
{
    use HasFactory;
    
    protected $casts = [
        'recorded_at' => 'datetime',
    ];

    protected $fillable = [
        'user_id',
        'type',
        'employee_id_no',
        'address',
        'latitude',
        'longitude',
        'mobile_no',
        'office',
        'employee_type',
        'recorded_at',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
