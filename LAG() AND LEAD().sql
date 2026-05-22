CREATE TABLE expenses(
month VARCHAR(50),
revenue INT
);

ALTER TABLE expenses 
ADD COLUMN Dept VARCHAR(30);

INSERT INTO expenses VALUES
('Jan',100,'Eng'),
('Feb',120,'Eng'),
('Mar',90,'Mkt'),
('Apr',110,'Eng'),
('May',130,'Mkt'),
('Jun',100,'Mkt');


SELECT * FROM expenses;
--AVG() AND SUM() 
SELECT month,revenue,
	SUM(revenue) OVER(ORDER BY month),
	SUM(revenue) OVER(PARTITION BY dept ORDER BY month),
	AVG(revenue) OVER()
FROM expenses;


SELECT month,revenue,
	SUM(revenue) OVER(ORDER BY month DESC),
	SUM(revenue) OVER(PARTITION BY dept ORDER BY month DESC),
	AVG(revenue) OVER()
FROM expenses;


--LAG()  AND LEAD() 

SELECT month,revenue,
	LAG(revenue,1) OVER(ORDER BY month) AS previous_month,
	LEAD(revenue,1) OVER(ORDER BY month) AS next_month,
	revenue - LAG(revenue) OVER(ORDER BY month) AS month_over_month_change
FROM expenses;


SELECT month,revenue,
	LAG(revenue,1) OVER() AS previous_month,
	LEAD(revenue,1) OVER() AS next_month,
	revenue - LAG(revenue) OVER(ORDER BY month) AS month_over_month_change
FROM expenses;

SELECT month,revenue,
	LAG(revenue,2) OVER() AS Previous_2_months
FROM expenses;

SELECT month,revenue,
	LAG(revenue,1,0) OVER(ORDER BY month) AS previous_month,
	LEAD(revenue,1,0) OVER(ORDER BY month) AS next_month,
	revenue - LAG(revenue) OVER(ORDER BY month) AS month_over_month_change
FROM expenses;
