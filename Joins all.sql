SELECT * FROM employees;
SELECT * FROM departments;

INSERT INTO departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance'),
(4,'Marketing');

INSERT INTO departments \
(101,'Arun',1,30000),
(102,'Bala',45000),
(103,'C')

--inner join
SELECT e.emp_name,d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

-- left join
SELECT e.emp_name,d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

--right join
SELECT e.emp_name,d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

--full join 
SELECT e.emp_name,d.dept_name
FROM employees e
FULL JOIN departments d
on e.dept_id = d.dept_id;

--cross join
SELECT e.emp_name,d.dept_name
FROM employees e
CROSS JOIN departments d;

