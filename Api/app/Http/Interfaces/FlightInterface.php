<?php

namespace App\Http\Interfaces;

use App\Models\Flight;

interface FlightInterface
{
    /**
     * Undocumented function
     *
     * @param array $request
     */
    public function search(array $request);

    /**
     * Undocumented function
     *
     * @param array $request
     */
    public function store(array $request);

    /**
     * Undocumented function
     *
     * @param App\Models\Flight $flight
     */
    public function show(Flight $flight);

    /**
     * Undocumented function
     *
     * @param array $request
     * @param App\Models\Flight $flight
     */
    public function update(array $request, Flight $flight);

    /**
     * Undocumented function
     *
     * @param App\Models\Flight $flight
     */
    public function destroy(Flight $flight);

}
