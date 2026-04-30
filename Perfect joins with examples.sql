CREATE TABLE test(
id INT,
name TEXT,
age INT
);

CREATE TABLE write(
id INT,
role TEXT
);

INSERT INTO test(id,name,age)
VALUES
(1,'Sky',12),
(2,'Red',14),
(3,'Yellow',13);

-- DROP TABLE test;


INSERT INTO write(id,role)
VALUES
(2,'Data Engineer'),
(1,'Data Scientist');


SELECT * FROM test;
SELECT * FROM write;

-- lets try joins now
-- INNER JOIN
SELECT t.name,w.role FROM test t
INNER JOIN write w ON t.id = w.id;
									
SELECT t.id,t.name,w.role FROM test t
INNER JOIN write w ON t.id = w.id;

-- LEFT JOIN
SELECT t.name,w.role FROM test t
LEFT JOIN write w ON t.id = w.id;

SELECT t.id,t.name,w.role FROM test t
LEFT JOIN write w ON t.id = w.id;

SELECT t.id,t.name,w.id,w.role FROM test t
LEFT JOIN write w ON t.id = w.id;

-- RIGHT JOIN 
SELECT t.name,w.role FROM test t
RIGHT JOIN write w ON t.id = w.id;


SELECT t.id,t.name,w.role,w.id FROM test t
RIGHT JOIN write w ON t.id = w.id;


-- FULL JOIN
SELECT t.name,w.role FROM test t
FULL JOIN write w ON t.id = w.id;

SELECT t.id,t.name,w.id,w.role FROM test t
FULL JOIN write w ON t.id = w.id;

--CROSS JOIN
SELECT t.name,w.role FROM test t 
CROSS JOIN write w;

SELECT t.id,t.name,w.id,w.role
FROM test t
CROSS JOIN write w;