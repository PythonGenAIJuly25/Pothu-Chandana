select * from bigbasketproducts;


with cte as (
select *,
	CASE 
		when rating >= 4.30 then "High"
        when rating between 3.50 and 4.30 then "medium"
        when rating <= 3.50 then "Low"
	END AS rating_category
FROM bigbasketproducts
WHERE 
rating is NOT NULL)

select rating_category,
	count(*) as total_count,
	sum(sale_price) as total_sale_price,
    (count(*) * 100) / (select count(*) from cte) as count_percentage,
    (sum(sale_price) * 100) / (select sum(sale_price) from cte) as sale_price_percentage
from cte
group by rating_category;
	
