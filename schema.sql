/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

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

--  Visits, spcializtion, vets
CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    vet_id INTEGER REFERENCES vets(id),
    species_id INTEGER REFERENCES species(id),
    PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits (
    vet_id INTEGER REFERENCES vets(id),
    animal_id INTEGER REFERENCES animals(id),
    visit_date DATE,
    PRIMARY KEY (vet_id, animal_id, visit_date)
);

-- Add an email column to the owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);


-- Add indexes to the visits table animal_id
CREATE INDEX idx_animal_id ON visits (animal_id);

-- Add indexes to the visits table vet_id
CREATE INDEX vet_id_asc ON visits(vet_id ASC);

-- Add indexes to the owners table
CREATE INDEX idx_email ON owners (email);