from flask import Flask, render_template, url_for
from flask_mysqldb import MySQL

app = Flask(__name__)

mysql = MySQL(app)

app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_DB'] = 'Pokemon_Database'


@app.route('/')
def index():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * from pokemon")
    fetchdata = cur.fetchall()
    cur.close()
    return render_template('login.html', data = fetchdata)
    

if __name__ == "__main__":
    app.run(debug=True)