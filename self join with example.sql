CREATE TABLE employ(
emp_id SERIAL PRIMARY KEY,
name VARCHAR(50),
department VARCHAR(50),
salary NUMERIC(10,2),
joining_date DATE,
email VARCHAR(100)
);

SELECT * FROM employ;

INSERT INTO employ(name,department,salary,joining_date,email)
VALUES
('Sajin','IT',60000,'2023-01-15','sajin@company.com'),
('Arun','HR',45000,'2022-03-10',NULL),
('Meena','Finance',70000,'2021-07-01','meena@company.com'),
('Rahul', 'IT', 50000, '2023-06-20', 'rahul@company.com'),
('Anu', 'HR', NULL, '2024-02-01', NULL),
('kumar', 'IT', 55000, '2020-11-11', 'kumar@company.com');

--SELECT 
SELECT * FROM employ;

SELECT name,department,salary FROM employ;

--DISTINCT
SELECT DISTINCT department FROM employ;

--WHERE 
SELECT * FROM employ
WHERE department = 'Finance';

SELECT * FROM employ
WHERE department = 'IT';

--IN
SELECT * FROM employ
WHERE department IN('IT','HR');

SELECT * FROM employ
WHERE department IN('IT','Finance');

--BETWEEN
SELECT * FROM employ
WHERE joining_date BETWEEN '2022-01-01' AND '2023-12-31';

SELECT * FROM employ 
WHERE salary BETWEEN 50000 AND 55000;

--LIKE
SELECT * FROM employ
WHERE name LIKE 'A%';

SELECT * FROM employ  
WHERE name LIKE 'a%'; --Not works due to case sensitive

SELECT * FROM employ
WHERE email LIKE '%company%';

--ILIKE
SELECT * FROM employ
WHERE name ILIKE 'k%';

SELECT * FROM employ
WHERE name ILIKE 'K%';

--ORDER BY
SELECT * FROM employ  --Default will be small value to larger value 
ORDER BY salary;

SELECT * FROM employ
ORDER BY salary DESC;

--LIMIT & OFFSET
SELECT * FROM employ
ORDER BY salary DESC LIMIT 3; -- First 3 output only

--LIMIT & OFFSET
SELECT * FROM employ
ORDER BY salary DESC LIMIT 3 OFFSET 2;  --offset will skip first 2 and then the LIMIT will give first 3

--NULL
SELECT * FROM employ 
WHERE SALARY IS NULL;

SELECT * FROM employ
WHERE email IS NULL;

--COALESCE
SELECT name, COALESCE(salary,0) AS salary --will replace the null
FROM employ;

SELECT name,COALESCE(email,'Not Provided') AS email
FROM  employ;

--TYPE CASTING
SELECT name, CAST(salary AS INTEGER) AS salary_int --Change the datatype
FROM employ;

SELECT name,salary::INTEGER 
FROM employ;

--DATE & TIME ARITHMETIC
SELECT CURRENT_DATE;

SELECT name,CURRENT_DATE - joining_date AS days_worked
FROM employ;

SELECT name,joining_date + INTERVAL '30 days' AS probation_end
FROM employ;

SELECT name,
EXTRACT(YEAR FROM AGE(CURRENT_DATE,joining_date))
AS experience_years
FROM employ;


-- TRYING ALL KEY WORDS 
SELECT DISTINCT name,
COALESCE(salary,0) AS salary,department
FROM employ  
WHERE department IN('IT','HR')
AND joining_date BETWEEN '2022-01-01' AND CURRENT_DATE
ORDER BY salary DESC
LIMIT 3 OFFSET 1;


--self join 
SELECT e1.name AS employee_1,
e2.name AS employee_2,
e1.department
FROM employ e1
INNER JOIN employ e2 ON e1.department = e2.department
WHERE e1.emp_id <> e2.emp_id;



SELECT * FROM  employ;
