create database salesanalysis;
use salesanalysis;

select * from sales_data_analytics_project;


-- Find total sales by region
SELECT region, SUM(total_sales) AS total_sales
FROM sales_data_analytics_project
GROUP BY region;

-- Count total orders by customer segment
SELECT customer_segment, COUNT(order_id) AS total_orders
FROM sales_data_analytics_project
GROUP BY customer_segment;

-- Find total profit by category
SELECT category, SUM(profit) AS total_profit
FROM sales_data_analytics_project
GROUP BY category;

-- Find average discount given per category
SELECT category, AVG(discount) AS avg_discount
FROM sales_data_analytics_project
GROUP BY category;

-- List top 5 highest sales orders
SELECT order_id, total_sales
FROM sales_data_analytics_project
ORDER BY total_sales DESC
LIMIT 5;

-- Find sales where discount is more than 5%
SELECT *
FROM sales_data_analytics_project
WHERE discount > 0.05;


-- Find region-wise profit contribution
SELECT 
    region,
    SUM(profit) AS region_profit,
    ROUND(
        SUM(profit) * 100.0 / (SELECT SUM(profit) FROM sales_data_analytics_project), 2
    ) AS profit_percentage
FROM sales_data_analytics_project
GROUP BY region;

-- Identify best-selling sub-category by quantity
SELECT sub_category, SUM(quantity) AS total_quantity
FROM sales_data_analytics_project
GROUP BY sub_category
ORDER BY total_quantity DESC;

-- Monthly sales trend
SELECT 
    MONTH(order_date) AS month,
    SUM(total_sales) AS monthly_sales
FROM sales_data_analytics_project
GROUP BY MONTH(order_date)
ORDER BY month;

-- Which payment mode generates highest sales?
SELECT payment_mode, SUM(total_sales) AS total_sales
FROM sales_data_analytics_project
GROUP BY payment_mode
ORDER BY total_sales DESC;

-- Find low-profit orders (profit < 5% of sales)
SELECT *,
       (profit / total_sales) * 100 AS profit_margin
FROM sales_data_analytics_project
WHERE (profit / total_sales) * 100 < 5;