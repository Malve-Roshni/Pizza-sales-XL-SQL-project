CREATE DATABASE IF NOT EXISTS pizzasales;
USE pizzasales; 
SELECT * fROM pizza;

-- Total revenue of the pizza orders --
SELECT SUM(unit_price) AS Total_Revenue 
FROM pizza;

-- Avg value of pizza orders --
SELECT SUM(unit_price) /COUNT(order_id) AS Avg_value_Order
FROM pizza; 

-- Total pizzas sold --
SELECT SUM(quantity) AS Total_pizza_sold
FROM pizza;

-- Total orders placed --
SELECT COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza;

-- Avg pizzas per order --
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/ CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_pizza_orders 
FROM pizza; 

-- % of sales by pizza category --
SELECT pizza_category,SUM(total_price)*100/(SELECT SUM(total_price)FROM pizza) AS Pct_Sales_Category
FROM pizza
GROUP BY pizza_category
ORDER BY Pct_Sales_Category DESC;

-- % of sales by pizza size--
SELECT pizza_size,SUM(total_price)*100/(SELECT SUM(total_price)FROM pizza) AS Pct_Sales_pizzasize
FROM pizza
GROUP BY pizza_size
ORDER BY Pct_Sales_pizzasize DESC;

-- Total pizzas sold by pizza category --
SELECT pizza_category,SUM(quantity) AS Pizza_sold_pizzacategory
FROM pizza
GROUP BY  pizza_category;

-- Top 5 best seller by total pizzas sold --
SELECT pizza_name,SUM(quantity) AS Best_sold_pizza
FROM pizza 
GROUP BY pizza_name 
ORDER BY Best_sold_pizza DESC
LIMIT 5; 

-- Worst 5 best seller by total pizzas sold --
SELECT pizza_name,SUM(quantity) AS Worst_sold_pizza 
FROM pizza 
GROUP BY pizza_name 
ORDER BY Worst_sold_pizza ASC
LIMIT 5; 

