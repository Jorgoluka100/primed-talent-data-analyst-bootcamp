select * from payment;

with customer_tiers as(
	select 
		customer_id,
		count(payment_id)as transaction_count,
		sum(amount)as total_spent,
		case 
			when count(payment_id)>=40 then 'Platinum'
		    when count(payment_id)>=30 then 'Gold'
			when count(payment_id)>=20 then 'silver'
			when count(payment_id)>=10 then 'Bronze'
			else 'Basic'
		END as customer_tier
	from payment
	GROUP BY customer_id
)
select 
	customer_tier,
	count(*) as customer_in_tier,
	round(sum(total_spent),2) as tier_total_revenue,
	round(avg(total_spent),2) as avg_revenue_per_customer,
	round(avg(transaction_count),2) as avg_transactions
from customer_tiers
group by customer_tier
having sum(total_spent)>3000
order by tier_total_revenue;