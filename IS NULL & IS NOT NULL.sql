CREATE TABLE employee(
id SERIAL,
name VARCHAR(50),
salary INT
);

SELECT * FROM employee;

INSERT INTO employee (name,salary)
VALUES
('Sky',50000),
('Cloud',NULL),
('Star',45000),
('Queen',NULL);

SELECT * FROM employee;

SELECT name,salary 
FROM employee
WHERE salary IS NULL;


SELECT name,salary 
FROM employee
WHERE salary IS NOT NULL;