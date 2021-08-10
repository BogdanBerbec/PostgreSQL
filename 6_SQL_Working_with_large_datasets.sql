SELECT * FROM orders;

-- 3.
SELECT paid, COUNT(*) FROM orders GROUP BY paid;
-- 5.

-- 6.
SELECT first_name, last_name, paid FROM users u JOIN orders o on u.id = o.user_id;