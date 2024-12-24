select * from [dbo].[Order]

---whats brand name 
select distinct (brand_name)#brand_name 
from [dbo].[Order]

--- whats product name 
select distinct (product_name)#product_name 
from [dbo].[Order]

---total qunatity
select count  (total_units)#quantity
from [dbo].[Order]

-- no of sales rep 
select  count (distinct sales_rep)#sales_rep 
from [dbo].[Order]

--- store name 
select distinct (store_name)#store_name 
from [dbo].[Order]

--- categroy name 
select distinct (category_name)#cotagory_name 
from [dbo].[Order]

-- no of customers 
select count( distinct customers )#customer
from [dbo].[Order]

--- whats city 
select distinct (city)#city 
from [dbo].[Order]

-- state 
select distinct (state)#state 
from [dbo].[Order]

---- no of orders 
select  count (distinct order_id )#orders 
from [dbo].[Order]


--- total - averege - max- min (revenue)

select sum (revenue)t_rev,
max(revenue)max_rev,
min (revenue)min_rev,
avg(revenue)v_rev
from [dbo].[Order]

-------max - min  order date 
select max (order_date)max_date,
min (order_date)min_date
from [dbo].[Order]

--- total quantity per city and product name 
select city,product_name ,count(distinct total_units)#q_per_city 
 from [dbo].[Order]
group by city ,product_name

--- total unit per state 
select state ,count(distinct total_units)#q_per_city 
 from [dbo].[Order]
group by state

--- tolal rev per state 
select state ,sum (revenue)#rev_state 
 from [dbo].[Order]
group by state

-- total rev per city 
select city ,sum (revenue)#rev_state 
 from [dbo].[Order]
group by city

--- total rev per brand name
select brand_name ,sum(revenue)#rev_state 
 from [dbo].[Order]
group by  brand_name 

---- total rev per category
select category_name ,sum(revenue)#rev_state 
 from [dbo].[Order]
group by category_name

--- total rev per product 
select product_name ,sum(revenue)#rev_state 
 from [dbo].[Order]
group by product_name


-- total rev per sales rep
select sales_rep ,sum(revenue)#rev_state 
 from [dbo].[Order]
group by sales_rep

-- Top 5 Products by revenue
Select Top(10) O.product_name Top_5_Products , Sum(O.revenue) Total
From Orders O
Group by O.product_name
Order by 2 DESC


-- Bottom 5 Products by revenue
Select Top(5) Product_name Bottom_5_Products, Sum(Revenue) Total
From Orders
Group by product_name
Order by 2 ASC
-- #orders by Brand_name
Select Brand_name, Count(Distinct Order_id) '#Orders'
From Orders
Where state != 'CA'
Group by brand_name
Having Count(Distinct Order_id) >=400
Order by [#Orders] DESC


-- Total Quantity by store_name
-- Total Quantity by store_name and brand_name
Select O.store_name , O.brand_name, sum(O.total_units) 'Total Quantity'
From Orders O
Where O.store_name = 'Santa Cruz Bikes'
Group by O.store_name, O.brand_name
Having sum(O.total_units) <200
Order by store_name





