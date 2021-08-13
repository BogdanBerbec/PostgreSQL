
-- 1.2.3.4.

-- CREATE INDEX ON users (username);

CREATE INDEX users_username_idx ON users (username);

DROP INDEX users_username_idx;

-- With index: 0.030ms
-- Without index: 0.485ms
EXPLAIN ANALYZE SELECT * FROM users WHERE username = 'Emil30';


-- 5.
CREATE INDEX users_username_idx ON users (username);

SELECT pg_size_pretty(pg_relation_size('users')); -- 872 kB
SELECT pg_size_pretty(pg_relation_size('users_username_idx')); -- 184 kB


-- 6. Index Types

-- 8. Automatically generated indexes

SELECT relname, relkind FROM pg_class WHERE relkind = 'i';

-- 10. Behind the Scene of Indexes: more more more details


