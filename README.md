# Data Analyst Bootcamp Portfolio

## Jorgo Luka

Applied projects completed during the Primed Talent Data Analyst Bootcamp, covering Python, SQL, data cleaning, exploratory analysis, business reporting, regression, and Power BI.

The three case studies below are the best place to start. Each notebook takes a raw dataset through cleaning, feature preparation, analysis, modelling, visualisation, and a short business summary.

## Featured case studies

| Project | Question answered | Verified result | Main tools | Open |
|---|---|---|---|---|
| **Retail Margin and Discount Analysis** | Where are discounting, geography, and product mix destroying profit? | Audited **9,994** orders covering **$2.30M** sales and **$286.4K** profit; identified Texas (**-$25.7K**) and Tables (**-$17.7K**) as the largest state and sub-category losses. | Python, Pandas, NumPy, Matplotlib, Seaborn | [Notebook](01_retail_margin_pipeline.ipynb) · [Colab](https://colab.research.google.com/github/Jorgoluka100/primed-talent-data-analyst-bootcamp/blob/main/01_retail_margin_pipeline.ipynb) |
| **Housing Price Modelling** | Which prepared property characteristics best explain sale price, and how accurately can a simple pipeline estimate it? | **2,930** homes; **586-home** test set; random-forest RMSE **$30,235** and R² **0.886**; overall quality ranked first in feature importance. | Python, scikit-learn, preprocessing pipelines | [Notebook](02_housing_price_pipeline.ipynb) · [Colab](https://colab.research.google.com/github/Jorgoluka100/primed-talent-data-analyst-bootcamp/blob/main/02_housing_price_pipeline.ipynb) |
| **Ride Demand Forecasting** | How does hourly pickup demand change, and can recent time features estimate the next unseen period? | **564,516** raw pickups aggregated into an hourly series; chronological **556/140** train-test split; linear-regression MAE **144.84**, RMSE **200.63**, R² **0.914**. | Python, Pandas, time features, scikit-learn | [Notebook](03_ride_demand_pipeline.ipynb) · [Colab](https://colab.research.google.com/github/Jorgoluka100/primed-talent-data-analyst-bootcamp/blob/main/03_ride_demand_pipeline.ipynb) |

## SQL work

The [`sql`](sql/) directory contains practical exercises in joins, conditional aggregation, null-safe reporting, time-series features, schema design, query plans, optimisation, segmentation, and reporting logic. Its [`readme.md`](sql/readme.md) provides a short index.

## Workflow demonstrated

1. Inspect the schema, data types, missing values, duplicates, and unexpected ranges.
2. Standardise names and prepare decision-relevant features.
3. Explore the data with grouped summaries and clear charts.
4. Build an interpretable baseline before comparing another model.
5. Evaluate on held-out data with MAE, RMSE, and R² where modelling is appropriate.
6. Translate the output into findings a business stakeholder can act on.

## Important scope

- The housing and ride datasets are established teaching datasets. They demonstrate the analytical workflow and are not claims about the current housing or transport market.
- These projects should be read alongside my [current AI & Data Science portfolio](https://github.com/Jorgoluka100/uni_projects), which uses newer official data and stronger leakage, uncertainty, testing, and deployment controls.
- Individual lab files are retained as learning evidence; the three notebooks above are the completed portfolio case studies.

## Skills

Python · SQL · Pandas · NumPy · Matplotlib · Seaborn · scikit-learn · data cleaning · feature engineering · regression · business analysis · reporting · Power BI

For opportunities in data analytics, data science, machine learning, or AI, contact me through my [GitHub profile](https://github.com/Jorgoluka100).
