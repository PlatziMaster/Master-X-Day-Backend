<?php

namespace App\Http\Services;

use App\Repositories\AirportRepository;
use App\Http\Interfaces\AirportInterface;


class AirportService implements AirportInterface
{
    private $repository;

    /**
     * [Eng] Create a new repository instance.
     * [Spa] Crea una nueva instancia del repositorio.
     *
     * @param \App\Repositories\AirportRepository $repository
     */
    public function __construct(AirportRepository $repository)
    {
        $this->repository = $repository;
    }

    /**
     * [Eng] Search the amount of total flights
     * [Spa] Busca la cantidad de vuelos totales
     *
     * @param array $request
     */
    public function getAirportsByCities(array $request)
    {
        $success = true;
        $message = 'ok';
        $response = [];

        try {
            $response =  $this->repository->getAirportsByCities($request);
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
