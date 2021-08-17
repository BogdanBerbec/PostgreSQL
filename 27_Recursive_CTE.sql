-- 1. Recursive CTE

WITH RECURSIVE countdown(val) AS (
    SELECT 3 AS val
    UNION
    SELECT val - 1
    FROM countdown
    WHERE val > 1
)
SELECT *
FROM countdown;

-- WITH RECURSIVE countdown(val) AS (
--     SELECT 8 AS val
--     UNION
--     SELECT val / 2 FROM countdown WHERE val > 1
-- )
-- SELECT * FROM countdown;

WITH RECURSIVE countdown(val) AS (
    SELECT 10 AS val
    UNION
    SELECT val - 1
    FROM countdown
    WHERE val > 1
)
SELECT *
FROM countdown;


-- 2.Recursive CTE's step by step

WITH RECURSIVE countdown(val) AS (
    SELECT 3 AS val -- Initial, Non-recursive query
    UNION
    SELECT val - 1
    FROM countdown
    WHERE val > 1 -- Recursive query
)
SELECT *
FROM countdown;


-- 3. Why use recursive CTE's
-- 4. Writing the query

WITH RECURSIVE suggestions(leader_id, follower_id, depth) AS (
    SELECT leader_id, follower_id, 1 AS depth
    FROM followers
    WHERE follower_id = 1000
    UNION
    SELECT f.leader_id, f.follower_id, depth + 1
    FROM followers f
    JOIN suggestions ON suggestions.leader_id = f.follower_id
    WHERE depth < 3
)
SELECT DISTINCT u.id, u.username
FROM suggestions s
JOIN users u ON u.id = s.leader_id
WHERE depth > 1
-- LIMIT 30
;

SELECT count(*) FROM users;







