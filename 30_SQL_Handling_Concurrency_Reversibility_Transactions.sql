
-- 1. What are transactions used for
-- 2. Some sample data

CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    balance INTEGER NOT NULL
);

INSERT INTO accounts (name, balance) VALUES ('Gia', 100), ('Alyson', 200);

SELECT * FROM accounts;


-- 3. Opening and closing transactions

BEGIN;

UPDATE accounts SET balance = balance - 50 WHERE name = 'Alyson';

SELECT * FROM accounts;

UPDATE accounts SET balance = balance + 50 WHERE name = 'Gia';

SELECT * FROM accounts;

COMMIT;



-- 4. Transaction Cleanup on Crash

UPDATE accounts SET balance = 100;

SELECT * FROM accounts;


BEGIN;

UPDATE accounts SET balance = balance - 50 WHERE name = 'Alyson';

-- CLOSED ALL SESSIONS

SELECT * FROM accounts;

BEGIN;

-- SELECT * FROM deunwfunufnefnwfkjwnk;

SELECT * FROM accounts;

ROLLBACK ;

SELECT * FROM accounts;