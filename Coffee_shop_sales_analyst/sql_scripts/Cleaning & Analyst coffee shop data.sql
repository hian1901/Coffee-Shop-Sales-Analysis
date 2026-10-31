select * from sales_db_copy;
-- duplicate detection
with duplicate_check as(
select ï»¿transaction_id , 
row_number() over(partition by ï»¿transaction_id,transaction_date,transaction_time,
transaction_qty,store_id,store_location,product_id,unit_price,product_category,product_type,product_detail) as rn
from `coffee shop sales (1)`)
select * from duplicate_check 
where rn > 1;
-- Create duplicate table
Create table sales_db_copy
like `coffee shop sales (1)`;
 insert sales_db_copy 
select * from `coffee shop sales (1)`;
-- update name 
alter table sales_db_copy
rename column ï»¿transaction_id to transaction_id;
-- change format
update sales_db_copy
set  transaction_date = str_to_date(transaction_date,'%m/%d/%Y'),
transaction_time = str_to_date(transaction_time,'%H:%i:%s');
alter table sales_db_copy
modify column  transaction_date date,
modify column  transaction_time time;

-- Caculate revenue
select transaction_qty, unit_price,
(transaction_qty * unit_price ) as revenue
from sales_db_copy;
alter table sales_db_copy
add column revenue double;
update sales_db_copy set revenue = (transaction_qty * unit_price );

select month(transaction_date), round(sum(revenue),2) as total_Revenue
from sales_db_copy
group by 1;

-- MoM Growth
select month(transaction_date),
round(sum(revenue),2) as total_Revenue,
lag(sum(revenue),1,0) over( order by (month(transaction_date))) as last_month_revenue,
round(((sum(revenue) - lag(sum(revenue),1,0) over( order by (month(transaction_date)))) / 
(lag(sum(revenue),1,0) over(order by (month(transaction_date))) )) * 100,2) as MoM
from sales_db_copy
group by 1
order by month(transaction_date) asc;

-- Order per month
select month(transaction_date),
count(*) as total
from sales_db_copy
group by 1;
-- MoM order count growth
select month(transaction_date) as 'month',
count(transaction_id) as 'order',
lag(count(transaction_id),1,0) over(order by month(transaction_date)) as last_order,
((count(transaction_id) - lag(count(transaction_id),1,0) over(order by month(transaction_date)) ) /
lag(count(transaction_id),1,0) over(order by month(transaction_date))) * 100 as MoM_order_growth
from sales_db_copy
group by 1;

-- total quantity & MoM quantity count 
select month(transaction_date),
sum(transaction_qty) as total
from sales_db_copy
group by 1;

select month(transaction_date),
sum(transaction_qty) as total,
((sum(transaction_qty) - lag(sum(transaction_qty),1,0) over(order by month(transaction_date))) / 
lag(sum(transaction_qty),1,0) over( order by month(transaction_date))) * 100 as MoM_order_count
from sales_db_copy
group by 1;

-- Weekday vs. Weekend Revenue
select 
month(transaction_date) as 'month',
case
when dayofweek(transaction_date) in (1,7) then 'weekend'
else 'weekday'
end as day_type,
sum(revenue) as total_revenue
from  sales_db_copy
 group by 1,2 ;

-- revenue of store for month
select store_location,
round(sum(revenue),2) as total
from sales_db_copy
where month(transaction_date) = 5
group by 1;

-- average daily revenue for the month
select 
day(transaction_date) as day,
round(avg(revenue),2) as avg
from sales_db_copy
where month(transaction_date) = 5
group by 1; -- slicer 

-- category renvenue avg
select day(transaction_date),
case 
when  sum(revenue) > avg(revenue)then 'above avg'
when sum(revenue) > avg(revenue) then 'below avg'
else 'average' end as category,
sum(revenue)
from sales_db_copy
where month(transaction_date) = 5
group by 1;

-- Product revenue for month
select product_type,
sum(revenue) as total
from sales_db_copy
where month(transaction_date) = 5 and product_category = 'Coffee' -- slicer
group by 1
order by 2 desc;

select product_category,
sum(revenue) as total
from sales_db_copy
where month(transaction_date) = 5 -- slicer
group by 1
order by 2 desc
limit 10 ;

-- hourly revenue by month
select hour(transaction_time)as 'hour',
sum(revenue)as total
from sales_db_copy
where month(transaction_date) = 5 
group by 1
order by 1 asc;

-- Renvenue day of week
select case
when dayofweek(transaction_date) = 1 then 'Sunday'
when dayofweek(transaction_date) = 2 then 'Monday'
when dayofweek(transaction_date) = 3 then 'Tuesday'
when dayofweek(transaction_date) = 4 then 'Wednesday'
when dayofweek(transaction_date) = 5 then 'Thurday'
when dayofweek(transaction_date) = 6 then 'Friday'
else 'Saturday' end day_of_week,
round(sum(revenue),2) as total
from sales_db_copy
where month(transaction_date) = 5
group by 1 ;