CREATE TABLE sales_reps (
    rep_id           SERIAL PRIMARY KEY,
        -- Unique identifier for each sales rep
    rep_name         VARCHAR(80) NOT NULL,
        -- Sales representative's name
    total_sales      NUMERIC(12,2) NOT NULL,
        -- Total sales revenue attributed to this rep
    transactions     INTEGER NOT NULL,
        -- Number of transactions processed
    sales_commission NUMERIC(10,2)
        -- NULLABLE: commission may not be calculated for all reps
        -- NULL here is the source of the data quality issue
);
 
INSERT INTO sales_reps (rep_name, total_sales, transactions, sales_commission)
VALUES
    ('Sarah Miller',  45000.00, 45, 4500.00),
        -- Commission present: 10% of sales
    ('James Taylor',  38000.00, 38, 3800.00),
	-- Commission present: 10% of sales
    ('Emily Clark',   52000.00, 52, 5200.00),
        -- Commission present: 10% of sales
    ('Michael Brown', 30000.00, 30, NULL),
        -- NULL commission — not yet calculated
    ('Jessica White', 41000.00, 41, 4100.00),
        -- Commission present: 10% of sales
    ('David Lee',     48000.00, 48, 4800.00),
        -- Commission present: 10% of sales
    ('Amanda Wilson', 35000.00, 35, NULL),
        -- NULL commission — on different compensation plan
    ('Robert Chen',   43000.00, 43, 4100.00),
        -- Commission present: ~9.5% of sales
    ('Lisa Wang',     39000.00, 39, 3900.00),
        -- Commission present: 10% of sales
    ('Tom Harris',    47000.00, 47, 4700.00);
        -- Commission present: 10% of sales

select * from sales_reps;

-- BAD QUERY

select 
	rep_id,
	rep_name,
	total_sales,
	total_sales+sales_commission as total_revenue
from sales_reps;

-- OPTIMIZED QUERY
select 
	rep_id,
	rep_name,
	total_sales,
	coalesce(sales_commission,0) as sales_comm_cleaned,
	total_sales+coalesce(sales_commission,0) as total_revenue
from sales_reps;


-- ANKIT VERSION
-- WRONG REPORT
select
	count(*) as total_reps,
	sum(total_sales) as company_total_sales,
	sum(sales_commission) as total_commission,
	round(avg(sales_commission),2)as average_commission_per_rep
from sales_reps;

-- CORRECT REPORT

select
	count(*) as total_reps,
	sum(total_sales) as company_total_sales,
	sum(coalesce(sales_commission,0)) as total_commission,
	round(avg(coalesce(sales_commission,0)),2)as average_commission_per_rep
from sales_reps;

---

select 
	count(*) as total_rows,
	count(sales_commission) as rows_with_commission,
	count(*)- count(sales_commission) as rows_missing_commission,
	sum(sales_commission) as sum_without_coalesce,
	sum(coalesce(sales_commission,0)) as sum_with_coalesce,
	round(avg(sales_commission),2)as avg_without_coalesce,
	round(avg(coalesce(sales_commission,0)),2)as avg_with_coalesce
from sales_reps;






