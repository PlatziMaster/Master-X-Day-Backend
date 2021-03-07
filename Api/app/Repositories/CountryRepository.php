<?php

namespace App\Repositories;

use App\Models\Country;

class CountryRepository
{
    /**
     * Show all countries with cities
     *
     * @param array $request
     * @return mixed
     */
    public function index()
    {
        return Country::select('id','name')->get();
    }
}
