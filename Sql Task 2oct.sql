select * from customer 

--1) FOR ALL ORDER
Select s.order_id, c.customer_name, p.product_name
 from sales as s
 join customer as c
 on s.customer_id = c.customer_id
 join product as p 
on s.product_id = p.product_id

--2) order from East
Select s.order_id,c.region from sales as s
join customer as c 
on s.customer_id = c.customer_id
where region = 'East'

select * from customer
where region = east

--3
Select s.order_id, c.customer_name, p.product_name, 
s.sales, s.profit
from sales as s 
join customer as c
on s.customer_id = c.customer_id 
join product as p 
on s.product_id = p.product_id 

-- 4didn't placed any order 
Select c.customer_name from customer as c
join sales as s
on c.customer_id = s.customer_id
where order_id is null

-- 5 

Select sum(s.sales) as total_sales,
	sum(s.profit) as Total_profit,
	c.region 
from sales as s 
join customer as c
on s.customer_id = c.customer_id 
group by region

--6 
select c.customer_name, sum(s.sales) as total_sales
from customer as c
join sales as s
on c.customer_id = s.customer_id
group by customer_name
order by total_sales desc
limit 5

--7 

select customer_name from customer 
where city is 

--8 
select p.category,avg(s.sales) 
from product as p 
join sales as s
on p.product_id = s.product_id
group by category

--9 
select ship_date from sales

select p.product_id,s.ship_date
from product as p
join sales as s
on p.product_id = s.product_id 
where ship_date  between '2017-01-01' and '2017-12-30'
order by ship_date