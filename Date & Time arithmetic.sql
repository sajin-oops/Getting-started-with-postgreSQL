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
(task_name,start_time,planned_duration,actual_end_time)
VALUES
('Database Design','2026-01-01 09:00:00','3 days','2026-01-04 11:30:00'),
('API Development','2026-01-05 10:00:00','1 week','2026-01-12 15:00:00'),
('Frontend Setup','2026-01-15 08:30:00','4 days','2026-01-18 09:00:00'),
('Security Audit','2026-01-20 13:00:00','2 days',NULL);

SELECT * FROM project_tasks;