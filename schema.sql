/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
id BIGSERIAL NOT NULL PRIMARY KEY,
name VARCHAR(300) NOT NULL,
date_of_birth DATE NOT NULL,
escape_attempts INTEGER,
neutered BOOLEAN,
weight_kg DECIMAL );

ALTER TABLE animals ADD COLUMN species VARCHAR(255);


CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255),
  age INTEGER
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER
);

--  primary key was already set for the animals table
ALTER TABLE animals
DROP COLUMN species;
ALTER TABLE animals
ADD COLUMN species_id INTEGER REFERENCES species(id);
ALTER TABLE owners
ADD COLUMN owners_id INTEGER REFERENCES owners(id);