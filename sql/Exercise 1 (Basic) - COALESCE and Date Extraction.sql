DROP TABLE IF EXISTS shipping_orders;
 
CREATE TABLE shipping_orders (
    order_id      SERIAL PRIMARY KEY,
    customer_name VARCHAR(80) NOT NULL,
    order_date    DATE NOT NULL,
    ship_date     DATE,
    order_total   NUMERIC(10,2)
);
 
INSERT INTO shipping_orders (customer_name, order_date, ship_date, order_total)
VALUES
    ('Alice Johnson',  '2024-01-15', '2024-01-18', 250.00),
    ('Bob Williams',   '2024-01-16', NULL,         180.00),
    ('Carol Davis',    '2024-01-17', '2024-01-19', 420.00),
    ('Dan Brown',      '2024-01-20', NULL,          95.00),
    ('Eve Martinez',   '2024-01-21', '2024-01-23', 310.00),
    ('Frank Lee',      '2024-01-22', '2024-01-22', 760.00),
    ('Grace Kim',      '2024-01-25', NULL,         150.00),
    ('Henry Adams',    '2024-01-27', '2024-01-30', 540.00);

select * from shipping_orders;

select
	order_id,
	customer_name,
	order_date,
	extract(DOW from order_date) as day_of_week_number,
	CASE EXTRACT(DOW from order_date)
		when 0 then 'Sunday'
		when 1 then 'Monday'
		when 2 then 'Tuesday'
		when 3 then 'Wednesday'
		when 4 then 'Thursday'
		when 5 then 'Friday'
		when 6 then 'Saturday'
	END AS day_of_week_name,
	coalesce(ship_date::TEXT,'Not Shipped') as shipping_status,
	order_total
from
	shipping_orders
order by
	order_id;

--- 

DROP TABLE IF EXISTS monthly_orders;
 
CREATE TABLE monthly_orders (
    order_id    SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date  DATE NOT NULL,
    order_type  VARCHAR(20) NOT NULL,
    revenue     NUMERIC(10,2) NOT NULL
);
 
INSERT INTO monthly_orders (customer_id, order_date, order_type, revenue)
VALUES
    -- January 2024

    (101, '2024-01-05', 'Priority', 1200.00),
    (102, '2024-01-08', 'Standard',  350.00),
    (101, '2024-01-15', 'Standard',  200.00),
    (103, '2024-01-20', 'Priority', 2500.00),
    (104, '2024-01-25', 'Standard',  175.00),
    (102, '2024-01-28', 'Priority',  900.00),
	
    -- February 2024

    (101, '2024-02-03', 'Priority', 1800.00),
    (105, '2024-02-10', 'Standard',  420.00),
    (103, '2024-02-14', 'Priority', 3100.00),
    (106, '2024-02-20', 'Standard',  290.00),
    (105, '2024-02-25', 'Standard',  310.00),

    -- March 2024

    (101, '2024-03-05', 'Standard',  550.00),
    (107, '2024-03-12', 'Priority', 4200.00),
    (103, '2024-03-18', 'Standard',  680.00),
    (108, '2024-03-22', 'Priority', 1500.00),
    (107, '2024-03-28', 'Standard',  340.00);
 
select * from monthly_orders;

SELECT 
    order_id, 
    customer_id, 
    order_date,
	EXTRACT(MONTH FROM order_date)as Order_month
FROM monthly_orders
ORDER BY EXTRACT(MONTH FROM order_date);

SELECT 
    EXTRACT(MONTH FROM order_date) AS order_month,
    COUNT(DISTINCT customer_id) AS total_customer,
	COUNT(order_id) AS total_orders,
	SUM(CASE WHEN order_type = 'Priority' THEN revenue ELSE 0 END) AS priority_revenue,
    SUM(revenue) AS total_revenue
FROM monthly_orders
GROUP BY order_month;

select
	EXTRACT(YEAR FROM order_date) AS order_year,
	EXTRACT(MONTH FROM order_date) AS order_month,
	To_CHAR(order_date,'Month')as month_name,
	COUNT(DISTINCT customer_id) AS unique_customers,
	SUM(CASE 
		WHEN order_type = 'Priority' THEN revenue 
		ELSE 0 
		END) AS standard_revenue,
	SUM(revenue) AS total_revenue,
	count(*) as total_orders
from 
	monthly_orders
group by
	EXTRACT(YEAR FROM order_date),
	EXTRACT(MONTH FROM order_date),
	To_CHAR(order_date,'Month')
order by
	order_year,
	order_month;
	
 