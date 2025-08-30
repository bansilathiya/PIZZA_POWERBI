select * from pizza_sales

select SUM(total_price) AS Total_revenue from pizza_sales

select SUM(total_price)/COUNT(distinct order_id)as Avg_Order_Value from pizza_sales

select SUM(quantity)as Total_Pizza_Sold from pizza_sales

select COUNT(distinct order_id)as Total_Orders from pizza_sales

select CAST(SUM(quantity)as decimal(10,2))/
CAST (COUNT(distinct order_id)as decimal (10,2))as Average_Pizzas_Per_Order from pizza_sales

select DATENAME(DW, order_date)as order_day, COUNT(distinct order_id) 
as Total_Orders from pizza_sales
group by DATENAME(DW, order_date)

select DATENAME(MONTH,order_date)as Month_Name, COUNT(distinct order_id)
as Total_Orders from pizza_sales 
group by DATENAME(MONTH,order_date)
order by Total_Orders desc

select pizza_size,CAST (SUM(total_price)As decimal (10,2)) as Total_Sales,CAST(SUM(total_price)*100/
(select SUM(total_price) from pizza_sales where datepart(quarter,Order_date)=1 )  as decimal (10,2))as PCT
from pizza_sales
 where datepart(quarter,Order_date)=1
group by pizza_size
order by PCT DESC

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

select top 5 pizza_name, SUM(total_price)as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue desc

select top 5 pizza_name, SUM(quantity)as Total_Quantity from pizza_sales
group by pizza_name
order by Total_Quantity desc

select top 5 pizza_name, count(distinct order_id)as Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders desc
