/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', date '2020-02-03', 0, true, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', date '2018-10-15', 2, TRUE, 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', date '2021-01-07', 1, FALSE, 15.04);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', date '2017-05-12', 5, TRUE, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, false, -11);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', '2005-06-12', 1, true, -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', '1998-10-13', 3, true, 17);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', '2022-05-14', 4, true, 22);

-- new tables data

INSERT INTO owners (full_name, age) 
VALUES 
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);


INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

INSERT INTO vets (name, age, date_of_graduation) VALUES 
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id) VALUES 
(1, (SELECT id FROM species WHERE name = 'Pokemon'));

INSERT INTO specializations (vet_id, species_id) VALUES 
(3, (SELECT id FROM species WHERE name = 'Pokemon')),
(3, (SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO specializations (vet_id, species_id) VALUES 
(4, (SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO visits (vet_id, animal_id, visit_date) VALUES
(1, (SELECT id FROM animals WHERE name = 'Agumon'), '2020-05-24'),
(3, (SELECT id FROM animals WHERE name = 'Agumon'), '2020-07-22'),
(4, (SELECT id FROM animals WHERE name = 'Gabumon'), '2021-02-02'),
(2, (SELECT id FROM animals WHERE name = 'Pikachu'), '2020-01-05'),
(2, (SELECT id FROM animals WHERE name = 'Pikachu'), '2020-03-08'),
(2, (SELECT id FROM animals WHERE name = 'Pikachu'), '2020-05-14'),
(3, (SELECT id FROM animals WHERE name = 'Devimon'), '2021-05-04'),
(4, (SELECT id FROM animals WHERE name = 'Charmander'), '2021-02-24'),
(2, (SELECT id FROM animals WHERE name = 'Plantmon'), '2019-12-21'),
(1, (SELECT id FROM animals WHERE name = 'Plantmon'), '2020-08-10'),
(2, (SELECT id FROM animals WHERE name = 'Plantmon'), '2021-04-07'),
(3, (SELECT id FROM animals WHERE name = 'Squirtle'), '2019-09-29'),
(4, (SELECT id FROM animals WHERE name = 'Angemon'), '2020-10-03'),
(4, (SELECT id FROM animals WHERE name = 'Angemon'), '2020-11-04'),
(2, (SELECT id FROM animals WHERE name = 'Boarmon'), '2019-01-24'),
(2, (SELECT id FROM animals WHERE name = 'Boarmon'), '2019-05-15'),
(2, (SELECT id FROM animals WHERE name = 'Boarmon'), '2020-02-27'),
(2, (SELECT id FROM animals WHERE name = 'Boarmon'), '2020-08-03'),
(3, (SELECT id FROM animals WHERE name = 'Blossom'), '2020-05-24'),
(1, (SELECT id FROM animals WHERE name = 'Blossom'), '2021-01-11');