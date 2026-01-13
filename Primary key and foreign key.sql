CREATE TABLE friends(
Name varchar(30),
Age int,
Native varchar(30),
Current_Location varchar(30)
);

SELECT * FROM friends;

INSERT INTO friends VALUES
('Sky',23,'Chennai','NewYork'),
('Cloud',24,'Bangalore','Singapore'),
('Walk',26,'Chennai','LosAngel'),
('Jade',28,'NewYork','NewYork');

SELECT * FROM friends;

ALTER TABLE friends
ADD COLUMN id int;

SELECT * FROM friends;

--UPDATE
UPDATE friends
SET id = CASE
WHEN name = 'Sky' THEN 1
WHEN name = 'Cloud' THEN 2
WHEN name = 'Walk' THEN 3
WHEN name = 'Jade' THEN 4
END;

SELECT * FROM friends;

ALTER TABLE friends
ADD PRIMARY KEY (id);

SELECT * FROM friends;

-- Creating a another table for foreignkey
CREATE TABLE businessman(
business_id INT PRIMARY KEY,
friend_id INT,
business_name VARCHAR(50),
FOREIGN KEY (friend_id) REFERENCES friends(id)
);

SELECT * FROM businessman;

INSERT INTO businessman (business_id,friend_id,business_name) VALUES
(1,1,'Tech_Startup'),
(2,2,'Coffee_Shop'),
(3,3,'Trading_Company'),
(4,4,'Cloths_Shop');

INSERT INTO businessman (business_id,friend_id,business_name) VALUES
(5,1,'House Agency');


INSERT INTO businessman (business_id,friend_id,business_name) VALUES
(6,1,'Health Startup'),
(7,2,'Vendor Shop'),
(8,3,'Gaming Company'),
(9,4,'Tea Shop');

SELECT * FROM businessman;

