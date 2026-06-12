
CREATE TABLE one(
id SERIAL PRIMARY KEY,
name VARCHAR(100),
department VARCHAR(50),
salary NUMERIC(10,2),
hire_date DATE
);


--inserting data
INSERT INTO one(name,department,salary,hire_date)
VALUES
  ('Sajin',   'Engineering', 75000, '2022-01-15'),
  ('Arjun',   'Marketing',   55000, '2021-06-10'),
  ('Priya',   'Engineering', 80000, '2020-03-22'),
  ('Meera',   'HR',          48000, '2023-07-01'),
  ('Rahul',   'Marketing',   62000, '2021-11-30'),
  ('Anita',   'Engineering', 90000, '2019-08-05'),
  ('Karan',   'HR',          51000, '2022-09-14'),
  ('Divya',   'Marketing',   70000, '2020-12-01'),
  ('Vikram',  'Engineering', 68000, '2023-03-18'),
  ('Sneha',   'HR',          53000, '2021-04-25');



SELECT * FROM one;

-- trying CTE on my own

WITH 
	learn AS(
			SELECT id,name,department FROM one
)
SELECT * FROM learn;



-- Multiple CTE 
WITH two AS(
		SELECT id,department FROM one
),
three AS(
	SELECT name,id FROM one
),
result AS (
	SELECT t.id,t.department,h.name FROM two t
	INNER JOIN three h ON t.id = h.id
)
SELECT * FROM result;

-- SELECT * FROM three;


WITH salary_detail AS(
	SELECT name,salary FROM one
),
	average AS(
		SELECT AVG(salary) AS average_salary,MAX(salary) AS maximum_salary,
		MIN(salary) AS minimum_salary FROM one	
	)
SELECT * FROM average;


SELECT * FROM one;



WITH salary_detail AS(
		SELECT name,salary FROM one
),
	average AS(
		SELECT AVG(salary) AS average_salary,MAX(salary) AS maximum_salary,
		MIN(salary) AS minimum_salary FROM one	
	),
	high_pay AS(
		SELECT name,salary > 70000 AS high_pays FROM one
	)
	SELECT * FROM high_pay;



--Window function

SELECT 
	name,department,salary,
	ROW_NUMBER() OVER() AS No_Of_Rows
	FROM one;
	


SELECT 
	name,department,salary,hire_date AS Seniors FROM one
	 ORDER BY hire_date DESC;

	
-- 								WINDOW FUNCTIONS
-- department wise total salary
SELECT name,department,salary,
SUM(salary) OVER(PARTITION BY department) AS dept_total
FROM one;

-- Counting departments
SELECT name,department,salary,
COUNT(department) OVER(PARTITION BY department) AS No_Of_Departs
FROM one;

--Finding average salary 
SELECT name,department,salary,
ROUND(AVG(salary) OVER(PARTITION BY department),2) AS Avg_salary_department
FROM one;



-- Counting departments
SELECT 
	name,department,salary,
	ROW_NUMBER() OVER(PARTITION BY department) AS No_Of_Departs
	FROM one;                  


SELECT * FROM one;


--roll up
SELECT department,SUM(salary) AS total_salary
FROM one
GROUP BY ROLLUP(department)
ORDER BY department;


SELECT department,SUM(salary) AS total_salary FROM one
GROUP BY department;

/*
WITH salary_detail AS(
	SELECT name,salary FROM one
),
	average AS(
		SELECT AVG(salary) AS average_salary,MAX(salary) AS maximum_salary,
		MIN(salary) AS minimum_salary FROM one	
	)
SELECT * FROM average;

*/

SELECT name,
AVG(salary) AS average_salary,
MAX(salary) AS maximum_salary,
MIN(salary) AS minimum_salary
FROM one
GROUP BY ROLLUP(name);

SELECT * FROM one;

SELECT AVG(salary) AS Avg_salary FROM one;