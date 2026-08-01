-- =========================================================
-- Project: Customer Shopping Behavior Analysis
-- Author: T. Prashanth
-- Database: MySQL
-- Description:
-- Business analysis using SQL on customer shopping data.
-- =========================================================


-- =========================================================
-- DATABASE SETUP
-- =========================================================

CREATE DATABASE customer_shopping_analysis;

USE customer_shopping_analysis;

CREATE TABLE customer_shopping (
    customer_id INT,
    age INT,
    gender VARCHAR(10),
    item_purchased VARCHAR(50),
    category VARCHAR(30),
    purchase_amount INT,
    location VARCHAR(50),
    size VARCHAR(10),
    color VARCHAR(30),
    season VARCHAR(20),
    review_rating DECIMAL(3,2),
    subscription_status VARCHAR(10),
    shipping_type VARCHAR(30),
    discount_applied VARCHAR(5),
    promo_code_used VARCHAR(5),
    previous_purchases INT,
    payment_method VARCHAR(30),
    frequency_of_purchases VARCHAR(30)
);

-- Verify imported data

SELECT *
FROM customer_shopping
LIMIT 10;


-- =========================================================
-- BUSINESS KPIs
-- =========================================================

-- Question 1:
-- What is the total revenue generated?

SELECT
    SUM(purchase_amount) AS total_revenue
FROM customer_shopping;


-- Question 2:
-- What is the average purchase amount?

SELECT
    ROUND(AVG(purchase_amount),2) AS average_purchase
FROM customer_shopping;


-- Question 3:
-- How many unique customers are there?

SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM customer_shopping;


-- =========================================================
-- REVENUE ANALYSIS
-- =========================================================

-- Question 4:
-- Which product categories generate the highest revenue?

SELECT
    category,
    SUM(purchase_amount) AS total_revenue
FROM customer_shopping
GROUP BY category
ORDER BY total_revenue DESC;


-- Question 5:
-- Which gender generates the highest revenue?

SELECT
    gender,
    SUM(purchase_amount) AS total_revenue
FROM customer_shopping
GROUP BY gender
ORDER BY total_revenue DESC;


-- Question 6:
-- Which season generates the highest revenue?

SELECT
    season,
    SUM(purchase_amount) AS total_revenue
FROM customer_shopping
GROUP BY season
ORDER BY total_revenue DESC;


-- Question 7:
-- Which states generate the highest revenue?

SELECT
    location,
    SUM(purchase_amount) AS total_revenue
FROM customer_shopping
GROUP BY location
ORDER BY total_revenue DESC
LIMIT 10;


-- =========================================================
-- CUSTOMER ANALYSIS
-- =========================================================

-- Question 8:
-- How many customers have an active subscription?

SELECT
    subscription_status,
    COUNT(*) AS total_customers
FROM customer_shopping
GROUP BY subscription_status;


-- Question 9:
-- Do subscribed customers spend more on average?

SELECT
    subscription_status,
    ROUND(AVG(purchase_amount),2) AS average_purchase
FROM customer_shopping
GROUP BY subscription_status;


-- Question 10:
-- Which age groups generate the highest revenue?

SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS age_group,
    SUM(purchase_amount) AS total_revenue
FROM customer_shopping
GROUP BY age_group
ORDER BY total_revenue DESC;


-- Question 11:
-- Who are the top 10 highest-spending customers?

SELECT
    customer_id,
    SUM(purchase_amount) AS total_spent
FROM customer_shopping
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;


-- =========================================================
-- PRODUCT ANALYSIS
-- =========================================================

-- Question 12:
-- Which products are purchased most frequently?

SELECT
    item_purchased,
    COUNT(*) AS total_purchases
FROM customer_shopping
GROUP BY item_purchased
ORDER BY total_purchases DESC
LIMIT 10;


-- Question 13:
-- What is the average customer review rating by category?

SELECT
    category,
    ROUND(AVG(review_rating),2) AS average_rating
FROM customer_shopping
GROUP BY category
ORDER BY average_rating DESC;


-- Question 14:
-- Which product categories generate the most revenue for each gender?

SELECT
    gender,
    category,
    SUM(purchase_amount) AS total_revenue
FROM customer_shopping
GROUP BY gender, category
ORDER BY gender, total_revenue DESC;


-- =========================================================
-- OPERATIONS ANALYSIS
-- =========================================================

-- Question 15:
-- Which payment methods are used most frequently?

SELECT
    payment_method,
    COUNT(*) AS total_transactions
FROM customer_shopping
GROUP BY payment_method
ORDER BY total_transactions DESC;


-- Question 16:
-- Which payment method generates the highest revenue?

SELECT
    payment_method,
    SUM(purchase_amount) AS total_revenue
FROM customer_shopping
GROUP BY payment_method
ORDER BY total_revenue DESC;


-- Question 17:
-- Which shipping methods are most popular?

SELECT
    shipping_type,
    COUNT(*) AS total_orders
FROM customer_shopping
GROUP BY shipping_type
ORDER BY total_orders DESC;


-- Question 18:
-- Which shipping method generates the highest revenue?

SELECT
    shipping_type,
    SUM(purchase_amount) AS total_revenue
FROM customer_shopping
GROUP BY shipping_type
ORDER BY total_revenue DESC;


-- =========================================================
-- ADVANCED BUSINESS ANALYSIS
-- =========================================================

-- Question 19:
-- Which season generates the highest average purchase amount?

SELECT
    season,
    ROUND(AVG(purchase_amount),2) AS average_purchase
FROM customer_shopping
GROUP BY season
ORDER BY average_purchase DESC;


-- Question 20:
-- Which season and category combinations generate the highest revenue?

SELECT
    season,
    category,
    SUM(purchase_amount) AS total_revenue
FROM customer_shopping
GROUP BY season, category
ORDER BY total_revenue DESC;