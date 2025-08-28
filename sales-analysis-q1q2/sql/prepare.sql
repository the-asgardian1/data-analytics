----------------------------------------SUM 
SELECT c.region,
	CASE when month(o.order_date) between 1 and 3 then 'Q1'
		when MONTH( o.order_date) between 4 and 6 then 'Q2'
	end as querter, 
	
	SUM(o.quantity * o.unit_price * (1- o.discount_pct)) AS total_revenue,
	count(DISTINCT o.order_id) AS orders_count
FROM orders o
join customers c on o.customer_id = c.customer_id
group by c.region, 
case when MONTH( o.order_date) between 1 and 3 then 'Q1'	
	when MONTH( o.order_date) between 4 and 6 then 'Q2'
end 
order by c.region, querter;
------------------------------------------------------------------AVG
SELECT c.region,
	CASE WHEN MONTH(o.order_date) BETWEEN 1 AND 3 THEN 'Q1'
	WHEN MONTH(o.order_date) BETWEEN 4 AND 6 THEN 'Q2'
	END AS Querter,
	AVG(o.discount_pct) AS avarage
FROM orders o 
join customers c on o.customer_id = c.customer_id
GROUP BY c.region,
CASE WHEN MONTH(o.order_date) BETWEEN 1 AND 3 THEN 'Q1'
 WHEN MONTH(o.order_date) BETWEEN 4 AND 6 THEN 'Q2'
 END 
 ORDER BY c.region, Querter;
 ------------------------------------------------------RETURN RATE
 SELECT c.region,
CASE WHEN MONTH(o.order_date) BETWEEN 1 AND 3 THEN 'Q1'
WHEN MONTH(o.order_date) BETWEEN 4 AND 6 THEN 'Q2'
END AS Querter,
 AVG(o.returned_flag * 1.0) as return_rate
 from orders o
 join customers c on o.customer_id = c.customer_id
 group by c.region,
 case when MONTH(o.order_date) BETWEEN 1 AND 3 THEN 'Q1'
 WHEN MONTH(o.order_date) BETWEEN 4 AND 6 THEN 'Q2'
 END 
 ORDER BY c.region, Querter;
 ---------------------------------- units sold
 SELECT c.region,
 CASE WHEN MONTH(o.order_date) BETWEEN 1 AND 3 THEN 'Q1'
 WHEN MONTH(o.order_date) BETWEEN 4 AND 6 THEN  'Q2'
 END AS Querter,
 sum(o.quantity) as units_sold
 FROM orders o
 join customers c on o.customer_id = c.customer_id
 group by region,
 case when MONTH(o.order_date) between 1 and 3 then 'Q1'
 when MONTH(o.order_date) between 4 and 6 then 'Q2'
 end 
 order by region, Querter;

 ----------------------------------AOV
 SELECT c.region,
 CASE WHEN MONTH(o.order_date) BETWEEN 1 AND 3 THEN 'Q1'
 WHEN MONTH(o.order_date) BETWEEN 4 AND 6 THEN  'Q2'
 END AS Querter,
 SUM(o.quantity * o.unit_price * (1- o.discount_pct)) / COUNT(DISTINCT order_id) as AOV
 FROM orders o
 join customers c on o.customer_id = c.customer_id
 group by region,
 case when MONTH(o.order_date) between 1 and 3 then 'Q1'
 when MONTH(o.order_date) between 4 and 6 then 'Q2'
 end 
 order by region, Querter;