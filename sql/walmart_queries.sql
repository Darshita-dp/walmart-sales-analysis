-- =========================================================
-- Walmart Sales Analysis - PostgreSQL Script
-- Author: Darshita Patel
-- Purpose:
--   Clean, readable SQL queries for exploratory analysis and
--   business-focused analysis on the walmart table.
-- =========================================================


-- =========================================================
-- 0) Basic sanity checks
-- =========================================================

SELECT *
FROM walmart
LIMIT 10;

SELECT COUNT(*) AS total_rows
FROM walmart;

SELECT COUNT(DISTINCT branch) AS distinct_branch_count
FROM walmart;

SELECT MIN(quantity) AS minimum_quantity_sold
FROM walmart;


-- =========================================================
-- 1) Payment method summary
-- Find different payment methods and number of transactions
-- =========================================================

SELECT
    payment_method,
    COUNT(*) AS transaction_count
FROM walmart
GROUP BY payment_method
ORDER BY transaction_count DESC;


-- =========================================================
-- 2) Payment method summary with quantity sold
-- Find different payment methods, number of transactions,
-- and total quantity sold
-- =========================================================

SELECT
    payment_method,
    COUNT(*) AS payment_count,
    SUM(quantity) AS total_quantity_sold
FROM walmart
GROUP BY payment_method
ORDER BY total_quantity_sold DESC;


-- =========================================================
-- 3) Highest-rated category in each branch
-- Identify the highest-rated category in each branch using
-- average rating
-- =========================================================

SELECT
    ranked_categories.branch,
    ranked_categories.category,
    ranked_categories.avg_rating
FROM (
    SELECT
        branch,
        category,
        AVG(rating) AS avg_rating,
        RANK() OVER (
            PARTITION BY branch
            ORDER BY AVG(rating) DESC
        ) AS category_rank
    FROM walmart
    GROUP BY branch, category
) AS ranked_categories
WHERE ranked_categories.category_rank = 1
ORDER BY ranked_categories.branch, ranked_categories.category;


-- =========================================================
-- 4) Busiest day for each branch
-- Identify the busiest day based on number of transactions
-- =========================================================

SELECT
    ranked_days.branch,
    ranked_days.day_name,
    ranked_days.transaction_count
FROM (
    SELECT
        branch,
        TO_CHAR(TO_DATE(date, 'DD/MM/YY'), 'Day') AS day_name,
        COUNT(*) AS transaction_count,
        RANK() OVER (
            PARTITION BY branch
            ORDER BY COUNT(*) DESC
        ) AS day_rank
    FROM walmart
    GROUP BY branch, TO_CHAR(TO_DATE(date, 'DD/MM/YY'), 'Day')
) AS ranked_days
WHERE ranked_days.day_rank = 1
ORDER BY ranked_days.branch;


-- =========================================================
-- 5) Total quantity sold per payment method
-- =========================================================

SELECT
    payment_method,
    SUM(quantity) AS total_quantity_sold
FROM walmart
GROUP BY payment_method
ORDER BY total_quantity_sold DESC;


-- =========================================================
-- 6) Rating summary by city and category
-- Determine average, minimum, and maximum rating for each
-- city-category combination
-- =========================================================

SELECT
    city,
    category,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating,
    ROUND(AVG(rating)::numeric, 2) AS avg_rating
FROM walmart
GROUP BY city, category
ORDER BY city, category;


-- =========================================================
-- 7) Total revenue and profit by category
-- Profit is calculated as: total * profit_margin
-- Since total = unit_price * quantity
-- =========================================================

SELECT
    category,
    ROUND(SUM(total)::numeric, 2) AS total_revenue,
    ROUND(SUM(total * profit_margin)::numeric, 2) AS total_profit
FROM walmart
GROUP BY category
ORDER BY total_profit DESC;


-- =========================================================
-- 8) Most common payment method for each branch
-- =========================================================

WITH branch_payment_counts AS (
    SELECT
        branch,
        payment_method,
        COUNT(*) AS total_transactions,
        RANK() OVER (
            PARTITION BY branch
            ORDER BY COUNT(*) DESC
        ) AS payment_rank
    FROM walmart
    GROUP BY branch, payment_method
)
SELECT
    branch,
    payment_method AS preferred_payment_method,
    total_transactions
FROM branch_payment_counts
WHERE payment_rank = 1
ORDER BY branch;


-- =========================================================
-- 9) Sales shift analysis
-- Categorize sales into Morning, Afternoon, Evening
-- and count invoices for each shift by branch
-- =========================================================

SELECT
    branch,
    CASE
        WHEN EXTRACT(HOUR FROM time::time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM time::time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS day_shift,
    COUNT(*) AS invoice_count
FROM walmart
GROUP BY
    branch,
    CASE
        WHEN EXTRACT(HOUR FROM time::time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM time::time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END
ORDER BY branch, invoice_count DESC;


-- =========================================================
-- 10) Branches with highest revenue decrease ratio
-- Compare revenue in 2023 vs 2022
-- Formula:
--   revenue_decrease_ratio = ((last_year_revenue - current_year_revenue)
--                             / last_year_revenue) * 100
-- =========================================================

WITH revenue_2022 AS (
    SELECT
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE EXTRACT(YEAR FROM TO_DATE(date, 'DD/MM/YY')) = 2022
    GROUP BY branch
),
revenue_2023 AS (
    SELECT
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE EXTRACT(YEAR FROM TO_DATE(date, 'DD/MM/YY')) = 2023
    GROUP BY branch
)
SELECT
    previous_year.branch,
    ROUND(previous_year.revenue::numeric, 2) AS last_year_revenue,
    ROUND(current_year.revenue::numeric, 2) AS current_year_revenue,
    ROUND(
        (
            (previous_year.revenue - current_year.revenue)::numeric
            / previous_year.revenue::numeric
        ) * 100,
        2
    ) AS revenue_decrease_ratio_pct
FROM revenue_2022 AS previous_year
JOIN revenue_2023 AS current_year
    ON previous_year.branch = current_year.branch
WHERE previous_year.revenue > current_year.revenue
ORDER BY revenue_decrease_ratio_pct DESC
LIMIT 5;


-- =========================================================
-- 11) Extra query: Revenue by branch
-- Useful for dashboarding and summary insight
-- =========================================================

SELECT
    branch,
    ROUND(SUM(total)::numeric, 2) AS total_revenue
FROM walmart
GROUP BY branch
ORDER BY total_revenue DESC;


-- =========================================================
-- 12) Extra query: Profit by branch
-- Useful for dashboarding and summary insight
-- =========================================================

SELECT
    branch,
    ROUND(SUM(total * profit_margin)::numeric, 2) AS total_profit
FROM walmart
GROUP BY branch
ORDER BY total_profit DESC;


-- =========================================================
-- 13) Extra query: Top categories by revenue
-- Useful for quick business summary
-- =========================================================

SELECT
    category,
    ROUND(SUM(total)::numeric, 2) AS total_revenue
FROM walmart
GROUP BY category
ORDER BY total_revenue DESC;


-- =========================================================
-- 14) Extra query: Average transaction value by branch
-- Useful for comparing branch-level customer spend
-- =========================================================

SELECT
    branch,
    ROUND(AVG(total)::numeric, 2) AS avg_transaction_value
FROM walmart
GROUP BY branch
ORDER BY avg_transaction_value DESC;


-- =========================================================
-- 15) Extra query: Average rating by branch
-- Useful for combining performance + customer satisfaction
-- =========================================================

SELECT
    branch,
    ROUND(AVG(rating)::numeric, 2) AS avg_branch_rating
FROM walmart
GROUP BY branch
ORDER BY avg_branch_rating DESC;
