SELECT * FROM employees;
SELECT * FROM departments;

INSERT INTO departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance'),
(4,'Marketing');

INSERT INTO employees VALUES
(101,'Arun',1,30000),
(102,'Bala',2,45000),
(103,'Charan',2,50000),
(104,'Divy',3,40000),
(105,'Esha',NULL,35000);

SELECT * FROM employees;

-- INNER JOIN
SELECT e.emp_name,d.dept_name 
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

