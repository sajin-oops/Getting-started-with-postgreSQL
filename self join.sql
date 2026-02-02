CREATE TABLE employes(
emp_id INT,
emp_name VARCHAR(50),
manager_id INT
);

SELECT * FROM employes;

INSERT INTO employes VALUES
(1,'Sajin',NULL),
(2,'Sky',1),
(3,'Snow',1),
(4,'White',2),
(5,'Ice',2); 

SELECT * FROM employes;

--self join

SELECT 
e.emp_name AS employee,
m.emp_name AS manager
FROM employes e
LEFT JOIN employes m
ON e.manager_id = m.emp_id;