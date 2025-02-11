create database superstore_etl;
use superstore_etl;

-- creating a new table with datatypes
create table sales (
	id int primary key,
	ship_mode varchar(50),
    segment varchar(50),
    country varchar(50),
    city varchar(50),
    state varchar(50),
    postal_code int,
    region varchar(50),
    category varchar(50),
    sub_category varchar(50),
    sales decimal(10,4),
    quantity int,
    discount decimal(10,4),
    profit decimal(10,4)
);

select * from df;

-- inserting into the sales table with datatypes
insert into sales 
	(select * from df );

select * from sales;

-- find the top 5 highest revenue generating products
select sub_category, round(sum(sales),2) as revenue from sales
group by sub_category
order by revenue desc
limit 5;

-- find the top 5 highest selling product in each region
with cte as (
select region, sub_category, sum(sales) as revenue
from sales
group by region, sub_category)
select * from
(select *,
	row_number() over(partition by region order by revenue desc) as rn
from cte) as t1
where rn <= 5;
select * from sales;

-- find segment comparison for ship_mode revenue
with cte as (
select segment, ship_mode, sum(sales) as revenue from sales
group by segment, ship_mode)
select * from
	(select *,
		rank() over(partition by segment order by revenue desc) as rn
	from cte) as t1
where rn <= 2;

-- for each segment which category had the highest revenue
with cte as 
(select segment, sub_category, sum(sales) as revenue
from sales
group by segment, sub_category)
select * from
	(select *,
		row_number() over(partition by segment order by revenue desc) as rn
	from cte) as t1
where rn = 1;


-- which category had the highest profit?
select category, sum(profit) as total_profit
from sales
group by category
order by total_profit desc;