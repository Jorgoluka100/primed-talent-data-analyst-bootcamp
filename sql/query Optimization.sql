CREATE TABLE customers (
    customer_id   SERIAL PRIMARY KEY,
	customer_name VARCHAR(100) NOT NULL,
	region VARCHAR(50)
);
 
CREATE TABLE products (
    product_id   SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category     VARCHAR(50)
);
 
CREATE TABLE orders (
    order_id    SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL REFERENCES customers(customer_id),
	order_date  DATE NOT NULL,
	order_total NUMERIC(12,2),
	status VARCHAR(20) DEFAULT 'Pending'
);
 
CREATE TABLE order_items (
    item_id    SERIAL PRIMARY KEY,
    order_id   INTEGER NOT NULL REFERENCES orders(order_id),
    product_id INTEGER NOT NULL REFERENCES products(product_id),
    quantity   INTEGER NOT NULL DEFAULT 1,
    unit_price NUMERIC(10,2) NOT NULL
);
 
-- Insert 6 customers across different regions
INSERT INTO customers (customer_name, region) VALUES
    ('Acme Corp',       'North'),
    ('Globex Inc',      'South'),
    ('Initech LLC',     'North'),
    ('Umbrella Co',     'West'),
    ('Stark Industries', NULL),       
    ('Wayne Enterprises','East');
 
-- Insert 5 products across different categories
INSERT INTO products (product_name, category) VALUES
    ('Laptop Pro 15',    'Electronics'),
    ('Office Chair',     'Furniture'),
    ('USB-C Hub',        'Electronics'),
    ('Standing Desk',    'Furniture'),
    ('Wireless Mouse',   'Electronics');
 
-- Insert 12 orders spanning multiple months and statuses
INSERT INTO orders (customer_id, order_date, order_total, status) VALUES
    (1, '2024-01-15', 2500.00, 'Completed'),
    (1, '2024-01-22', 150.00,  'Completed'),
    (2, '2024-01-10', 800.00,  'Completed'),
    (3, '2024-02-05', 3200.00, 'Completed'),
    (2, '2024-02-18', 450.00,  'Pending'),
    (4, '2024-02-20', 1200.00, 'Completed'),
    (5, '2024-03-01', 75.00,   'Cancelled'),
    (3, '2024-03-12', 5600.00, 'Completed'),
    (6, '2024-03-15', 920.00,  'Completed'),
    (1, '2024-03-20', NULL,    'Pending'),    -- NULL order_total
    (4, '2024-01-28', 340.00,  'Completed'),
    (6, '2024-02-14', 1850.00, 'Completed');
 
-- Insert order line items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
    (1, 1, 1, 1500.00),
    (1, 3, 2, 50.00),
    (2, 5, 3, 50.00),
    (3, 2, 1, 800.00),
    (4, 4, 2, 1600.00),
    (5, 3, 1, 50.00),
    (6, 1, 1, 1200.00),
    (7, 5, 1, 75.00),
    (8, 4, 2, 1400.00),
    (8, 1, 2, 1500.00),
    (9, 2, 1, 920.00),
    (11, 5, 2, 45.00),
    (12, 1, 1, 1850.00);

select o.order_id,
	   c.customer_name,
	   o.order_date,
	   o.order_total,
	   ()