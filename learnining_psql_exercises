CREATE DATABASE learning_psql_exercises;

CREATE TABLE boats
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO boats (name)
VALUES ('Rogue Wave'),
       ('Harbour Master');

SELECT *
FROM boats;

CREATE TABLE crew_members
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(50)
--     boat_id INTEGER REFERENCES boats(id)
);

INSERT INTO crew_members (first_name)
VALUES ('Alex'),
       ('Lucia'),
       ('Ari');

SELECT *
FROM crew_members;

ALTER TABLE crew_members
    ADD COLUMN boat_id INTEGER REFERENCES boats (id);

-- UPDATE crew_members
-- SET boat_id = (CASE
--                    WHEN id IN (1, 2) THEN 1
--                    WHEN id = 3 THEN 2
--     END);

-- UPDATE crew_members SET boat_id = 2 WHERE id = 3;
--
-- UPDATE crew_members SET boat_id = NULL;

SELECT * FROM crew_members WHERE boat_id = 1;
