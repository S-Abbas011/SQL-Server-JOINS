
select * from customer 

### 1.Write a query to display OrderID, CustomerName, and ProductName for all orders.

```SQL

Select s.order_id, c.customer_name, p.product_name
 from sales as s
 join customer as c
 on s.customer_id = c.customer_id
 join product as p 
on s.product_id = p.product_id
```

--2.Display all orders placed by customers who belong to the East region.
Select s.order_id,c.region from sales as s
join customer as c 
on s.customer_id = c.customer_id
where region = 'East'

select * from customer
where region = east

--3.Retrieve OrderID, CustomerName, ProductName, Sales, and Profit by joining Customers, Orders, and Products.
Select s.order_id, c.customer_name, p.product_name, 
s.sales, s.profit
from sales as s 
join customer as c
on s.customer_id = c.customer_id 
join product as p 
on s.product_id = p.product_id 

--4.Find all customers who have not placed any orders.
Select c.customer_name from customer as c
join sales as s
on c.customer_id = s.customer_id
where order_id is null

-- 5.For each Region, calculate the total Sales and total Profit.

Select sum(s.sales) as total_sales,
	sum(s.profit) as Total_profit,
	c.region 
from sales as s 
join customer as c
on s.customer_id = c.customer_id 
group by region

--6.List the top 5 customers by total Sales amount.
select c.customer_name, sum(s.sales) as total_sales
from customer as c
join sales as s
on c.customer_id = s.customer_id
group by customer_name
order by total_sales desc
limit 5

--7.Display pairs of customers who are from the same City.

select customer_name from customer 
where city is 

--8.For each Product Category, find the average Sales per Product.
select p.category,avg(s.sales) 
from product as p 
join sales as s
on p.product_id = s.product_id
group by category

-- 9.Retrieve all orders with product details that were shipped in the year 2024.

select p.product_id,s.ship_date
from product as p
join sales as s
on p.product_id = s.product_id 
where ship_date  between '2017-01-01' and '2017-12-30'
order by ship_date

--10.Find all Categories where the total Profit is negative.
Select 
	p.category,
	sum(s.profit) as total_profit
from product as p 
join sales as s 
on p.product_id = s.product_id
group by category 
having sum(s.profit) < 0 
