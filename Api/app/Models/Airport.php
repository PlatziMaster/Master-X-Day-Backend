<?php

namespace App\Models;

use App\Models\Country;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Airport extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'city_id',
        'name',
        'latitude',
        'longitude',
    ];

    /**
     * Undocumented function
     *
     * @return void
     */
    public function City()
    {
        return $this->belongsTo(City::class);
    }

    public function Country()
    {
        return $this->City->belongsTo(Country::class);
    }
}
