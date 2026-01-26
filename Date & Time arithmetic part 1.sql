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