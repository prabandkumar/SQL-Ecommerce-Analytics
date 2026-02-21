-- Top 3 selling products
SELECT
    product_id,
    product_name,
    total_quantity
FROM (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity) AS total_quantity,
        RANK() OVER (ORDER BY SUM(oi.quantity) DESC) AS rank_no
    FROM products p
    JOIN order_items oi
    ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name
) ranked_products
WHERE rank_no <= 3;

-- Revenue per customer
WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.name,
        SUM(p.price * oi.quantity) AS revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.name
)
SELECT *
FROM customer_revenue
ORDER BY revenue DESC;

-- Customer ranking by spend
SELECT
    customer_id,
    name,
    revenue,
    RANK() OVER (ORDER BY revenue DESC) AS customer_rank
FROM (
    SELECT
        c.customer_id,
        c.name,
        SUM(p.price * oi.quantity) AS revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.name )t;
    
    -- Monthly revenue trend
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(p.price * oi.quantity) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month;