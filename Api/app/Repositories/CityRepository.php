<?php

namespace App\Repositories;

use App\Models\City;


class CityRepository
{
    /**
     * Show all countries with cities
     *
     * @param array $request
     * @return mixed
     */
    public function index(array $request)
    {
        return City::select('id','country_id','name')
            ->where('country_id', $request['country'])
            ->get();
    }
}
