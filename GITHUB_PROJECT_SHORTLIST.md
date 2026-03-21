select * from rental;
select * from inventory;
select * from film_category;
select * from category;
select * from film;
select * from customer;

with outer_query as
(select 
	count(film_id) as film_id_count,
	category_id
from film_category
group by category_id;
)
select 

---

select 	
	r.customer_id,
	c.first_name||''||c.last_name as customer_name,
	count(distinct cat.name)as distinct_categories,
	count(*) as total_rentals
from rental r
inner join customer c on r.customer_id=c.customer_id
inner join inventory i on r.inventory_id=i.inventory_id
inner join film_category fc on i.film_id=fc.film_id
inner join category cat on fc.category_id=cat.category_id
where r.rental_date>= (date '2006-02-14'- INTERVAL '6 months')
and r.rental_date< (date '2006-02-14')
group by r.customer_id,c.first_name,c.last_name
having count(distinct cat.name)>=3
order by distinct_categories DESC, total_rentals DESC
limit 15;

-- ANKIT version

SELECT 
	r.customer_id,
	c.first_name || ' ' || c.last_name AS customer_name,
	COUNT(DISTINCT cat.name) AS distinct_categories,
	COUNT(*) AS total_rentals
FROM rental r
INNER JOIN customer c ON r.customer_id = c.customer_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film_category fc ON i.film_id = fc.film_id
INNER JOIN category cat ON fc.category_id = cat.category_id
WHERE r.rental_date >= (DATE '2006-02-14' - INTERVAL '6 months')
AND r.rental_date < DATE '2006-02-14'
GROUP BY r.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT cat.name) >=3
ORDER BY distinct_categories DESC, total_rentals DESC
LIMIT 15;
 

