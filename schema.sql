/* Day 1 */

CREATE TABLE animals (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER DEFAULT 0,
    neutured BOOLEAN DEFAULT FALSE,
    weight_kg DECIMAL(5,2) NOT NULL
);

/* Day 2 query and update animals table*/

ALTER TABLE animals
ADD COLUMN species VARCHAR(50);

/* Day 3 query multiple tables*/

CREATE TABLE owners(
    id BIGSERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INTEGER
); 

CREATE TABLE species(
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INTEGER REFERENCES species(id),
ADD COLUMN owners_id INTEGER REFERENCES owners(id);