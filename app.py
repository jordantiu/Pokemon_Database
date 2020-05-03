from flask import Flask, render_template, request, redirect, url_for

from flask_mysqldb import MySQL
import MySQLdb

app = Flask(__name__)

mysql = MySQL(app)

app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_DB'] = 'Pokemon_Database'

# @app.route('/')
# def index():
#     cur = mysql.connection.cursor()
#     cur.execute("SELECT * from pokemon")
#     fetchdata = cur.fetchall()
#     cur.close()
#     return render_template('login.html', data = fetchdata)

@app.route('/')
def login():
    return render_template('login.html', title='data')

@app.route('/checkUser', methods=["POST"])
def check():
    username = str(request.form["user"])
    password = str(request.form["password"])
    cur = mysql.connection.cursor()

    #TODO: Prevent SQL Injection
    cur.execute("SELECT login_id FROM login WHERE login_id = %s AND password = %s", (username, password,))

    user = cur.fetchone()

    if len(user) is 1:
        # Redirects page to home page
        return redirect(url_for("index"))
    else:
        return redirect(url_for("check"))

@app.route('/index', methods=['GET','POST'])
def index():
    if request.method == "POST":
        tID = request.form['trainerID']
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM COLLECTION WHERE trainer_id = %s" % (tID))
        fetchdata = cur.fetchall()
        return render_template('index.html', data = fetchdata)
    return render_template('index.html')

if __name__ == "__main__":
    app.run(debug=True)