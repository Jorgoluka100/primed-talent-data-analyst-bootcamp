select * from rental;

EXPLAIN ANALYSE
SELECT 
	customer_id,
	count(customer_id) as customer_count
from rental
group by customer_id;

EXPLAIN ANALYSE
SELECT 
	customer_id,
	count(customer_id) as customer_count
from rental
where rental_date between '2025-07-01' and '2025-08-01'
group by customer_id;


--- ANKIT VERSION
-- SLOW QUERY
EXPLAIN ANALYSE
select * from rental
where customer_id=148;

--OPTIMIZED QUERY
EXPLAIN ANALYSE
select * from rental
where customer_id=148
and rental_date between '2025-06-01' and '2025-08-01';