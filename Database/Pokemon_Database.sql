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

-- INSERT INTO pokemon VALUES ('name', pokedex_number, 'Type1', 'Type2', 'egg_group_1', 'Egg_group_2');
INSERT INTO pokemon VALUES ('Bulbasaur', 1, 'Grass', 'Poison', 'Monster', 'Grass');
INSERT INTO pokemon VALUES ('Ivysaur', 2, 'Grass', 'Poison', 'Monster', 'Grass');
INSERT INTO pokemon VALUES ('Venusaur', 3, 'Grass', 'Poison', 'Monster', 'Grass');
INSERT INTO pokemon VALUES ('Charmander', 4, 'Fire', NULL, 'Monster', 'Dragon');
INSERT INTO pokemon VALUES ('Charmeleon', 5, 'Fire', NULL, 'Monster', 'Dragon');
INSERT INTO pokemon VALUES ('Charizard', 6, 'Fire', 'Flying', 'Monster', 'Dragon');
INSERT INTO pokemon VALUES ('Squirtle', 7, 'Water', NULL, 'Monster', 'Water 1');
INSERT INTO pokemon VALUES ('Wartortle', 8, 'Water', NULL, 'Monster', 'Water 1');
INSERT INTO pokemon VALUES ('Blastoise', 9, 'Water', NULL, 'Monster', 'Water 1');
INSERT INTO pokemon VALUES ('Caterpie', 10, 'Bug', NULL, 'Bug', NULL);
INSERT INTO pokemon VALUES ('Metapod', 11, 'Bug', NULL, 'Bug', NULL);
INSERT INTO pokemon VALUES ('Butterfree', 12, 'Bug', 'Flying', 'Bug', NULL);
INSERT INTO pokemon VALUES ('Weedle', 13, 'Bug', 'Poison', 'Bug', NULL);
INSERT INTO pokemon VALUES ('Kakuna', 14, 'Bug', 'Poison', 'Bug', NULL);
INSERT INTO pokemon VALUES ('Beedrill', 15, 'Bug', 'Poison', 'Bug', NULL);
INSERT INTO pokemon VALUES ('Pidgey', 16, 'Normal', 'Flying', 'Flying', NULL);
INSERT INTO pokemon VALUES ('Pidgeotto', 17, 'Normal', 'Flying', 'Flying', NULL);
INSERT INTO pokemon VALUES ('Pidgeot', 18, 'Normal', 'Flying', 'Flying', NULL);
INSERT INTO pokemon VALUES ('Rattata', 19, 'Normal', 'Dark', 'Field', NULL);
INSERT INTO pokemon VALUES ('Raticate', 20, 'Normal', 'Dark', 'Field', NULL);
INSERT INTO pokemon VALUES ('Spearow', 21, 'Normal', 'Flying', 'Flying', NULL);
INSERT INTO pokemon VALUES ('Fearow', 22, 'Normal', 'Flying', 'Flying', NULL);
INSERT INTO pokemon VALUES ('Ekans', 23, 'Poison', NULL, 'Field', 'Dragon');
INSERT INTO pokemon VALUES ('Arbok', 24, 'Poison', NULL, 'Field', 'Dragon');
INSERT INTO pokemon VALUES ('Pikachu', 25, 'Electric', NULL, 'Field', 'Fairy');
INSERT INTO pokemon VALUES ('Raichu', 26, 'Electric', 'Electric', 'Field', 'Fairy');
INSERT INTO pokemon VALUES ('Sandshrew', 27, 'Ground', 'Ice', 'Field', NULL);
INSERT INTO pokemon VALUES ('Sandslash', 28, 'Ground', 'Ice', 'Field', NULL);
INSERT INTO pokemon VALUES ('Nidoran_Female', 29, 'Poison', NULL, 'Monster', 'Field');
INSERT INTO pokemon VALUES ('Nidorina', 30, 'Poison', NULL, 'Undiscovered', NULL);
INSERT INTO pokemon VALUES ('Nidoqueen', 31, 'Poison', 'Ground', 'Undiscovered', NULL);
INSERT INTO pokemon VALUES ('Nidoran_Male', 32, 'Poison', NULL, 'Monster', 'Field');
INSERT INTO pokemon VALUES ('Nidorino', 33, 'Poison', NULL, 'Monster', 'Field');
INSERT INTO pokemon VALUES ('Nidoking', 34, 'Poison', 'Ground', 'Monster', 'Field');
INSERT INTO pokemon VALUES ('Clefairy', 35, 'Fairy', NULL, 'Fairy', NULL);
INSERT INTO pokemon VALUES ('Clefable', 36, 'Fairy', NULL, 'Fairy', NULL);
INSERT INTO pokemon VALUES ('Vulpix', 37, 'Fire', 'Ice', 'Field', NULL);
INSERT INTO pokemon VALUES ('Ninetales', 38, 'Fire', 'Ice', 'Field', NULL);
INSERT INTO pokemon VALUES ('Jigglypuff', 39, 'Normal', 'Fairy', 'Fairy', NULL);
INSERT INTO pokemon VALUES ('Wigglytuff', 40, 'Normal', 'Fairy', 'Fairy', NULL);
INSERT INTO pokemon VALUES ('Zubat', 41, 'Poison', 'Flying', 'Flying', NULL);
INSERT INTO pokemon VALUES ('Golbat', 42, 'Poison', 'Flying', 'Flying', NULL);
INSERT INTO pokemon VALUES ('Oddish', 43, 'Grass', 'Poison', 'Grass', NULL);
INSERT INTO pokemon VALUES ('Gloom', 44, 'Grass', 'Poison', 'Grass', NULL);
INSERT INTO pokemon VALUES ('Vileplume', 45, 'Grass', 'Poison', 'Grass', NULL);
INSERT INTO pokemon VALUES ('Paras', 46, 'Bug', 'Grass', 'Bug', 'Grass');
INSERT INTO pokemon VALUES ('Parasect', 47, 'Bug', 'Grass', 'Bug', 'Grass');
INSERT INTO pokemon VALUES ('Venonat', 48, 'Bug', 'Poison', 'Bug', NULL);
INSERT INTO pokemon VALUES ('Venomoth', 49, 'Bug', 'Poison', 'Bug', NULL);
INSERT INTO pokemon VALUES ('Diglett', 50, 'Ground', 'Ground', 'Field', NULL);
INSERT INTO pokemon VALUES ('Dugtrio', 51, 'Ground', 'Ground', 'Field', NULL);
INSERT INTO pokemon VALUES ('Meowth', 52, 'Normal', 'Dark', 'Field', NULL);
INSERT INTO pokemon VALUES ('Persian', 53, 'Normal', 'Dark', 'Field', NULL);
INSERT INTO pokemon VALUES ('Psyduck', 54, 'Water', NULL, 'Water 1', 'Field');
INSERT INTO pokemon VALUES ('Golduck', 55, 'Water', NULL, 'Water 1', 'Field');
INSERT INTO pokemon VALUES ('Mankey', 56, 'Fighting', NULL, 'Field', NULL);
INSERT INTO pokemon VALUES ('Primeape', 57, 'Fighting', NULL, 'Field', NULL);
INSERT INTO pokemon VALUES ('Growlithe', 58, 'Fire', NULL, 'Field', NULL);
INSERT INTO pokemon VALUES ('Arcanine', 59, 'Fire', NULL, 'Field', NULL);
INSERT INTO pokemon VALUES ('Poliwag', 60, 'Water', NULL, 'Water 1', NULL);
INSERT INTO pokemon VALUES ('Poliwhirl', 61, 'Water', NULL, 'Water 1', NULL);
INSERT INTO pokemon VALUES ('Poliwrath', 62, 'Water', 'Fighting', 'Water 1', NULL);
INSERT INTO pokemon VALUES ('Abra', 63, 'Psychic', NULL, 'Human-Like', NULL);
INSERT INTO pokemon VALUES ('Kadabra', 64, 'Psychic', NULL, 'Human-Like', NULL);
INSERT INTO pokemon VALUES ('Alakazam', 65, 'Psychic', NULL, 'Human-Like', NULL);
INSERT INTO pokemon VALUES ('Machop', 66, 'Fighting', NULL, 'Human-Like', NULL);
INSERT INTO pokemon VALUES ('Machoke', 67, 'Fighting', NULL, 'Human-Like', NULL);
INSERT INTO pokemon VALUES ('Machamp', 68, 'Fighting', NULL, 'Human-Like', NULL);
INSERT INTO pokemon VALUES ('Bellsprout', 69, 'Grass', 'Poison', 'Grass', NULL);
INSERT INTO pokemon VALUES ('Weepinbell', 70, 'Grass', 'Poison', 'Grass', NULL);
INSERT INTO pokemon VALUES ('Victreebel', 71, 'Grass', 'Poison', 'Grass', NULL);
INSERT INTO pokemon VALUES ('Tentacool', 72, 'Water', 'Poison', 'Water 3', NULL);
INSERT INTO pokemon VALUES ('Tentacruel', 73, 'Water', 'Poison', 'Water 3', NULL);
INSERT INTO pokemon VALUES ('Geodude', 74, 'Rock', 'Ground', 'Mineral', NULL);
INSERT INTO pokemon VALUES ('Graveler', 75, 'Rock', 'Ground', 'Mineral', NULL);
INSERT INTO pokemon VALUES ('Golem', 76, 'Rock', 'Ground', 'Mineral', NULL);
INSERT INTO pokemon VALUES ('Ponyta', 77, 'Fire', NULL, 'Field', NULL);
INSERT INTO pokemon VALUES ('Rapidash', 78, 'Fire', NULL, 'Field', NULL);
INSERT INTO pokemon VALUES ('Slowpoke', 79, 'Water', 'Psychic', 'Monster', 'Water 1');
INSERT INTO pokemon VALUES ('Slowbro', 80, 'Water', 'Psychic', 'Monster', 'Water 1');
INSERT INTO pokemon VALUES ('Magnemite', 81, 'Electric', 'Steel', 'Mineral', NULL);
INSERT INTO pokemon VALUES ('Magneton', 82, 'Electric', 'Steel', 'Mineral', NULL);
INSERT INTO pokemon VALUES ("Farfetch'd", 83, 'Normal', 'Flying', 'Flying', 'Field');
INSERT INTO pokemon VALUES ('Doduo', 84, 'Normal', 'Flying', 'Flying', NULL);
INSERT INTO pokemon VALUES ('Dodrio', 85, 'Normal', 'Flying', 'Flying', NULL);
INSERT INTO pokemon VALUES ('Seel', 86, 'Water', NULL, 'Water 1', 'Field');
INSERT INTO pokemon VALUES ('Dewgong', 87, 'Water', 'Ice', 'Water 1', 'Field');
INSERT INTO pokemon VALUES ('Grimer', 88, 'Poison', 'Poison', 'Amorphous', NULL);
INSERT INTO pokemon VALUES ('Muk', 89, 'Poison', 'Poison', 'Amorphous', NULL);
INSERT INTO pokemon VALUES ('Shellder', 90, 'Water', NULL, 'Water 3', NULL);
INSERT INTO pokemon VALUES ('Cloyster', 91, 'Water', 'Ice', 'Water 3', NULL);
INSERT INTO pokemon VALUES ('Gastly', 92, 'Ghost', 'Poison', 'Amorphous', NULL);
INSERT INTO pokemon VALUES ('Haunter', 93, 'Ghost', 'Poison', 'Amorphous', NULL);
INSERT INTO pokemon VALUES ('Gengar', 94, 'Ghost', 'Poison', 'Amorphous', NULL);
INSERT INTO pokemon VALUES ('Onix', 95, 'Rock', 'Ground', 'Mineral', NULL);
INSERT INTO pokemon VALUES ('Drowzee', 96, 'Psychic', NULL, 'Human-Like', NULL);
INSERT INTO pokemon VALUES ('Hypno', 97, 'Psychic', NULL, 'Human-Like', NULL);
INSERT INTO pokemon VALUES ('Krabby', 98, 'Water', NULL, 'Water 3', NULL);
INSERT INTO pokemon VALUES ('Kingler', 99, 'Water', NULL, 'Water 3', NULL);
INSERT INTO pokemon VALUES ('Voltorb', 100, 'Electric', NULL, 'Mineral', NULL);
INSERT INTO pokemon VALUES ('Electrode', 101, 'Electric', NULL, 'Mineral', NULL);
INSERT INTO pokemon VALUES ('Exeggcute', 102, 'Grass', 'Psychic', 'Grass', NULL);
INSERT INTO pokemon VALUES ('Exeggutor', 103, 'Grass', 'Psychic', 'Grass', NULL);
INSERT INTO pokemon VALUES ('Cubone', 104, 'Ground', NULL, 'Monster', NULL);
INSERT INTO pokemon VALUES ('Marowak', 105, 'Ground', 'Fire', 'Monster', NULL);
INSERT INTO pokemon VALUES ('Hitmonlee', 106, 'Fighting', NULL, 'Human-Like', NULL);
INSERT INTO pokemon VALUES ('Hitmonchan', 107, 'Fighting', NULL, 'Human-Like', NULL);
INSERT INTO pokemon VALUES ('Lickitung', 108, 'Normal', NULL, 'Monster', NULL);
INSERT INTO pokemon VALUES ('Koffing', 109, 'Poison', NULL, 'Amorphous', NULL);
INSERT INTO pokemon VALUES ('Weezing', 110, 'Poison', NULL, 'Amorphous', NULL);
INSERT INTO pokemon VALUES ('Rhyhorn', 111, 'Ground', 'Rock', 'Monster', 'Field');
INSERT INTO pokemon VALUES ('Rhydon', 112, 'Ground', 'Rock', 'Monster', 'Field');
INSERT INTO pokemon VALUES ('Chansey', 113, 'Normal', NULL, 'Fairy', NULL);
INSERT INTO pokemon VALUES ('Tangela', 114, 'Grass', NULL, 'Grass', NULL);
INSERT INTO pokemon VALUES ('Kangaskhan', 115, 'Normal', NULL, 'Monster', NULL);
INSERT INTO pokemon VALUES ('Horsea', 116, 'Water', NULL, 'Water 1', 'Dragon');
INSERT INTO pokemon VALUES ('Seadra', 117, 'Water', NULL, 'Water 1', 'Dragon');
INSERT INTO pokemon VALUES ('Goldeen', 118, 'Water', NULL, 'Water 2', NULL);
INSERT INTO pokemon VALUES ('Seaking', 119, 'Water', NULL, 'Water 2', NULL);
INSERT INTO pokemon VALUES ('Staryu', 120, 'Water', NULL, 'Water 3', NULL);
INSERT INTO pokemon VALUES ('Starmie', 121, 'Water', 'Psychic', 'Water 3', NULL);
INSERT INTO pokemon VALUES ('Mr. Mime', 122, 'Psychic', 'Fairy', 'Human-Like', NULL);
INSERT INTO pokemon VALUES ('Scyther', 123, 'Bug', 'Flying', 'Bug', NULL);
INSERT INTO pokemon VALUES ('Jynx', 124, 'Ice', 'Psychic', 'Human-Like', NULL);
INSERT INTO pokemon VALUES ('Electabuzz', 125, 'Electric', NULL, 'Human-Like', NULL);
INSERT INTO pokemon VALUES ('Magmar', 126, 'Fire', NULL, 'Human-Like', NULL);
INSERT INTO pokemon VALUES ('Pinsir', 127, 'Bug', NULL, 'Bug', NULL);
INSERT INTO pokemon VALUES ('Tauros', 128, 'Normal', NULL, 'Field', NULL);
INSERT INTO pokemon VALUES ('Magikarp', 129, 'Water', NULL, 'Water 2', 'Dragon');
INSERT INTO pokemon VALUES ('Gyarados', 130, 'Water', 'Flying', 'Water 2', 'Dragon');
INSERT INTO pokemon VALUES ('Lapras', 131, 'Water', 'Ice', 'Monster', 'Water 1');
INSERT INTO pokemon VALUES ('Ditto', 132, 'Normal', NULL, 'Ditto', NULL);
INSERT INTO pokemon VALUES ('Eevee', 133, 'Normal', NULL, 'Field', NULL);
INSERT INTO pokemon VALUES ('Vaporeon', 134, 'Water', NULL, 'Field', NULL);
INSERT INTO pokemon VALUES ('Jolteon', 135, 'Electric', NULL, 'Field', NULL);
INSERT INTO pokemon VALUES ('Flareon', 136, 'Fire', NULL, 'Field', NULL);
INSERT INTO pokemon VALUES ('Porygon', 137, 'Normal', NULL, 'Mineral', NULL);
INSERT INTO pokemon VALUES ('Omanyte', 138, 'Rock', 'Water', 'Water 1', 'Water 3');
INSERT INTO pokemon VALUES ('Omastar', 139, 'Rock', 'Water', 'Water 1', 'Water 3');
INSERT INTO pokemon VALUES ('Kabuto', 140, 'Rock', 'Water', 'Water 1', 'Water 3');
INSERT INTO pokemon VALUES ('Kabutops', 141, 'Rock', 'Water', 'Water 1', 'Water 3');
INSERT INTO pokemon VALUES ('Aerodactyl', 142, 'Rock', 'Flying', 'Flying', NULL);
INSERT INTO pokemon VALUES ('Snorlax', 143, 'Normal', NULL, 'Monster', NULL);
INSERT INTO pokemon VALUES ('Articuno', 144, 'Ice', 'Flying', 'Undiscovered', NULL);
INSERT INTO pokemon VALUES ('Zapdos', 145, 'Electric', 'Flying', 'Undiscovered', NULL);
INSERT INTO pokemon VALUES ('Moltres', 146, 'Fire', 'Flying', 'Undiscovered', NULL);
INSERT INTO pokemon VALUES ('Dratini', 147, 'Dragon', NULL, 'Water 1', 'Dragon');
INSERT INTO pokemon VALUES ('Dragonair', 148, 'Dragon', NULL, 'Water 1', 'Dragon');
INSERT INTO pokemon VALUES ('Dragonite', 149, 'Dragon', 'Flying', 'Water 1', 'Dragon');
INSERT INTO pokemon VALUES ('Mewtwo', 150, 'Psychic', NULL, 'Undiscovered', NULL);
INSERT INTO pokemon VALUES ('Mew', 151, 'Psychic', NULL, 'Undiscovered', NULL);

-- INSERT INTO evolution VALUES(0, pokedex_number, 'Evolves_from', 'Evolves_to');
INSERT INTO evolution VALUES(1, 1, NULL, 2);
INSERT INTO evolution VALUES(2, 2, 1, 3);
INSERT INTO evolution VALUES(3, 3, 2, NULL);
INSERT INTO evolution VALUES(4, 4, NULL, 5);
INSERT INTO evolution VALUES(5, 5, 4, 6);
INSERT INTO evolution VALUES(6, 6, 5, NULL);
INSERT INTO evolution VALUES(7, 7, NULL, 8);
INSERT INTO evolution VALUES(8, 8, 7, 8);
INSERT INTO evolution VALUES(9, 9, 8, NULL);
INSERT INTO evolution VALUES(10, 10, NULL, 11);
INSERT INTO evolution VALUES(11, 11, 10, 12);
INSERT INTO evolution VALUES(12, 12, 11, NULL);
INSERT INTO evolution VALUES(13, 13, NULL, 14);
INSERT INTO evolution VALUES(14, 14, 13, 16);
INSERT INTO evolution VALUES(15, 15, 14, NULL);
INSERT INTO evolution VALUES(16, 16, NULL, 17);
INSERT INTO evolution VALUES(17, 17, 16, 18);
INSERT INTO evolution VALUES(18, 18, 17, NULL);
INSERT INTO evolution VALUES(19, 19, NULL, 20);
INSERT INTO evolution VALUES(20, 20, 19, NULL);
INSERT INTO evolution VALUES(21, 21, NULL, 22);
INSERT INTO evolution VALUES(22, 22, 21, NULL);
INSERT INTO evolution VALUES(23, 23, NULL, 24);
INSERT INTO evolution VALUES(24, 24, 23, NULL);
INSERT INTO evolution VALUES(25, 25, NULL, 26);
INSERT INTO evolution VALUES(26, 26, 25, NULL);
INSERT INTO evolution VALUES(27, 27, NULL, 28);
INSERT INTO evolution VALUES(28, 28, 27, NULL);
INSERT INTO evolution VALUES(29, 29, NULL, 30);
INSERT INTO evolution VALUES(30, 30, 29, 31);
INSERT INTO evolution VALUES(31, 31, 30, NULL);
INSERT INTO evolution VALUES(32, 32, NULL, 33);
INSERT INTO evolution VALUES(33, 33, 32, 34);
INSERT INTO evolution VALUES(34, 34, 33, NULL);
INSERT INTO evolution VALUES(35, 35, NULL, 36);
INSERT INTO evolution VALUES(36, 36, 35, NULL);
INSERT INTO evolution VALUES(37, 37, NULL, 38);
INSERT INTO evolution VALUES(38, 38, 37, NULL);
INSERT INTO evolution VALUES(39, 39, NULL, 40);
INSERT INTO evolution VALUES(40, 40, 39, NULL);
INSERT INTO evolution VALUES(41, 41, NULL, 42);
INSERT INTO evolution VALUES(42, 42, 41, NULL);
INSERT INTO evolution VALUES(43, 43, NULL, 44);
INSERT INTO evolution VALUES(44, 44, 43, 45);
INSERT INTO evolution VALUES(45, 45, 44, NULL);
INSERT INTO evolution VALUES(46, 46, NULL, 47);
INSERT INTO evolution VALUES(47, 47, 46, NULL);
INSERT INTO evolution VALUES(48, 48, NULL, 49);
INSERT INTO evolution VALUES(49, 49, 48, NULL);
INSERT INTO evolution VALUES(50, 50, NULL, 51);
INSERT INTO evolution VALUES(51, 51, 50, NULL);
INSERT INTO evolution VALUES(52, 52, NULL, 53);
INSERT INTO evolution VALUES(53, 53, 52, NULL);
INSERT INTO evolution VALUES(54, 54, NULL, 55);
INSERT INTO evolution VALUES(55, 55, 54, NULL);
INSERT INTO evolution VALUES(56, 56, NULL, 57);
INSERT INTO evolution VALUES(57, 57, 56, NULL);
INSERT INTO evolution VALUES(58, 58, NULL, 59);
INSERT INTO evolution VALUES(59, 59, 58, NULL);
INSERT INTO evolution VALUES(60, 60, NULL, 61);
INSERT INTO evolution VALUES(61, 61, 60, 62);
INSERT INTO evolution VALUES(62, 62, 61, NULL);
INSERT INTO evolution VALUES(63, 63, NULL, 64);
INSERT INTO evolution VALUES(64, 64, 63, 65);
INSERT INTO evolution VALUES(65, 65, 64, NULL);
INSERT INTO evolution VALUES(66, 66, NULL, 67);
INSERT INTO evolution VALUES(67, 67, 66, 68);
INSERT INTO evolution VALUES(68, 68, 67, NULL);
INSERT INTO evolution VALUES(69, 69, NULL, 70);
INSERT INTO evolution VALUES(70, 70, 69, 71);
INSERT INTO evolution VALUES(71, 71, 70, NULL);
INSERT INTO evolution VALUES(72, 72, NULL, 73);
INSERT INTO evolution VALUES(73, 73, 72, NULL);
INSERT INTO evolution VALUES(74, 74, NULL, 75);
INSERT INTO evolution VALUES(75, 75, 74, 76);
INSERT INTO evolution VALUES(76, 76, 75, NULL);
INSERT INTO evolution VALUES(77, 77, NULL, 78);
INSERT INTO evolution VALUES(78, 78, 77, NULL);
INSERT INTO evolution VALUES(79, 79, NULL, 80);
INSERT INTO evolution VALUES(80, 80, 79, NULL);
INSERT INTO evolution VALUES(81, 81, NULL, 82);
INSERT INTO evolution VALUES(82, 82, 81, NULL);
INSERT INTO evolution VALUES(83, 83, NULL, NULL);
INSERT INTO evolution VALUES(84, 84, NULL, 85);
INSERT INTO evolution VALUES(85, 85, 84, NULL);
INSERT INTO evolution VALUES(86, 86, NULL, 87);
INSERT INTO evolution VALUES(87, 87, 86, NULL);
INSERT INTO evolution VALUES(88, 88, NULL, 89);
INSERT INTO evolution VALUES(89, 89, 88, NULL);
INSERT INTO evolution VALUES(90, 90, NULL, 91);
INSERT INTO evolution VALUES(91, 91, 90, NULL);
INSERT INTO evolution VALUES(92, 92, NULL, 93);
INSERT INTO evolution VALUES(93, 93, 92, 94);
INSERT INTO evolution VALUES(94, 94, 93, NULL);
INSERT INTO evolution VALUES(95, 95, NULL, NULL);
INSERT INTO evolution VALUES(96, 96, NULL, 97);
INSERT INTO evolution VALUES(97, 97, 96, NULL);
INSERT INTO evolution VALUES(98, 98, NULL, 99);
INSERT INTO evolution VALUES(99, 99, 98, NULL);
INSERT INTO evolution VALUES(100, 100, NULL, 101);
INSERT INTO evolution VALUES(101, 101, 100, NULL);
INSERT INTO evolution VALUES(102, 102, NULL, 103);
INSERT INTO evolution VALUES(103, 103, 102, NULL);
INSERT INTO evolution VALUES(104, 104, NULL, 105);
INSERT INTO evolution VALUES(105, 105, 104, NULL);
INSERT INTO evolution VALUES(106, 106, NULL, NULL);
INSERT INTO evolution VALUES(107, 107, NULL, NULL);
INSERT INTO evolution VALUES(108, 108, NULL, NULL);
INSERT INTO evolution VALUES(109, 109, NULL, 110);
INSERT INTO evolution VALUES(110, 110, 109, NULL);
INSERT INTO evolution VALUES(111, 111, NULL, 112);
INSERT INTO evolution VALUES(112, 112, 111, NULL);
INSERT INTO evolution VALUES(113, 113, NULL, NULL);
INSERT INTO evolution VALUES(114, 114, NULL, NULL);
INSERT INTO evolution VALUES(115, 115, NULL, NULL);
INSERT INTO evolution VALUES(116, 116, NULL, 117);
INSERT INTO evolution VALUES(117, 117, 116, NULL);
INSERT INTO evolution VALUES(118, 118, NULL, 119);
INSERT INTO evolution VALUES(119, 119, 118, NULL);
INSERT INTO evolution VALUES(120, 120, NULL, 121);
INSERT INTO evolution VALUES(121, 121, 120, NULL);
INSERT INTO evolution VALUES(122, 122, NULL, NULL);
INSERT INTO evolution VALUES(123, 123, NULL, NULL);
INSERT INTO evolution VALUES(124, 124, NULL, NULL);
INSERT INTO evolution VALUES(125, 125, NULL, NULL);
INSERT INTO evolution VALUES(126, 126, NULL, NULL);
INSERT INTO evolution VALUES(127, 127, NULL, NULL);
INSERT INTO evolution VALUES(128, 128, NULL, NULL);
INSERT INTO evolution VALUES(129, 129, NULL, 130);
INSERT INTO evolution VALUES(130, 130, 129, NULL);
INSERT INTO evolution VALUES(131, 131, NULL, NULL);
INSERT INTO evolution VALUES(132, 132, NULL, NULL);

-- EEVEE evolves into multiple options
INSERT INTO evolution VALUES(133, 133, NULL, 134);
INSERT INTO evolution VALUES(134, 133, NULL, 135);
INSERT INTO evolution VALUES(135, 133, NULL, 136);

INSERT INTO evolution VALUES(136, 134, 133, NULL);
INSERT INTO evolution VALUES(137, 135, 133, NULL);
INSERT INTO evolution VALUES(138, 136, 133, NULL);
INSERT INTO evolution VALUES(139, 137, NULL, NULL);
INSERT INTO evolution VALUES(140, 138, NULL, 139);
INSERT INTO evolution VALUES(141, 139, 138, NULL);
INSERT INTO evolution VALUES(142, 140, NULL, 141);
INSERT INTO evolution VALUES(143, 141, 140, NULL);
INSERT INTO evolution VALUES(144, 142, NULL, NULL);
INSERT INTO evolution VALUES(145, 143, NULL, NULL);
INSERT INTO evolution VALUES(146, 144, NULL, NULL);
INSERT INTO evolution VALUES(147, 145, NULL, NULL);
INSERT INTO evolution VALUES(148, 146, NULL, NULL);
INSERT INTO evolution VALUES(149, 147, NULL, 148);
INSERT INTO evolution VALUES(150, 148, 147, 149);
INSERT INTO evolution VALUES(151, 149, 148, NULL);
INSERT INTO evolution VALUES(152, 150, NULL, NULL);
INSERT INTO evolution VALUES(153, 151, NULL, NULL);


-- INSERT INTO trainer VALUES ('trainer_id', 'trainer_name', 'Gender', 'Funds', 'Badges', 'start_date', 'Total_caught', 'Unique_caught');
INSERT INTO trainer VALUES ('123456', 'Red', 'M', 1000000, 8, '1996-2-27', NULL, NULL);
INSERT INTO trainer VALUES ('840123', 'Blue', 'F', 0, 2, '2001-5-28', NULL, NULL);
INSERT INTO trainer VALUES ('489213', 'Ash', 'M', 50, 5, '1996-2-27', NULL, NULL);

-- INSERT INTO collection VALUES(catpure_id,'trainer_id','pokemon_gender',pokedex_number,pokemon_level,'nickname','nature', in_roster);
INSERT INTO collection VALUES(1,'123456','M',1,50,'Bulby','Bashful',TRUE);
INSERT INTO collection VALUES(2,'840123','F',4,72,'Charzy','Bold',FALSE);
INSERT INTO collection VALUES(3,'489213','M',7,85,'Squirty','Brave',TRUE);
INSERT INTO collection VALUES(4,'123456','F',10,99,'Catery','Calm',FALSE);
INSERT INTO collection VALUES(5,'840123','M',13,34,'Weedy','Careful',TRUE);
INSERT INTO collection VALUES(6,'489213','F',16,15,'Pidge-o','Docile',FALSE);
INSERT INTO collection VALUES(7,'123456','M',19,28,'Rattatattat','Gentle',TRUE);
INSERT INTO collection VALUES(8,'840123','F',22,56,'Phil','Hardy',FALSE);
INSERT INTO collection VALUES(9,'489213','M',25,40,'Chuey','Hasty',TRUE);
INSERT INTO collection VALUES(10,'123456','F',28,8,'Sandy','Impish',FALSE);
INSERT INTO collection VALUES(11,'840123','M',31,67,'Ned','Jolly',TRUE);
INSERT INTO collection VALUES(12,'489213','F',34,13,'King','Lax',FALSE);
INSERT INTO collection VALUES(13,'123456','F',28,8,'Sandy','Impish',FALSE);
INSERT INTO collection VALUES(14,'840123','M',31,67,'Ned','Jolly',TRUE);
INSERT INTO collection VALUES(15,'489213','F',34,13,'King','Lax',FALSE);
INSERT INTO collection VALUES(16,'123456','F',28,8,'Sandy','Impish',FALSE);
INSERT INTO collection VALUES(17,'840123','M',31,67,'Ned','Jolly',TRUE);
INSERT INTO collection VALUES(18,'489213','F',34,13,'King','Lax',FALSE);
INSERT INTO collection VALUES(19,'489213','M',7,85,'Squirty','Brave',TRUE);
INSERT INTO collection VALUES(20,'123456','F',10,99,'Catery','Calm',FALSE);
INSERT INTO collection VALUES(21,'840123','M',13,34,'Weedy','Careful',TRUE);
INSERT INTO collection VALUES(22,'489213','F',16,15,'Pidge-o','Docile',FALSE);
INSERT INTO collection VALUES(23,'489213','F',16,15,'Pidge-o','Docile',FALSE);
INSERT INTO collection VALUES(24,'489213','F',16,15,'Pidge-o','Docile',FALSE);
INSERT INTO collection VALUES(25,'840123','M',13,34,'Pidge-o','Careful',TRUE);

-- INSERT INTO login VALUES ('login_id', 'trainer_id', 'password');
INSERT INTO login VALUES ('Red', '123456', 'password');
INSERT INTO login VALUES ('Blue', '840123', 'password');
INSERT INTO login VALUES ('Ash', '489213', 'icyeevee');

-- INSERT INTO login VALUES ('login_id', 'trainer_id', 'password');
-- INSERT INTO login VALUES ('Red', '123456', PASSWORD('password'));
-- INSERT INTO login VALUES ('Blue', '840123', PASSWORD('password'));
-- INSERT INTO login VALUES ('Ash', '489213', PASSWORD('icyeevee'));


-- Query to find all pokemon and their trainers that are fairy type
SELECT trainer.trainer_name, trainer.trainer_id, pokemon_name from trainer
INNER JOIN collection
ON trainer.trainer_id = collection.trainer_id
INNER JOIN pokemon
ON pokemon.pokedex_number = collection.pokedex_number
WHERE type1 = 'Bug' OR type2 = 'Bug';

-- Query to find total number of pokemon caught by a trainer
SELECT trainer.trainer_id, trainer.trainer_name, COUNT(*) as total_caught
FROM  trainer INNER JOIN collection ON trainer.trainer_id = collection.trainer_id
GROUP BY trainer.trainer_id;

-- Query to find total number of unique pokemon caught by a trainer
SELECT trainer.trainer_id, trainer.trainer_name, COUNT(DISTINCT pokedex_number) as unique_caught
FROM  trainer 
INNER JOIN collection ON trainer.trainer_id = collection.trainer_id
GROUP BY trainer.trainer_id;

-- Query to Find all pokemon with a grass typing (type 1 or type2) 
SELECT pokemon_name, pokedex_number FROM pokemon
WHERE type1 = 'Grass' or type2 = 'Grass';

-- Query to find all pokemon name, pokedex number, that don't evolve at all. Sort by pokedex_number
SELECT p.pokemon_name, p.pokedex_number FROM pokemon AS p
INNER JOIN evolution
ON evolution.pokedex_number = p.pokedex_number
WHERE evolves_to is null AND evolves_from is null
ORDER BY p.pokedex_number;

-- Query to display the name and pokedex id of all pokemon caught by trainer with trainer_id = '123456'
SELECT pokemon.pokemon_name, pokemon.pokedex_number FROM pokemon
INNER JOIN collection
ON pokemon.pokedex_number = collection.pokedex_number
INNER JOIN trainer
ON trainer.trainer_id = collection.trainer_id
WHERE trainer.trainer_id = '123456'
ORDER BY pokedex_number;

-- Query to to find what pokemon trainer with trainer_id = '123456' owns will evolve to
SELECT pokemon_name, pokedex_number
FROM pokemon
WHERE pokedex_number IN (
    SELECT evolution.evolves_to
    from pokemon INNER JOIN evolution ON pokemon.pokedex_number = evolution.evolution_id
    WHERE evolution.evolution_id IN (
        SELECT collection.pokedex_number
        FROM trainer 
        INNER JOIN collection ON trainer.trainer_id = collection.trainer_id AND trainer.trainer_id = '123456'))
ORDER BY pokedex_number;


SELECT pokemon_name, pokedex_number
FROM pokemon
WHERE pokedex_number IN (
    SELECT evolution.evolves_to
    from pokemon INNER JOIN evolution ON pokemon.pokedex_number = evolution.evolution_id
    WHERE evolution.evolution_id IN (
        SELECT collection.pokedex_number
        FROM trainer 
        INNER JOIN collection ON trainer.trainer_id = collection.trainer_id));
