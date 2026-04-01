CREATE TABLE order_shipments (
    order_id         SERIAL PRIMARY KEY,
    customer_name    VARCHAR(80) NOT NULL,
    customer_country VARCHAR(50) NOT NULL,
    ship_region      VARCHAR(50),
    order_date       DATE NOT NULL,
        -- DATE: when the order was placed
    order_total      NUMERIC(10,2) NOT NULL
        -- NUMERIC(10,2): monetary value of the order
);
 
 
INSERT INTO order_shipments (customer_name, customer_country, ship_region, order_date, order_total)
VALUES
    ('Alice Johnson',  'USA',     'East',    '2024-01-05', 1500.00),
        -- USA + region present → VALID
    ('Bob Williams',   'USA',      NULL,     '2024-01-08',  850.00),
        -- USA + NULL region → REGION MISMATCH
    ('Carol Davis',    'Canada',  'Ontario', '2024-01-12', 2200.00),
        -- Non-USA + region present → VALID
    ('Dan Brown',      'USA',     'West',    '2024-01-15',  475.00),
        -- USA + region present → VALID
    ('Eve Martinez',   'Mexico',   NULL,     '2024-01-20', 3100.00),
        -- Non-USA + NULL region → VALID (only USA is checked)
    ('Frank Lee',      'USA',      NULL,     '2024-02-02',  925.00),
        -- USA + NULL region → REGION MISMATCH
    ('Grace Kim',      'UK',      'London',  '2024-02-08', 1750.00),
        -- Non-USA + region present → VALID
    ('Henry Adams',    'USA',     'Central', '2024-02-14',  650.00),
        -- USA + region present → VALID
    ('Ivy Chen',       'USA',      NULL,     '2024-02-20', 4200.00),
        -- USA + NULL region → REGION MISMATCH
    ('Jack Wilson',    'Germany',  NULL,     '2024-03-01', 1100.00),
        -- Non-USA + NULL region → VALID (only USA is checked)
    ('Karen Lopez',    'USA',     'South',   '2024-03-08',  780.00),
        -- USA + region present → VALID
    ('Leo Martin',     'Canada',   NULL,     '2024-03-15', 1950.00),
        -- Non-USA + NULL region → VALID (only USA is checked)
    ('Maria Santos',   'USA',      NULL,     '2024-03-20',  620.00),
        -- USA + NULL region → REGION MISMATCH
    ('Nick Taylor',    'USA',     'East',    '2024-03-22', 1350.00),
        -- USA + region present → VALID
    ('Olivia Park',    'Japan',   'Tokyo',   '2024-03-25', 2800.00);
        -- Non-USA + region present → VALID 

select * from order_shipments; 

SELECT
	order_id,
	customer_name,
	customer_country,
	ship_region,
	CASE
		WHEN customer_country='USA' and ship_region IS NULL 
			THEN 'Region Mismatch'
		ELSE 'Valid'
	END AS validation_status
FROM order_shipments
ORDER BY order_id;

SELECT
	SUM(CASE
		WHEN customer_country='USA' AND ship_region IS NULL
			THEN 1 ELSE 0
	END) AS mismatch_count,
	COUNT(*) AS total_rows,
	ROUND(SUM(CASE
		WHEN customer_country='USA' AND ship_region IS NULL
			THEN 1 ELSE 0 END) * 100 / COUNT(*),1
	) AS mismatch_percentage
FROM order_shipments;