CREATE DATABASE ecommerce_db;
USE ecommerce_db;
SHOW DATABASES;
USE ecommerce_db;
SELECT * FROM customers LIMIT 10;
select * from orders limit 10;
select * from order_items limit 10;
select * from products limit 10;
select * from payments limit 10;
select * from sellers limit 10;
select * from reviews limit 10;

-- NULL check
SELECT COUNT(*) 
FROM orders
WHERE order_delivered_customer_date IS NULL;

-- Duplicates check
SELECT order_id, COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Invalid values
SELECT *
FROM payments
WHERE payment_value <= 0;


SELECT COUNT(order_id) AS total_orders
FROM orders;
SELECT ROUND(SUM(payment_value),2) AS total_revenue
FROM payments;
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM customers;
SELECT 
o.order_id,
SUM(p.payment_value) AS order_revenue
FROM orders o
JOIN payments p 
ON o.order_id = p.order_id
GROUP BY o.order_id
LIMIT 10;
SELECT 
o.customer_id,
ROUND(SUM(p.payment_value),2) AS total_spent
FROM orders o
JOIN payments p 
ON o.order_id = p.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
LIMIT 10;
SELECT 
DATE_FORMAT(order_purchase_timestamp,'%Y-%m') AS month,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

SELECT 
oi.product_id,
COUNT(oi.order_id) AS total_orders
FROM order_items oi
GROUP BY oi.product_id
ORDER BY total_orders DESC
LIMIT 10;

SELECT 
oi.product_id,
ROUND(SUM(oi.price),2) AS total_revenue
FROM order_items oi
GROUP BY oi.product_id
ORDER BY total_revenue DESC
LIMIT 10;

SELECT 
p.product_category_name,
ROUND(SUM(oi.price),2) AS revenue
FROM order_items oi
JOIN products p 
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 10;

SELECT 
ROUND(AVG(review_score),2) AS avg_rating
FROM reviews;

SELECT 
r.review_score,
COUNT(o.order_id) AS total_orders
FROM reviews r
JOIN orders o 
ON r.order_id = o.order_id
GROUP BY r.review_score
ORDER BY r.review_score DESC;

SELECT 
o.customer_id,
ROUND(SUM(p.payment_value),2) AS lifetime_value
FROM orders o
JOIN payments p 
ON o.order_id = p.order_id
GROUP BY o.customer_id
ORDER BY lifetime_value DESC
LIMIT 10;

SELECT 
customer_id,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1
ORDER BY total_orders DESC;

SELECT 
ROUND(SUM(payment_value) / COUNT(DISTINCT order_id),2) AS avg_order_value
FROM payments;

SELECT 
DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS month,
ROUND(SUM(p.payment_value),2) AS revenue
FROM orders o
JOIN payments p 
ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;

SELECT 
customer_id,
SUM(payment_value) AS total_spent,
RANK() OVER (ORDER BY SUM(payment_value) DESC) AS ranking
FROM orders o
JOIN payments p 
ON o.order_id = p.order_id
GROUP BY customer_id;

SELECT 
DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS month,
ROUND(SUM(p.payment_value),2) AS revenue
FROM orders o
JOIN payments p 
ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;

SELECT 
o.customer_id,
ROUND(SUM(p.payment_value),2) AS total_spent
FROM orders o
JOIN payments p 
ON o.order_id = p.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
LIMIT 10;

SELECT 
p.product_category_name,
ROUND(SUM(oi.price),2) AS revenue
FROM order_items oi
JOIN products p 
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC;

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM customers;

SELECT COUNT(order_id) AS total_orders
FROM orders;