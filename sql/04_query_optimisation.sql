-- 04_query_optimisation.sql
-- PostgreSQL
-- Demonstrates a sargable date-range query and how to inspect the plan before/after indexing.

DROP TABLE IF EXISTS portfolio_payments;

CREATE TABLE portfolio_payments (
    payment_id     bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id    integer NOT NULL,
    amount         numeric(10,2) NOT NULL CHECK (amount >= 0),
    payment_date   timestamp NOT NULL
);

-- Deterministic sample data covering roughly one year.
INSERT INTO portfolio_payments (customer_id, amount, payment_date)
SELECT
    1 + (g % 500)::integer AS customer_id,
    ROUND((10 + (g % 190) * 0.75)::numeric, 2) AS amount,
    TIMESTAMP '2026-01-01 00:00:00' + (g * INTERVAL '30 minutes') AS payment_date
FROM generate_series(0, 17519) AS g;

ANALYZE portfolio_payments;

-- Baseline plan. A half-open interval avoids end-of-day timestamp mistakes.
EXPLAIN (ANALYZE, BUFFERS)
SELECT payment_id, customer_id, amount, payment_date
FROM portfolio_payments
WHERE payment_date >= TIMESTAMP '2026-03-01 00:00:00'
  AND payment_date <  TIMESTAMP '2026-04-01 00:00:00'
ORDER BY payment_date;

CREATE INDEX idx_portfolio_payments_payment_date
    ON portfolio_payments (payment_date);

ANALYZE portfolio_payments;

-- Re-run the same query and compare the plan/costs.
EXPLAIN (ANALYZE, BUFFERS)
SELECT payment_id, customer_id, amount, payment_date
FROM portfolio_payments
WHERE payment_date >= TIMESTAMP '2026-03-01 00:00:00'
  AND payment_date <  TIMESTAMP '2026-04-01 00:00:00'
ORDER BY payment_date;

-- Aggregate after filtering. Keep the indexed filter column unwrapped in WHERE.
SELECT
    payment_date::date AS payment_day,
    COUNT(*) AS transactions,
    ROUND(SUM(amount), 2) AS daily_revenue,
    ROUND(AVG(amount), 2) AS avg_transaction_value
FROM portfolio_payments
WHERE payment_date >= TIMESTAMP '2026-03-01 00:00:00'
  AND payment_date <  TIMESTAMP '2026-04-01 00:00:00'
GROUP BY payment_date::date
ORDER BY payment_day;
