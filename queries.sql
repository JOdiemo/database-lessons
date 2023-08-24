/*Queries that provide answers to the questions from all projects.*/

/*Day One*/
SELECT * FROM animals WHERE name::text LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name , escape_attempts FROM animals WHERE weight_kg > 10.5; 
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/*Day Two */

/* Transaction - BEGIN, UPDATE and COMMIT */

/*UPDATE*/
BEGIN TRANSACTION;
UPDATE animals SET species='unspecified';

SELECT species FROM animals;
ROLLBACK TRANSACTION;
SELECT species FROM animals;
END TRANSACTION;

BEGIN TRANSACTION;
UPDATE animals SET species='digimon'
	WHERE name::text LIKE '%mon';
	
UPDATE animals SET species='pokemon'
	WHERE species ISNULL;

SELECT * FROM animals ;
	
COMMIT TRANSACTION;

SELECT * FROM animals ;

/*Delete and Savepoint*/

/*Delete all and Rollback*/
BEGIN TRANSACTION;
SELECT * FROM animals;

DELETE FROM animals;

ROLLBACK;

SELECT * FROM animals;

/*Savepoint*/
BEGIN TRANSACTION;

SAVEPOINT SP1;
 
 DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT SP2;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TRANSACTION TO SP2;

UPDATE animals set weight_kg = weight_kg * -1 
	WHERE weight_kg < 0;
	
COMMIT TRANSACTION;
 
SELECT * FROM animals 

/*Questions*/

SELECT count(*) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) as Minimum, MAX(weight_kg) as Maximum FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals where date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


/*Day Three*/

/*Questions*/
--What animals belong to Melody Pond?
SELECT name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name= 'Melody Pond';
--List of all animals that are Pokemon (their type is Pokemon).
SELECT * FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.id = 1;
--List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;
--How many animals are there per species?
SELECT species.name, COUNT(species_id) FROM animals INNER JOIN species ON species.id = animals.species_id GROUP BY species.name;
--List all Digimon owned by Jennifer Orwell.
SELECT owners.full_name, animals.name, species.name FROM animals INNER JOIN owners ON animals.owner_id = owners.id INNER JOIN species
ON animals.species_id = species.id
WHERE species.id = 2
and owners.id = 2;
--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * FROM animals INNER JOIN owners ON animals.owner_id = owners.id where owners.id = 5 AND animals.escape_attempts = 0;
--Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) as animal_number 
FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name 
ORDER BY animal_number DESC LIMIT 1;

/*Day Four*/

/*Questions*/

--Who was the last animal seen by William Tatcher?
select animals.name, vets.name, visits.date_of_visit FROM animals 
	INNER JOIN visits ON animals.id = visits.animals_id
	LEFT JOIN vets ON vets.id = visits.vet_id 
	WHERE vets.id = 5 ORDER BY visits.date_of_visit DESC LIMIT 1
--How many different animals did Stephanie Mendez see?
select COUNT(animals.name), vets.name FROM animals 
	INNER JOIN visits ON animals.id = visits.animals_id
	JOIN vets ON visits.vet_id = vets.id
	WHERE vets.id = 7 GROUP BY vets.name
--List all vets and their specialties, including vets with no specialties.
