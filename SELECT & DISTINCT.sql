SELECT * FROM friends;
SELECT * FROM businessman;

-- SELECT f.name,b.business_name
-- FROM friends f
-- INNER JOIN businessman b
-- ON f.id = b.friend_id;


-- SELECT f.name,b.business_name
-- FROM friends f
-- INNER JOIN businessman b
-- ON f.id = b.friend_id;

-- SELECT name,current_location,business_name
-- FROM friends 
-- INNER JOIN businessman
-- ON friends.id = businessman.friend_id;

-- SELECT name,age,native,current_location,business_name
-- FROM friends
-- INNER JOIN businessman ON
-- friends.id = businessman.business_id;


-- select 
SELECT * FROM friends;

SELECT name,age FROM friends;

SELECT name,native,current_location FROM friends;

SELECT * FROM businessman;

--distinct
SELECT DISTINCT business_id,friend_id,business_name
FROM businessman;

SELECT DISTINCT business_id,business_name
FROM businessman;


SELECT DISTINCT business_name FROM businessman;
SELECT DISTINCT friend_id FROM businessman;

