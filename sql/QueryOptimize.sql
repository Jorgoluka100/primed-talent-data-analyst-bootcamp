-- Stores customer-level information
CREATE TABLE Customers2 (
    customer_id INTEGER PRIMARY KEY,   -- Unique ID for each customer
    customer_name TEXT NOT NULL         -- Customer full name
);
-- Stores order-level information
CREATE TABLE Orders2 (
    order_id INTEGER PRIMARY KEY,       -- Unique ID for each order
    customer_id INTEGER,                -- Customer who placed the order
    order_date TEXT,                    -- Date of order
    order_status TEXT,                  -- Status: Completed, Cancelled, etc.
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
-- Stores individual items inside an order
CREATE TABLE OrderItems2 (
    order_item_id INTEGER PRIMARY KEY,  -- Unique ID for order item
    order_id INTEGER,                   -- Order to which item belongs
    quantity INTEGER,                   -- Number of units purchased
    price REAL,                         -- Price per unit
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
INSERT INTO Customers2 (customer_name) VALUES
('Alice'),
('Bob'),
('Charlie'),
('Diana');
INSERT INTO Orders2 (customer_id, order_date, order_status) VALUES
(1, '2024-01-01', 'Completed'),
(1, '2024-01-10', 'Completed'),
(2, '2024-01-05', 'Completed'),
(3, '2024-01-08', 'Cancelled'),
(4, '2024-01-15', 'Completed');
INSERT INTO OrderItems2 (order_id, quantity, price) VALUES
(1, 2, 100),
(1, 1, 50),
(2, 3, 200),
(3, 1, 500),
(4, 5, 100),
(5, 2, 300);
 
---Retrieve top 3 customers by total spending on completed orders
SELECT c.customer_name, SUM(oi.quantity * oi.price) AS total_spent
FROM Customers2 c
JOIN Orders2 o ON c.customer_id = o.customer_id
JOIN OrderItems2 oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 3;
 
