SELECT * FROM students;
SELECT * FROM departments;

CREATE TABLE students(
id SERIAL,
name VARCHAR(50),
dept_id INT
);

SELECT * FROM students;

CREATE TABLE departments(
id INT,
dept_name VARCHAR(60)
);

SELECT * FROM students;

INSERT INTO students(name,dept_id)
VALUES
('Sky',10),
('Milo',20),
('Cloudy',NULL);

SELECT * FROM students;

INSERT INTO departments(id,dept_name)
VALUES
(10,'CSE'),
(20,'ECE'),
(30,NULL);

SELECT * FROM departments;

SELECT s.name,d.dept_name
FROM students s
INNER JOIN departments d
ON s.dept_id = d.id
WHERE d.dept_name = 'CSE';

