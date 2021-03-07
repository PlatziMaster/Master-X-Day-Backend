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
@app.route('/users')
def Index():
    cur = mysql.connection.cursor()
    cur.execute('SELECT id, name, last_name, email FROM users')
    data = cur.fetchall()
    cur.close()
    return render_template('users.html',  users=data)


@app.route('/search_flight', methods=['GET'])
def search_flight():
    if request.method == 'GET':
        cur = mysql.connection.cursor()
        cur.execute('''SELECT COUNT(*) FROM aeroplatzi.flights ''')
        rv = cur.fetchall()
        row_headers = [x[0] for x in cur.description]
        json_data = []
        for result in rv:
            json_data.append(dict(zip(row_headers, result)))
        return json.dumps(json_data)


@app.route('/create_flight', methods=['POST'])
def create_flight():
    if request.method == 'POST':
        cur = mysql.connection.cursor()

        flights_id = 123
        flights_route = 20
        flights_planes = 555
        flights_gate = '36'
        flights_is_active = 1

        fields = (flights_id, flights_route, flights_planes,flights_gate, flights_is_active)
        sql = '''INSERT INTO aeroplatzi.flights VALUES (%d,%d,%d,'2021-04-03 14:40:45','2021-04-03 14:40:45',%s,'in-flight',NOW(),NOW(),%d)'''
        cur.execute(sql % fields)
        mysql.connection.commit()

       
        return render_template('crud_flights.html')

   
@app.route('/create_flight_form', methods=['POST'])
def create_flight_form():
    if request.method == 'POST':

        cur = mysql.connection.cursor()
        origin = request.form['origin']
        destination = request.form['destination']
        date = request.form['date']
        time = request.form['time']
        boarding_gate = request.form['boarding_gate']
        status = request.form['status']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO routes (ORIGIN, DESTINATION) VALUES (%s,%s)", (origin, destination))
        cur.execute("INSERT INTO flights (ORIGIN, DESTINATION) VALUES (%s,%s)", (origin, destination))

        mysql.connection.commit()
        flash('Contact Added successfully')
    return render_template('crud_flights.html')


@app.route('/update_flight', methods=['POST'])
def update_flight():
    #cur = mysql.connection.cursor()
    #data = cur.fetchall()
    #cur.close()
    return render_template('crud_flights.html',  users=data)



@app.route('/delete_flight', methods=['POST'])
def delete_flight():
    #cur = mysql.connection.cursor()
    #data = cur.fetchall()
    # cur.close()
    return 'delete_flight'


    
@app.route('/')
def inicio():
    #cur = mysql.connection.cursor()
    #data = cur.fetchall()
    #cur.close()
    return render_template('crud_flights.html')

if __name__ == "__main__":
    app.run(port=8080, debug=True)
