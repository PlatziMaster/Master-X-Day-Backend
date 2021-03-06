from flask import Flask, render_template, request, redirect, url_for, flash
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
@app.route('/')
def Index():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM users')
    data = cur.fetchall()
    cur.close()
    return render_template('index.html',  users=data)


@app.route('/add_user')
def add_contact():
    mysql.connection.cursor()
    cur.execute("INSERT INTO users (NAME, last_name, email) VALUES (%s,%s,%s)", ('William ', 'Tappan', 'ing.tappan@gmail'))
    mysql.connection.commit()
    flash('Contact Added successfully')
    return render_template('index.html')

if __name__ == "__main__":
    app.run(port=5000, debug=True)
    