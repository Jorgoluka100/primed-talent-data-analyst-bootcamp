select * from payment;

WITH threshold_calc AS (
    -- Calculate the 90th percentile value (Top 10%)
    SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY amount) AS top_10_percent_value
    FROM payment
)
SELECT 
    p.payment_id,
    p.amount,
    CASE 
        WHEN p.amount >= t.top_10_percent_value THEN 'High Revenue'
        WHEN p.amount >= t.top_10_percent_value * 0.5 THEN 'Medium' -- Custom midpoint
        ELSE 'Low'
    END AS revenue_category
FROM payment p, threshold_calc t;

-- ANKIT version

with revenue_thresholds as(
	select 
		percentile_cont(0.90) within group(order by amount) as p90,
		percentile_cont(0.50) within group(order by amount) as p50
	FROM payment
)
select 
	p.payment_id,
	p.customer_id,
	p.amount,
	case
		when p.amount>=rt.p90 then 'High Revenue'
		when p.amount>=rt.p50 then 'Medium Revenue'
		else 'Low Revenue'
	End as revenue_classification
from payment p
cross join revenue_thresholds rt
order by p.amount desc
limit 20;

--- Team Lab: Cross-Platform Date Logic Conversion
--SQL query

SELECT
     c.customer_id,
     c.first_name + ' ' + c.last_name AS customer_name,
   COUNT(r.rental_id) AS rentals_last_6_months,
   AVG(DATEDIFF(day, r.rental_date, r.return_date)) AS avg_rental_days
 FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
WHERE r.rental_date >= DATEADD(month, -6, '2006-02-14')
 AND r.rental_date < '2006-02-14'
   AND r.return_date IS NOT NULL
 GROUP BY c.customer_id, c.first_name, c.last_name
-- HAVING COUNT(r.rental_id) > 5
-- ORDER BY rentals_last_6_months DESC;

-- postgresql query

SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(r.rental_id) AS rentals_last_6_months,
    AVG(r.return_date::date - r.rental_date::date) AS avg_rental_days
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
WHERE r.rental_date >= '2006-02-14'::date - INTERVAL '6 months'
  AND r.rental_date < '2006-02-14'::date
  AND r.return_date IS NOT NULL
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(r.rental_id) > 5
ORDER BY rentals_last_6_months DESC;
 