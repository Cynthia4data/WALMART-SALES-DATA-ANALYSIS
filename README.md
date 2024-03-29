# WALMART-SALES-DATA-ANALYSIS

About

This project aims to explore Walmart Sales data to understand product,
branches and customer behavior. It also aims to study how sales
strategies can be improved. The data set was obtained from [[Walmart
Sales Forecasting
Competition]{.underline}.](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting)

Purposes of The Project

The major aim of this project is to derive more insights into the sales
data of Walmart to understand the different factors that affect sales of
the different branches.

About Data

The dataset was obtained from [[Walmart Sales Forecasting
Competition]{.underline}](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting)
. This dataset contains transactions from three different branches of
Walmart: Mandalay, Yangon and Naypayita. The data contains 17 columns
and 1000 rows.

| Column  | Decription | Data Type|
| :------------ |:---------------| :-----|
| invoice_id	| Invoice of the sales made	| VARCHAR(30)
| branch	| Branch where the sales was made	| VARCHAR(5)
| city	| The location of the branch	| VARCHAR(30)
| customer_type	| The type of the customer	| VARCHAR(30)
| gender	| Customer’s gender	| VARCHAR(10)
| Product_line	| Product line of the product sold	| VARCHAR(100)
| unit_price	| The price of each product	| DECIMAL(10, 2)
| quantity	| The amount of product sold	| INT
| VAT	| The amount of tax on the purchase	| FLOAT(6,4)
| total	| The total cost of the purchase	| DECIMAL(10,2)
| date	| The date of purchase	| DATE
| time	| The time of purchase	| TIMESTAMP
| payment_method	| The total amount paid	| DECIMAL(10,2)
| cogs	| Cost of goods sold	| DECIMAL(10,2)
| gross_margin_percentage	| Gross margin percentage	| FLOAT(11,9)
| gross_income	| Gross income	| DECIMAL(10,2)
| rating	| Rating	| FLOAT(2,1)


**TOOL** **USED:** MySQL

**Exploratory** **Data** **Analysis**

> 1\. Product Analysis

Conduct analysis on the data to understand the different product lines,
the products lines performing best and the product lines that need to be
improved.

> 2\. Sales Analysis

This analysis aims to answer the question of the sales trends of
product. The result of this can help use measure the effectiveness of
each sales strategy the business applies and what modifications are
needed to gain more sales.

> 3\. Customer Analysis

This analysis aims to uncover the different customers segments, purchase
trends and the profitability of each customer segment.

**Approach** **Used**

> 1\. **Data** **Wrangling:** This is the first step where inspection of
> data is done to make sure **NULL** values and missing values are
> detected and data replacement methods are used to replace, missing or
> **NULL** values.
>
> Build a database
>
> Create table sales_data and insert the data.
>
> 2\. **Feature** **Engineering:** This will help use generate some new
> columns from existing ones.
>
> a\. Add a new column named time_of_dayto give insight of sales in the
> Morning, Afternoon and Evening. This will help answer the question on
> which part of the day most sales are made.
>
> b\. Add a new column named day_namethat contains the extracted days of
> the week on which the given transaction took place (Mon, Tue, Wed,
> Thur, Fri). This will help answer the question on which week of the
> day each branch is busiest.
>
> c\. Add a new column named month_namethat contains the extracted
> months of the year on which the given transaction took place (Jan,
> Feb, Mar). Help determine which month of the year has the most sales
> and profit.

**Business** **Questions** **Answered**

**Generic** **Question**

> 1\. How many unique cities does the data have? 2. In which city is
> each branch?

**Product**

> 1\. How many unique product lines does the data have? 2. What is the
> most common payment method?
>
> 3\. What is the most selling product line? 4. What is the total
> revenue by month? 5. What month had the largest COGS?
>
> 6\. What product line had the largest revenue? 7. What is the city
> with the largest revenue? 8. What product line had the largest VAT?
>
> 9\. Which branch sold more products than average product sold? 10.What
> is the most common product line by gender?
>
> 11.What is the average rating of each product line?

**Sales**

> 1\. Number of sales made in each time of the day per weekday 2. Which
> of the customer types brings the most revenue?
>
> 3\. Which city has the largest tax percent/ VAT (**Value** **Added**
> **Tax**)? 4. Which customer type pays the most in VAT?

**Customer**

> 1\. How many unique customer types does the data have?
>
> 2\. How many unique payment methods does the data have? 3. What is the
> gender of most of the customers?
>
> 4\. What is the gender distribution per branch?
>
> 5\. Which time of the day do customers give most ratings?
>
> 6\. Which time of the day do customers give most ratings per branch?
> 7. Which day fo the week has the best avg ratings?
>
> 8\. Which day of the week has the best average ratings per branch?
