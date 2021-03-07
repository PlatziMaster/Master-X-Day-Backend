const mySqlLib = require("../db/mySQlLib");

class FlightsServices {
	constructor() {
		this.table = "Flight";
		this.mySQL = new mySqlLib();
	}

	async getFlights(details, callback) {
		const flights = await this.mySQL.getCount(this.table, details, callback);
		return flights;
	}

	async createFlight(data, callback) {
		//data is missing, it needs a parser
		const createdFlight = await this.mySQL.create(this.table, parsedValues, callback);
		return createdFlight;
	}

	//   async updateFlight(data, callback) {

	//     const updatedFlight = await this.mySQL.
	//   }
}

module.exports = FlightsServices;
