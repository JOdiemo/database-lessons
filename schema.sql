/* Database schema to keep the structure of the entire database. */
/*Day One*/
CREATE TABLE animals(
   id serial primary key,
   name CHAR(20),
   date_of_birth DATE,
   escape_attempt INT,
   neutered BOOL,
   weight_kg DECIMAL   
); 

/*Day Two*/
ALTER TABLE animals
    ADD species varchar(20);   

/*Day Three*/

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(50),
  age INT  
);
SELECT * FROM owners

CREATE TABLE species(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)  
);
SELECT * FROM species

ALTER TABLE animals
    ADD COLUMN IF NOT EXISTS owner_id
	INT;
	
ALTER TABLE animals
	ADD CONSTRAINT fk_animals_species
	FOREIGN KEY (species_id)
	REFERENCES species(id)
	ON DELETE CASCADE;	

select * from animals

ALTER TABLE animals
    ADD COLUMN IF NOT EXISTS owner_id
	INT;
	
ALTER TABLE animals
	ADD CONSTRAINT fk_animals_owners
	FOREIGN KEY (owner_id)
	REFERENCES owners(id)
	ON DELETE CASCADE;	

select * from animals

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
	PRIMARY KEY (vet_id, species_id),
	CONSTRAINT fk_vet FOREIGN KEY (vet_id) 
	REFERENCES vets(id),
	CONSTRAINT fk_species FOREIGN KEY(species_id) 
	REFERENCES species(id));
SELECT * FROM specializations
	
--Create bridge table visits	
CREATE TABLE visits (
	vet_id INT NOT NULL, 
	animals_id INT NOT NULL, 
	date_of_visit DATE,
	PRIMARY KEY (vet_id, animals_id),
	CONSTRAINT fk_vet FOREIGN KEY (vet_id) 
	REFERENCES vets(id),
	CONSTRAINT fk_animals FOREIGN KEY(animals_id) 
	REFERENCES animals(id));
SELECT * FROM visits
