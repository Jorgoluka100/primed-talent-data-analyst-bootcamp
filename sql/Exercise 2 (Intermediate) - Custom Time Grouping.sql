select * from rental;

SELECT 
    payment_id,
    payment_date,
    amount,
    CASE 
        WHEN EXTRACT(MONTH FROM payment_date) BETWEEN 7 AND 9 THEN 'Q1'
        WHEN EXTRACT(MONTH FROM payment_date) BETWEEN 10 AND 12 THEN 'Q2'
        WHEN EXTRACT(MONTH FROM payment_date) BETWEEN 1 AND 3 THEN 'Q3'
        WHEN EXTRACT(MONTH FROM payment_date) BETWEEN 4 AND 6 THEN 'Q4'
    END AS FiscalQuarter
FROM payment;

-- ankit version

SELECT
	rental_id,
	rental_date,
	EXTRACT(MONTH FROM rental_date) AS calendar_month,
	CASE
		WHEN EXTRACT(MONTH FROM rental_date) BETWEEN 7 AND 9 THEN 'Q1'
		WHEN EXTRACT(MONTH FROM rental_date) BETWEEN 10 AND 12 THEN 'Q2'
		WHEN EXTRACT(MONTH FROM rental_date) BETWEEN 1 AND 3 THEN 'Q3'
		WHEN EXTRACT(MONTH FROM rental_date) BETWEEN 4 AND 6 THEN 'Q4'
	END AS fiscal_quarter
FROM rental
ORDER BY rental_date;

--- Boundary verification query

SELECT
	EXTRACT(MONTH FROM rental_date) AS calendar_month,
	CASE
		WHEN EXTRACT(MONTH FROM rental_date) BETWEEN 7 AND 9 THEN 'Q1'
		WHEN EXTRACT(MONTH FROM rental_date) BETWEEN 10 AND 12 THEN 'Q2'
		WHEN EXTRACT(MONTH FROM rental_date) BETWEEN 1 AND 3 THEN 'Q3'
		WHEN EXTRACT(MONTH FROM rental_date) BETWEEN 4 AND 6 THEN 'Q4'
	END AS fiscal_quarter,
	COUNT(*) AS rental_count
FROM rental
GROUP BY calendar_month, fiscal_quarter
ORDER BY calendar_month;

---- Exercise 3 (Advanced): Filtering on Aggregate Result

SELECT 
    customer_id, 
    COUNT(DISTINCT rental_id) AS total_distinct_orders
FROM rental
WHERE rental_date >= '2005-08-23'::date - INTERVAL '90 days'
  AND rental_date <= '2005-08-23'::timestamp
GROUP BY customer_id
HAVING COUNT(DISTINCT rental_id) > 10
ORDER BY total_distinct_orders DESC;

-- Ankit version

SELECT
	r.customer_id,
	c.first_name || ' ' || c.last_name AS customer_name,
	COUNT(DISTINCT r.rental_id) AS distinct_rentals
FROM rental r
INNER JOIN customer c ON r.customer_id = c.customer_id
WHERE r.rental_date >= (DATE '2005-08-23' - INTERVAL '90 days')
  AND r.rental_date < DATE '2005-08-23'
GROUP BY r.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT r.rental_id) > 10
ORDER BY distinct_rentals;
 
 