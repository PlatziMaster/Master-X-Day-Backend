const express = require('express');
const FlightsServices = require('../services/flights');

function flights(app) {
  const router = express.Router();

  app.use('/api/flights', router);

  const flightServices = new FlightsServices();

  router.get('/', async (req, res) => {
    try {
      const details = '';
      await flightServices.getFlights(details, (err, results) => {
        if (err) {
          console.log('error in flightServices.getFlights', err);
        }
        res.status(200).send(results);
        console.log('Flights sent');
      });
      //code to get flights
    } catch (error) {
      console.log('error in getFlights', error);
    }
  });

  router.post('/', async (req, res) => {
    try {
      //code to post flight
    } catch (error) {
      console.log('error in postFlight', error);
    }
  });

  router.put('/', async (req, res) => {
    try {
    } catch (error) {
      console.log('error in updateFlight', error);
    }
  });

  router.delete('/', async (req, res) => {
    try {
      //code to delete flights
    } catch (error) {
      console.log('error in deleteFlight', error);
    }
  });
}

module.exports = flights;
