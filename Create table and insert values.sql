CREATE TABLE employees(
employees_name varchar(50),
designation varchar(100),
salary int,
company int
);

SELECT * FROM employees;

ALTER TABLE employees
ADD COLUMN role varchar(50);

SELECT * FROM employees;

ALTER TABLE employees
ALTER COLUMN company TYPE varchar(60);

SELECT * FROM employees;

INSERT INTO employees VALUES
('Sajin','Data Engineer',1400000,'Google','Team Leader');

SELECT * FROM employees;

INSERT INTO employees VALUES
('Lijin','Data Scientist',2000000,'Google','Team Leader');

INSERT INTO employees VALUES
('Aaron','ML Engineer',2600000,'Google','Team Leader'),
('Abishek','Software Engineer',3000000,'Meta','SDE 1'),
('Aswin','software Engineer','6000000','Meta','SDE 3');

SELECT * FROM employees; 


SELECT SUM(salary) FROM employees;

SELECT AVG(salary) FROM employees;

SELECT COUNT(*) FROM employees;

SELECT MIN(salary) FROM employees;

SELECT MAX(salary) FROM employees;

