-- 1. Materialized views
-- 2. Grouping by week
-- 3. Reminder on left join
-- 4. Writing a Slow Query

SELECT *
FROM likes l
         LEFT JOIN posts p ON l.post_id = p.id
         LEFT JOIN comments c ON c.id = l.comment_id;

-- DOES NOT WORK
SELECT *
FROM likes l
         JOIN posts p ON l.post_id = p.id
         JOIN comments c ON c.id = l.comment_id;
---------------------------------------

SELECT date_trunc('week', COALESCE(p.created_at, c.created_at)) AS week,
       count(p.id)                                                 num_likes_for_posts,
       count(c.id)                                                 num_likes_for_comments
FROM likes l
         LEFT JOIN posts p ON l.post_id = p.id
         LEFT JOIN comments c ON c.id = l.comment_id
GROUP BY week
ORDER BY week;


-- 5. Creating and Refreshing queries

CREATE MATERIALIZED VIEW weekly_likes AS (
    SELECT
    date_trunc('week', COALESCE(p.created_at, c.created_at)) AS week,
    count(p.id) AS num_likes_for_posts,
    count(c.id) AS num_likes_for_comments
    FROM likes l
    LEFT JOIN posts p on l.post_id = p.id
    LEFT JOIN comments c on c.id = l.comment_id
    GROUP BY week
    ORDER BY week
) WITH DATA;

SELECT * FROM weekly_likes;

DELETE FROM posts WHERE created_at < '2010-02-01';

REFRESH MATERIALIZED VIEW weekly_likes;

SELECT * FROM weekly_likes;

