SELECT * FROM friends;

SELECT * FROM businessman;

SELECT name,age
FROM friends
WHERE age >25;

SELECT name,age
FROM friends 
WHERE age >26;


SELECT name,age
FROM friends
WHERE age >25
ORDER BY age DESC 
LIMIT 2;

SELECT name,age
FROM friends
WHERE age >20
ORDER BY age ASC 
LIMIT 8;