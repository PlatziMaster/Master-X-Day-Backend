<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Flight extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'origin_airport_id',
        'destination_airport_id',
        'outgoing_date',
        'outgoing_time',
        'passenger_number',
        'boarding_gate',
        'flight_status',
    ];

    /**
     * Undocumented function
     *
     * @return void
     */
    public function originAirport()
    {
        return $this->belongsTo(Airport::class, 'id', 'origin_airport_id');
    }

    /**
     * Undocumented function
     *
     * @return void
     */
    public function destinationAirport()
    {
        return $this->belongsTo(Airport::class, 'id', 'destination_airport_id');
    }
}
