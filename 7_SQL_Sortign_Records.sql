-- 1.
SELECT * FROM products ORDER BY price;

SELECT price, count(*) no_prices FROM products GROUP BY price ORDER BY no_prices desc;

-- SELECT * FROM products where price = 619;



-- 2.

SELECT * FROM products ORDER BY name DESC ;
SELECT * FROM products ORDER BY name ASC ;

SELECT * FROM products ORDER BY price, weight DESC ;

-- 3.
SELECT * FROM users OFFSET 40;
SELECT * FROM users LIMIT 5;
SELECT * FROM users LIMIT 999;
SELECT * FROM products ORDER BY price LIMIT 5;
SELECT * FROM products ORDER BY price DESC LIMIT 5 OFFSET 1;
SELECT * FROM products ORDER BY price LIMIT 1;

SELECT * FROM products ORDER BY price LIMIT 20 OFFSET 0;
SELECT * FROM products ORDER BY price LIMIT 20 OFFSET 20;
SELECT * FROM products ORDER BY price LIMIT 20 OFFSET 40;


-- 4.

SELECT * FROM products ORDER BY price DESC OFFSET 1 LIMIT 2;

