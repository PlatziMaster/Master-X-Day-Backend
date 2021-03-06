<?php

namespace App\Repositories;

use App\Models\Flight;


class FlightRepository
{
    /**
     * Create a flight
     *
     * @param array $request
     * @return App\Models\Flight
     */
    public function store(array $request)
    {
        $flight = Flight::create($request);

        return $flight->save();
    }

    /**
     * Update a flight
     *
     * @param array $request
     * @return App\Models\Flight
     */
    public function update(array $request, Flight $flight)
    {
        $flight->update($request);

        return $flight->save();
    }

    /**
     * Delete a flight.
     *
     * @param array $request
     * @return mixed
     */
    public function delete(Flight $flight)
    {
        return $flight->delete();
    }

}
