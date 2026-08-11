# Data Analyst Bootcamp Portfolio

## Jorgo Luka

Applied work from the **Primed Talent Data Analyst Bootcamp (220 hours)**, focused on turning raw data into defensible analysis, models, visualisations, and business recommendations.

For my strongest current machine-learning and AI work, start with my separate [AI & Data Science Portfolio](https://github.com/Jorgoluka100/uni_projects). This repository is intentionally narrower: it shows the analytical foundations behind that work — cleaning, EDA, SQL, regression, reporting, and communicating results.

## Start here

| Project | Question answered | Verified result | Main tools | Open |
|---|---|---|---|---|
| **Retail Margin & Discount Analysis** | Where are discounting, geography, and product mix destroying profit? | Audited **9,994** orders covering **$2.30M** sales and **$286.4K** profit; Texas (**-$25.7K**) and Tables (**-$17.7K**) were the largest state and sub-category losses. | Python, Pandas, NumPy, Matplotlib, Seaborn | [Executed notebook](notebooks/01_retail_margin_pipeline.ipynb) |
| **Housing Price Modelling** | Which prepared property characteristics best explain sale price, and how accurately can a simple pipeline estimate it? | **2,930** homes; **586-home** test set; random-forest RMSE **$30,235** and R² **0.886**; overall quality ranked first in feature importance. | Python, scikit-learn, preprocessing pipelines | [Executed notebook](notebooks/02_housing_price_pipeline.ipynb) |
| **Ride Demand Forecasting** | How does hourly pickup demand change, and can recent time features estimate the next unseen period? | **564,516** raw pickups aggregated into an hourly series; chronological **556/140** train-test split; linear-regression MAE **144.84**, RMSE **200.63**, R² **0.914**. | Python, Pandas, time features, scikit-learn | [Executed notebook](notebooks/03_ride_demand_pipeline.ipynb) |

The notebooks retain their executed outputs so the results can be inspected immediately on GitHub.

## Repository structure

```text
.
├── notebooks/
│   ├── 01_retail_margin_pipeline.ipynb
│   ├── 02_housing_price_pipeline.ipynb
│   └── 03_ride_demand_pipeline.ipynb
├── data/
│   ├── SampleSuperstore.csv
│   ├── AmesHousing.csv
│   └── uber_raw_apr14.csv
├── outputs/
├── sql/
└── README.md
```

## Reproduce the featured notebooks

The notebooks use repository-relative data paths. To rerun them with the same layout:

```bash
git clone https://github.com/Jorgoluka100/primed-talent-data-analyst-bootcamp.git
cd primed-talent-data-analyst-bootcamp/notebooks
jupyter lab
```

Open the relevant notebook from that directory and run all cells. I deliberately do **not** label the GitHub links as one-click Colab runs because Colab opens a notebook without cloning its surrounding repository data.

## SQL learning evidence

The [`sql/`](sql/) directory contains bootcamp exercises across joins, `CASE`, conditional aggregation, null handling, schema design, query planning, optimisation, segmentation, and reporting logic. These files are retained as **learning evidence**, not presented as production SQL or flagship portfolio projects.

See the curated [`sql/README.md`](sql/README.md) for the best examples and the scope of that material.

## Workflow demonstrated

1. Inspect schema, types, missing values, duplicates, and unexpected ranges.
2. Clean and standardise data before calculating business metrics.
3. Build decision-relevant features without using information unavailable at prediction time.
4. Explore patterns with grouped summaries and clear visualisations.
5. Establish an interpretable baseline before comparing a more flexible model.
6. Evaluate on held-out data with metrics appropriate to the problem.
7. Translate the analysis into findings a non-technical stakeholder can act on.

## Scope and limitations

- The datasets are established teaching datasets. Results demonstrate analytical method; they are **not claims about today's housing, retail, or transport markets**.
- The three notebooks above are the completed case studies. Classroom exercises remain visible for transparency but should not be interpreted as polished production work.
- Historical course/instructor material removed from `main` remains preserved in the repository history/archive branch rather than being used as portfolio evidence.

## Skills evidenced

**Python · SQL · Pandas · NumPy · scikit-learn · Matplotlib · Seaborn · data cleaning · feature engineering · regression · time-based validation · business analysis · reporting**

For opportunities in analytics, data science, machine learning, or applied AI, contact me through my [GitHub profile](https://github.com/Jorgoluka100).
