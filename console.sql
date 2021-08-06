create database learning_postgresql;

drop table cities;

create table cities (
    name VARCHAR(50),
    country VARCHAR(50),
    population INT,
    area INT
);

insert into cities
values
('Tokyo', 'Japan', 38505000, 8223),
('Delhi', 'India', 28125000, 2240),
('Shanghai', 'China', 22125000, 4015),
('Sao Paulo', 'Brazil', 20935000, 3043);

select * from cities;

SELECT name, area FROM cities WHERE area > 4000;

SELECT name, area FROM cities WHERE area BETWEEN 2000 AND 5000;

SELECT name, area FROM cities WHERE area NOT IN (3043, 8223) OR name = 'Delhi';

SELECT name, area FROM cities WHERE area NOT IN (3043, 8223) OR name = 'Delhi' OR name = 'Tokyo';

UPDATE cities SET population = 39505000 WHERE name = 'Tokyo';

DELETE FROM cities WHERE name = 'Tokyo';

INSERT INTO cities VALUES ('Tokyo', 'Japan', 38505000, 8233);



