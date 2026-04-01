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
	case extract(DOW from order_date)
	when 0 th
 