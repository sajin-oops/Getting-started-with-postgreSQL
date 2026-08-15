CREATE TABLE example(
name VARCHAR(40),
age INT
);

INSERT INTO example
(first_name,age)VALUES
('Sky',23),
('Cloud',20),
('RUN',22);

SELECT * FROM example;

ALTER TABLE example ADD COLUMN last_name VARCHAR(40);

ALTER TABLE example RENAME COLUMN name TO first_name;

-- INSERT INTO example(last_name)
-- VALUES
-- ('Walk'),
-- ('HigH'),
-- ('low');

DELETE FROM example WHERE first_name IS NULL; 
DELETE FROM example WHERE last_name IS NULL; 


UPDATE example SET last_name = 'walk' WHERE first_name = 'Sky';
UPDATE example SET last_name = 'stay' WHERE first_name = 'RUN';
UPDATE example SET last_name = 'HIGH' WHERE first_name = 'Cloud';


-- String functions with examples
SELECT CONCAT(first_name, ' ',last_name) AS full_name FROM example;


--upper()
select first_name,last_name,UPPER(first_name) AS upper_first_name,UPPER(last_name)AS upper_last_name FROM example;

-- lower()
SELECT first_name,LOWER(first_name) FROM example;



-- TRIM()
SELECT TRIM(' bOoM ') AS trimmed;

SELECT TRIM('R' FROM 'RRYoooR')AS trimmed;

SELECT TRIM(LEADING 'R' FROM 'RRYoooR')AS trimmed; --This 'LEADING' keyword will remove the beginning matching letter
SELECT TRIM(TRAILING 'R' FROM 'RRYoooR')AS trimmed; --This 'TRAILING' keyword will remove the Last matching letter
