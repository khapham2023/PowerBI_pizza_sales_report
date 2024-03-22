select * from pizza_sales;
-- total revenue
select round(sum(total_price),2) total_revenue from pizza_sales;

--Average value per order
select round(sum(total_price)/count(distinct order_id),2) average_value_per_order from pizza_sales; 

--total pizza sold
select sum(quantity) sold_amount from pizza_sales;

--total orders
select count(distinct order_id) total_order from pizza_sales;

--number of orders by week day
select DATENAME(DW,order_date) week_day, count(distinct order_id) total_order from pizza_sales 
group by DATENAME(DW,order_date);

-- number of order by month
select DATENAME(MONTH,order_date) month, count(distinct order_id) total_order from pizza_sales 
group by DATENAME(MONTH,order_date);

-- number of order by quarter
select DATENAME(QUARTER,order_date) quarter, count(distinct order_id) total_order from pizza_sales 
group by DATENAME(QUARTER,order_date);

-- % sales by pizza category
select pizza_category, round(sum(total_price)*100 / (select sum(total_price) from pizza_sales),2) percentage_of_revenue 
from pizza_sales
group by pizza_category;

-- % sales by pizza size
select pizza_size, round(sum(total_price)*100 / (select sum(total_price) from pizza_sales),2) percentage_of_revenue 
from pizza_sales
group by pizza_size;

--top 5 pizzas by revenue
select top 5 pizza_name_id, round(sum(total_price),2) revenue from pizza_sales
group by pizza_name_id
order by revenue desc;


--bottom 5 pizzas by revenue
select top 5 pizza_name_id, round(sum(total_price),2) revenue from pizza_sales
group by pizza_name_id
order by revenue;

--top 5 pizzas by quantity
select top 5 pizza_name_id, sum(quantity) quantity from pizza_sales
group by pizza_name_id
order by quantity desc;

--bottom 5 pizzas by quantity
select top 5 pizza_name_id, sum(quantity) quantity from pizza_sales
group by pizza_name_id
order by quantity;

