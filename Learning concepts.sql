CREATE TABLE em(
emp_id INT,
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT
);

SELECT * FROM em;

INSERT INTO em VALUES
(1, 'Sajin', 'Data', 50000),
(2, 'Arun', 'Data', 60000),
(3, 'Kumar', 'Data', 55000),
(4, 'Priya', 'HR', 40000),
(5, 'Divya', 'HR', 45000),
(6, 'John', 'Sales', 70000),
(7, 'Raj', 'Sales', 65000);

SELECT emp_name,department,
ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary)
FROM em;

SELECT emp_name,department,
RANK() OVER(PARTITION BY department ORDER BY salary)
FROM em;

SELECT emp_name,department,
DENSE_RANK() OVER(PARTITION BY department ORDER BY salary)
FROM em;

SELECT * FROM em;

SELECT emp_name,department,
ROW_NUMBER() OVER(PARTITION BY emp_name) AS No_Of_Employee FROM em;

SELECT emp_name,department,
ROW_NUMBER() OVER(PARTITION BY department) AS No_Of_Department FROM em;


SELECT emp_name,department,
ROW_NUMBER() OVER(ORDER BY emp_id) AS No_Of_Employee FROM em;


SELECT emp_name,department,
ROW_NUMBER() OVER(ORDER BY emp_id DESC) AS No_Of_Employee FROM em;

SELECT emp_name,department,
ROW_NUMBER() OVER(ORDER BY department) FROM em;

SELECT emp_name,department, 
ROW_NUMBER() OVER(ORDER BY department) FROM em;

SELECT * FROM em;

SELECT emp_id,emp_name,department, 
ROW_NUMBER() OVER() FROM em;