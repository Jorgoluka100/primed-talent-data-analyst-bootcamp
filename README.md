# Data Analyst Portfolio

## Jorgo Luka

This is my **analyst-focused supporting portfolio**, containing projects originally developed through structured training and then retained as evidence of the core analyst workflow: **cleaning data, defining useful metrics, writing SQL, building reports, validating results and explaining what the numbers mean**.

[![Analyst portfolio integrity](https://github.com/Jorgoluka100/primed-talent-data-analyst-bootcamp/actions/workflows/portfolio-integrity.yml/badge.svg)](https://github.com/Jorgoluka100/primed-talent-data-analyst-bootcamp/actions/workflows/portfolio-integrity.yml)

For my stronger end-to-end Data Science, Data Engineering, AI and BI work, start with the **[main Data & AI portfolio](https://github.com/Jorgoluka100/uni_projects)**.

## Best analyst / BI evidence

### [Executive Commerce Intelligence — Power BI + Tableau →](https://github.com/Jorgoluka100/uni_projects/tree/main/projects/executive_commerce_bi)

My primary BI project uses a shared governed KPI layer across Power BI and Tableau, with DAX/TMDL, Tableau workbook source, reproducible reporting exports, dashboard storytelling and CI over **98,199 commercial orders**.

### [Retail Performance Dashboard →](dashboard/)

An interactive Streamlit dashboard built on the retail dataset in this repository. It provides additional reporting evidence through KPI cards, region/category filters, profit-margin analysis, loss concentration, discount bands and a decision summary.

## Analysis projects

| Project | Business question | Evidence | Tools |
| --- | --- | --- | --- |
| **[Retail Margin & Discount Analysis](notebooks/01_retail_margin_pipeline.ipynb)** | Where are sales failing to translate into profit? | **9,994** line-item records, **$2.30M** sales and **$286.4K** profit; Texas (**-$25.7K**) and Tables (**-$17.7K**) were the largest losses by state and sub-category. | Python, Pandas, NumPy, Matplotlib |
| **[Housing Price Modelling](notebooks/02_housing_price_pipeline.ipynb)** | How accurately can sale prices be estimated after a reproducible cleaning and modelling pipeline? | **2,930** homes, **586** held-out test rows; random-forest RMSE **$30,235**, R² **0.886**. | Python, scikit-learn |
| **[Ride Demand Forecasting](notebooks/03_ride_demand_pipeline.ipynb)** | Can recent pickup patterns support short-horizon demand planning? | **564,516** raw pickups; chronological **556/140** train-test split; MAE **144.84**, RMSE **200.63**, R² **0.914**. | Python, Pandas, scikit-learn |

The notebooks retain their outputs so charts, checks and conclusions can be reviewed directly on GitHub.

## SQL evidence

The [`sql/`](sql/) folder contains PostgreSQL examples covering:

- data-quality checks
- null-safe reporting
- schema normalisation
- query optimisation

For larger end-to-end SQL and analytics-engineering evidence, use **[E-commerce SQL + dbt](https://github.com/Jorgoluka100/uni_projects/tree/main/projects/ecommerce_sql_analytics)**. It includes relational modelling, reconciliation, cohorts, window functions, grain controls, dbt models and data-quality tests.

## Analyst habits demonstrated here

- inspect types, missing values and duplicates before reporting
- clean data before calculating KPIs
- build filters and summaries around business questions
- keep training and test data separate when modelling
- compare models with meaningful baselines
- translate outputs into concise business conclusions

These are teaching datasets, so the projects demonstrate my analysis process rather than making claims about current retail, housing or transport markets.

Dataset provenance, scope and retained-file checksums are recorded in **[THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)**.

## Run locally

```bash
git clone https://github.com/Jorgoluka100/primed-talent-data-analyst-bootcamp.git
cd primed-talent-data-analyst-bootcamp
python -m pip install -r requirements.txt
jupyter lab
```

To launch the dashboard:

```bash
streamlit run dashboard/app.py
```
