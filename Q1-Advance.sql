-- Q1:Find how much amount spent by each customer on artists?
--  Write a query to return customer name, artist name and total spent

with bsa as(
select 	artist.artist_id as artist_id, artist.name as artist_name,
sum(invoice_line.unit_price * invoice_line.quantity)
from invoice_line
join track on track.track_id = invoice_line.track_id
join album on album.album_id= track.album_id
join artist on artist.artist_id = album.album_id
group by 1,2
order by 3 desc
limit 1
)
select customer.customer_id, customer.first_name, customer.last_name, bsa.artist_name,
sum(invoice_line.unit_price* invoice_line.quantity)as total_spent
from invoice
join customer on customer.customer_id= invoice.customer_id
join invoice_line on invoice_line.invoice_id= invoice.invoice_id
join track on track.track_id = invoice_line.track_id
join album on album.album_id= track.album_id
join bsa on bsa.artist_id = album.artist_id
group by 1,2,3,4
order by 5 desc;