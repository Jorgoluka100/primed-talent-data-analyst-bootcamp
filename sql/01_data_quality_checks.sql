-- 01_data_quality_checks.sql
-- PostgreSQL
-- Compact, self-contained examples of checks I use before trusting analysis.

WITH sales(order_id, customer_id, region, sales, profit) AS (
    VALUES
        (1, 101, 'London', 120.00::numeric, 24.00::numeric),
        (2, 102, NULL,     80.00::numeric, -5.00::numeric),
        (3, 103, 'London', 150.00::numeric, 31.00::numeric),
        (4, 104, '',       90.00::numeric, 10.00::numeric),
        (4, 104, '',       90.00::numeric, 10.00::numeric)
)
SELECT
    COUNT(*) AS row_count,
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_customer_ids,
    COUNT(*) FILTER (WHERE region IS NULL OR BTRIM(region) = '') AS missing_regions,
    COUNT(*) FILTER (WHERE sales < 0) AS negative_sales_rows,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales;

-- Duplicate business keys should be investigated before aggregation.
WITH sales(order_id, customer_id, region, sales, profit) AS (
    VALUES
        (1, 101, 'London', 120.00::numeric, 24.00::numeric),
        (2, 102, NULL,      80.00::numeric, -5.00::numeric),
        (3, 103, 'London', 150.00::numeric, 31.00::numeric),
        (4, 104, '',        90.00::numeric, 10.00::numeric),
        (4, 104, '',        90.00::numeric, 10.00::numeric)
)
SELECT order_id, COUNT(*) AS duplicate_rows
FROM sales
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY duplicate_rows DESC, order_id;

-- Reconcile row-level totals with grouped totals rather than assuming joins/aggregations preserved money.
WITH sales(order_id, region, sales) AS (
    VALUES
        (1, 'London', 120.00::numeric),
        (2, 'Unknown', 80.00::numeric),
        (3, 'London', 150.00::numeric),
        (4, 'Manchester', 90.00::numeric)
),
region_totals AS (
    SELECT region, SUM(sales) AS regional_sales
    FROM sales
    GROUP BY region
)
SELECT
    (SELECT SUM(sales) FROM sales) AS source_total,
    (SELECT SUM(regional_sales) FROM region_totals) AS grouped_total,
    (SELECT SUM(sales) FROM sales) =
    (SELECT SUM(regional_sales) FROM region_totals) AS reconciles;
