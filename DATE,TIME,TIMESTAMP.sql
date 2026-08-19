-- DATE,TIME,TIMESTAMP

CREATE TABLE a(
	id INT,
	name VARCHAR(50),
	joining_date DATE
);

-- DATE
INSERT INTO a VALUES
(1,'Arun','2025-06-10'),
(2,'Rahul','2026-01-15'),
(3,'Priya','2026-08-19');

SELECT * FROM a;

CREATE TABLE schedule(
	id INT,
	meeting_time TIME
);

-- TIME
INSERT INTO schedule VALUES
(1,'09:30:00'),
(2,'14:45:00'),
(3,'18:00:00');

SELECT * FROM schedule;

-- TIMESTAMP
CREATE TABLE orders(
	order_id INT,
	order_date TIMESTAMP
);

INSERT INTO orders VALUES
(1,'2026-08-19 10:30:00'),
(2,'2026-08-19 14:45:00'),
(3,'2026-08-20 09:15:00');

SELECT * FROM orders;