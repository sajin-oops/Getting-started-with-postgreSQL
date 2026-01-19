SELECT * FROM employee;

-- IS NULL  &  IS NOT NULL
SELECT name,salary
FROM employee
WHERE salary IS NOT NULL;

SELECT name,salary 
FROM employee
WHERE salary IS NULL;


-- COALESCE

SELECT name,
COALESCE(salary,0)AS salary
FROM employee;

SELECT name,
COALESCE(salary,0) + 5000 AS updated_salary
FROM  employee;


