/* Database schema to keep the structure of the entire database. */
CREATE TABLE animals(
   id serial primary key,
   name CHAR(20),
   date_of_birth DATE,
   escape_attempt INT,
   neutered BOOL,
   weight_kg DECIMAL   
); 

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(50),
  age INT  
);

CREATE TABLE species(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)  
);

CREATE TABLE vets(
   id SERIAL PRIMARY KEY,
   name VARCHAR(50),
   age INT,
   date_of_graduation DATE
);

CREATE TABLE specializations (
	vet_id INT NOT NULL, 
	species_id INT NOT NULL, 	
	CONSTRAINT fk_vet FOREIGN KEY (vet_id) 
	REFERENCES vets(id),
	CONSTRAINT fk_species FOREIGN KEY(species_id) 
	REFERENCES species(id));
	
CREATE TABLE visits (
	vet_id INT NOT NULL, 
	animals_id INT NOT NULL, 
	date_of_visit DATE,	
	CONSTRAINT fk_vet FOREIGN KEY (vet_id) 
	REFERENCES vets(id),
	CONSTRAINT fk_animals FOREIGN KEY(animals_id) 
	REFERENCES animals(id));


--Create a file named schema_based_on_diagram.sql where you implement the database from the diagram.
--Join tables from many-to-many relationships might not appear in the diagram, but you still need them.
--Remember to add the FK indexes.

--Data Table Schema is at the below link

https://lucid.app/lucidchart/034f07a9-ac76-448c-a339-aa7dfdeb0d38/edit?viewport_loc=-12136%2C-11167%2C1916%2C830%2C0_0&invitationId=inv_789b487f-c1ec-4a01-9545-ea7ae10fe1d7
