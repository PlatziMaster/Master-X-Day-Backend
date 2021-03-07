<?php

namespace App\Http\Services;

use App\Repositories\CountryRepository;
use App\Http\Interfaces\CountryInterface;


class CountryService implements CountryInterface
{
    private $repository;

    /**
     * [Eng] Create a new repository instance.
     * [Spa] Crea una nueva instancia del repositorio.
     *
     * @param \App\Repositories\CountryRepository $repository
     */
    public function __construct(CountryRepository $repository)
    {
        $this->repository = $repository;
    }

    /**
     * [Eng] Search the amount of total flights
     * [Spa] Busca la cantidad de vuelos totales
     *
     * @param array $request
     */
    public function index()
    {
        $success = true;
        $message = 'ok';
        $response = [];

        try {
            $response = $this->repository->index();
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
