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


SELECT task_name,start_time,planned_duration,
(start_time+planned_duration) AS expected_deadline
FROM project_tasks;