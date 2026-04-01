select * from rental;

with fiscal_context as(
	select 
		date '2005-08-10' as reference_date,
		extract(month from c)as current month,
		case
			when Extract(month from date '2005-08-10') between 7 and 9 then 'Q1'
			when Extract(month from date '2005-08-10') between 10 and 12 then 'Q2'
			when Extract(month from date '2005-08-10') between 1 and 3 then 'Q3'
			when Extract(month from date '2005-08-10') between 4 and 6 then 'Q4'
		End as current_fiscal_quarter,

		-- calculate start and  end dates for current quarter
		case
			when Extract(month from date '2005-08-10') between 7 and 9 
			then date_trunc('year',date '2005-08-10')+ interval '6 months'
)