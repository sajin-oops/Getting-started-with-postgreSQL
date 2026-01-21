-- Type Casting

SELECT * FROM casting;

SELECT name, salary:: INTEGER +2 AS updated_salary
FROM casting;

SELECT * FROM casting;


CREATE TABLE test(
ID SERIAL,
name TEXT,
age TEXT
);

SELECT * FROM test;

INSERT INTO test(name,age)
VALUES
('White','24'),
('Black','23');

SELECT * FROM test;

-- Using :: 

SELECT name,age:: INTEGER +1 AS updated_age
FROM test
WHERE id = 2 ;


SELECT name,age:: INTEGER  AS updated_age
FROM test
WHERE id = 2 ;

SELECT * FROM test;

SELECT name,age:: INTEGER AS salary_int 		-- Here i change the TEXT data type into an INTEGER data type using ::
FROM test;

-- Using CAST()

SELECT * FROM test;

SELECT name,age, CAST(age AS INTEGER)
FROM test
WHERE id = 1;

SELECT name,age, CAST(age AS INTEGER) AS age_int 
FROM test
WHERE id = 1;



SELECT CAST('1' AS INTEGER);