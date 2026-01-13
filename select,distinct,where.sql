-- SELECT & DISTINCT

SELECT * FROM friends;

SELECT * FROM businessman;

SELECT DISTINCT business_name
FROM businessman;
 
SELECT DISTINCT friend_id
FROM businessman;

SELECT * FROM businessman 
WHERE business_name = 'Health Startup';

SELECT business_id,friend_id 
FROM  businessman
WHERE business_name = 'Health Startup';

--in

SELECT business_id,friend_id 
FROM businessman 
WHERE business_name IN ('Health Startup','Coffee_Shop');

SELECT * FROM businessman;

SELECT business_name,business_id
FROM businessman
WHERE friend_id IN (1,2);

SELECT business_name,business_id,friend_id
FROM businessman
WHERE friend_id IN (1,2);