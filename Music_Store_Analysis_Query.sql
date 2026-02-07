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

select billing_city, sum(total) as total_spend 
from invoice 
group by billing_city 
order by total_spend
desc limit 1;

/* Who is the best customer. The customer who have spent the most money will be declared the best customer. write a query that returns the person who has spent the most money. */

select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total_spend 
from customer
inner join invoice on customer.customer_id = invoice.invoice_id 
group by customer.customer_id, customer.first_name, customer.last_name
order by total_spend desc;


/* Let's invite the artist who have written the most rock music in our dataset. write a query that returns the artist name and total track count of the top 10 rock bands? */

select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs 
from artist 
inner join album on artist.artist_id = album.artist_id
inner join track on album.album_id = track.album_id
inner join genre on track.genre_id = genre.genre_id
where genre.name = "Rock"
group by artist.artist_id, artist.name
order by number_of_songs desc limt 1;

/* Return all the track name that have a song length longer than the average song length.
Return the name and milliseconds for each name. Order by the song length with the longest songs listed first. */

Select name, milliseconds 
from track where milliseconds > (select avg(milliseconds) from track) 
order by milliseconds desc;

/* select how much amount spent by each customer on artist? Write a query to return customer name, artist nae and total spent. */

select customer.first_name, artist.name, sum(invoice_line.unit_price*invoice_linequantity) as total_spend
from customer 
inner join invoice on customer.customer_id = invoice.customer_id
inner join invoice_line on invoice.invoice_id = invoice_line.invoice.id
inner join track on invoice_line.track_id = track.track_id
inner join album on track.album_id = album.album_id
inner join artist on album.artist_id = album.artist_id
group by customer.first_name, artist.name
order by total_spend;





