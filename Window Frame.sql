

CREATE TABLE em(
id SERIAL PRIMARY KEY,
name VARCHAR(100),
department VARCHAR(50),
salary NUMERIC(10,2),
hire_date DATE
);


--inserting data
INSERT INTO em(name,department,salary,hire_date)
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


SELECT * FROM em;

--window frame

SELECT name,hire_date,salary,SUM(salary) OVER(
	ORDER BY hire_date
	ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS running_total_salary FROM em;


SELECT name,department,salary,
SUM(salary) OVER(
	PARTITION BY department
	ORDER BY salary
	ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING 
) AS Sum_salary_WF from em;



-- ORDER BY

SELECT * FROM  em;

SELECT name,department,salary FROM em ORDER BY department;

SELECT name,department,salary FROM em ORDER BY name;


--GROUP BY

SELECT department,
	COUNT(*) AS employee_count
FROM em
GROUP BY department;


SELECT name,
	COUNT(*) AS employee_count
FROM em
GROUP BY name ;



--min and max
SELECT  department,
COUNT(*) AS employee_count,
MIN(salary) AS min_salary,
MAX(salary) AS max_salary
FROM    em    
GROUP BY department
ORDER BY department ASC;


--Approximate aggregations

-- SELECT APPROX_COUNT_DISTINCT(name) AS approx_unique,
-- COUNT(DISTINCT name) AS exact_unique
-- FROM em;

SELECT * FROM em;

SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY salary) AS median_salary
FROM em;

SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY salary) AS median_salary, 
PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY salary) AS P95_salary
FROM em;


SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY salary) AS median_salary,
PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY salary) AS P95_salary,
PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY salary) AS P99_salary
FROM em;


--Common table expressions(CTE)

WITH dept_stats AS(
	SELECT
	department,
	COUNT(*) AS head_count,
	ROUND(AVG(salary),0) AS avg_salary,
	MAX(salary) AS max_salary,
	MIN(salary) AS min_salry
	FROM em
	GROUP BY department
)
SELECT * 	
FROM dept_stats
ORDER BY avg_salary DESC;


--instead of doing subqury we use it inside CTE 
--example


	SELECT
	department,
	COUNT(*) AS head_count,
	ROUND(AVG(salary), 0) AS avg_salary,
	MAX(salary) AS max_salary,
	MIN(salary) AS min_salry
	FROM em
	GROUP BY department


--another one

WITH demo_test AS(
	SELECT name,department FROM em
)
SELECT * FROM demo_test;

-- another one 
WITH demo_test AS(
	SELECT name,department,salary FROM em
)
SELECT * FROM demo_test;