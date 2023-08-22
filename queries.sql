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
BEGIN TRANSACTION;
UPDATE animals SET species='unspecified';

SELECT species FROM animals;
ROLLBACK TRANSACTION;
SELECT species FROM animals;

UPDATE animals SET species='digimon'
	WHERE name::text LIKE '%mon';
	
UPDATE animals SET species='pokemon'
	WHERE species ISNULL;
	
COMMIT TRANSACTION;

SELECT * FROM animals ;
