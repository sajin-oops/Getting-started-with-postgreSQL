SELECT * FROM mark;

SELECT * FROM student;

-- haha
/*
this query is for inner join 

*/

-- inner join
SELECT student.name,mark.score
FROM student
INNER JOIN mark
ON student.id = mark.id;



INSERT INTO student(id,name) 
VALUES 
(5,'Goldy');

SELECT * FROM student;



-- left join

SELECT student.name,mark.score 
FROM student
LEFT JOIN mark
ON student.id = mark.id;


-- SELECT mark.score,student.name
-- FROM mark
-- LEFT JOIN student
-- ON mark.id = student.id;


-- Right join

SELECT student.name,mark.score 
FROM student
RIGHT JOIN mark
ON student.id = mark.id;


--FULL outer join

SELECT student.name,mark.score 
FROM student
FULL OUTER JOIN mark
ON student.id = mark.id;









