-- Create a table to store product information
CREATE TABLE products_1 (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    price REAL
); 
-- Create a table to store order information
CREATE TABLE orders_1 (
    order_id INTEGER PRIMARY KEY,
    product_id INTEGER,
    quantity INTEGER,
    total_price REAL,
    order_date TEXT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
); 
-- Insert sample products
INSERT INTO products_1 VALUES (1, 'Laptop', 50000);
INSERT INTO products_1 VALUES (2, 'Mouse', 500);
 
-- Insert sample orders
-- date('now') means today
-- '-3 days' and '-10 days' simulate recent vs older orders 
INSERT INTO orders_1 VALUES (
    1, 1, 1, 50000, date('now', '-3 days')
);
 
INSERT INTO orders_1 VALUES (
    2, 2, 2, 1000, date('now', '-10 days')
);
select * from products_1;
select * from orders_1;

SELECT SUM(total_price) as total_revenue
FROM orders_1
WHERE order_date >= date('now', '-7 days'); 