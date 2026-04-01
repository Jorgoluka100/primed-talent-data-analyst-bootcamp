create table transactions(
	transaction_id serial primary key,
	customer_name varchar(50),
	customer_type varchar(10),
	transaction_value numeric(10,2)
);

insert into transactions (customer_name,customer_type,transaction_value)
values('Alice Johnson','VIP','1500.00'),
	  ('Bob Williams','VIP','800.00'),
	  ('Carol Davis','Regular','2000.00'),
	  ('Dan Brown','VIP',NULL),
	  ('Eve Martin','Regular',NULL),
	  ('Frank Lee','VIP','1000.00');

select * from transactions;

select transaction_id,
	customer_name,
	customer_type,
	transaction_value,
	COALESCE(transaction_value,0) as Value_Cleaned,
	CASE
		when COALESCE(transaction_value,0)>1000 
		and customer_type='VIP'
		then 'Premium'
		else 'Standard'
	END as classification
from transactions
order by transaction_id;

	  