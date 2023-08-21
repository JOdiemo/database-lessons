/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
   id INT,
   name CHAR(20),
   date_of_birth DATE,
   escape_attempt INT,
   neutered BOOL,
   weight_kg DECIMAL   
); 

