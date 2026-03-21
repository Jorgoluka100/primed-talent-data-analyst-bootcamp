select * from payment;

select 
	min(payment_date) as earliest_payment,
	max(payment_date) as latest_payment,
	count(*) as total_rows
from payment;

Explain Analyse
select * from payment
where payment_date between '2007-03-01' and '2007-03-31';

select count(*) as total_rows_in_table from payment;

-- count how many rows actually match

--- Monthly distribution of payments

select DATE_TRUNC('Month',payment_date) as payment_month,
	   count(*) as row_count,
	   round(count(*)*100/(select count(*) from payment),1) as pct_of_table
from payment
group by DATE_TRUNC('Month',payment_date)
order by payment_month;

-- create a B-Tree index on payment date column

create INDEX idx_payment_date
	on payment
	using BTREE(payment_date);
	
--- OPTIMIZED QUERY

Explain Analyse
select * from payment
where payment_date between '2007-03-01' and '2007-03-31';

Explain Analyse
select payment_id, customer_id,amount,payment_date from payment
where payment_date>='2007-03-01'
and payment_date< '2007-03-31'
order by payment_date;

--- AGGGREGATION EXAMPLE
Explain Analyse
select
	cast(payment_date as DATE) as payment_day,
	count(*) as total_transsactions,
	sum(amount) as daily_revenue,
	round(avg(amount),2) as avg_transaction_value
	FROM payment
WHERE payment_date >= '2007-3-01'
AND   payment_date < '2007-03-31'
GROUP BY CAST(payment_date AS DATE)
ORDER BY payment_day;
	


	