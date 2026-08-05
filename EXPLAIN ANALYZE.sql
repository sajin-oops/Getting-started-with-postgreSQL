-- Create table
CREATE TABLE workers (
    emp_id      SERIAL PRIMARY KEY,
    emp_name    VARCHAR(50),
    department  VARCHAR(50),
    salary      NUMERIC(10,2),
    manager_id  INT,
    hire_date   DATE
);

-- Insert sample data
INSERT INTO workers (emp_name, department, salary, manager_id, hire_date) VALUES
('Arjun',   'Engineering', 75000, NULL, '2019-03-15'),
('Priya',   'Engineering', 68000, 1,    '2020-06-01'),
('Kiran',   'Engineering', 62000, 1,    '2021-01-20'),
('Divya',   'Sales',       55000, NULL, '2018-11-05'),
('Rahul',   'Sales',       48000, 4,    '2021-09-10'),
('Meena',   'Sales',       52000, 4,    '2022-02-14'),
('Sanjay',  'HR',          60000, NULL, '2017-07-19'),
('Anita',   'HR',          45000, 7,    '2020-12-01'),
('Vikram',  'Engineering', 90000, 1,    '2016-04-22'),
('Lakshmi', 'Sales',       58000, 4,    '2019-08-30');


SELECT * FROM workers;


INSERT INTO workers(emp_name,department,salary,manager_id,hire_date) VALUES
('Naveen', 'Engineering', 40000, 2, '2023-04-01'),
('Sneha',  'Engineering', 38000, 2, '2023-05-15'),  
('Ravi',   'Engineering', 35000, 9, '2023-06-01');



--Indexing
/*

					What is an Index?
Think of a book.
Without an index → You read every page to find "Chapter 15".
With an index → You jump directly to the correct page.
PostgreSQL indexes work exactly like that.
Without an index, PostgreSQL usually performs a Sequential Scan.

*/
SELECT * FROM workers;



EXPLAIN  
SELECT * FROM workers
WHERE department = 'engineering';

-- O/P

-- "Seq Scan on workers  (cost=0.00..13.38 rows=1 width=264)"
-- "  Filter: ((department)::text = 'engineering'::text)"
/*

What "EXPLAIN" does ?
PostgreSQL does not execute the query.
Instead, it tells you:
"Here's how I plan to execute this query."

*/


EXPLAIN ANALYZE
SELECT * FROM workers
WHERE department = 'engineering';

-- What "ANALYZE" adds ?
-- PostgreSQL actually runs the query and then reports:
-- The execution plan it used.
-- How long it actually took.
-- How many rows it processed.
-- Whether its estimates were accurate.


CREATE INDEX idx_workers_department
ON workers(department);


EXPLAIN ANALYZE
SELECT * FROM workers
WHERE department = 'engineering';


SELECT * FROM workers WHERE salary > 70000;

CREATE INDEX idx_salary
ON workers(salary);


EXPLAIN ANALYZE
SELECT * FROM workers
WHERE salary > 70000;

