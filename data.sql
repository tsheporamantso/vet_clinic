/* DAY 1*/
INSERT INTO animals (name, date_of_birth, escape_attempts,neutured,weight_kg)
VALUES('Agumon', '2020-02-03', 0, true, 10.23),
('Gabumon', '2018-11-15',2, true, 8),
('Pikachu', '2021-01-07',1, false,15.04),
('Devimon', '2017-05-12',5, true, 11);

/* Day 2 query and update animals table*/

INSERT INTO animals (name, date_of_birth, escape_attempts, neutured, weight_kg, species)
VALUES('Charmander', '2020-02-08', 0, false, -11.0, '');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutured, weight_kg, species)
VALUES('Plantmon', '2021-11-15', 2, true, -5.7, '');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutured, weight_kg, species)
VALUES('Squirtle', '1993-04-02', 3, false, -12.13, '');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutured, weight_kg, species)
VALUES('Angemon', '2005-06-12', 1, true, -45.0, '');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutured, weight_kg, species)
VALUES('Boarmon', '2005-06-07', 7, true, 20.4, '');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutured, weight_kg, species)
VALUES('Blossom', '1998-10-13', 3, true, 17.0, '');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutured, weight_kg, species)
VALUES('Ditto', '2022-05-14', 4, true, 22.0, '');

/* Day 3 query multiple tables*/

INSERT INTO owners(full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species(name)
VALUES
('Pokemon'),
('Digimon');

UPDATE animals
SET species_id = (CASE
WHEN name LIKE '%mon' THEN (
    SELECT id FROM species WHERE name = 'Digimon'
) ELSE (
    SELECT id FROM species WHERE name = 'Pokemon'
)
END);

SELECT id, name, species_id FROM animals
ORDER BY id;

UPDATE animals
SET owners_id = (CASE
WHEN name IN ('Agumon') THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHEN name IN ('Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHEN name IN ('Devimon','Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
WHEN name IN ('Charmander','Squirtle','Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHEN name IN ('Angemon','Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
END);

SELECT id, name, species_id, owners_id FROM animals
ORDER BY id;

UPDATE animals
SET owners_id = 2
WHERE id = 2;

SELECT id, name, species_id, owners_id FROM animals
ORDER BY id;

/* Day 4 add join table */

INSERT INTO vets(name, age, date_of_graduation)
VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id) 
VALUES
((SELECT id FROM vets WHERE name = 'William Tatcher'),(SELECT id FROM species WHERE name = 'Pokemon')),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),(SELECT id FROM species WHERE name = 'Digimon')),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),(SELECT id FROM species WHERE name = 'Pokemon')),
((SELECT id FROM vets WHERE name = 'Jack Harkness'),(SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES
((SELECT id FROM animals WHERE name = 'Agumon'),(SELECT id FROM vets WHERE name = 'William Tatcher' ),'2020-05-24'), 
((SELECT id FROM animals WHERE name = 'Agumon'),(SELECT id FROM vets WHERE name = 'Stephanie Mendez' ),'2020-07-22'), 
((SELECT id FROM animals WHERE name = 'Gabumon'),(SELECT id FROM vets WHERE name = 'Jack Harkness' ),'2021-02-02'),
((SELECT id FROM animals WHERE name = 'Pikachu'),(SELECT id FROM vets WHERE name = 'Maisy Smith' ),'2020-01-05'),
((SELECT id FROM animals WHERE name = 'Pikachu'),(SELECT id FROM vets WHERE name = 'Maisy Smith' ),'2020-03-08'),
((SELECT id FROM animals WHERE name = 'Pikachu'),(SELECT id FROM vets WHERE name = 'Maisy Smith' ),'2020-05-14'),
((SELECT id FROM animals WHERE name = 'Devimon'),(SELECT id FROM vets WHERE name = 'Stephanie Mendez' ),'2021-05-04'),
((SELECT id FROM animals WHERE name = 'Charmander'),(SELECT id FROM vets WHERE name = 'Jack Harkness' ),'2021-02-24'),
((SELECT id FROM animals WHERE name ='Plantmon'),(SELECT id FROM vets WHERE name = 'Maisy Smith'),'2019-12-21'),
((SELECT id FROM animals WHERE name ='Plantmon'),(SELECT id FROM vets WHERE name = 'William Tatcher'),'2020-08-10'),
((SELECT id FROM animals WHERE name ='Plantmon'),(SELECT id FROM vets WHERE name = 'Maisy Smith'),'2021-04-07'),
((SELECT id FROM animals WHERE name ='Squirtle'),(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),'2019-09-29'),
((SELECT id FROM animals WHERE name ='Angemon'),(SELECT id FROM vets WHERE name = 'Jack Harkness'),'2020-10-03'),
((SELECT id FROM animals WHERE name ='Angemon'),(SELECT id FROM vets WHERE name = 'Jack Harkness'),'2020-11-04'),
((SELECT id FROM animals WHERE name ='Boarmon'),(SELECT id FROM vets WHERE name = 'Maisy Smith'),'2019-01-24'),
((SELECT id FROM animals WHERE name ='Boarmon'),(SELECT id FROM vets WHERE name = 'Maisy Smith'),'2019-05-15'),
((SELECT id FROM animals WHERE name ='Boarmon'),(SELECT id FROM vets WHERE name = 'Maisy Smith'),'2020-02-27'),
((SELECT id FROM animals WHERE name ='Boarmon'),(SELECT id FROM vets WHERE name = 'Maisy Smith'),'2020-08-03'),
((SELECT id FROM animals WHERE name ='Blossom'),(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),'2020-05-24'),
((SELECT id FROM animals WHERE name ='Blossom'),(SELECT id FROM vets WHERE name = 'William Tatcher'),'2021-01-11');         







