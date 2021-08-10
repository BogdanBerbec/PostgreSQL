
-- 1.
SELECT * FROM products;

SELECT DISTINCT(department) FROM products;

-- SELECT * FROM products WHERE department = 'Electronics';
-- SELECT * FROM products WHERE department = 'Computers';

(SELECT * FROM products ORDER BY price DESC LIMIT 4) UNION
(SELECT * FROM products ORDER BY price / weight DESC LIMIT 4);


-- 2.

(SELECT name, price FROM products) UNION
(SELECT name, weight FROM products);

-- SELECT name FROM products UNION SELECT price FROM products;

-- 3.

(SELECT * FROM products ORDER BY price DESC LIMIT 4) INTERSECT
(SELECT * FROM products ORDER BY price / weight DESC LIMIT 4);

(SELECT * FROM products ORDER BY price DESC LIMIT 4) INTERSECT ALL
(SELECT * FROM products ORDER BY price / weight DESC LIMIT 4);


-- 4.

(SELECT id, name FROM products ORDER BY price DESC LIMIT 4) EXCEPT
(SELECT id, name FROM products ORDER BY price / weight DESC LIMIT 4);


-- 5.

(SELECT department FROM products WHERE price < 170) UNION
(SELECT department FROM products GROUP BY department HAVING count(*) > 2);







