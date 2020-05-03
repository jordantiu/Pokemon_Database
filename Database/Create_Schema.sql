CREATE SCHEMA Pokemon_Database;

USE Pokemon_Database; 

CREATE TABLE pokemon(
	pokemon_name VARCHAR(30) NOT NULL,
    pokedex_number INT NOT NULL,
    type1 VARCHAR(30) NOT NULL, 
    type2 VARCHAR(30),
    egg_group_1 VARCHAR(30) NOT NULL,
    egg_group_2 VARCHAR(30),
    PRIMARY KEY (pokedex_number),
    UNIQUE KEY (pokemon_name)
    );

CREATE TABLE trainer(
	trainer_id VARCHAR(6) NOT NULL, 
	trainer_name VARCHAR(30) NOT NULL,
    gender CHAR(1),
    funds INT, 
    badges INT, 
    start_date DATE, 
    total_caught INT, 
    unique_caught INT, 
	PRIMARY KEY (trainer_id),
    CONSTRAINT CHK_Funds CHECK (funds >= 0),
    CONSTRAINT CHK_Badges CHECK (badges >= 0 AND badges <= 8)
);

CREATE TABLE collection(
	capture_id INT NOT NULL,
	trainer_id VARCHAR(6) NOT NULL, 
    pokemon_gender CHAR(1), 
    pokedex_number INT NOT NULL, 
    pokemon_level INT NOT NULL, 
    nickname VARCHAR(30),
    nature VARCHAR(30),
    in_roster BOOLEAN,
    PRIMARY KEY (capture_id),
    CONSTRAINT FK_collection_trainer_id FOREIGN KEY (trainer_id) REFERENCES trainer (trainer_id),
    -- CONSTRAINT FK_collection_pokedex_number FOREIGN KEY (pokedex_number) REFERENCES pokemon (pokedex_number),
    CONSTRAINT CHK_pokemon_level CHECK (pokemon_level > 0 AND pokemon_level <= 100)
);

CREATE TABLE evolution(
	evolution_id INT NOT NULL,
    pokedex_number INT NOT NULL,
    evolves_from INT,
	evolves_to INT,
    PRIMARY KEY (evolution_id),
    CONSTRAINT FK_evolves_to_pokemon FOREIGN KEY (evolves_to) REFERENCES pokemon (pokedex_number),
	CONSTRAINT FK_evolves_from_pokemon FOREIGN KEY (evolves_from) REFERENCES pokemon (pokedex_number)
);

CREATE TABLE login(
	login_id VARCHAR(20) NOT NULL,
	trainer_id VARCHAR(6) NOT NULL,
    password VARCHAR(20) NULL,
    PRIMARY KEY (login_id),
    CONSTRAINT FK_login_id FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id)
);

/*
CREATE TABLE login(
	login_id VARCHAR(20) NOT NULL,
	trainer_id VARCHAR(6) NOT NULL,
    password blob NOT NULL,
    PRIMARY KEY (login_id),
    CONSTRAINT FK_login_id FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id)
);
*/


CREATE TABLE caught(
	capture_id INT NOT NULL,
    trainer_id VARCHAR(6) NOT NULL,
    pokedex_number INT NOT NULL,
    PRIMARY KEY(capture_id, trainer_id)
);