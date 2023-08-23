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

