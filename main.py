from flask import Flask, render_template, request, redirect, url_for, flash, make_response
from flask_mysqldb import MySQL


# initializations
app = Flask(__name__)

# Mysql Connection
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'django'
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


@app.route('/search', methods=['GET'])
def search():
    if request.method == 'GET':

        cur = mysql.connection.cursor()
        cur.execute('''SELECT user, host FROM mysql.user''')
        rv = cur.fetchall()
        print(rv)
    
    return 'search'

@app.route('/create_flight', methods=['POST'])
def create_flight():
    if request.method == 'POST':
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
    #cur.close()
    return 'delete_flight'


    
@app.route('/')
def inicio():
    #cur = mysql.connection.cursor()
    #data = cur.fetchall()
    #cur.close()
    return render_template('crud_flights.html')

if __name__ == "__main__":
    app.run(port=5000, debug=True)
