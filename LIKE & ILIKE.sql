
--LIKE 
-- it is used to find the pattern matching & its case sensitive

SELECT * FROM marks
WHERE subject LIKE 'science'; -- NO OUTPUT DUE TO CASE SENSITIVE

SELECT * FROM marks
WHERE subject LIKE 'Science'; -- YES ITS WORKING

CREATE TABLE learning(
name VARCHAR(40),
age VARCHAR(40),
college VARCHAR(50)
);

SELECT * FROM learning;

INSERT INTO learning (name,age,college)
VALUES
('Sajin',22,'Mcc'),
('Sky',21,'Mcc'),
('Solo',24,'Mcc'),
('Hope',21,'mcc'),
('Faith',23,'mcc'),
('Joy',24,'Loyola'),
('Merry',21,'Loyola'),
('Queen',22,'Alpha'),
('King',24,'Alpha');

SELECT * FROM learning;

SELECT * FROM learning 
WHERE college LIKE 'Mcc';

SELECT * FROM learning
WHERE college LIKE 'mcc';

SELECT * FROM learning
WHERE college LIKE 'Loyola';

SELECT * FROM learning 
WHERE college LIKE 'Alpha';


--ILIKE 
-- it works the same but its not case sensitive

SELECT * FROM marks
WHERE subject ILIKE 'science';

SELECT * FROM learning 
WHERE college ILIKE 'Mcc';

SELECT * FROM learning;
