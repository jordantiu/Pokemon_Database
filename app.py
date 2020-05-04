from flask import Flask, render_template, request, redirect, url_for
from flask_mysqldb import MySQL
import MySQLdb


app = Flask(__name__)

mysql = MySQL(app)

app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_DB'] = 'Pokemon_Database'

@app.route('/')
def login():
    return render_template('login.html', title='data')

@app.route('/checkUser', methods=["POST"])
def check():
    global username

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

@app.route('/login')
def home():
    return render_template('index.html', title='data')

    

@app.route('/index', methods=['GET','POST'])
def index():
    if request.method == "POST" and 'logout' in request.form:
        return render_template('login.html', title='data')

    # Display Trainer Information
    if request.method == "POST" and 'display_trainer' in request.form:
        labels = ["Label"]
        get_trainer_info = mysql.connection.cursor()
        get_trainer_info.execute(
            "Select trainer_name, gender, funds, badges from login INNER JOIN trainer WHERE login.trainer_id = trainer.trainer_id AND login_id = %s",
            (username,))
        fetch_trainer_info = get_trainer_info.fetchall()
        return render_template('index.html', trainer_data = fetch_trainer_info, trainer_labels = labels)

    # Display Entire Collection (Trainer Specific)
    if request.method == "POST" and 'displayCollection' in request.form:
        labels = ["Label"]
        get_collection_info = mysql.connection.cursor()
        get_collection_info.execute(
            "SELECT trainer.trainer_id, collection.capture_id, collection.nickname, pokemon.pokemon_name, collection.pokemon_level, "
            "collection.nature, pokemon.type1, pokemon.type2, collection.in_roster FROM trainer INNER JOIN collection "
            "ON collection.trainer_id = trainer.trainer_id INNER JOIN pokemon ON collection.pokedex_number = "
            "pokemon.pokedex_number INNER JOIN login ON trainer.trainer_id = login.trainer_id WHERE login_id = %s",
            (username,))
        fetch_collection = get_collection_info.fetchall()

        return render_template('index.html', collection_data=fetch_collection, collection_labels=labels)

    # Trainer Collection Search
    if request.method == "POST" and 'collection_search' in request.form:
        labels = ["Label"]
        pokemon_name = request.form['collectionInputPokemon']
        get_collection_info = mysql.connection.cursor()
        get_collection_info.execute(
            "SELECT trainer.trainer_id, collection.nickname, pokemon.pokemon_name, collection.pokemon_level, "
            "collection.nature, pokemon.type1, pokemon.type2, collection.in_roster FROM trainer INNER JOIN collection "
            "ON collection.trainer_id = trainer.trainer_id INNER JOIN pokemon ON collection.pokedex_number = "
            "pokemon.pokedex_number INNER JOIN login ON trainer.trainer_id = login.trainer_id WHERE login_id = %s AND pokemon_name = %s",
            (username, pokemon_name,))
        fetch_collection = get_collection_info.fetchall()
        return render_template('index.html', collection_data=fetch_collection, collection_labels=labels)

    # Search Pokedex by Pokedex Number
    if request.method == "POST" and 'form2' in request.form:
        labels = ["Label"]

        pID = request.form['pokedex']
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM pokemon WHERE pokedex_number = %s" % (pID))
        fetchdata = cur.fetchall()
        return render_template('index.html', data = fetchdata, pokedex_labels=labels)

    # Search Pokedex
    if request.method == "POST" and 'pokedex_search' in request.form:
        labels = ["Label"]
        pokemon_name = request.form['inputPokemon']
        type_1 = request.form['selectType1']
        type_2 = request.form['selectType2']
        egg_1 = request.form['selectEgg1']
        egg_2 = request.form['selectEgg2']
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM pokemon WHERE pokemon_name = %s OR ((type1 = %s OR type2 = %s) OR (egg_group_1 = %s OR egg_group_2 = %s))",
                    (pokemon_name, type_1, type_2, egg_1, egg_2,))
        fetch_pokedex = cur.fetchall()
        return render_template('index.html', pokedex_data = fetch_pokedex, pokedex_labels = labels)

    # Add pokemon
    if request.method == "POST" and 'addPokemon' in request.form:
        cID = request.form['captureID']
        tID = request.form['trainerID']
        gender = request.form['gender']
        pID = request.form['pokedexNumber']
        pLEV = request.form['pokemonLevel']
        nick = request.form['nickname']
        nature = request.form['nature']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO collection(capture_id, trainer_id, pokemon_gender, pokedex_number, pokemon_level, nickname, nature, in_roster) VALUES(%s,%s,%s,%s,%s, %s, %s, 0)" , (cID, tID, gender, pID, pLEV, nick, nature,))
        mysql.connection.commit()
        return render_template('index.html')

    # Switch Pokemon Lineup
    if request.method == "POST" and 'switchLineup' in request.form:
        cID = request.form['captureID']
        tID = request.form['trainerID']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE collection SET in_roster = IF(in_roster = 0, 1, 0) WHERE trainer_id = %s AND capture_id = %s" % (tID, cID))
        mysql.connection.commit()
        return render_template('index.html')

    return render_template('index.html')

if __name__ == "__main__":
    app.run(debug=True)