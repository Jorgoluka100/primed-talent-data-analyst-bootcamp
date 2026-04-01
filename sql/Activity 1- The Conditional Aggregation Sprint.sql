DROP TABLE IF EXISTS sales;
 
CREATE TABLE sales (
    sale_id        SERIAL PRIMARY KEY,
    customer_id    INTEGER NOT NULL,
    customer_name  VARCHAR(80) NOT NULL,
    customer_type  VARCHAR(20) NOT NULL,
    signup_date    DATE NOT NULL,
    product_name   VARCHAR(100) NOT NULL,
    product_price  NUMERIC(10,2),
    quantity       INTEGER NOT NULL,
    sale_date      DATE NOT NULL
);
 
INSERT INTO sales (customer_id, customer_name, customer_type, signup_date, product_name, product_price, quantity, sale_date)
VALUES
    (101, 'Alice Johnson',  'New',       '2024-03-01', 'Laptop Pro',       1299.99, 1, '2024-03-10'),
    (102, 'Bob Williams',   'Returning', '2023-06-15', 'Wireless Mouse',     29.99, 3, '2024-03-11'),
    (103, 'Carol Davis',    'New',       '2024-03-05', 'Office Chair',      449.99, 2, '2024-03-12'),
    (104, 'Dan Brown',      'Returning', '2023-01-20', 'Monitor 27 inch',  1099.00, 1, '2024-03-13'),
    (105, 'Eve Martinez',   'New',       '2024-03-08', 'USB-C Hub',          45.00, 5, '2024-03-14'),
    (101, 'Alice Johnson',  'New',       '2024-03-01', 'Keyboard',           NULL,  2, '2024-03-15'),
    (106, 'Frank Lee',      'Returning', '2022-11-10', 'Standing Desk',    1450.00, 1, '2024-03-16'),
    (107, 'Grace Kim',      'New',       '2024-03-10', 'Webcam HD',          89.99, 1, '2024-03-17'),
    (102, 'Bob Williams',   'Returning', '2023-06-15', 'Laptop Pro',       1299.99, 2, '2024-03-18'),
    (108, 'Henry Adams',    'Returning', '2023-09-01', 'Desk Lamp',          54.99, 4, '2024-03-19'),
    (103, 'Carol Davis',    'New',       '2024-03-05', 'Headphones',        349.99, 1, '2024-03-20'),
    (109, 'Ivy Chen',       'New',       '2024-03-12', 'Server Rack',      2500.00, 1, '2024-03-21'),
    (110, 'Jack Wilson',    'Returning', '2023-04-22', 'Printer',            NULL,  1, '2024-03-22'),
    (106, 'Frank Lee',      'Returning', '2022-11-10', 'Office Chair',      449.99, 3, '2024-03-23'),
    (107, 'Grace Kim',      'New',       '2024-03-10', 'Monitor 27 inch',  1099.00, 1, '2024-03-24');

 select * from sales;

-- CONDITIONAL AGGREGATION

 SELECT 
    -- 1) Total Revenue
    SUM(product_price * quantity) AS total_revenue,

    -- 2) Revenue from 'New' Customers (signed up in the same month as the sale)
    SUM(CASE 
        WHEN DATE_TRUNC('month', signup_date) = DATE_TRUNC('month', sale_date) 
        THEN product_price * quantity 
        ELSE 0 
    END) AS new_customer_revenue,

    -- 3) Revenue from 'High-Value' Products (price > $1000)
    SUM(CASE 
        WHEN product_price > 1000 
        THEN product_price * quantity 
        ELSE 0 
    END) AS high_value_product_revenue

FROM sales;

--- rewriting the second aggregation
select SUM(product_price * quantity) FILTER (
    WHERE DATE_TRUNC('month', signup_date) = DATE_TRUNC('month', sale_date)
) AS new_customer_revenue
from sales;

select DATE_TRUNC('month', signup_date) from sales;
select EXTRACT(MONTH FROM signup_date) from sales;
select TO_CHAR(signup_date, 'YYYY-MM') from sales;

select SUM(CASE 
    WHEN EXTRACT(MONTH FROM signup_date) = EXTRACT(MONTH FROM sale_date) 
     AND EXTRACT(YEAR FROM signup_date) = EXTRACT(YEAR FROM sale_date)
    THEN product_price * quantity 
    ELSE 0 
END) AS new_customer_revenue
from sales;

select SUM(CASE 
    WHEN TO_CHAR(signup_date, 'YYYY-MM') = TO_CHAR(sale_date, 'YYYY-MM')
    THEN product_price * quantity 
    ELSE 0 
END) AS new_customer_revenue
from sales;

-- ANKIT VERSION
SELECT
	SUM(COALESCE(product_price, 0) * quantity) AS total_revenue,
	SUM(CASE WHEN customer_type= 'New'
		THEN COALESCE(product_price, 0) * quantity ELSE 0 END) AS new_customer_revenue,
	SUM(CASE WHEN COALESCE(product_price, 0) > 1000 
		THEN COALESCE(product_price, 0) * quantity ELSE 0 END) AS high_value_product_revenue
FROM sales;
 
---- Activity 2: Date Calculation Whiteboard

DROP TABLE IF EXISTS customers;
 
CREATE TABLE customers (
    customer_id          SERIAL PRIMARY KEY,
    customer_name        VARCHAR(80) NOT NULL,
    email                VARCHAR(120) NOT NULL,
    customer_signup_date DATE NOT NULL,
    last_purchase_date   DATE
);
 
INSERT INTO customers (customer_name, email, customer_signup_date, last_purchase_date)
VALUES
    ('Alice Johnson',  'alice.johnson@email.com',  '2022-06-15', '2024-02-10'),
    ('Bob Williams',   'bob.williams@email.com',   '2023-08-20', '2024-03-01'),
    ('Carol Davis',    'carol.davis@email.com',     '2021-01-10', '2023-12-15'),
    ('Dan Brown',      'dan.brown@email.com',       '2023-03-25', NULL),
    ('Eve Martinez',   'eve.martinez@email.com',    '2023-03-26', '2024-03-20'),
    ('Frank Lee',      'frank.lee@email.com',       '2024-01-05', '2024-03-15'),
    ('Grace Kim',      'grace.kim@email.com',       '2022-11-30', NULL),
    ('Henry Adams',    'henry.adams@email.com',     '2023-06-10', '2024-01-25'),
    ('Ivy Chen',       'ivy.chen@email.com',        '2020-09-01', '2023-06-30'),
    ('Jack Wilson',    'jack.wilson@email.com',      '2024-02-28', NULL),
    ('Karen Lopez',    'karen.lopez@email.com',     '2023-03-24', '2024-03-22'),
    ('Leo Martin',     'leo.martin@email.com',      '2022-03-25', '2024-02-01');
 
select * from customers;

SELECT 
    customer_id, 
    CURRENT_DATE - customer_signup_date AS total_days,
    AGE(CURRENT_DATE, customer_signup_date) AS tenure_formatted
FROM customers
WHERE customer_signup_date < CURRENT_DATE - INTERVAL '1 year';

-- ANKIT VERSION
SELECT
	customer_id,
	customer_name,
	customer_signup_date,
	(DATE '2024-03-25' - customer_signup_date) AS customer_age_days
FROM customers
WHERE (DATE '2024-03-25'- customer_signup_date) > 365
ORDER BY customer_age_days DESC;
 