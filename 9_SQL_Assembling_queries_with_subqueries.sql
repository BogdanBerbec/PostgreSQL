-- 1.
SELECT max(price)
FROM products
WHERE department = 'Toys';

SELECT name, price
FROM products
WHERE price > (SELECT max(price) FROM products WHERE department = 'Toys');


-- 2.

-- EXAMPLE:

-- SELECT p1.name, (SELECT count(name) FROM products)
-- FROM (SELECT * FROM products) p1
--          JOIN (SELECT * FROM products) p2
--               ON p1.id = p2.id
-- WHERE p1.id IN (SELECT id FROM products);


-- 4.

SELECT max(price)
FROM products;

SELECT name, price, (SELECT max(price) FROM products)
FROM products
WHERE price > 867;

SELECT price
FROM products
WHERE id = 3;

SELECT name, price, (SELECT price FROM products WHERE id = 3) id_3_price
FROM products
WHERE price > 867;


-- 5.

SELECT *
FROM products;

SELECT max(price)
FROM products;

SELECT name, price, (price::decimal / 991) price_ratio, trunc((price::decimal / 991), 3) price_ratio_n_decimals
FROM products;

SELECT name, price, trunc((price::decimal / 991), 3) price_ratio
FROM products;


-- 8.
SELECT name, price / weight price_weight_ratio
FROM products;

SELECT name, price_weight_ratio
FROM (
         SELECT name, price / weight price_weight_ratio
         FROM products
     ) p
WHERE price_weight_ratio > 5;


-- 9.
SELECT max(price)
FROM products;
-- =
SELECT *
FROM (SELECT max(price) FROM products) p;


-- 10.
SELECT *
FROM orders;

SELECT count(*)
FROM orders;
SELECT count(distinct (user_id))
FROM orders;

SELECT count(*) / count(distinct (user_id)) average_order_per_user
FROM orders;

SELECT user_id, count(*)
FROM orders
GROUP BY user_id;

SELECT AVG(order_count)
FROM (SELECT user_id, count(*) order_count FROM orders GROUP BY user_id) p;


-- 11. 12.
SELECT AVG(price) avg_price
FROM products
GROUP BY department
ORDER BY avg_price DESC
LIMIT 1;
-- =
SELECT MAX(avg_price)
FROM (SELECT AVG(price) avg_price FROM products GROUP BY department) p;


-- 14.

SELECT user_id
FROM orders
WHERE product_id = 3;

SELECT first_name
FROM users u
         JOIN (SELECT user_id
               FROM orders
               WHERE product_id = 3) o ON o.user_id = u.id;
-- =
SELECT first_name
FROM users u
         JOIN orders o on u.id = o.user_id
WHERE product_id = 3;


-- 15.
SELECT id
FROM orders
WHERE product_id IN (SELECT id FROM products WHERE price / weight > 50);

SELECT id
FROM orders
WHERE product_id IN (SELECT id FROM products WHERE price / weight > 50);


-- 16.
SELECT name
FROM products
WHERE price > (SELECT AVG(price) FROM products);


-- 17. 19. Solution
SELECT name, price
FROM products
WHERE price > (SELECT price FROM products WHERE name = 'Fantastic Wooden Chair');


-- 20.
SELECT name
FROM products
WHERE department NOT IN (SELECT distinct(department) FROM products WHERE price < 100);


-- 21.
SELECT name, department, price
FROM products
WHERE price > (SELECT max(price) FROM products WHERE department = 'Industrial');
-- =
SELECT name, department, price
FROM products
WHERE price > ALL (SELECT price FROM products WHERE department = 'Industrial');


-- 22.
SELECT name, department, price
FROM products
WHERE price > (SELECT min(price) FROM products WHERE department = 'Industrial');

SELECT name, department, price
FROM products
WHERE price > SOME (SELECT price FROM products WHERE department = 'Industrial');


-- 24. 25.
SELECT name
FROM products
WHERE price > ALL (SELECT price FROM products WHERE department = 'Toys');


-- 26.
SELECT name, department, price
FROM products p1
WHERE p1.price = (
    SELECT max(price)
    FROM products p2
    WHERE p1.department = p2.department
);


-- 27.
SELECT p.id,
       p.name,
       p.department,
       p.price,
       p.weight,
       (SELECT count(*) FROM orders o WHERE p.id = o.product_id) as no_orders
FROM products p
ORDER BY no_orders DESC;


-- 29.

SELECT (SELECT max(price) FROM products) / (SELECT AVG(price) FROM products);


-- 30.

SELECT (SELECT max(price) FROM products), (SELECT min(price) FROM products),
(SELECT avg(price) FROM products);

SELECT max(price), min(price), avg(price) FROM products;










