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

/* Day 4 add join table */

CREATE TABLE vets(
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INTEGER,
    date_of_graduation DATE 
);

CREATE TABLE specializations(
    id BIGSERIAL PRIMARY KEY,
    vet_id INTEGER REFERENCES vets(id),
    species_id INTEGER REFERENCES species(id),
    UNIQUE (vet_id, species_id)
);

CREATE TABLE visits (
    id BIGSERIAL PRIMARY KEY,
    vet_id INTEGER REFERENCES vets(id),
    animal_id INTEGER REFERENCES animals(id),
    visit_date DATE,
    UNIQUE (vet_id, animal_id, visit_date)
);