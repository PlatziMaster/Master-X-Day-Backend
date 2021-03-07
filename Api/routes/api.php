<?php

use Illuminate\Support\Facades\Route;


Route::group(['middleware' => 'api', 'prefix' => 'v1'], function () {
    Route::get('flight/search', 'Api\FlightController@search')->name('flight.search');
    Route::apiResource('flights', 'Api\FlightController');
    Route::apiResource('countries', 'Api\CountryController');
    Route::apiResource('airports', 'Api\AirportController');
    Route::apiResource('cities', 'Api\CityController');
});
