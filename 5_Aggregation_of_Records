SELECT user_id FROM comments GROUP BY user_id;

-- 4.
SELECT avg(id) FROM comments;
SELECT sum(id) FROM comments;

-- 5.
SELECT user_id, max(id) FROM comments GROUP BY user_id;

SELECT user_id, count(id) num_comments_created FROM comments GROUP BY user_id;

-- 6.
SELECT * FROM photos;

SELECT user_id, count(*) FROM photos GROUP BY user_id;


-- 7.
SELECT photo_id, count(*) FROM comments GROUP BY photo_id;

-- 8. Exercise overview 9.10.11.12.13.14.


-- 15.
SELECT photo_id, COUNT(*) FROM comments WHERE photo_id < 3 GROUP BY photo_id HAVING COUNT(*) > 2;

-- 16.
SELECT user_id, COUNT(*) FROM comments WHERE photo_id < 50 GROUP BY user_id HAVING COUNT(*) > 20;





