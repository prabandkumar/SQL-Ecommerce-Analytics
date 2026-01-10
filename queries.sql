-- All customers
SELECT * FROM customers;

-- Total orders placed
SELECT COUNT(*) AS total_orders
FROM orders;

-- Total revenue
SELECT 
    SUM(p.price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;

-- Orders per customer
SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- Average order value
SELECT 
    SUM(p.price * oi.quantity) / COUNT(DISTINCT o.order_id) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- Customers with orders
SELECT DISTINCT
    c.customer_id,
    c.name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Customers who never ordered
SELECT
    c.customer_id,
    c.name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Product wise sales
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

-- Product wise revenue
SELECT
    p.product_name,
    SUM(p.price * oi.quantity) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name;

-- Repeat customers
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) > 1;

