# SQL Learning Portfolio

This directory contains SQL exercises completed during the Primed Talent Data Analyst Bootcamp. It is retained to show progression across relational modelling, reporting logic, data-quality checks, joins, aggregation, date handling, and query optimisation.

## Best examples to review

| Example | What it demonstrates |
|---|---|
| [`Task 1 - Validating Data Consistency with CASE.sql`](Task%201%20-%20Validating%20Data%20Consistency%20with%20CASE.sql) | Uses `CASE` and conditional aggregation to identify missing region data and quantify the scale of a data-quality issue. |
| [`Assignment 1 - The Null-Safe Reporting Query.sql`](Assignment%201%20-%20The%20Null-Safe%20Reporting%20Query.sql) | Uses `COALESCE` to make transaction calculations and reporting fields robust to missing values. |
| [`Schema_Refactoring.sql`](Schema_Refactoring.sql) | Exercises schema design and refactoring rather than treating every analysis as a single flat table. |
| [`Task 2 - Optimizing a Date-Range Query.sql`](Task%202%20-%20Optimizing%20a%20Date-Range%20Query.sql) | Focuses on date filtering and query-performance reasoning. |
| [`queryplan.sql`](queryplan.sql) | Explores query plans and the relationship between SQL structure and execution behaviour. |

## Topics covered

- joins and relational reasoning
- `CASE` expressions and conditional aggregation
- null-safe reporting with `COALESCE`
- date and time logic
- schema creation and refactoring
- segmentation and reporting queries
- indexes, query plans, and optimisation exercises
- introductory NoSQL and time-series activities

## Scope

These files are **bootcamp learning exercises**, not a production SQL codebase. Some preserve classroom scaffolding, sample data, or alternative solutions because the purpose of this directory is to show learning progression transparently.

For polished SQL used inside an end-to-end project, see the [SQL Sales and Customer Analysis](https://github.com/Jorgoluka100/uni_projects/blob/main/02_SQL_Sales_and_Customer_Analysis.ipynb) in my main AI & Data Science portfolio. That project includes source checks, relational grain controls, reconciliation tests, a semantic layer, and verified analytical outputs.
