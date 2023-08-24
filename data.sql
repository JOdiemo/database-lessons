/* Populate the database with sample data. */

/*Day One*/
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4, 'Devimon', '2017-05-12', 5, true, 11);

/*Day Two*/
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) values
(5, 'Charmander', '2020-02-08', 0, false, -11),
(6, 'Plantmon', '2021-11-15', 2, true, -5.7),
(7, 'Squirtle', '1993-04-02', 3, false, -12.13),
(8, 'Angemon', '2005-06-12', 1, true, -45),
(9, 'Boarmon', '2005-06-7', 7, true, 20.4),
(10, 'Blossom', '1998-10-13', 3, true, 17),
(11, 'Ditto', '2022-05-14', 4, true, 22);

/*Day Three*/
INSERT INTO owners(id, full_name, age) 
VALUES
 (1, 'Sam Smith, 34),
 (2, 'Jennifer Orwell', 19),	
 (3, 'Bob',45),	
 (4, 'Melody Pond',77),	
 (5, 'Dean Winchester',14),	
 (6, 'Jodie Whittaker',38);
select * from owners

INSERT INTO species (id, name)
VALUES
(1, 'Pokeman'),
(2, 'Digimon');

SELECT * from species

UPDATE animals SET species_id = 2 
 WHERE name::text LIKE '%mon';
SELECT * FROM animals

 UPDATE animals SET species_id = 1 
  WHERE name::text NOT LIKE '%mon';
SELECT * FROM animals
 
UPDATE animals SET owner_id = 1 	WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 	WHERE name = 'Gabumon';
UPDATE animals SET owner_id = 2 	WHERE name = 'Pikachu';
UPDATE animals SET owner_id = 3 	WHERE name = 'Devimon';
UPDATE animals SET owner_id = 3 	WHERE name = 'Plantmon';
UPDATE animals SET owner_id = 4 	WHERE name = 'Charmander';
UPDATE animals SET owner_id = 4 	WHERE  name = 'Squirtle' ;	
UPDATE animals SET owner_id = 4 	WHERE name = 'Blossom';
UPDATE animals SET owner_id = 5 	WHERE name = 'Angemon';
UPDATE animals SET owner_id = 5 	WHERE name = 'Boarmon';
	
SELECT * FROM animals
	
/*Day Four*/
--Create a table named vets with the following columns
CREATE TABLE vets(
   id SERIAL PRIMARY KEY,
   name VARCHAR(50),
   age INT,
   date_of_graduation DATE
);

SELECT * FROM vets

--Create bridge table specializations
CREATE TABLE specializations (
	vet_id INT NOT NULL, 
	species_id INT NOT NULL, 
	CONSTRAINT fk_vet FOREIGN KEY (vet_id) 
	REFERENCES vets(id),
	CONSTRAINT fk_species FOREIGN KEY(species_id) 
	REFERENCES species(id));
SELECT * FROM specializations
	
--Create bridge table visits	
CREATE TABLE visits (
	vet_id INT NOT NULL, 
	animals_id INT NOT NULL, 
	PRIMARY KEY (vet_id, animals_id),
	CONSTRAINT fk_vet FOREIGN KEY (vet_id) 
	REFERENCES vets(id),
	CONSTRAINT fk_animals FOREIGN KEY(animals_id) 
	REFERENCES animals(id));
SELECT * FROM visits

