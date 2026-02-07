/*	Easy questions  */
/* Who is the most senior person bases on job title? */

select employee_id, first_name, last_name, levels 
from employee 
order by levels 
limit 1;

/* Which countries have the most invoices? */

select billing_counry, count(*) as total_invoice 
from invoice 
group by billing_country 
order by total_invoice 
desc;


/* What are top 3 values of total invoices? */

Select total from invoice 
order by total 
desc limit 3;


/* Which city has the best customer? We would like to through a promotional music festival in the city we made the most money. 
Write a query that return one city that have the highest sum of invoice totals. Return both city name and sum of total invoice. */


