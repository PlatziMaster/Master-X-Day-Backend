const { config } = require('../config/dotenv');
const mysql = require('mysql');

//add credentials

class mySqlLib {
  constructor() {
    this.client = mysql.createConnection({
      host: config.dbHost,
      user: config.dbUser,
      password: config.dbPassword,
      database: config.dbName,
    });
    this.dbName = config.dbName;
  }

  connect() {
    if (!mySqlLib.connection) {
      //if no connection exists, create a new one
      mySqlLib.connection = new Promise((resolve, reject) => {
        this.client.connect((err) => {
          if (err) {
            reject(err);
          } else {
            console.log('Connected to MySQL db');
            resolve(this.client);
          }
        });
      });
    }
    //If the connection already exists, return it
    return mySqlLib.connection;
  }

  getCount(table, details, callback) {
    return this.connect()
      .then((db) => {
        return db.query(`SELECT COUNT(*) FROM ${table} ${details}`, callback);
      })
      .catch((err) => {
        console.log('error in getNumberOfFlights', err);
      });
  }

  async create(table, data, callback) {
    const query = await this.connect()
      .then((db) => {
        return db.query(`INSERT INTO ${table} VALUES (?);`, data, callback);
      })
      .catch((err) => {
        console.log('error in create', err);
      });
    return query;
  }

  async update(table, data, callback) {
    const query = await this.connect()
      .then((db) => {
        return db.query(
          `UPDATE ${this.table} SET Date=?, Time=?, RouteId=?, PlaneId=?, StatusId=?, NumPassenger=? where FlightId=?`
        );
      })
      .catch((err) => {
        console.log('error in update', err);
      });
    return query;
  }

  //   async updateFlights(table, data, callback) {
  //     const query = await this.connect().then((db) => {
  //         return db.query(`UPDATE ${table} SET `)
  //     })
  //   }
}

module.exports = mySqlLib;
