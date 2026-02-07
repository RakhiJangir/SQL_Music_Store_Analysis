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

