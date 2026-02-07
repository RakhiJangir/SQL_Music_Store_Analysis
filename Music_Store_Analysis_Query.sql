/*	Easy questions  */
/* Who is the most senior person bases on job title? */

select employee_id, first_name, last_name, levels 
from employee 
order by levels 
limit 1;

