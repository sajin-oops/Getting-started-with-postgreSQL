CREATE TABLE sales (
    region     text,
    sale_date  date,
    amount     numeric
);

INSERT INTO sales (region, sale_date, amount) VALUES
    ('east', '2026-01-03', 120),
    ('east', '2026-01-09', 80),
    ('east', '2026-01-15', 80),
    ('east', '2026-01-22', 150),
    ('west', '2026-01-05', 200),
    ('west', '2026-01-11', 60),
    ('west', '2026-01-18', 60);

INSERT INTO sales(region,sale_date,amount) VALUES
('west','2026-01-18',34);


-- Let's Play
SELECT * FROM sales;

--Window Functions
-- RANK()
SELECT region,sale_date,amount,
RANK() OVER (PARTITION BY region ORDER BY sale_date)
FROM sales;


SELECT region,sale_date,amount,
RANK() OVER(PARTITION BY region ORDER BY amount)
FROM sales;


-- ROW_NUMBER()
SELECT region,sale_date,amount,
ROW_NUMBER() OVER (PARTITION BY region ORDER BY sale_date)
FROM sales;

--SUM()
SELECT region,sale_date,amount,
SUM(amount) OVER (PARTITION BY region ORDER BY sale_date)
FROM sales;


-- AVG()
SELECT region,sale_date,amount,
AVG(amount) OVER (PARTITION BY region ORDER BY sale_date)
FROM sales;



-- DENSE_RANK()
SELECT region,sale_date,amount,
DENSE_RANK() OVER(PARTITION BY region ORDER BY amount DESC)
FROM sales;


SELECT region,sale_date,amount,
RANK() OVER(PARTITION BY region ORDER BY amount DESC),
DENSE_RANK() OVER(PARTITION BY region ORDER BY amount DESC)     
FROM sales;














SELECT * FROM sales;


SELECT region,sale_date,amount,
RANK() OVER(PARTITION BY region)
FROM sales;


SELECT region,sale_date,amount,
RANK() OVER(PARTITION BY region ORDER BY amount DESC)
FROM sales;

SELECT region,sale_date,amount,
RANK() OVER(PARTITION BY region ORDER BY amount ASC)
FROM sales;



SELECT region,sale_date,amount,
DENSE_RANK() OVER(PARTITION BY region ORDER BY amount ASC)
FROM sales;


SELECT region,sale_date,amount,
AVG(amount)OVER(PARTITION BY region ORDER BY sale_date DESC)
FROM sales;


SELECT region,sale_date,amount,
AVG(amount)OVER(PARTITION BY region ORDER BY amount DESC)
FROM sales;


SELECT region,sale_date,amount,
SUM(amount)OVER(PARTITION BY region ORDER BY sale_date DESC)
FROM sales;


SELECT region,sale_date,amount,
	RANK() OVER(PARTITION BY region ORDER BY amount),
	RANK() OVER( ORDER BY amount)
FROM sales;



SELECT region,sale_date,amount,
	RANK() OVER(PARTITION BY region ORDER BY amount)
FROM sales;



SELECT region,sale_date,amount,
	RANK() OVER(ORDER BY amount)
FROM sales;


SELECT * FROM sales;




SELECT region,sale_date,amount,
	RANK() OVER(PARTITION BY region ORDER BY amount),
	RANK() OVER( ORDER BY amount)
	
FROM sales
ORDER BY region,amount;


--Better one always try to add ORDER BY ALSO IN THE end 
SELECT region, sale_date, amount,
       RANK() OVER (PARTITION BY region ORDER BY amount) AS rank_per_region,
       RANK() OVER (ORDER BY amount) AS rank_overall
FROM sales
ORDER BY region, amount;








