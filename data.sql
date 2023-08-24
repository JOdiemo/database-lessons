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
-- Insert the following data for vets:
INSERT INTO vets (name,age,date_of_graduation) VALUES ('William Tatcher' , 45 , '2000-04-23'),('Maisy Smith' , 26 , '2019-01-17'),('Stephanie Mendez' , 64 , '1981-05-04'),('Jack Harkness' , 38 , '2008-06-08');

-- Insert the following data for specializations table:
INSERT INTO specializations (vet_id, species_id)
VALUES
  ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM species WHERE name = 'Pokemon')),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Digimon')),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Pokemon')),
  ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM species WHERE name = 'Digimon'));

-- Insert the following data for visits:
INSERT INTO visits (vet_id, animals_id, date_of_visit)
VALUES
  ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM animals WHERE name = 'Agumon'), '2020-05-24'), 
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE name = 'Agumon'), '2020-07-22'),
  ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animals WHERE name = 'Gabumon'), '2021-02-02'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Pikachu'), '2020-01-05'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Pikachu'), '2020-03-08'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Pikachu'), '2020-05-14'),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE name = 'Devimon'), '2021-05-04'),
  ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animals WHERE name = 'Charmander'), '2021-02-24'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Plantmon'), '2019-12-21'),
  ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM animals WHERE name = 'Plantmon'), '2020-08-10'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Plantmon'), '2021-04-07'),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE name = 'Squirtle'), '2019-09-29'),
  ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animals WHERE name = 'Angemon'), '2020-10-03'),
  ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animals WHERE name = 'Angemon'), '2020-11-04'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'), '2019-01-24'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'), '2019-05-15'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'), '2020-02-27'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'), '2020-08-03'),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE name = 'Blossom'), '2020-05-24'),
  ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM animals WHERE name = 'Blossom'), '2021-01-11');
