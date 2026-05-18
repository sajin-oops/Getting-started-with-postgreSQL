CREATE TABLE employ(
id SERIAL PRIMARY KEY,
name VARCHAR(100),
department VARCHAR(50),
salary NUMERIC(10,2),
hire_date DATE
);


--inserting data
INSERT INTO employ(name,department,salary,hire_date)
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


SELECT * FROM employ;

SELECT name,department,salary,
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) as row_num
FROM employ;

--Assigning ranks
SELECT name,department,salary,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) as rank
FROM employ;

SELECT name,department,salary,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) as rank
FROM employ;

SELECT 
id,name,department,salary,hire_date,ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS row_num FROM employ;



SELECT 
id,name,department,salary,hire_date,ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num FROM employ;

--Assigning row numbers 
SELECT id,name,department, ROW_NUMBER() OVER(ORDER BY id) AS Number_Of_Rows FROM employ;

SELECT ROW_NUMBER() OVER(ORDER BY id DESC) AS Number_Of_Rows,id,name,department FROM employ;

SELECT * FROM employ;

SELECT name,department,salary,SUM(salary) OVER (PARTITION BY department) AS dept_total
FROM employ;

SELECT name,department,salary,
SUM(salary) OVER (PARTITION BY department) AS dept_total,
ROUND(AVG(salary) OVER (PARTITION BY department),1) AS dept_avg
FROM employ;

SELECT name,department,salary,MAX(salary) OVER(PARTITION BY department) AS dept_max FROM employ;

SELECT name,department,salary,MAX(salary) OVER(PARTITION BY department) AS dept_max,
MIN(salary) OVER(PARTITION BY department) AS dept_min
FROM employ;


SELECT * FROM employ;

SELECT name,department,salary,COUNT(*) OVER(PARTITION BY department)AS no_of_depts FROM employ;

--Running total of salary as employees were hired over time

SELECT name,hire_date,salary,SUM(salary) 
OVER(ORDER BY hire_date) AS running_salary_total
FROM employ;

SELECT name,hire_date,salary,SUM(salary) 
OVER(ORDER BY hire_date) AS running_salary_total,
COUNT(*) OVER(ORDER BY hire_date) AS employees_hired_so_far
FROM employ ORDER BY hire_date;


--Ranking functions
SELECT name,department,salary,ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank,
DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dense_rank
FROM employ;


-- top earner by department wise..
SELECT name,department,salary,FIRST_VALUE(name) OVER(PARTITION BY department ORDER BY salary DESC) AS top_earner
FROM employ;