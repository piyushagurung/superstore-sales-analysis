-- Q1: Total revenue & profit by region
-- Which region makes the most money and has the best margins?
SELECT 
  Region,
  ROUND(SUM(Sales), 2) AS total_revenue,
  ROUND(SUM(Profit), 2) AS total_profit,
  ROUND(SUM(Profit) * 100.0 / SUM(Sales), 1) AS profit_margin_pct
FROM sales
GROUP BY Region
ORDER BY total_revenue DESC;

-- Q2: Top 10 products by profit
-- Which specific products should we sell more of?
SELECT 
  "Product Name",
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY "Product Name"
ORDER BY total_profit DESC
LIMIT 10;

-- Q3: Monthly revenue trend
-- Is the business growing? Are there seasonal patterns?
SELECT 
  SUBSTR("Order Date", 1, 7) AS month,
  ROUND(SUM(Sales), 2) AS monthly_revenue,
  COUNT(DISTINCT "Order ID") AS num_orders
FROM sales
GROUP BY month
ORDER BY month;

-- Q4: Profit margin by category
-- Which product category — Furniture, Technology, or Office Supplies — is most profitable?
SELECT 
  Category,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit,
  ROUND(SUM(Profit) * 100.0 / SUM(Sales), 1) AS margin_pct
FROM sales
GROUP BY Category
ORDER BY margin_pct DESC;

-- Q5: Revenue by customer segment
-- Should marketing focus on Consumers, Corporate, or Home Office customers?
SELECT 
  Segment,
  COUNT(DISTINCT "Customer ID") AS customers,
  ROUND(SUM(Sales), 2) AS total_revenue,
  ROUND(AVG(Sales), 2) AS avg_order_value
FROM sales
GROUP BY Segment
ORDER BY total_revenue DESC;

-- Q6: Loss-making sub-categories (problem areas)
-- Which products are actually costing us money?
SELECT 
  "Sub-Category",
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY "Sub-Category"
HAVING total_profit < 0
ORDER BY total_profit ASC;

-- Q7: Revenue by ship mode (operational efficiency)
-- Is the business bigger this year than last year?
SELECT 
  "Ship Mode",
  COUNT(*) AS num_orders,
  ROUND(SUM(Sales), 2) AS total_revenue,
  ROUND(AVG(Sales), 2) AS avg_order_value
FROM sales
GROUP BY "Ship Mode"
ORDER BY total_revenue DESC;

-- Q8: Top 10 states by revenue
-- Are we using the right shipping methods? Does faster shipping mean bigger orders?
SELECT 
  State,
  ROUND(SUM(Sales), 2) AS total_revenue,
  ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY State
ORDER BY total_revenue DESC
LIMIT 10;