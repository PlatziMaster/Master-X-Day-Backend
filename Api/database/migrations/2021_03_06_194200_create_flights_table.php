<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFlightsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('flights', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('origin_airport_id');
            $table->unsignedBigInteger('destination_airport_id');
            $table->timestamp('outgoing_date');
            $table->time('outgoing_time');
            $table->integer('passenger_number');
            $table->string('boarding_gate', 4);
            $table->string('flight_status', 20);
            $table->softDeletes();
            $table->timestamps();

            /* Relations */
            $table->foreign('origin_airport_id')->references('id')->on('airports');
            $table->foreign('destination_airport_id')->references('id')->on('airports');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('flights');
    }
}
