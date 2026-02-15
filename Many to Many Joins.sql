CREATE TABLE students(
student_id SERIAL PRIMARY KEY,
student_name VARCHAR(100)
)

CREATE TABLE courses(
course_id SERIAL PRIMARY KEY,
course_name VARCHAR(100)
);

CREATE TABLE enrollments(
student_id INT REFERENCES students(student_id),
course_id INT REFERENCES courses(course_id),
PRIMARY KEY (student_id,course_id)
);

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;


INSERT INTO students VALUES
(1,'Sajin'),
(2,'Rahul'),
(3,'Priya');

INSERT INTO courses VALUES
(1,'Python'),
(2,'SQL'),
(3,'Machine Learning');

INSERT INTO enrollments VALUES
(1,1),
(1,2),
(2,2), 
(3,1),
(3,3);

SELECT s.student_name,c.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;