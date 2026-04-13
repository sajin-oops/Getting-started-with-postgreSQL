CREATE TABLE emp(
id SERIAL PRIMARY KEY,
name VARCHAR(40),
department VARCHAR(40),
salary NUMERIC(14,2),
hire_date DATE
);

SELECT * FROM emp;

INSERT INTO emp(name,department,salary,hire_date)
VALUES('Sajin','IT',1200000,'2026-04-14');


INSERT INTO emp(name,department,salary,hire_date)
VALUES
('Aaron','Non IT',3000000,'2024-02-11'),
('Lijin','IT',9000000,'2021-01-24');

SELECT * FROM emp;

SELECT name,salary FROM emp;
  
SELECT name,department FROM emp;

