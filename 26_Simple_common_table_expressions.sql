-- 1.

SELECT username, ct.created_at, pt.created_at
FROM users u
         JOIN caption_tags ct on u.id = ct.user_id
         JOIN photo_tags pt on u.id = pt.user_id
WHERE ct.created_at < '2010-07-01'
   OR pt.created_at < '2010-07-01';

-- ALTER TABLE caption_tags RENAME COLUMN time_when_was_created TO created_at;

SELECT *
FROM photo_tags
LIMIT 1;

SELECT username, t.created_at
FROM users u
         JOIN ((SELECT created_at, user_id FROM photo_tags) UNION ALL (SELECT created_at, user_id FROM caption_tags)) t
              ON u.id = t.user_id
WHERE t.created_at < '2010-01-07';

-- SELECT username


-- 3. What's a CTE? CTE = Common table expression

WITH tags AS (
    SELECT created_at, user_id FROM photo_tags UNION ALL SELECT created_at, user_id FROM caption_tags
)
SELECT username, tags.created_at
FROM users
         JOIN tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';

--======================================================================================================================
EXPLAIN
SELECT username, t.created_at
FROM users u
         JOIN ((SELECT created_at, user_id FROM photo_tags) UNION ALL (SELECT created_at, user_id FROM caption_tags)) t
              ON u.id = t.user_id
WHERE t.created_at < '2010-01-07';
-- S U N T   I D E N T I C E  D.P.D.V   A L   P E R F O R M A N T E I: A T A T   C U   C T E   C A T   S I   F A R A
EXPLAIN
WITH tags AS (
    SELECT created_at, user_id FROM photo_tags UNION ALL SELECT created_at, user_id FROM caption_tags
)
SELECT username, tags.created_at
FROM users
         JOIN tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';
--======================================================================================================================
