-- Department Table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_name) VALUES
('Engineering'),
('Marketing'),
('HR'),
('Finance'),
('Sales');

-- Employees Table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    salary NUMERIC(10,2),
    hire_date DATE,
    department_id INT,
    manager_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);


INSERT INTO employees
(first_name,last_name,gender,salary,hire_date,department_id,manager_id)
VALUES
('Sajin','Ak','Male',75000,'2022-01-15',1,NULL),
('Arjun','Kumar','Male',65000,'2021-06-10',1,1),
('Priya','Sharma','Female',55000,'2023-02-05',2,1),
('Anita','Rao','Female',50000,'2022-09-12',3,1),
('Rahul','Verma','Male',80000,'2020-03-22',4,NULL),
('Deepak','Singh','Male',60000,'2023-04-11',5,5),
('Neha','Patel','Female',58000,'2021-12-01',2,1),
('Kiran','Nair','Male',70000,'2022-07-18',1,1);



-- Projects Table
CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    budget NUMERIC(12,2)
);

INSERT INTO projects
(project_name,start_date,end_date,budget)
VALUES
('Data Warehouse','2024-01-01','2024-12-31',500000),
('CRM System','2024-02-01','2024-09-30',250000),
('Marketing Analytics','2024-03-01','2024-11-30',300000);


-- Employee Projects (Many-to-Many)
CREATE TABLE employee_projects (
    employee_id INT,
    project_id INT,
    assigned_date DATE,
    PRIMARY KEY(employee_id, project_id),
    FOREIGN KEY(employee_id)
        REFERENCES employees(employee_id),
    FOREIGN KEY(project_id)
        REFERENCES projects(project_id)
);

INSERT INTO employee_projects VALUES
(1,1,'2024-01-05'),
(2,1,'2024-01-10'),
(3,2,'2024-02-05'),
(4,2,'2024-02-10'),
(5,3,'2024-03-05'),
(6,3,'2024-03-08'),
(7,2,'2024-02-15'),
(8,1,'2024-01-15');

-- Attendance Table
CREATE TABLE attendance (
    attendance_id SERIAL PRIMARY KEY,
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20),
    FOREIGN KEY(employee_id)
        REFERENCES employees(employee_id)
);

INSERT INTO attendance
(employee_id,attendance_date,status)
VALUES
(1,'2024-06-01','Present'),
(2,'2024-06-01','Absent'),
(3,'2024-06-01','Present'),
(4,'2024-06-01','Present'),
(5,'2024-06-01','Absent'),
(6,'2024-06-01','Present'),
(7,'2024-06-01','Present'),
(8,'2024-06-01','Present');




SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;
SELECT * FROM employee_projects;
SELECT * FROM attendance;


/*

Beginner
List all employees.
Show employees earning more than 60,000.
Sort employees by salary descending.
Find employees hired after 2022.

*/
-- 1.
SELECT * FROM employees;
-- 2.
SELECT * FROM employees WHERE salary > 60000;
-- 3.
SELECT employee_id,salary FROM employees ORDER BY salary DESC;
SELECT * FROM employees ORDER BY salary DESC;
-- 4.
SELECT * FROM employees WHERE hire_date > '2022-12-31';



/*

JOINs
5. Show employee name and department name.
6. List employees without projects.
7. Show all projects and assigned employees.
8. Find employees and their managers (Self Join).

*/

-- Available tables name

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;
SELECT * FROM employee_projects;
SELECT * FROM attendance;

-- 5.
SELECT e.first_name,d.department_name 
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id;


SELECT e.first_name AS employee_name,d.department_name 
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id;


-- 6.
SELECT * FROM employees;
SELECT * FROM employee_projects;

SELECT e.first_name,p.project_id FROM employees e
LEFT JOIN employee_projects p
ON e.employee_id = p.employee_id WHERE p.employee_id IS NULL;

-- 7.Show all projects and assigned employees.

SELECT p.project_name,

SELECT * FROM employees;  --e
SELECT * FROM projects;   --p
SELECT * FROM employee_projects;  --pp


SELECT e.first_name,pp.employee_id,pp.project_id,p.project_name FROM employee_projects pp
INNER JOIN projects p ON p.project_id = pp.project_id JOIN employees e	ON 	
e.employee_id = pp.employee_id;


SELECT p.project_name,e.first_name FROM employee_projects pp
INNER JOIN projects p ON p.project_id = pp.project_id INNER JOIN employees e ON 	
e.employee_id = pp.employee_id;

SELECT p.project_name,
       e.first_name
FROM employee_projects ep
JOIN projects p
    ON p.project_id = ep.project_id
JOIN employees e
    ON e.employee_id = ep.employee_id;



-- 8. Find employees and their managers (Self Join).

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;
SELECT * FROM employee_projects;
SELECT * FROM attendance;  

SELECT employee_id,first_name,manager_id FROM employees;

--second edition
SELECT e.first_name AS Employee_name,m.first_name AS Manager_name FROM employees e INNER JOIN 
employees m ON e.manager_id = m.employee_id;

/*

GROUP BY
9. Average salary by department.
10. Count employees in each department.
11. Department with highest salary expense.

*/

-- 9.
SELECT ROUND(AVG(e.salary)) AS Average_salary,d.department_name FROM employees e INNER JOIN departments D ON e.department_id = d.department_id GROUP BY e.department_id,d.department_name ;

--10.

SELECT d.department_name,COUNT(e.employee_id) FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;


-- 11.
SELECT d.depart,e

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;
SELECT * FROM employee_projects;
SELECT * FROM attendance;

/*

Subqueries
12. Employee with highest salary
13. Employees earning above average salary.
14. Departments having more than 2 employees.
*/

SELECT * FROM employees;

-- 12.
SELECT * FROM employees WHERE salary =(SELECT MAX(salary) FROM employees);

-- 13.
SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT AVG(salary) FROM employees;

-- 14.

SELECT * FROM employees WHERE department_id IN(
SELECT department_id FROM employees GROUP BY department_id 
HAVING COUNT(*) > 2
);

SELECT * FROM employees WHERE department_id IN(
SELECT department_id FROM employees GROUP BY department_id 
HAVING COUNT(*) > 2 
) ORDER BY department_id;
	

/*
CTEs
15. Create a CTE for high-salary employees.
16. Recursive CTE for employee-manager hierarchy.

*/
-- 15.
WITH high_salary_employees AS(
	SELECT * FROM employees WHERE salary >= 70000
)
SELECT * FROM high_salary_employees;


SELECT * FROM employees;





/*
Window Functions
17. Rank employees by salary.
18. Dense rank employees within each department.
19. Running total of salaries.

Advanced
20. Employees who are not assigned to any project (Anti Join).
21. Top 3 highest-paid employees.
22. Find salary difference from department average.
23. Projects with budgets above average budget.

This dataset is large enough to practice almost every PostgreSQL concept from beginner to advanced.

*/


SELECT * FROM employees;



--roll up
SELECT department,SUM(salary) AS total_salary
FROM one
GROUP BY ROLLUP(department)
ORDER BY department;


--let's recall CTE(common table expression)

/*

A CTE is a temporary result set that you define using the WITH keyword.

*/

-- With out CTE

SELECT * FROM employees WHERE salary >= 80000;

-- Now try this with CTE

WITH highest_salary_employees AS (
	SELECT * FROM employees WHERE salary >= 80000
)
SELECT * FROM highest_salary_employees;


WITH all_employees_name AS(
	SELECT first_name,last_name FROM employees
)
SELECT * FROM all_employees_name;


-- CTE with aggregation
SELECT * FROM employees;


WITH highest_salary_employees AS(
	SELECT employee_id,first_name,last_name,salary,department_id,
	RANK() OVER(ORDER BY salary DESC) AS salary_rank
	FROM employees
	WHERE salary > 60000
)SELECT * FROM highest_salary_employees;



-- Better one
WITH highest_salary_employees AS(
	SELECT employee_id,first_name,last_name,salary,department_id,
	RANK() OVER(ORDER BY salary DESC) AS salary_rank
	FROM employees
	WHERE salary > 60000
)
SELECT 
	salary_rank,first_name,last_name,salary
	FROM highest_salary_employees;


SELECT * FROM employees;



--Let's Learn recursive CTE(COMMON TABLE EXPRESSION)


-- Recursive CTE

SELECT * FROM employees;

SELECT employee_id,first_name,manager_id
FROM employees ORDER BY employee_id;


SELECT * FROM employees
WHERE manager_id IS NULL;


--first one - Build the organization tree

WITH RECURSIVE employee_tree AS(
--Ancher query 
	SELECT
		employee_id,first_name,manager_id,
		1 AS level
	FROM employees
	WHERE manager_id IS NULL

	UNION ALL
-- Recursive query
	SELECT
		e.employee_id,
		e.first_name,
		e.manager_id,
		et.level + 1
	FROM employees e
	JOIN employee_tree et
	ON e.manager_id = et.employee_id
)
SELECT * FROM employee_tree;



WITH RECURSIVE employee_hierarchy AS(
	SELECT employee_id,first_name,last_name,manager_id, 1 AS LEVEL
	FROM employees 
	WHERE manager_id IS NULL
	UNION ALL

	SELECT e.employee_id,e.first_name,e.last_name,e.manager_id,eh.LEVEL + 1
	FROM employees e
	INNER JOIN employee_hierarchy eh ON e.manager_id = eh.employee_id
	
)
SELECT * FROM employee_hierarchy
ORDER BY LEVEL, first_name;
 


--another one
WITH RECURSIVE manager_chain AS(
	--BASE 
	SELECT employee_id,first_name,manager_id,
	CAST(first_name AS VARCHAR) AS CHAIN,
	1 AS depth
	FROM employees
	WHERE manager_id IS NULL
	
	UNION ALL
	--RECURSIVE
	SELECT e.employee_id,e.first_name,e.manager_id,
	mc.chain || '-> ' || e.first_name,
	mc.depth + 1
	FROM employees e
	INNER JOIN manager_chain mc ON e.manager_id = mc.employee_id
)
SELECT employee_id,first_name,CHAIN,depth
FROM manager_chain
ORDER BY depth,first_name;


SELECT * FROM employees;

/*

CTE (keyword - WITH): "Create a temporary table and use it once.

Recursive CTE (keyword - WITH RECURSIVE): "Create a temporary table and 
keep adding to it by referring to itself until there's nothing left to add."

*/ 


--Window function

-- 17. Rank employees by salary.

SELECT first_name,employee_id,salary,
RANK() OVER( ORDER BY salary DESC) AS Salary_rank FROM employees;
