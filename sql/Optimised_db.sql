DROP INDEX IF EXISTS idx_customer_email;
EXPLAIN ANALYSE
select * from customer
where email='mary.smith@sakilacustomer.org'

create index idx_customer_email on customer(email);

EXPLAIN ANALYSE
select * from customer
where email='mary.smith@sakilacustomer.org'