-- Using the below ERD as reference, write a SQL query that returns a list of users along with their friends' names.

SELECT users.first_name, users.last_name, user2.first_name AS friend_first_name, user2.last_name AS frined_last_name 
FROM users 
JOIN friendships ON users.id = friendships.user_id
JOIN users AS user2 ON user2.id = friendships.friend_id;

-- 1. Return all users who are friends with Kermit, make sure their names are displayed in results.
SELECT users.first_name, users.last_name, user2.first_name AS friend_first_name, user2.last_name AS frined_last_name FROM users
JOIN friendships ON users.id = friendships.user_id
JOIN users AS user2 ON user2.id = friendships.friend_id
WHERE user2.first_name = 'Kermit';

-- 2. Return the friends of Eli in alphabetical order.

SELECT users.first_name, users.last_name, user2.first_name AS friend_first_name, user2.last_name AS frined_last_name FROM users
JOIN friendships ON users.id = friendships.user_id
JOIN users AS user2 ON user2.id = friendships.friend_id
WHERE users.first_name = 'Eli'order by user2.first_name;

-- 3. Return the count of all friendships
SELECT users.first_name, users.last_name, count(user2.first_name) AS no_of_friends
FROM users
JOIN friendships ON users.id = friendships.user_id
JOIN users AS user2 ON user2.id = friendships.friend_id
GROUP BY users.first_name;


