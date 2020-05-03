from flask import Flask, render_template, url_for, request, redirect
from flask_mysqldb import MySQL

app = Flask(__name__)

mysql = MySQL(app)

app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_DB'] = 'Pokemon_Database'

@app.route('/', methods=['GET','POST'])
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