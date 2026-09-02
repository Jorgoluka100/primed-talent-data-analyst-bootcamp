# Retail Performance Dashboard

A small interactive dashboard built from the repository's `SampleSuperstore.csv` dataset. It is designed as **analyst evidence**, not another machine-learning project.

## Questions it answers

- How much sales and profit are generated under the current filters?
- Which regions and categories contribute most to profit?
- Where are losses concentrated by state and sub-category?
- How does profitability change across discount bands?
- Do the conclusions persist when the user changes region, segment, category or date filters?

## What it demonstrates

- KPI definition and reconciliation from line-item data
- stakeholder-friendly filtering and drill-down
- profit-margin and loss-concentration analysis
- business-focused visualisation rather than model-first analysis
- defensive data validation before reporting
- concise decision summaries linked to the filtered data

## Run it

From the repository root:

```bash
python -m pip install -r requirements.txt
streamlit run dashboard/app.py
```

The app reads `data/SampleSuperstore.csv` directly from this repository.

## Important scope note

This is a **Streamlit dashboard**, not a Power BI project. It demonstrates dashboard design and analytical reporting without claiming experience with a tool that is not used in the code.
