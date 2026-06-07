CREATE TABLE one(
id SERIAL PRIMARY KEY,
name VARCHAR(100),
department VARCHAR(50),
salary NUMERIC(10,2),
hire_date DATE
);


--inserting data
INSERT INTO one(name,department,salary,hire_date)
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



SELECT * FROM one;

-- trying CTE on my own

WITH 
	learn AS(
			SELECT id,name,department FROM one
)
SELECT * FROM learn;



-- Multiple CTE 
WITH two AS(
		SELECT id,department FROM one
),
three AS(
	SELECT name,id FROM one
),
result AS (
	SELECT t.id,t.department,h.name FROM two t
	INNER JOIN three h ON t.id = h.id
)
SELECT * FROM result;

-- SELECT * FROM three;



