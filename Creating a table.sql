CREATE TABLE categories(
category_id SERIAL PRIMARY KEY,
name varchar(100)
)

CREATE TABLE products(
product_id SERIAL PRIMARY KEY,
name VARCHAR(100),
price DECIMAL(10,2),
description VARCHAR(255),
tags VARCHAR(244),
category_id INT,
FOREIGN KEY(category_id) REFERENCES categories(category_id),
supplier VARCHAR(100)
);

CREATE TABLE customer(
customer_id SERIAL PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
email varchar(100) NOT NULL,
phone_number VARCHAR(30),
city VARCHAR(233)

);

CREATE TABLE orders(
order_id SERIAL PRIMARY KEY,
customer_id INT,
product_id INT,
total_quantity INT,
total_amount DECIMAL,
order_rating DECIMAL,
length DECIMAL,
width DECIMAL,
order_timestamp TIMESTAMP,
delivery_timestamp TIMESTAMP,
FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
FOREIGN KEY(product_id) REFERENCES products(product_id)
);


INSERT INTO categories (name) VALUES ('Electronics'),('clothing'),('home and kitchen')

--for the second one
INSERT INTO products(name,price,description,tags,category_id,supplier)VALUES
('Laptop',1000.3,'gaming laptop powered','electronics,tech',1,'supplierA'),
('tablet',300.3,'gaming  powered','electronics',2,'supplierB')

INSERT INTO customer(customer_name,email,phone_number,city)VALUES
('sajin','sajin22@gmail.com',993322332,'chennai')

INSERT INTO orders (customer_id,product_id,total_quantity,total_amount,order_rating,length,width,order_timestamp,delivery_timestamp)VALUES
(1,1,4,100.22,3.3,3.3,2.2,'2023-01-22 10:20:00','2023-01-22 15:45:00'),
(2,1,4,100.22,3.3,3.3,2.2,'2023-01-22 10:20:00','2023-01-22 15:45:00')