--Learning Date & Time arithmetic

CREATE TABLE project_tasks(
task_id SERIAL PRIMARY KEY,
task_name TEXT,
start_time TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
planned_duration INTERVAL,
actual_end_time TIMESTAMP WITH TIME ZONE
);

SELECT * FROM project_tasks;

INSERT INTO project_tasks
(task_name,start_time,planned_duration,actual) 



--Calculationg the deadlines
SELECT task_name,start_time,planned_duration,
(start_time+planned_duration) AS expected_deadline
FROM project_tasks;

--Here time overrun
 
SELECT 
task_name,actual_end_time - (start_time + planned_duration)
AS time_overrun
FROM project_tasks;

SELECT 
task_name,actual_end_time - (start_time + planned_duration)
AS time_overrun
FROM project_tasks
WHERE actual_end_time IS NOT NULL;

--Using AGE()
--AGE() is a specialized function used to calculate the human readable difference between two timestamps
SELECT
task_name,AGE(actual_end_time,start_time) AS total_time_taken
FROM project_tasks
WHERE actual_end_time IS NOT NULL;



SELECT
task_name,AGE(actual_end_time,start_time) AS total_time_taken
FROM project_tasks;


-- Filtering with date arithmetic

SELECT * FROM project_tasks;


SELECT task_name,start_time
FROM project_tasks
WHERE start_time < NOW() - INTERVAL '10 days';

SELECT task_name,start_time
FROM project_tasks
WHERE start_time < NOW() - INTERVAL '14 days';


-- Current date & time 
-- adding and subtracting days,months,years
SELECT CURRENT_DATE;

SELECT CURRENT_TIME;

SELECT NOW();

SELECT CURRENT_DATE + INTERVAL '5 days';

SELECT CURRENT_DATE - INTERVAL '2 days';

SELECT NOW() - INTERVAL '1 days'

SELECT NOW() + INTERVAL '1 month';

SELECT NOW() + INTERVAL '1 year';

SELECT NOW();

SELECT NOW() - INTERVAL '10 years';

SELECT NOW() - INTERVAL '10 year';

SELECT NOW() - INTERVAL '30 minutes';

--Date difference
SELECT CURRENT_DATE - DATE '2026-01-01';

-- Using AGE()
SELECT AGE(CURRENT_DATE, DATE '2000-05-15');

--Finding my birthday :)
SELECT AGE(CURRENT_DATE, DATE '2003-01-21') AS Sajin_Age;

--EXTRACT Parts from date/time

SELECT
EXTRACT(YEAR FROM NOW()) AS year,
EXTRACT(MONTH FROM NOW()) AS month,
EXTRACT(MONTH FROM NOW()) AS day,
EXTRACT(HOUR FROM NOW()) AS hour;


SELECT NOW();

SELECT EXTRACT (YEAR FROM NOW()) as year;

--Truncate date/time

SELECT DATE_TRUNC('day',NOW());

SELECT DATE_TRUNC('month',NOW());
SELECT DATE_TRUNC('year',NOW());

SELECT NOW()::DATE;
SELECT NOW()DATE;
SELECT NOW();

SELECT CURRENT_DATE::TIMESTAMP;
SELECT CURRENT_DATE;

SELECT NOW() AT TIME ZONE 'UTC';
SELECT NOW() AT TIME ZONE 'Asia/Kolkata';