from flask import Flask, render_template, request, redirect, url_for, flash, make_response
from flask_mysqldb import MySQL
import json


# initializations
app = Flask(__name__)

# Mysql Connection
app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_PORT'] = 3306
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'secret'
app.config['MYSQL_DB'] = 'aeroplatzi'
mysql = MySQL(app)

# settings
app.secret_key = "mysecretkey"

# routes


@app.route('/search_flight', methods=['GET'])
def search_flight():
    if request.method == 'GET':
        cur = mysql.connection.cursor()
        cur.execute('''SELECT COUNT(*) FROM aeroplatzi.flights ''')
        rv = cur.fetchall()
        row_headers = [x[0] for x in cur.description]
        print(rv)
        json_data = []
        for result in rv:
            json_data.append(dict(zip(row_headers, result)))
        return json.dumps(json_data)


@app.route('/create_flight', methods=['POST'])
def create_flight():
    if request.method == 'POST':
        cur = mysql.connection.cursor()

        flights_route = 123
        flights_planes = 25
        flights_takeoff = 872
        flights_landing = '2021-04-03 14:00:45'
        flights_gate = '45'
        flights_state = 'ON TIME'   
        flights_created = '2021-04-03 14:45:45'
        flights_updated = '4'
        flights_is_active = TRUE

        cur.execute('''INSERT INTO aeroplatzi.flights VALUES (123,25,872,'2021-04-03 14:00:45',
        '2021-04-03 14:45:45','4','ON TIME',NOW(),NOW(),TRUE)''')


        rv = cur.fetchall()
        row_headers = [x[0] for x in cur.description]
        print(rv)
        json_data = []
        for result in rv:
            json_data.append(dict(zip(row_headers, result)))
        return json.dumps(json_data)


@app.route('/update_flight', methods=['POST'])
def update_flight():
    #cur = mysql.connection.cursor()
    #data = cur.fetchall()
    # cur.close()
    return 'update_flight'


@app.route('/delete_flight', methods=['POST'])
def delete_flight():
    #cur = mysql.connection.cursor()
    #data = cur.fetchall()
    # cur.close()
    return 'delete_flight'


if __name__ == "__main__":
    app.run(port=5000, debug=True)
