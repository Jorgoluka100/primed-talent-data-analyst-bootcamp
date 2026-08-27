# Data Analyst Portfolio — Bootcamp Projects

## Jorgo Luka

This repository is the **analyst-focused supporting portfolio** behind my main [Data & AI portfolio](https://github.com/Jorgoluka100/uni_projects). It focuses on the fundamentals that matter in analyst roles: **cleaning data, defining useful metrics, writing SQL, building reports, validating results and explaining what the numbers mean**.

## Start here

### [Retail Performance Dashboard →](dashboard/)

An interactive Streamlit dashboard built on the retail dataset in this repository. It adds business-facing reporting evidence to the portfolio: KPI cards, region/category filters, profit-margin analysis, loss concentration, discount bands and a decision summary.

## Analysis projects

| Project | Business question | Evidence | Tools |
| --- | --- | --- | --- |
| **[Retail Margin & Discount Analysis](notebooks/01_retail_margin_pipeline.ipynb)** | Where are sales failing to translate into profit? | **9,994** orders, **$2.30M** sales and **$286.4K** profit; Texas (**-$25.7K**) and Tables (**-$17.7K**) were the largest losses by state and sub-category. | Python, Pandas, NumPy, Matplotlib, Seaborn |
| **[Housing Price Modelling](notebooks/02_housing_price_pipeline.ipynb)** | How accurately can sale prices be estimated after a reproducible cleaning and modelling pipeline? | **2,930** homes, **586** held-out test rows; random-forest RMSE **$30,235**, R² **0.886**. | Python, scikit-learn |
| **[Ride Demand Forecasting](notebooks/03_ride_demand_pipeline.ipynb)** | Can recent pickup patterns support short-horizon demand planning? | **564,516** raw pickups; chronological **556/140** train-test split; MAE **144.84**, RMSE **200.63**, R² **0.914**. | Python, Pandas, scikit-learn |

The notebooks retain their outputs so charts, checks and conclusions can be reviewed directly on GitHub.

## SQL evidence

The [`sql/`](sql/) folder contains PostgreSQL examples covering:

- data-quality checks
- null-safe reporting
- schema normalisation
- query optimisation

For a larger end-to-end SQL project, use **[E-commerce SQL Analytics](https://github.com/Jorgoluka100/uni_projects/tree/main/projects/ecommerce_sql_analytics)** in my main portfolio. It includes relational modelling, reconciliation, cohorts, window functions and join-safety tests.

## Analyst habits demonstrated here

- inspect types, missing values and duplicates before reporting
- clean data before calculating KPIs
- build filters and summaries around business questions
- keep training and test data separate when modelling
- compare models with meaningful baselines
- translate outputs into concise business conclusions

These are teaching datasets, so the projects demonstrate my analysis process rather than making claims about current retail, housing or transport markets.

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
