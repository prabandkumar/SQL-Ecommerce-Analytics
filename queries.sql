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

