var chai = require('chai');
var axios = require('axios');

const { expect } = chai;


describe('GET Method for AeroPlatzi', () => {
  it('should respond with 200 code', async () => {
    const options = {
      method: 'get',
      url: 'https://platzi-master-xday.herokuapp.com/api/flights',
    };
    const response = await axios(options);
    expect(response.status).to.equal(200);
  });
});

describe('GET Method for COUNT of total flights in AeroPlatzi', () => {
    it('should respond with 200 code', async () => {
      const options = {
        method: 'post',
        url: 'https://platzi-master-xday.herokuapp.com/api/flights/count',

      }
      const response = await axios(options);
      expect(response.status).to.equal(200);
    });
  });

describe('DELETE Method for count of total flights in AeroPlatzi', () => {
    it('should respond with 201 code', async () => {
      const options = {
        method: 'post',
        url: 'https://platzi-master-xday.herokuapp.com/api/flights',
        data: {
            FlightId: 1,
        }
      }
      const response = await axios(options);
      expect(response.status).to.equal(201);
    });
  });

  describe('POST Method for count of total flights in AeroPlatzi', () => {
    it('should respond with 201 code', async () => {
        RouteId = Math.floor((Math.random() * 10) + 1);
        PlaneId = Math.floor((Math.random() * 10) + 1);
        StatusId = Math.floor((Math.random() * 10) + 1);
        NumPassanger = Math.floor((Math.random() * 100) + 1);
      const options = {
        method: 'post',
        url: `https://platzi-master-xday.herokuapp.com/api/flights/${RouteId}/${PlaneId}/${StatusId}/${NumPassanger}`,
        data: {
        }
      }
      const response = await axios(options);
      expect(response.status).to.equal(201);
    });
  });

  describe('PUT Method for count of total flights in AeroPlatzi', () => {
    it('should respond with 201 code', async () => {
      const options = {
        method: 'post',
        url: 'https://platzi-master-xday.herokuapp.com/api/flights',
        data: {
            RouteId: Math.floor((Math.random() * 10) + 1),
            PlaneId: Math.floor((Math.random() * 10) + 1),
            StatusId: Math.floor((Math.random() * 10) + 1),
            NumPassanger: Math.floor((Math.random() * 100) + 1),
        }
      }
      const response = await axios(options);
      expect(response.status).to.equal(201);
    });
  });