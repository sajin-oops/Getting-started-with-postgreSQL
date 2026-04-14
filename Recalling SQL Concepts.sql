CREATE TABLE emp(
id SERIAL PRIMARY KEY,
name VARCHAR(40),
department VARCHAR(40),
salary NUMERIC(14,2),
hire_date DATE
);

SELECT * FROM emp;

INSERT INTO emp(name,department,salary,hire_date)
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


TRUNCATE TABLE emp;
DELETE FROM emp;
TRUNCATE TABLE emp RESTART IDENTITY; -- Worth a lot 

--EXERCISE - 1 SELECT
/* 

Q1. Get all columns from the employees table.
Q2. Get only the name and salary columns.
Q3. Get name and salary but rename them as employee_name and monthly_pay.

*/

SELECT * FROM emp;

SELECT name,salary FROM emp;

SELECT name AS employee_name, salary AS monthly_pay FROM emp;

--EXERCISE - 2 WHERE
/* 
Q1. Get all employees from the Engineering department.
Q2. Get employees whose salary is greater than 60000.
Q3. Get employees from Marketing department AND salary greater than 60000.
Q4. Get employees whose salary is between 50000 and 70000.
Q5. Get employees whose name starts with the letter S.
*/

SELECT * FROM emp WHERE department = 'Engineering';

SELECT salary FROM emp WHERE salary > 60000;

SELECT * FROM emp WHERE department = 'Marketing' AND salary > 60000;

SELECT * FROM emp WHERE SALARY BETWEEN 50000 AND 70000;

SELECT * FROM emp WHERE name LIKE 'S%';
SELECT * FROM emp WHERE name ILIKE 's%';
SELECT * FROM emp WHERE name ILIKE '%n';

--EXERCISE - 3 ORDER BY
/*

Q1. Get all employees sorted by salary lowest to highest.
Q2. Get all employees sorted by salary highest to lowest.
Q3. Get all employees sorted by department first, then by salary highest to lowest within each department.

*/

SELECT * FROM emp ORDER BY salary;
SELECT * FROM emp ORDER BY salary DESC;
SELECT * FROM emp ORDER BY salary ASC;

SELECT * FROM emp ORDER BY department,salary ASC;
SELECT * FROM emp ORDER BY department,salary DESC;

--EXERCISE - 4 LIMIT & OFFSET
/* 
Q1. Get the top 3 highest paid employees.
Q2. Get the lowest 3 paid employees.
Q3. Skip the first 3 highest paid employees and get the next 2 after them.
*/

SELECT * FROM emp ORDER BY salary DESC LIMIT 3;
SELECT * FROM emp ORDER BY salary ASC LIMIT 3;
SELECT * FROM emp ORDER BY salary DESC LIMIT 2 OFFSET 3;
SELECT * FROM emp ORDER BY salary DESC;


--EXERCISE - 5 Aggregate Functions
/*
Q1. Count the total number of employees.
Q2. Get the total salary paid to all employees.
Q3. Get the average salary of all employees.
Q4. Get the highest and lowest salary in one query.
Q5. Get all 4 — COUNT, SUM, AVG, MIN, MAX in a single query with proper aliases.
*/

