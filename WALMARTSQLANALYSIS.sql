CREATE Database Walmart_Sales_data_analysis; 

CREATE TABLE Sales_data(
	invoice_id VARCHAR(30) Not null Primary key,
    branch VARCHAR(5) Not null,
    city VARCHAR(30) Not null,
    customer_type VARCHAR(30) Not null,
    gender VARCHAR(10) Not null,
    product_line VARCHAR(100) Not null,
    unit_price DECIMAL(10, 2) Not null,
    quantity INT Not null,
    VAT FLOAT(6,4) Not null,
    total DECIMAL(12,4) Not null,
    date DATETIME Not null,
    time Time Not null,
    payment_method VARCHAR(15) Not null,
    cogs DECIMAL(10,2) Not null,
    gross_margin_pct FLOAT(11),
    gross_income DECIMAL(12, 4) Not null,
    rating FLOAT(2, 1)
);
    
    SELECT * FROM Sales_data;
    
---------------------------------------------------------------------------------------------------
-- --------------------------------Feature Engineering ------------------------------------------------    
-- Add column time_of_day

SELECT 
	time,
	CASE
		WHEN 'time' BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
		WHEN 'time' BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
	END
     AS time_of_date		 
FROM sales_data;

ALTER TABLE sales_data ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales_data
SET time_of_day = 
    CASE
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END;

-- Name of day
SELECT 
	date,
    dayname(date) AS day_name
FROM Sales_data;

ALTER TABLE sales_data ADD COLUMN day_name VARCHAR(10);
UPDATE sales_data
SET day_name = dayname(date);

-- month_name

SELECT
	date,
    monthname(date) AS month_name
FROM sales_data;

ALTER TABLE sales_data ADD COLUMN month_name VARCHAR(15);

UPDATE sales_data
SET month_name = monthname(date);

-- ------------------------------------------------------------------------------------------------------
-- ----------------------------------------Generic Question----------------------------------------------------------

-- 1. How many unique cities does the data have?

SELECT
	DISTINCT city
FROM sales_data;

-- 2. In which city is each branch?
SELECT 
	DISTINCT branch
FROM sales_data;

SELECT 
	DISTINCT city,
    branch
FROM sales_data;

-- ----------------------------------------------------------------------------------------------------------------------------------
-- -----------------------------------PRODUCT INSIGHT------------------------------------------------------------------------
-- 1. How many unique product lines does the data have?
SELECT 
	DISTINCT product_line
FROM sales_data;

-- 2. Most common payment method
SELECT 
	payment_method,
	COUNT(payment_method) AS cnt
FROM sales_data
GROUP BY payment_method
ORDER BY cnt DESC;

-- 3. What is the most selling product_line?
SELECT 
	product_line,
	COUNT(product_line) AS cnt
FROM sales_data
GROUP BY product_line
ORDER BY cnt DESC;

-- 4. What is the total revenue by month?
SELECT
	month_name AS month,
	SUM(total) AS total_revenue
FROM sales_data
GROUP BY month_name
ORDER BY total_revenue DESC;

-- 5. What month had the largest COGS? 
SELECT 
	month_name AS month,
    SUM(cogs) AS cogs
FROM sales_data
GROUP BY month_name
ORDER BY cogs DESC;

-- 6. What product_line had the largest revene
SELECT 
	SUM(total) AS total_revenue,
    product_line
FROM sales_data
GROUP BY product_line
ORDER BY total_revenue DESC;

-- 7. City with the largest revenue?
SELECT 
	SUM(total) AS total_revenue,
    city,
    branch
FROM sales_data
GROUP BY city, branch
ORDER BY total_revenue DESC;

-- 8. What product line had the highest VAT?
SELECT 
	product_line,
    AVG(VAT) AS avg_tax
FROM sales_data
GROUP BY product_line
ORDER BY avg_tax DESC;

-- 9. Which branch sold more than average products sold?
 SELECT 
	branch,
    SUM(quantity) AS qty
FROM sales_data
GROUP BY branch 
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales_data);

-- 10. What is the most common product line by gender?
SELECT 
	gender,
    product_line,
	COUNT(gender) AS total_count
FROM sales_data
GROUP BY gender, product_line
ORDER BY total_count DESC;

-- 11. What is the average rating of each product_line?
SELECT 
	product_line,
    round(AVG(rating), 2) AS avg_rating
FROM sales_data
GROUP BY product_line
ORDER BY avg_rating DESC;

-- -------------------------------------------------------------------------------------------------------
-- --------------------------Sales Analysis ---------------------------------------------------------------

-- 1. Number of sales made in each time of the day per weekday
SELECT 
	time_of_day,
    COUNT(*) AS total_sales
FROM sales_data
WHERE day_name = 'Sunday'
GROUP BY time_of_day
ORDER BY total_sales DESC;

-- 2. Number of customer types brings the most revenue
SELECT
	customer_type,
    SUM(total) AS total_revenue
FROM sales_data
GROUP BY customer_type
ORDER BY total_revenue DESC;

-- 3. Which city has the largest tax percent/VAT?
SELECT 
	city,
    AVG(VAT) AS VAT
FROM sales_data
GROUP BY city
ORDER BY VAT DESC;

-- 4. Which customer type pays the most in VAT?
SELECT 
	customer_type,
    AVG(VAT) AS VAT
FROM sales_data
GROUP BY customer_type
ORDER BY VAT DESC;

-- ---------------------------------------------------------------------------------------------------------------------
-- ----------------------------Customer Analysis -----------------------------------------------------------------------

-- 1. How many unique customer types does the data have?
SELECT 
	DISTINCT (customer_type)
FROM sales_data;

-- 2. How many unique payment methos does the data have?
SELECT 
	DISTINCT(payment_method)
FROM sales_data;

-- 3. What is the gender of most of the customers?
SELECT 
	gender,
    COUNT(*) AS gender_cnt
FROM sales_data
GROUP BY gender
ORDER BY gender_cnt;

-- 4. What is the gender distribution per branch?
SELECT 
	gender,
    COUNT(*) AS gender_cnt
FROM sales_data
WHERE branch = "C"
GROUP BY gender
ORDER BY gender_cnt;

-- 5. Which time of the day do customers give most ratings?
SELECT
	time_of_day,
    AVG(rating) AS avg_rating
FROM sales_data
GROUP BY time_of_day
ORDER BY avg_rating;

-- 6. Which time of the day do customers give most rating per branch?
SELECT
	time_of_day,
    AVG(rating) AS avg_rating
FROM sales_data
WHERE branch = "C"
GROUP BY time_of_day
ORDER BY avg_rating;

-- 7. Which day of the week has the best Avg rating?
SELECT
	day_name,
    AVG(rating) AS avg_rating
FROM sales_data
GROUP BY day_name
ORDER BY avg_rating DESC;

-- 8. Which day of the week has the best average ratings per branch?
SELECT
	day_name,
    AVG(rating) AS avg_rating
FROM sales_data
WHERE branch = "A"
GROUP BY day_name
ORDER BY avg_rating DESC;






