DROP TABLE IF EXISTS monthly_sales;
 
CREATE TABLE monthly_sales (
    sale_id       SERIAL PRIMARY KEY,
    customer_id   INTEGER NOT NULL,
    order_date    DATE NOT NULL,
    product_name  VARCHAR(100) NOT NULL,
    sale_amount   NUMERIC(10,2) NOT NULL,
    discount_rate NUMERIC(5,2)    -- NULLABLE: some sales have no discount info
);
 
INSERT INTO monthly_sales (customer_id, order_date, product_name, sale_amount, discount_rate)
VALUES
    -- January 2024 (6 rows, 5 unique customers, 2 NULL discounts)
    (201, '2024-01-05', 'Widget A', 150.00, 10.00),
    (202, '2024-01-08', 'Widget B', 275.00, NULL),
    (203, '2024-01-12', 'Widget C',  89.99,  5.00),
    (201, '2024-01-18', 'Widget D', 320.00, NULL),
    (204, '2024-01-22', 'Widget A', 150.00, 15.00),
    (205, '2024-01-28', 'Widget E', 425.00, 10.00),
    -- February 2024 (6 rows, 6 unique customers, 2 NULL discounts)
    (202, '2024-02-03', 'Widget B', 275.00,  8.00),
    (206, '2024-02-07', 'Widget C',  89.99, NULL),
    (203, '2024-02-14', 'Widget A', 150.00,  5.00),
    (201, '2024-02-19', 'Widget D', 320.00, 12.00),
    (207, '2024-02-22', 'Widget E', 425.00, NULL),
    (204, '2024-02-28', 'Widget B', 275.00, 10.00),
    -- March 2024 (8 rows, 8 unique customers, 2 NULL discounts)
    (205, '2024-03-05', 'Widget A', 150.00, NULL),
    (208, '2024-03-08', 'Widget C',  89.99,  7.50),
    (201, '2024-03-12', 'Widget D', 320.00, 10.00),
    (206, '2024-03-15', 'Widget E', 425.00,  5.00),
    (203, '2024-03-19', 'Widget B', 275.00, NULL),
    (209, '2024-03-22', 'Widget A', 150.00, 15.00),
    (202, '2024-03-25', 'Widget D', 320.00,  8.00),
    (207, '2024-03-28', 'Widget E', 425.00, 10.00);

select * from monthly_sales;

select 
	Extract(MONTH FROM order_date) as sale_month,
	COALESCE(discount_rate, 0) AS discount_rate_fixed,
	COUNT(DISTINCT customer_id) AS unique_customer_count,
	SUM(sale_amount) AS total_monthly_revenue
from monthly_sales
GROUP BY 
    EXTRACT(MONTH FROM order_date), 
    COALESCE(discount_rate, 0)
ORDER BY sale_month;

--- Ankit version

SELECT
	EXTRACT(MONTH FROM order_date) AS sale_month,
	COUNT(DISTINCT customer_id) AS unique_customers,
	ROUND(AVG(COALESCE(discount_rate, 0)),2) AS avg_discount_rate,
	SUM(sale_amount) AS total_sales
FROM monthly_sales
GROUP BY sale_month --EXTRACT(MONTH FROM order_date)
ORDER BY sale_month;
 
 