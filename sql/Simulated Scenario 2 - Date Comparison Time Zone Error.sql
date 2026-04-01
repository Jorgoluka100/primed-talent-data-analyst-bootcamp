select * from rental;

select count(*) as rentals_on_date
from rental
where rental_date::DATE=DATE '2005-08-01';

-- CORRECT
select count(*) as rentals_on_date
from rental
where rental_date>=timestamp '2005-08-01 00:00:00'
and   rental_date<timestamp '2005-08-02 00:00:00';

--

select count(*) as rentals_on_date
from rental
where (rental_date at TIME ZONE 'America/New_York')::DATE = current_date;