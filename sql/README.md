# Curated SQL Examples

This folder contains a small set of cleaned PostgreSQL examples distilled from my bootcamp work. The goal is to show the underlying SQL skills clearly without mixing recruiter-facing code with classroom scaffolding, database files, duplicate solutions, or scratch exercises.

| Script | What it demonstrates |
|---|---|
| [`01_data_quality_checks.sql`](01_data_quality_checks.sql) | Missing-value checks, conditional aggregation, duplicate detection, and simple reconciliation. |
| [`02_null_safe_reporting.sql`](02_null_safe_reporting.sql) | `COALESCE`, safe arithmetic, status-aware reporting, and grouped business metrics. |
| [`03_schema_normalisation.sql`](03_schema_normalisation.sql) | Moving from a denormalised design to clients, projects, tasks, and employee assignments with foreign keys. |
| [`04_query_optimisation.sql`](04_query_optimisation.sql) | Sargable date predicates, indexing, `EXPLAIN ANALYZE`, and avoiding functions on indexed filter columns. |

These are intentionally compact learning examples. For a full SQL analytics project with source validation, grain controls, KPI reconciliation, a semantic layer, and automated checks, see [`02_SQL_Sales_and_Customer_Analysis.ipynb`](https://github.com/Jorgoluka100/uni_projects/blob/main/02_SQL_Sales_and_Customer_Analysis.ipynb) in my main AI & Data Science portfolio.

The original bootcamp SQL exercises are preserved on `archive/pre-portfolio-curation-2026-08-11` and in repository history.
