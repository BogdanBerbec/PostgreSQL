-- 1. Most popular users

SELECT username, count(*)
FROM users u
         JOIN (
    SELECT user_id
    FROM photo_tags
    UNION ALL
    SELECT user_id
    FROM caption_tags
) AS t ON t.user_id = u.id
GROUP BY username
ORDER BY count(*) DESC;

-- SELECT * FROM users WHERE username = 'Bonita96';
--
-- SELECT count(*) FROM users;


-- 2. A possible solution for merging tables -
-- 3. Creating a view

CREATE VIEW tags AS
(
SELECT id, created_at, user_id, post_id, 'photo_tag' AS type
FROM photo_tags
UNION ALL
SELECT id, created_at, user_id, post_id, 'caption_tag' AS type
FROM caption_tags
    );

SELECT *
FROM tags;
SELECT *
FROM tags
WHERE type = 'caption_tag';

SELECT username, count(*)
FROM users u
         JOIN tags t ON t.user_id = u.id
GROUP BY username
ORDER BY count(*) DESC;


-- 4. When to use a view

CREATE VIEW recent_posts AS
(
SELECT *
FROM posts
ORDER BY created_at DESC
LIMIT 10 );

SELECT *
FROM recent_posts;

SELECT username
FROM recent_posts rp
         JOIN users u on rp.user_id = u.id;


-- 5. Deleting and changing views

CREATE OR REPLACE VIEW recent_posts AS
(
SELECT *
FROM posts
ORDER BY created_at DESC
LIMIT 15 );

SELECT * FROM recent_posts;

DROP VIEW recent_posts;
