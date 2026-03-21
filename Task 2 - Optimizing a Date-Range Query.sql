DROP TABLE IF EXISTS sales_transactions;
 
CREATE TABLE sales_transactions (
    transaction_id  SERIAL PRIMARY KEY,
    customer_name   VARCHAR(80) NOT NULL,
    transaction_date DATE NOT NULL,
    sale_amount     NUMERIC(10,2) NOT NULL,
    tax             NUMERIC(10,2),       -- NULLABLE: tax may not be recorded
    discount        NUMERIC(10,2),       -- NULLABLE: not all sales have discounts
    commission      NUMERIC(10,2),       -- NULLABLE: not all sales earn commission
    sales_rep_name  VARCHAR(80)          -- NULLABLE: some sales are self-service
);


 
INSERT INTO sales_transactions (customer_name, transaction_date, sale_amount, tax, discount, commission, sales_rep_name)
VALUES
    ('Alice Johnson',  '2024-01-05', 1500.00, 120.00,  75.00, 150.00, 'Sarah Miller'),
    ('Bob Williams',   '2024-01-10',  850.00,   NULL,  42.50,  85.00, 'Sarah Miller'),
    ('Carol Davis',    '2024-01-15', 2200.00, 176.00,   NULL, 220.00, 'James Taylor'),
    ('Dan Brown',      '2024-01-20',  475.00,  38.00,  23.75,   NULL, NULL),
    ('Eve Martinez',   '2024-02-02', 3100.00,   NULL,   NULL, 310.00, 'Sarah Miller'),
    ('Frank Lee',      '2024-02-08',  925.00,  74.00,  46.25,   NULL, 'James Taylor'),
    ('Grace Kim',      '2024-02-14', 1750.00, 140.00,  87.50, 175.00, NULL),
    ('Henry Adams',    '2024-02-20',  650.00,   NULL,   NULL,   NULL, NULL),
    ('Ivy Chen',       '2024-03-01', 4200.00, 336.00, 210.00, 420.00, 'Sarah Miller'),
    ('Jack Wilson',    '2024-03-08', 1100.00,  88.00,   NULL, 110.00, 'James Taylor'),
    ('Karen Lopez',    '2024-03-15',  780.00,   NULL,  39.00,   NULL, NULL),
    ('Leo Martin',     '2024-03-22', 1950.00, 156.00,  97.50, 195.00, 'Sarah Miller');

select * from sales_transactions;

SELECT 
    transaction_id,
    customer_name,
    COALESCE(sales_rep_name, 'Self-Service') AS processed_by,    
    sale_amount,    
    -- Net Amount = Amount - Discount + Tax
    (sale_amount 
      - COALESCE(discount, 0) 
      + COALESCE(tax, 0)
    ) AS net_transaction_total,   
    COALESCE(commission, 0) AS commission_earned
FROM sales_transactions;


--- ANKIT version
select 
	transaction_id,
	customer_name,
	transaction_date,
	sale_amount,
	coalesce(tax,0) as tax_applied,
	coalesce(discount,0) as discount_applied,
	coalesce(sales_rep_name,'Unassigned') as sales_representative,
	sale_amount+coalesce(tax,0)-coalesce(discount,0) as customer_total
from sales_transactions
order by transaction_id;
	

