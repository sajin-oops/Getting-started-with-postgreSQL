CREATE TABLE students(
student_id INT,
name VARCHAR(50)
);

CREATE TABLE courses(
student_id INT,
course VARCHAR(40)
);

SELECT * FROM students;
SELECT * FROM courses;

INSERT INTO students
VALUES
(1,'Tom🐱'),
(2,'Jerry🐁'),
(3,'Dora🐣');

-- DROP table students;

INSERT INTO courses
VALUES
(1,'Math➕'),
(2,'Science🧬'),
(4,'Art🎨');

SELECT * FROM courses;

--inner join
SELECT s.name,c.course
FROM students s
INNER JOIN courses c
ON s.student_id = c.student_id;

--left join
SELECT s.name,c.course
FROM students s
LEFT JOIN courses c
ON s.student_id = c.student_id;



--right join
SELECT s.name,c.course
FROM students s
RIGHT JOIN courses c
ON s.student_id = c.student_id;


--full join
SELECT s.name,c.course
FROM students s
FULL JOIN courses c
ON s.student_id = c.student_id;


--full join
SELECT s.student_id,s.name,c.course
FROM students s
FULL JOIN courses c
ON s.student_id = c.student_id;
