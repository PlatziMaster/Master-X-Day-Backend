<?php

namespace App\Http\Services;

use App\Models\Flight;
use App\Repositories\FlightRepository;
use App\Http\Interfaces\FlightInterface;


class FlightService implements FlightInterface
{
    private $repository;

    /**
     * [Eng] Create a new repository instance.
     * [Spa] Crea una nueva instancia del repositorio.
     *
     * @param \App\Repositories\FlightRepository $repository
     */
    public function __construct(FlightRepository $repository)
    {
        $this->repository = $repository;
    }

    /**
     * [Eng] Search the amount of total flights
     * [Spa] Busca la cantidad de vuelos totales
     *
     * @param array $request
     */
    public function search(array $request)
    {
        $success = true;
        $message = 'ok';
        $response = [];

        try {
            $response = "Search All";
        } catch (\Exception $e) {
            $success = false;
            $message = $e->getMessage();
            throw $e;
        }

        return [
            'success' => $success,
            'message' => $message,
            'attributes' => $response
        ];
    }

    /**
     * [Eng] Create a flight
     * [Spa] Crear un vuelo
     *
     * @param array $request
     */
    public function store(array $request)
    {
        $success = true;
        $message = 'ok';
        $response = [];

        try {
            $flight = $this->repository->store($request);
            $response = $flight;
            $message = 'the flight has been successfully stored';
        } catch (\Exception $e) {
            $success = false;
            $message = $e->getMessage();
            throw $e;
        }

        return [
            'success' => $success,
            'message' => $message,
            'attributes' => $response
        ];
    }

    /**
     * [Eng] Displays the flight information.
     * [Spa] Muestra la información del vuelo.
     *
     * @param array $request
     */
    public function show(Flight $flight)
    {
        $success = true;
        $message = 'ok';
        $response = [];

        try {
            $response = $flight;
        } catch (\Exception $e) {
            $success = false;
            $message = $e->getMessage();
            throw $e;
        }

        return [
            'success' => $success,
            'message' => $message,
            'attributes' => $response
        ];
    }

    /**
     * [Eng] Update a flight
     * [Spa] Actualiza un vuelo
     *
     * @param array $request
     */
    public function update(array $request, Flight $flight)
    {
        $success = true;
        $message = 'ok';
        $response = [];

        try {
            $data = $this->repository->update($request, $flight);
            $response = $data;
            $message = 'the flight has been successfully updated';
        } catch (\Exception $e) {
            $success = false;
            $message = $e->getMessage();
            throw $e;
        }

        return [
            'success' => $success,
            'message' => $message,
            'attributes' => $response
        ];
    }

    /**
     * [Eng] Delete a flight.
     * [Spa] Elimina un vuelo
     *
     * @param array $request
     */
    public function destroy(Flight $flight)
    {
        $success = true;
        $message = 'ok';
        $response = [];

        try {
            $this->repository->delete($flight);
            $message = 'the flight has been successfully deleted';
        } catch (\Exception $e) {
            $success = false;
            $message = $e->getMessage();
            throw $e;
        }

        return [
            'success' => $success,
            'message' => $message,
            'attributes' => $response
        ];
    }
}
