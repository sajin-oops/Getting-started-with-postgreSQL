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

Subqueries
12. Employee with highest salary.
13. Employees earning above average salary.
14. Departments having more than 2 employees.

CTEs
15. Create a CTE for high-salary employees.
16. Recursive CTE for employee-manager hierarchy.

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


