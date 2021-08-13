-- 2.3.4.5.

SELECT *
FROM users
ORDER BY id DESC
LIMIT 3;

SELECT *
FROM (SELECT * FROM users OFFSET (SELECT count(*) FROM users) - 3) t
ORDER BY id DESC;


-- 6.

SELECT username, caption
FROM users u
         JOIN posts p ON u.id = p.user_id
WHERE u.id = 200;


-- 7.

SELECT username, count(l.user_id)
FROM users u
         JOIN likes l on u.id = l.user_id
GROUP BY username;

-- SELECT count(*) FROM likes WHERE user_id = 4790;


-- 8.