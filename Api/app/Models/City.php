<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class City extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'country_id',
        'name',
    ];

    /**
     * Undocumented function
     *
     * @return void
     */
    public function Country()
    {
        return $this->belongsTo(Country::class);
    }

    /**
     * Undocumented function
     *
     * @return void
     */
    public function Airports()
    {
        return $this->hasMany(Airport::class);
    }
}
