-- id	first_name	last_name	age	sex	employee_title	department	salary	target	bonus	email	city	address	manager_id

CREATE TABLE no(
id INT,
first_name TEXT,
salary INT,
department TEXT
);

INSERT INTO no(id,first_name,salary,department)
VALUES
(1,'Sky',10,'HR'),
(2,'Dasy','10','HR'),
(3,'Queen','23','Engineering');

SELECT * FROM no;

--lets try partition by

SELECT first_name,salary,department,AVG(salary) OVER(PARTITION BY department) AS Average_salary FROM no;

INSERT INTO no(id,first_name,salary,department)
VALUES(4,'Ice',12,'HR');


SELECT first_name,salary,department,AVG(salary) OVER(PARTITION BY department) AS Average_salary FROM no;
