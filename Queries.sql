-- Seniormost employee based on job title.
select * from employee
order by levels desc
limit 1;

-- country having most invoices
select count(*) as Count ,billing_country
from invoice
group by billing_country
order by Count desc;

-- top 3 values of total invoice
select * from invoice
order by total desc
limit 3;

-- Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
-- Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals

select sum(total) as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc
limit 1;

-- Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer.
-- Write a query that returns the person who has spent the most money.

SELECT customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
group by customer.customer_id,customer.first_name, customer.last_name
order by total desc
limit 1;







