-- SQL Assignment

create database sqlassignment;
use sqlassignment;

/* 1.	Create a table called employees with the following structure:
 •	emp_id (integer, should not be NULL and should be a primary key)
•	emp_name (text, should not be NULL)
•	age (integer, should have a check constraint to ensure the age is at least 18)
•	email (text, should be unique for each employee)
•	salary (decimal, with a default value of 30,000). 
Write the SQL query to create the above table with all constraints. */

CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,            
    emp_name VARCHAR(30) NOT NULL,                        
    age INTEGER CHECK (age >= 18),                  
    email VARCHAR(20) UNIQUE,                              
    salary DECIMAL DEFAULT 30000                    
);

/* 6. You created a products table without constraints as follows:

CREATE TABLE products (

    product_id INT,

    product_name VARCHAR(50),

    price DECIMAL(10, 2));
Now, you realise that?
: The product_id should be a primary keyQ
: The price should have a default value of 50.00 */

CREATE TABLE products (

    product_id INT,

    product_name VARCHAR(50),

    price DECIMAL(10, 2));

ALTER TABLE products
ADD CONSTRAINT pk_prd_id PRIMARY KEY (product_id);

ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.00;

/* 7. You have two tables:
Write a query to fetch the student_name and class_name for each student using an INNER JOIN */

CREATE TABLE students (
    student_id INT PRIMARY KEY,       
    student_name VARCHAR(50) NOT NULL, 
    class_id INT                       
);

INSERT INTO students (student_id, student_name, class_id)
VALUES
    (1, 'Alice', 101),
    (2, 'Bob', 102),
    (3, 'Charlie', 101);
    
CREATE TABLE classes (
    class_id INT PRIMARY KEY,       
    class_name VARCHAR(50) NOT NULL
);
    
INSERT INTO classes (class_id, class_name)
VALUES
    (101, 'Math'),
    (102, 'Science'),
    (103, 'History');

SELECT s.student_name, c.class_name
FROM students s
INNER JOIN classes c
ON s.class_id = c.class_id;

/* 8. Consider the following three tables:
Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are 
listed even if they are not associated with an order 

Hint: (use INNER JOIN and LEFT JOIN) */

CREATE TABLE orders (
    order_id INT PRIMARY KEY,       
    order_date DATE NOT NULL, 
    customer_id INT                       
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,       
    customer_name VARCHAR(40) NOT NULL                       
);

CREATE TABLE product (
    product_id INT PRIMARY KEY,       
    product_name VARCHAR(100) NOT NULL, 
    order_id INT                       
);

INSERT INTO orders (order_id, order_date, customer_id)
VALUES
    (1, '2024-01-01', 101),
    (2, '2024-01-03', 102);
    
INSERT INTO customers (customer_id, customer_name)
VALUES
    (101, 'Alice'),
    (102, 'Bob');
    
INSERT INTO product (product_id, product_name, order_id)
VALUES
    (1, 'Laptop', 1),
    (2, 'Phone', Null);

SELECT o.order_id, c.customer_name, p.product_name
FROM product p
LEFT JOIN orders o ON p.order_id = o.order_id
LEFT JOIN customers c ON o.customer_id = c.customer_id;

/* 9. Given the following tables:
Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function. */

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,       
    product_id INT NOT NULL, 
    amount INT                       
);

INSERT INTO sales (sale_id, product_id, amount)
VALUES
	(1, 101, 500),
    (2, 102, 300),
    (3, 101, 700);
    
CREATE TABLE productss (
    product_id INT PRIMARY KEY,       
    product_name VARCHAR(50) NOT NULL                   
);

INSERT INTO productss (product_id, product_name)
VALUES
	(101, 'Laptop'),
    (102, 'Phone');

SELECT p.product_id, p.product_name, SUM(s.amount) AS total_sales
FROM productss p
INNER JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name;

/* 10. You are given three tables:
Write a query to display the order_id, customer_name, and the quantity of products ordered by each 
customer using an INNER JOIN between all three tables */

CREATE TABLE orderss (
    order_id INT PRIMARY KEY,       
    order_date DATE NOT NULL, 
    customer_id INT                       
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,       
    customer_name VARCHAR(40) NOT NULL                       
);

CREATE TABLE order_details (
    order_id INT NOT NULL,       
    product_id INT NOT NULL, 
    quantity INT                      
);

INSERT INTO orderss (order_id, order_date, customer_id)
VALUES
    (1, '2024-01-02', 1),
    (2, '2024-01-05', 2);
    
INSERT INTO customer (customer_id, customer_name)
VALUES
    (1, 'Alice'),
    (2, 'Bob');

INSERT INTO order_details (order_id, product_id, quantity)
VALUES
    (1, 101, 2),
    (1, 102, 1),
    (2, 101, 3);
    
SELECT o.order_id, c.customer_name, od.quantity
FROM orderss o
INNER JOIN customer c ON o.customer_id = c.customer_id
INNER JOIN order_details od ON o.order_id = od.order_id;








