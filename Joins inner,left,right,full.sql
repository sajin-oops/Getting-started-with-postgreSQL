SELECT * FROM students;

SELECT * FROM courses;

-- INNER JOIN 

SELECT s.name,c.course FROM students s
INNER JOIN courses c ON s.student_id = c.student_id;

--LEFT JOIN 

SELECT s.name,c.course FROM students s
LEFT JOIN courses c ON s.student_id = c.student_id;

--RIGHT JOIN 

SELECT s.name,c.course FROM students s
RIGHT JOIN courses c ON s.student_id = c.student_id;

--FULL JOIN 
SELECT s.name,c.course FROM students s
FULL JOIN courses c ON s.student_id = c.student_id;