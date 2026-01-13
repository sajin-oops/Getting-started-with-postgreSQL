SELECT * FROM marks;


--between
-- With mark example

SELECT * FROM marks
WHERE score BETWEEN 70 AND 80;

SELECT * FROM marks
WHERE score BETWEEN 85 AND 90;

SELECT * FROM marks
WHERE score BETWEEN 85 AND 95;


--With student id examples
SELECT * FROM marks 
WHERE student_id BETWEEN 1 AND 2;

SELECT * FROM marks
WHERE student_id BETWEEN 2 AND 3;

SELECT * FROM marks
WHERE student_id BETWEEN 0 AND 1;

SELECT * FROM marks;
