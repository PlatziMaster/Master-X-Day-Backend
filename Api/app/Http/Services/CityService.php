<?php

namespace App\Http\Services;

use App\Repositories\CityRepository;
use App\Http\Interfaces\CityInterface;


class CityService implements CityInterface
{
    private $repository;

    /**
     * [Eng] Create a new repository instance.
     * [Spa] Crea una nueva instancia del repositorio.
     *
     * @param \App\Repositories\CityRepository $repository
     */
    public function __construct(CityRepository $repository)
    {
        $this->repository = $repository;
    }

    /**
     * [Eng] Search the amount of total flights
     * [Spa] Busca la cantidad de vuelos totales
     *
     * @param array $request
     */
    public function index(array $request)
    {
        $success = true;
        $message = 'ok';
        $response = [];

        try {
            $response = $this->repository->index($request);
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
