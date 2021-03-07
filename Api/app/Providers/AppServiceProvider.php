<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        // Services
        $this->app->bind('App\Http\Interfaces\FlightInterface', 'App\Http\Services\FlightService');
        $this->app->bind('App\Http\Interfaces\CityInterface', 'App\Http\Services\CityService');
        $this->app->bind('App\Http\Interfaces\CountryInterface', 'App\Http\Services\CountryService');
        $this->app->bind('App\Http\Interfaces\AirportInterface', 'App\Http\Services\AirportService');
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
