/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
id BIGSERIAL NOT NULL PRIMARY KEY,
name VARCHAR(300) NOT NULL,
date_of_birth DATE NOT NULL,
escape_attempts INTEGER,
neutered BOOLEAN,
weight_kg DECIMAL );
