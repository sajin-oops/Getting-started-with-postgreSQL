-- Create table
CREATE TABLE workers (
    emp_id      SERIAL PRIMARY KEY,
    emp_name    VARCHAR(50),
    department  VARCHAR(50),
    salary      NUMERIC(10,2),
    manager_id  INT,
    hire_date   DATE
);

-- Insert sample data
INSERT INTO workers (emp_name, department, salary, manager_id, hire_date) VALUES
('Arjun',   'Engineering', 75000, NULL, '2019-03-15'),
('Priya',   'Engineering', 68000, 1,    '2020-06-01'),
('Kiran',   'Engineering', 62000, 1,    '2021-01-20'),
('Divya',   'Sales',       55000, NULL, '2018-11-05'),
('Rahul',   'Sales',       48000, 4,    '2021-09-10'),
('Meena',   'Sales',       52000, 4,    '2022-02-14'),
('Sanjay',  'HR',          60000, NULL, '2017-07-19'),
('Anita',   'HR',          45000, 7,    '2020-12-01'),
('Vikram',  'Engineering', 90000, 1,    '2016-04-22'),
('Lakshmi', 'Sales',       58000, 4,    '2019-08-30');


SELECT * FROM workers;


-- Find employees earning above the average salary
WITH avg_salary AS(
	SELECT AVG(salary) AS avg_sal
	FROM workers
)
SELECT emp_name,salary FROM workers,avg_salary
WHERE workers.salary > avg_salary.avg_sal;


SELECT AVG(salary) FROM workers;

-- CTE with aggregation
-- Find the total salary per department, then filter departments with total salary above 100000:

WITH dept_totals AS ( 
	SELECT department,SUM(salary) AS total_salary
	FROM workers
	GROUP BY department
)
SELECT * FROM dept_totals
WHERE total_salary > 100000;

