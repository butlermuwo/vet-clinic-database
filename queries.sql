/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016/01/01' and '2019/01/01';
SELECT name FROM animals WHERE neutered = true and escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 and 17.3;

BEGIN;
UPDATE animals 
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name like '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals
ROLLBACK;
SELECT * FROM animals

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '01/01/2022';
SAVEPOINT delete_by_birth;
UPDATE animals
SET weight_kg = weight_kg * (-1);
ROLLBACK TO delete_by_birth;
UPDATE animals
SET weight_kg = weight_kg * (-1)
WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;
/* End transaction */

