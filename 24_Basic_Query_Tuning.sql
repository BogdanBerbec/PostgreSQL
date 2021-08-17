-- 1.2.

EXPLAIN ANALYZE SELECT username, contents
FROM users u
         JOIN comments c on u.id = c.user_id
WHERE username = 'Alyson14';

EXPLAIN SELECT username, contents
FROM users u
         JOIN comments c on u.id = c.user_id
WHERE username = 'Alyson14';

SELECT * FROM pg_stats WHERE tablename = 'users';

