# Data Analyst Bootcamp Projects

## Jorgo Luka

This repo contains the main projects I completed from a 220-hour Data Analyst Bootcamp. They are smaller than the projects in my [AI & Data Science portfolio](https://github.com/Jorgoluka100/uni_projects), but they show the basics I use all the time: cleaning data, exploring it, writing SQL, building simple models and explaining the result.

## Projects

| Project | What I looked at | Result | Tools |
|---|---|---|---|
| **[Retail Margin & Discount Analysis](notebooks/01_retail_margin_pipeline.ipynb)** | Looked at where sales were turning into losses by state, product type and discount level. | **9,994** orders, **$2.30M** sales and **$286.4K** profit. Texas (**-$25.7K**) and Tables (**-$17.7K**) were the largest losses by state and sub-category. | Python, Pandas, NumPy, Matplotlib, Seaborn |
| **[Housing Price Modelling](notebooks/02_housing_price_pipeline.ipynb)** | Cleaned the housing data, built a preprocessing pipeline and compared models on a held-out test set. | **2,930** homes, **586** in the test set; random-forest RMSE **$30,235**, R² **0.886**. | Python, scikit-learn |
| **[Ride Demand Forecasting](notebooks/03_ride_demand_pipeline.ipynb)** | Turned raw pickup data into an hourly time series and predicted the next unseen period using time features. | **564,516** raw pickups; chronological **556/140** train-test split; MAE **144.84**, RMSE **200.63**, R² **0.914**. | Python, Pandas, scikit-learn |

The notebooks keep their outputs so the charts and results can be viewed directly on GitHub.

## SQL practice

The [`sql/`](sql/) folder contains short PostgreSQL examples covering:

- data-quality checks
- null-safe reporting
- schema normalisation
- query optimisation

For a larger SQL project, see my [SQL Sales & Customer Analysis](https://github.com/Jorgoluka100/uni_projects/blob/main/02_SQL_Sales_and_Customer_Analysis.ipynb).

## Running the notebooks

```bash
git clone https://github.com/Jorgoluka100/primed-talent-data-analyst-bootcamp.git
cd primed-talent-data-analyst-bootcamp
python -m pip install -r requirements.txt
cd notebooks
jupyter lab
```

The notebooks use the data files stored in this repository, which is why I have not labelled them as one-click Colab notebooks.

## What I practised here

1. Checking columns, types, missing values and duplicates.
2. Cleaning data before calculating KPIs or fitting a model.
3. Exploring patterns with grouped summaries and charts.
4. Keeping training and test data separate.
5. Comparing a model with a simple baseline where appropriate.
6. Turning the result into a short business conclusion.

These are teaching datasets, so the results show my analysis process rather than making claims about today's retail, housing or transport markets.
