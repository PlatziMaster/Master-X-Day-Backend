from flask import Flask, render_template, request, redirect, url_for, flash, make_response
from flask_mysqldb import MySQL


# initializations
app = Flask(__name__)

# Mysql Connection
app.config['MYSQL_HOST'] = '127.0.0.1:3306'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'secret'
app.config['MYSQL_DB'] = ''
mysql = MySQL(app)

# settings
app.secret_key = "mysecretkey"

# routes


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
    #cur = mysql.connection.cursor()
    #data = cur.fetchall()
    #cur.close()
    return 'create_flight'    

@app.route('/update_flight', methods=['POST'])
def update_flight():
    #cur = mysql.connection.cursor()
    #data = cur.fetchall()
    #cur.close()
    return 'update_flight'


@app.route('/delete_flight', methods=['POST'])
def delete_flight():
    #cur = mysql.connection.cursor()
    #data = cur.fetchall()
    #cur.close()
    return 'delete_flight'

if __name__ == "__main__":
    app.run(port=5000, debug=True)
