-- ================================================
-- SWIGGY SQL ANALYSIS
-- Data Analyst: Ravalika
-- GitHub: github.com/ravalikaworld
-- ================================================

-- Create Database
CREATE DATABASE swiggy;
USE swiggy;

-- Create Orders Table
CREATE TABLE orders (
    order_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    food_item VARCHAR(50),
    amount INT,
    status VARCHAR(20)
);

-- Insert Data
INSERT INTO orders VALUES
(1,'Ananya','Hyderabad','Biryani',250,'Delivered'),
(2,'Vikram','Mumbai','Pizza',450,'Delivered'),
(3,'Divya','Hyderabad','Dosa',120,'Cancelled'),
(4,'Rahul','Delhi','Burger',200,'Delivered'),
(5,'Sneha','Hyderabad','Biryani',350,'Delivered'),
(6,'Arjun','Mumbai','Pasta',280,'Delivered');

-- Query 1: All orders
SELECT * FROM orders;

-- Query 2: Only Hyderabad orders
SELECT * FROM orders
WHERE city = 'Hyderabad';

-- Query 3: Total amount per city
SELECT city, SUM(amount) as total_revenue
FROM orders
GROUP BY city
ORDER BY total_revenue DESC;

-- Query 4: Above average orders
SELECT customer_name, amount
FROM orders
WHERE amount > (
    SELECT AVG(amount) FROM orders
);

-- Query 5: Rank customers by amount
SELECT customer_name, amount,
RANK() OVER (ORDER BY amount DESC)
as ranking
FROM orders;

-- Query 6: CTE - High value orders
WITH high_value_orders AS (
    SELECT * FROM orders
    WHERE amount > 300
)
SELECT * FROM high_value_orders;
