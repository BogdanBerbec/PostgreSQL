-- 1.2.
CREATE DATABASE validation;

CREATE TABLE products
(
    id         SERIAL PRIMARY KEY,
    name       VARCHAR(40),
    department VARCHAR(40),
    price      INTEGER,
    weight     INTEGER
);

INSERT INTO products (name, department, price, weight)
VALUES ('Shirt', 'Clothes', 20, 1);

SELECT *
FROM products;


-- 3.

INSERT INTO products (name, department, weight)
VALUES ('Pants', 'Clothes', 3);

SELECT *
FROM products;

-- ALTER TABLE products
--     ALTER COLUMN price SET NOT NULL;

UPDATE products
SET price = 9999
WHERE price IS NULL;

ALTER TABLE products
    ALTER COLUMN price SET NOT NULL;

-- INSERT INTO products (name, department, weight)
-- VALUES ('Shoes', 'Clothes', 5); DOES NOT FUNCTION BECAUSE PRICE IS NULL

ALTER TABLE products
    ALTER COLUMN name SET NOT NULL;
ALTER TABLE products
    ALTER COLUMN department SET NOT NULL;


--======================================================================
ALTER TABLE products
    ALTER COLUMN price SET DEFAULT 999;

SELECT *
FROM products;
--======================================================================

-- 6.

ALTER TABLE products
    ALTER COLUMN price SET DEFAULT 999;

--======================================================================

-- ||||||||||||||     A I C I   A M   R A M A S  |||||||||||||||||||

--======================================================================
INSERT INTO products (name, department, weight)
VALUES ('Gloves', 'Tools', 1);
SELECT *
FROM products;


-- 7.

INSERT INTO products (name, department, price, weight)
VALUES ('Shirt', 'Tools', 24, 1);

ALTER TABLE products
    ADD UNIQUE (name);


-- 8.

-- ALTER TABLE products
--     DROP CONSTRAINT products_name_key;

ALTER TABLE products
    ADD UNIQUE (name, department);

-- INSERT INTO products (name, department, price, weight)
-- VALUES ('Shirt', 'Housewares', 24, 1);

SELECT *
FROM products;

-- ALTER TABLE products DROP CONSTRAINT products_name_department_key;


-- 10.

ALTER TABLE products ADD CHECK ( price > 0 );

-- INSERT INTO products (name, department, price, weight) VALUES
-- ('Belt', 'House', -99, 1);


-- 11.

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  est_delivery TIMESTAMP NOT NULL,
  CHECK ( created_at < est_delivery )
);

INSERT INTO orders (name, created_at, est_delivery) VALUES
('Shirt', '2000-NOV-20 01:00 AM', '2000-NOV-25 01:00 AM');

-- INSERT INTO orders (name, created_at, est_delivery) VALUES
-- ('Shirt', '2000-NOV-20 01:00 AM', '2000-NOV-10 01:00 AM');





















/*
============================================================
            E C H I V A L E N T U L   L U I
          'S H O W   C R E A T E   T A B L E'
                  D I N   M Y S Q L
============================================================
 */
SELECT *
FROM information_schema.columns
WHERE table_catalog = 'validation'
  AND table_name = 'products'
ORDER BY ordinal_position;
--============================================================