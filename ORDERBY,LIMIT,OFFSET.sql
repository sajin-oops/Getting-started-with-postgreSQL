-- SELECT * FROM student;   MESSED UP!

-- ALTER TABLE student 
-- ADD COLUMN 
-- age int ;

-- SELECT * FROM student;

-- INSERT INTO student 
-- (id,age) VALUES (1,22),(2,27),(3,23),(5,29);

SELECT * FROM learning;


-- ORDER BY
SELECT college,age 
FROM learning
ORDER BY college ASC; --BETTER ALWAYS MENTION ASC OR DESC. ITS GOOD FOR TOP NO.1 ENGINEER

SELECT name
FROM learning 
ORDER BY name ASC;

--The default is set to be ASCENDING ORDER WISE ONLY 
SELECT age,college
FROM learning 
ORDER BY college;

SELECT * FROM learning
ORDER BY college ASC, age DESC;

SELECT * FROM learning 
ORDER BY college ASC, age ASC;

SELECT name,college
FROM learning
ORDER BY college ASC,name DESC;

SELECT name,college
FROM learning
ORDER BY college ASC,name ASC;


-- LIMIT - LIMIT is like how many rows u want in the result.
--Lets see what this limit is :)

SELECT * FROM learning LIMIT 5;	

SELECT name,college
FROM learning
ORDER BY college ASC,name ASC LIMIT 5;


--OFFSET - OFFSET will skip a certain number of rows before showing the result
--LET SEE ABOUT OFFSET

SELECT * FROM learning;

SELECT * FROM learning
OFFSET 2;


SELECT * FROM learning 
ORDER BY name 
LIMIT 2 OFFSET 2;