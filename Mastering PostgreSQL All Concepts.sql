CREATE TABLE employees(
id SERIAL PRIMARY KEY,
name VARCHAR(100),
department VARCHAR(50),
salary NUMERIC(10,2),
hire_date DATE
);

SELECT * FROM employees;

--inserting data
INSERT INTO employees(name,department,salary,hire_date)
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

--EXERCISE - 1 SELECT
/* 

Q1. Get all columns from the employees table.
Q2. Get only the name and salary columns.
Q3. Get name and salary but rename them as employee_name and monthly_pay.


*/

SELECT * FROM employees;

SELECT name,salary FROM employees;

SELECT name AS employee_name,salary AS monthly_pay
FROM employees;

--EXERCISE - 2 WHERE

/* 

Q1. Get all employees from the Engineering department.
Q2. Get employees whose salary is greater than 60000.
Q3. Get employees from Marketing department AND salary greater than 60000.
Q4. Get employees whose salary is between 50000 and 70000.
Q5. Get employees whose name starts with the letter S.

*/
--Q1
SELECT * FROM employees WHERE department = 'Engineering';

--Q2
SELECT * FROM employees WHERE salary > 60000;

--Q3
SELECT * FROM employees  WHERE department = 'Marketing' AND salary > 60000;
		
--Q4
SELECT * FROM employees WHERE salary BETWEEN 50000 AND 70000; 

--Q5
SELECT * FROM employees WHERE name ILIKE 's%';
--or
SELECT * FROM employees WHERE name LIKE 'S%';


--EXERCISE - 3 ORDER BY
/*

Q1. Get all employees sorted by salary lowest to highest.
Q2. Get all employees sorted by salary highest to lowest.
Q3. Get all employees sorted by department first, then by salary highest to lowest within each department.

*/

--Q1
SELECT * FROM employees ORDER BY salary ASC;

--Q2
SELECT * FROM employees ORDER BY salary DESC;

--Q3
SELECT * FROM employees ORDER BY department,salary DESC;
--or
SELECT department,salary FROM employees ORDER BY department,salary DESC;


--EXERCISE - 4 LIMIT & OFFSET

/* 

Q1. Get the top 3 highest paid employees.
Q2. Get the lowest 3 paid employees.
Q3. Skip the first 3 highest paid employees and get the next 2 after them.

*/

--Q1
SELECT * FROM employees ORDER BY salary DESC LIMIT 3;

--Q2
SELECT * FROM employees ORDER BY salary ASC LIMIT 3;

--Q3
SELECT * FROM employees ORDER BY salary DESC LIMIT 2 OFFSET 3;

--EXERCISE - 5 Aggregate Functions

/*

Q1. Count the total number of employees.
Q2. Get the total salary paid to all employees.
Q3. Get the average salary of all employees.
Q4. Get the highest and lowest salary in one query.
Q5. Get all 4 — COUNT, SUM, AVG, MIN, MAX in a single query with proper aliases.


*/

--Q1
SELECT COUNT(name) AS total_no_of_employees FROM employees; 

--Q2
SELECT SUM(salary) AS Total_salary FROM employees;
--or
SELECT COUNT(name) AS no_of_employees,SUM(salary) AS Total_salary FROM employees;

--Q3
SELECT AVG(salary) AS Average_salary FROM employees;

--Q4
--Working query is below
SELECT MAX(salary) AS Highest_salary,MIN(salary) AS lowest_salary FROM employees;

--Q5
SELECT count(name) AS total_no_of_employees, SUM(salary) AS Total_salary,AVG(salary) AS Average_salary,MIN(salary) AS Minimum_salary,MAX(salary) AS Maximum_salary FROM employees;


-- EXERCISE - 6 GROUP BY

/*

Q1. Get the total salary per department.
Q2. Get the average salary per department.
Q3. Get the number of employees in each department.
Q4. Get the highest salary in each department.

*/

SELECT * FROM employees
--Q1
SELECT department,sum(salary) AS Total_Salary FROM employees GROUP BY department;

--Q2
SELECT department,AVG(salary) AS Average_salary FROM employees GROUP BY department;

--Q3
SELECT department,COUNT(name) AS No_of_employees FROM employees GROUP BY department;

--Q4
SELECT department,MAX(salary) AS Highest_salary FROM employees GROUP BY department;



-- Exercise 7 - HAVING
/*
TIPS TO REMEMBER 
			WHERE - Filters rows before grouping
			HAVING - Filers groups after grouping

*/

/*

Q1. Get departments where the total salary is greater than 150000.
Q2. Get departments where the average salary is greater than 60000.
Q3. Get departments that have more than 2 employees.
Q4. Get departments where the highest salary is greater than 75000.

*/

--Q1
SELECT sum(salary) AS Total_Salary,department FROM employees GROUP BY department HAVING SUM(salary) > 150000;

--Q2
SELECT department,AVG(salary) AS Average_salary FROM employees GROUP BY department HAVING AVG(salary) >60000;

--Q3	
SELECT department,COUNT(name) AS No_of_employees FROM employees GROUP BY department HAVING COUNT(name) >2;

--Q4
SELECT department,MAX(salary) AS Highest_salary FROM employees GROUP BY department HAVING MAX(salary) > 75000;


-- Exercise 8 — UPDATE & DELETE
/*
  
Q1. Update Sajin's salary to 95000.
Q2. Update all HR department employees salary by adding 5000 to their current salary.
Q3. Delete the employee named Meera.
Q4. Verify all 3 changes by selecting the full table.
  
*/

/*

test query 	-	Fixed the mistake successfully
UPDATE employees SET SALARY = 48000
WHERE id = 4;

UPDATE employees SET salary = 51000
WHERE id = 7;

UPDATE employees SET SALARY = 53000
WHERE id = 10;

SELECT * FROM employees ORDER BY id ASC;
SELECT * FROM  employees;

*/

--Q1
UPDATE employees SET salary = 95000
WHERE id = 1;

--Q2
UPDATE employees SET salary = salary + 5000
WHERE department = 'HR';

--Q3
DELETE FROM employees 
WHERE id = 4;

--Q4
SELECT * FROM employees;

