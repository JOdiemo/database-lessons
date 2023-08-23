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
