-- 1.2.3.4.

SELECT (2); -- integer
SELECT (2.0); -- numeric
SELECT (2.0::INTEGER); -- integer: int4
SELECT (2.0::SMALLINT);
-- integer: int2
-- SELECT (99999::SMALLINT); -- smallint out of range
SELECT (2.0::BIGINT); -- integer: int8

SELECT (1.99999::REAL - 1.99998::REAL); -- 0.00001001358
SELECT (1.99999::DECIMAL - 1.99998::DECIMAL); -- exactly precision
SELECT (1.99999::NUMERIC - 1.99998::NUMERIC);
-- exactly precision

-- 5.
SELECT (12.123124324::INTEGER); -- 12

SELECT ('alskdjfalskjdf'::CHAR(3)); -- als
SELECT ('a'::CHAR(3)); -- a (contains spaces)
SELECT ('aeiunkjfn3rujnkjnfkjkjfwkbewjfnfwni'::VARCHAR(5)); -- aeiun
SELECT ('a'::VARCHAR(5)); -- a ( does not contain spaces )
SELECT ('aeiunkjfn3rujnkjnfkjkjfwkbewjfnfwni'::TEXT);
-- aeiunkjfn3rujnkjnfkjkjfwkbewjfnfwni


-- 6.
SELECT ('true'::BOOLEAN); -- true
SELECT ('t'::BOOLEAN); -- true
SELECT ('yes'::BOOLEAN); -- true
SELECT ('y'::BOOLEAN); -- true
SELECT (1::BOOLEAN); -- true

SELECT ('false'::BOOLEAN); -- false
SELECT ('f'::BOOLEAN); -- false
SELECT ('no'::BOOLEAN); -- false
SELECT ('n'::BOOLEAN); -- false
SELECT (0::BOOLEAN); -- false

SELECT (NULL::BOOLEAN);
-- null


-- 7.
SELECT ('NOV-20-1980'::DATE); -- 1980-11-20
SELECT ('NOV 20 1980'::DATE); -- 1980-11-20
SELECT ('NOV 20, 1980'::DATE); -- 1980-11-20
SELECT ('1980 NOV 20'::DATE); -- 1980-11-20
SELECT ('1980 November 20'::DATE); -- 1980-11-20

SELECT ('01:23'::TIME); -- 01:23:00
SELECT ('01:23 PM'::TIME); -- 13:23:00
SELECT ('01:23 PM'::TIME WITHOUT TIME ZONE); -- 13:23:00
SELECT ('01:23:23 PM'::TIME WITHOUT TIME ZONE); -- 13:23:23

SELECT ('01:23:23 AM EST'::TIME WITH TIME ZONE); -- 01:23:23.000000 -05:00
SELECT ('01:23:23 AM PST'::TIME WITH TIME ZONE); -- 01:23:23.000000 -08:00
SELECT ('01:23:23 AM z'::TIME WITH TIME ZONE); -- 01:23:23.000000 +00:00
SELECT ('01:23:23 AM UTC'::TIME WITH TIME ZONE); -- 01:23:23.000000 +00:00

SELECT ('NOV-20-1980 1:23 AM PST'::TIMESTAMP WITHOUT TIME ZONE);


-- 8.
SELECT ('1 day'::INTERVAL); -- 0 years 0 mons 1 days 0 hours 0 mins 0.0 secs
SELECT ('1 D'::INTERVAL); -- 0 years 0 mons 1 days 0 hours 0 mins 0.0 secs
SELECT ('1 D 20 H'::INTERVAL); -- 0 years 0 mons 1 days 20 hours 0 mins 0.0 secs
SELECT ('1 D 20 H 30 M 45 S'::INTERVAL); -- 0 years 0 mons 1 days 20 hours 30 mins 45.0 secs
SELECT ('1 D 20 H 30 M 45 S'::INTERVAL) - ('1 D'::INTERVAL); -- 0 years 0 mons 0 days 20 hours 30 mins 45.0 secs

SELECT ('NOV-20-1980 1:2 AM EST'::TIMESTAMP WITH TIME ZONE)
           -
       ('1 D'::INTERVAL); -- 1980-11-19 06:02:00.000000 +00:00

SELECT ('NOV-20-1980 1:2 AM EST'::TIMESTAMP WITH TIME ZONE)
           -
       ('4 D'::INTERVAL); -- 1980-11-16 06:02:00.000000 +00:00

SELECT ('NOV-20-1980 1:23 AM EST'::TIMESTAMP WITH TIME ZONE)
           -
       ('NOV-10-1980 1:23 AM EST'::TIMESTAMP WITH TIME ZONE); -- 0 years 0 mons 10 days 0 hours 0 mins 0.0 secs

SELECT ('NOV-20-1980 1:23 AM EST'::TIMESTAMP WITH TIME ZONE)
           -
       ('NOV-10-1980 5:43 AM PST'::TIMESTAMP WITH TIME ZONE); -- 0 years 0 mons 9 days 16 hours 40 mins 0.0 secs

