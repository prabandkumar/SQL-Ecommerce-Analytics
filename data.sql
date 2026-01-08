-- Customers
INSERT INTO customers VALUES
(1, 'Amit Sharma', 'amit@gmail.com', '2024-01-05'),
(2, 'Riya Verma', 'riya@gmail.com', '2024-01-10'),
(3, 'Karan Mehta', 'karan@gmail.com', '2024-01-15'),
(4, 'Sneha Iyer', 'sneha@gmail.com', '2024-02-01'),
(5, 'Rahul Singh', 'rahul@gmail.com', '2024-02-10'),
(6, 'Ananya Rao', 'ananya@gmail.com', '2024-02-20'),
(7, 'Vikas Gupta', 'vikas@gmail.com', '2024-03-01'),
(8, 'Neha Kapoor', 'neha@gmail.com', '2024-03-05');

-- Products
INSERT INTO products VALUES
(1, 'Wireless Mouse', 799.00),
(2, 'Mechanical Keyboard', 2499.00),
(3, 'USB-C Charger', 999.00),
(4, 'Laptop Stand', 1499.00),
(5, 'Bluetooth Headphones', 2999.00),
(6, 'Webcam HD', 1999.00);

-- Orders
INSERT INTO orders VALUES
(101, 1, '2024-02-01'),
(102, 2, '2024-02-03'),
(103, 1, '2024-02-10'),
(104, 3, '2024-02-12'),
(105, 5, '2024-02-15'),
(106, 6, '2024-03-01'),
(107, 2, '2024-03-05');

-- Order Items
INSERT INTO order_items VALUES
(1, 101, 1, 1),
(2, 101, 3, 2),
(3, 102, 2, 1),
(4, 103, 5, 1),
(5, 104, 4, 1),
(6, 105, 1, 2),
(7, 106, 6, 1),
(8, 107, 2, 1),
(9, 107, 3, 1);
