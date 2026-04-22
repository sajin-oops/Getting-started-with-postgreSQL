CREATE TABLE a_employee(
id SERIAL,
name VARCHAR(50),
department_id INT
);

SELECT * FROM a_employee;

INSERT INTO a_employee(name,department_id)
VALUES
('Alice',10),
('BOb',20),
('Carol',30),
('Dave',NULL);

SELECT * FROM a_employee;

CREATE TABLE a_departments(
id INT,
name VARCHAR(50)
);

-- DROP TABLE a_departments;

SELECT * FROM a_departments;

INSERT INTO a_departments(id,name)
VALUES
(10,'Engineering'),
(20,'Marketing'),
(40,'Finance');


SELECT * FROM a_departments;

--INNER JOIN
SELECT e.name,d.name 
FROM a_employee e
INNER JOIN a_departments d ON e.department_id = d.id;


SELECT e.name,d.name AS department
FROM a_employee e
INNER JOIN a_departments d ON e.department_id = d.id;

