<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\V1\FlightController;

Route::apiResource('v1/flights', FlightController::class);
