<?php

namespace App\Http\Controllers\Api;

use App\Models\Flight;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Interfaces\FlightInterface;

class FlightController extends Controller
{
    use ApiResponse;

    private $service;

    /**
     * [Eng] Create a new service instance.
     * [Spa] Crea una nueva instancia del servicio.
     *
     * @param App\Http\Interfaces\FlightInterface $service
     */
    public function __construct(FlightInterface $service)
    {
        $this->service = $service;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function search(Request $request)
    {
        return $this->successResponse($this->service->search($request->all()));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return $this->successResponse($this->service->store($request->all()));
    }

    /**
     * Display the specified resource.
     *
     * @param  App\Models\Flight  $flight
     * @return \Illuminate\Http\Response
     */
    public function show(Flight $flight)
    {
        return $this->successResponse($this->service->show($flight));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  App\Models\Flight  $flight
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Flight $flight)
    {
        return $this->successResponse($this->service->update($request->all(), $flight));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  App\Models\Flight  $flight
     * @return \Illuminate\Http\Response
     */
    public function destroy(Flight $flight)
    {
        return $this->successResponse($this->service->destroy($flight));
    }
}
