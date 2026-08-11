-- 02_null_safe_reporting.sql
-- PostgreSQL
-- Null-safe arithmetic and grouped reporting using a self-contained sample dataset.

WITH transactions(transaction_id, customer_id, status, quantity, unit_price, discount) AS (
    VALUES
        (1, 101, 'completed', 2, 25.00::numeric, 0.10::numeric),
        (2, 102, 'completed', 1, 40.00::numeric, NULL::numeric),
        (3, 101, 'refunded',  1, 25.00::numeric, 0.00::numeric),
        (4, 103, 'completed', 3, NULL::numeric, 0.05::numeric),
        (5, 104, NULL,        2, 15.00::numeric, NULL::numeric)
),
prepared AS (
    SELECT
        transaction_id,
        customer_id,
        COALESCE(status, 'unknown') AS status,
        quantity,
        COALESCE(unit_price, 0) AS unit_price,
        COALESCE(discount, 0) AS discount,
        quantity * COALESCE(unit_price, 0) * (1 - COALESCE(discount, 0)) AS net_value
    FROM transactions
)
SELECT
    status,
    COUNT(*) AS transactions,
    COUNT(DISTINCT customer_id) AS customers,
    ROUND(SUM(net_value), 2) AS net_value,
    ROUND(AVG(net_value), 2) AS avg_transaction_value
FROM prepared
GROUP BY status
ORDER BY net_value DESC;

-- A separate data-quality view makes imputation visible instead of silently hiding missing source values.
WITH transactions(transaction_id, status, quantity, unit_price, discount) AS (
    VALUES
        (1, 'completed', 2, 25.00::numeric, 0.10::numeric),
        (2, 'completed', 1, 40.00::numeric, NULL::numeric),
        (3, 'refunded',  1, 25.00::numeric, 0.00::numeric),
        (4, 'completed', 3, NULL::numeric, 0.05::numeric),
        (5, NULL,        2, 15.00::numeric, NULL::numeric)
)
SELECT
    COUNT(*) FILTER (WHERE status IS NULL) AS missing_status,
    COUNT(*) FILTER (WHERE unit_price IS NULL) AS missing_unit_price,
    COUNT(*) FILTER (WHERE discount IS NULL) AS missing_discount
FROM transactions;
