
-- ============================================================================
-- PostgreSQL Practice Data Generator
-- ============================================================================
-- Creates two related tables with large synthetic datasets:
--   1. employees            (~100,000 rows) — self-referencing hierarchy
--   2. sales_transactions    (~5,000,000 rows) — fact table for aggregation/
--                                                window function practice
-- ============================================================================

DROP TABLE IF EXISTS sales_transactions;
DROP TABLE IF EXISTS employees;

-- ============================================================================
-- TABLE 1: employees
-- ============================================================================
CREATE TABLE employees (
    employee_id     SERIAL PRIMARY KEY,
    first_name      TEXT NOT NULL,
    last_name       TEXT NOT NULL,
    department      TEXT NOT NULL,
    job_title       TEXT NOT NULL,
    region          TEXT NOT NULL,
    manager_id      INTEGER REFERENCES employees(employee_id),
    hire_date       DATE NOT NULL,
    salary          NUMERIC(10,2) NOT NULL
);

-- Top-level leadership first (no manager)
INSERT INTO employees (first_name, last_name, department, job_title, region, manager_id, hire_date, salary)
SELECT
    (ARRAY['Alex','Priya','Ravi','Meera','John','Divya','Karthik','Sneha','Arun','Lakshmi'])[floor(random()*10+1)],
    (ARRAY['Kumar','Iyer','Reddy','Nair','Sharma','Pillai','Rao','Menon','Singh','Das'])[floor(random()*10+1)],
    'Executive',
    'Chief Officer',
    (ARRAY['South','North','East','West'])[floor(random()*4+1)],
    NULL,
    (CURRENT_DATE - (floor(random()*3650))::int),
    250000 + random()*150000
FROM generate_series(1,5);

-- Rest of the org, each reporting to a random earlier employee (acyclic hierarchy)
INSERT INTO employees (first_name, last_name, department, job_title, region, manager_id, hire_date, salary)
SELECT
    (ARRAY['Alex','Priya','Ravi','Meera','John','Divya','Karthik','Sneha','Arun','Lakshmi',
           'Vikram','Anjali','Suresh','Pooja','Manoj','Deepa','Rahul','Nisha','Vijay','Kavya'])[floor(random()*20+1)],
    (ARRAY['Kumar','Iyer','Reddy','Nair','Sharma','Pillai','Rao','Menon','Singh','Das',
           'Gupta','Nambiar','Krishnan','Varma','Joseph'])[floor(random()*15+1)],
    (ARRAY['Engineering','Sales','Marketing','Finance','HR','Operations','Support','Product'])[floor(random()*8+1)],
    (ARRAY['Analyst','Associate','Senior Analyst','Manager','Team Lead','Consultant','Specialist','Coordinator'])[floor(random()*8+1)],
    (ARRAY['South','North','East','West'])[floor(random()*4+1)],
    (1 + floor(random() * (gs.n - 1)))::int,
    (CURRENT_DATE - (floor(random()*3650))::int),
    35000 + random()*120000
FROM generate_series(6, 100000) AS gs(n);

-- ============================================================================
-- TABLE 2: sales_transactions
-- ============================================================================
CREATE TABLE sales_transactions (
    transaction_id  BIGSERIAL PRIMARY KEY,
    employee_id     INTEGER NOT NULL REFERENCES employees(employee_id),
    customer_id     INTEGER NOT NULL,
    product_category TEXT NOT NULL,
    region          TEXT NOT NULL,
    transaction_date DATE NOT NULL,
    quantity        INTEGER NOT NULL,
    unit_price      NUMERIC(10,2) NOT NULL,
    amount          NUMERIC(12,2) NOT NULL
);

INSERT INTO sales_transactions (employee_id, customer_id, product_category, region, transaction_date, quantity, unit_price, amount)
SELECT
    (1 + floor(random()*100000))::int,
    (1 + floor(random()*20000))::int,
    (ARRAY['Electronics','Groceries','Apparel','Furniture','Books','Toys','Sports','Beauty'])[floor(random()*8+1)],
    (ARRAY['South','North','East','West'])[floor(random()*4+1)],
    (DATE '2020-01-01' + (floor(random()*2100))::int),
    q.qty,
    p.price,
    q.qty * p.price
FROM generate_series(1, 5000000) AS gs
CROSS JOIN LATERAL (SELECT (1 + floor(random()*10))::int AS qty) q
CROSS JOIN LATERAL (SELECT round((5 + random()*495)::numeric, 2) AS price) p;



											--Indexing

SELECT * FROM sales_transactions;

SELECT * FROM employees;

EXPLAIN ANALYZE 
SELECT * FROM employees;


EXPLAIN ANALYZE 
SELECT * FROM sales_transactions;

SELECT * FROM sales_transactions WHERE employee_id = 891;

CREATE INDEX idx_sales_employee_id ON sales_transactions(employee_id);

EXPLAIN ANALYZE
SELECT * FROM sales_transactions WHERE employee_id = 891;

CREATE INDEX idx_sales_employees_id ON sales_transactions(employee_id);
ANALYZE sales_transactions;


EXPLAIN ANALYZE
SELECT * FROM sales_transactions WHERE employee_id = 57; 



-- CTE
WITH high_earners AS(
	SELECT employee_id,first_name,last_name,department,salary
	FROM employees
	WHERE salary > 150000
	
)
SELECT department,COUNT(*) AS num_high_earners,
ROUND(AVG(salary),2) AS avg_salary
FROM high_earners
GROUP BY department
ORDER BY avg_salary DESC;



