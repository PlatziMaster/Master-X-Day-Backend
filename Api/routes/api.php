<?php

use Illuminate\Support\Facades\Route;


Route::group(['middleware' => 'api', 'prefix' => 'v1'], function () {
    Route::get('flight/search', 'Api\FlightController@search')->name('flight.search');
    Route::apiResource('flight', 'Api\FlightController')->except('index');
    Route::apiResource('country', 'Api\CountryController');
});
