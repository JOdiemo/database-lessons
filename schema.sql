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

CREATE TABLE species(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)  
);

ALTER TABLE animals
    ADD COLUMN IF NOT EXISTS owner_id
	INT;
	
ALTER TABLE animals
	ADD CONSTRAINT fk_animals_species
	FOREIGN KEY (species_id)
	REFERENCES species(id)
	ON DELETE CASCADE;	

ALTER TABLE animals
    ADD COLUMN IF NOT EXISTS owner_id
	INT;
	
ALTER TABLE animals
	ADD CONSTRAINT fk_animals_owners
	FOREIGN KEY (owner_id)
	REFERENCES owners(id)
	ON DELETE CASCADE;	
