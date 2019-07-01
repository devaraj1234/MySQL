SELECT * FROM users;
SELECT * FROM faves;
SELECT * FROM follows;
SELECT * FROM tweets;
SELECT first_name FROM users;
SELECT first_name FROM users WHERE ID = 2;
SELECT first_name FROM users WHERE ID = 2 OR 3;
SELECT * FROM users WHERE first_name LIKE "%e" ORDER BY birthday DESC;
SELECT first_name FROM users ORDER BY first_name;


INSERT INTO tweets (tweet, user_id, created_at, updated_at)
VALUES ('HELLO', 1, NOW(), NOW());
SELECT * FROM tweets;


UPDATE users SET
first_name = "David"
WHERE id =1;
SELECT * FROM users;

SELECT * FROM tweets;
DELETE FROM tweets
WHERE id = 15;


