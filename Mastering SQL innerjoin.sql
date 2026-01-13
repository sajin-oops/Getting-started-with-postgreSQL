SELECT * FROM friends;
SELECT * FROM businessman;

SELECT f.name,b.business_name
FROM friends f
INNER JOIN businessman b
ON f.id = b.friend_id;


SELECT f.name,b.business_name
FROM friends f
INNER JOIN businessman b
ON f.id = b.friend_id;

SELECT name,current_location,business_name
FROM friends 
INNER JOIN businessman
ON friends.id = businessman.friend_id;

SELECT name,age,native,current_location,business_name
FROM friends
INNER JOIN businessman ON
friends.id = businessman.business_id;


-- Successfully understand the inner join in SQL
--Mastering SQL innerjoin