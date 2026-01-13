CREATE TABLE marks(
student_id INT,
subject VARCHAR(20),
score INT
);

SELECT * FROM marks;

INSERT INTO marks VALUES
(1,'Maths',85),
(1,'Science',90),
(2,'Maths',70),
(2,'Science',75),
(3,'Maths',95);


--Count
SELECT COUNT(*) FROM marks;
-- It will tell the total number of rows


--Sum
SELECT SUM(score) FROM marks;

--Avg
SELECT AVG(score) FROM marks;

SELECT MIN(score),MAX(score) FROM marks;