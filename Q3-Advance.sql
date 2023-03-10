-- Q3:Write a query that determines the customer that has spent the most on music for each country. 
-- Write a query that returns the country along with the top customer and how much they spent. 
-- For countries where the top amount spent is shared, provide all customers who spent this amount

with customer_with_country as(
select customer.customer_id, customer.first_name, customer.last_name, invoice.billing_country,
sum(invoice.total) as total_spending,
ROW_NUMBER()OVER(PARTITION BY invoice.billing_country ORDER BY SUM(total) desc) as RowNo
from invoice
join customer on customer.customer_id= invoice.customer_id
GROUP BY 1,2,3,4
ORDER BY 4 ASC,5 DESC)
SELECT * FROM Customer_with_country WHERE RowNo<= 1

