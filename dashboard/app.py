from pathlib import Path

import pandas as pd
import streamlit as st


DATA_PATH = Path(__file__).resolve().parents[1] / "data" / "SampleSuperstore.csv"

st.set_page_config(page_title="Retail Performance Dashboard", layout="wide")


@st.cache_data
def load_data(path: Path) -> pd.DataFrame:
    df = pd.read_csv(path, encoding="latin-1")
    df.columns = df.columns.str.strip()

    for column in ["Sales", "Profit", "Discount", "Quantity"]:
        if column in df.columns:
            df[column] = pd.to_numeric(df[column], errors="coerce")

    if "Order Date" in df.columns:
        df["Order Date"] = pd.to_datetime(df["Order Date"], errors="coerce")

    return df


@st.cache_data
def validate_data(df: pd.DataFrame) -> list[str]:
    required = {
        "Sales",
        "Profit",
        "Discount",
        "Region",
        "Category",
        "Sub-Category",
        "State",
        "Segment",
    }
    return sorted(required.difference(df.columns))


try:
    data = load_data(DATA_PATH)
except FileNotFoundError:
    st.error(f"Dataset not found at {DATA_PATH}")
    st.stop()

missing = validate_data(data)
if missing:
    st.error("The dashboard cannot run because required columns are missing: " + ", ".join(missing))
    st.stop()

st.title("Retail Performance Dashboard")
st.caption(
    "A decision-focused view of sales, profit, discounting and loss concentration using the Sample Superstore dataset."
)

# -----------------------------
# Filters
# -----------------------------
st.sidebar.header("Filters")

region_options = sorted(data["Region"].dropna().astype(str).unique())
segment_options = sorted(data["Segment"].dropna().astype(str).unique())
category_options = sorted(data["Category"].dropna().astype(str).unique())

selected_regions = st.sidebar.multiselect("Region", region_options, default=region_options)
selected_segments = st.sidebar.multiselect("Segment", segment_options, default=segment_options)
selected_categories = st.sidebar.multiselect("Category", category_options, default=category_options)

filtered = data[
    data["Region"].astype(str).isin(selected_regions)
    & data["Segment"].astype(str).isin(selected_segments)
    & data["Category"].astype(str).isin(selected_categories)
].copy()

if "Order Date" in filtered.columns and filtered["Order Date"].notna().any():
    min_date = filtered["Order Date"].min().date()
    max_date = filtered["Order Date"].max().date()
    selected_dates = st.sidebar.date_input(
        "Order date",
        value=(min_date, max_date),
        min_value=min_date,
        max_value=max_date,
    )
    if isinstance(selected_dates, tuple) and len(selected_dates) == 2:
        start_date, end_date = selected_dates
        filtered = filtered[
            filtered["Order Date"].dt.date.between(start_date, end_date)
        ]

if filtered.empty:
    st.warning("No rows match the selected filters.")
    st.stop()

# -----------------------------
# KPI layer
# -----------------------------
total_sales = filtered["Sales"].sum()
total_profit = filtered["Profit"].sum()
profit_margin = total_profit / total_sales if total_sales else 0.0
avg_discount = filtered["Discount"].mean()
order_count = (
    filtered["Order ID"].nunique() if "Order ID" in filtered.columns else len(filtered)
)

kpi_1, kpi_2, kpi_3, kpi_4, kpi_5 = st.columns(5)
kpi_1.metric("Sales", f"${total_sales:,.0f}")
kpi_2.metric("Profit", f"${total_profit:,.0f}")
kpi_3.metric("Profit margin", f"{profit_margin:.1%}")
kpi_4.metric("Orders", f"{order_count:,}")
kpi_5.metric("Average discount", f"{avg_discount:.1%}")

st.divider()

# -----------------------------
# Performance breakdowns
# -----------------------------
st.subheader("Where is profit being created or lost?")

region_summary = (
    filtered.groupby("Region", as_index=False)
    .agg(Sales=("Sales", "sum"), Profit=("Profit", "sum"))
    .sort_values("Profit", ascending=False)
)
region_summary["Profit Margin"] = region_summary["Profit"] / region_summary["Sales"]

category_summary = (
    filtered.groupby("Category", as_index=False)
    .agg(Sales=("Sales", "sum"), Profit=("Profit", "sum"))
    .sort_values("Profit", ascending=False)
)
category_summary["Profit Margin"] = category_summary["Profit"] / category_summary["Sales"]

left, right = st.columns(2)
with left:
    st.markdown("**Profit by region**")
    st.bar_chart(region_summary.set_index("Region")["Profit"])
    st.dataframe(
        region_summary.style.format(
            {"Sales": "${:,.0f}", "Profit": "${:,.0f}", "Profit Margin": "{:.1%}"}
        ),
        use_container_width=True,
        hide_index=True,
    )

with right:
    st.markdown("**Profit by category**")
    st.bar_chart(category_summary.set_index("Category")["Profit"])
    st.dataframe(
        category_summary.style.format(
            {"Sales": "${:,.0f}", "Profit": "${:,.0f}", "Profit Margin": "{:.1%}"}
        ),
        use_container_width=True,
        hide_index=True,
    )

# -----------------------------
# Loss concentration
# -----------------------------
st.subheader("Loss concentration")

state_summary = (
    filtered.groupby("State", as_index=False)
    .agg(Sales=("Sales", "sum"), Profit=("Profit", "sum"))
)
state_summary["Profit Margin"] = state_summary["Profit"] / state_summary["Sales"]
loss_states = state_summary[state_summary["Profit"] < 0].sort_values("Profit").head(10)

subcategory_summary = (
    filtered.groupby("Sub-Category", as_index=False)
    .agg(Sales=("Sales", "sum"), Profit=("Profit", "sum"))
)
subcategory_summary["Profit Margin"] = (
    subcategory_summary["Profit"] / subcategory_summary["Sales"]
)
loss_subcategories = subcategory_summary[subcategory_summary["Profit"] < 0].sort_values("Profit")

left, right = st.columns(2)
with left:
    st.markdown("**Lowest-profit states**")
    if loss_states.empty:
        st.success("No loss-making states under the selected filters.")
    else:
        st.dataframe(
            loss_states.style.format(
                {"Sales": "${:,.0f}", "Profit": "${:,.0f}", "Profit Margin": "{:.1%}"}
            ),
            use_container_width=True,
            hide_index=True,
        )

with right:
    st.markdown("**Loss-making sub-categories**")
    if loss_subcategories.empty:
        st.success("No loss-making sub-categories under the selected filters.")
    else:
        st.dataframe(
            loss_subcategories.style.format(
                {"Sales": "${:,.0f}", "Profit": "${:,.0f}", "Profit Margin": "{:.1%}"}
            ),
            use_container_width=True,
            hide_index=True,
        )

# -----------------------------
# Discount analysis
# -----------------------------
st.subheader("Discount versus profitability")

discount_bins = [-0.001, 0.0, 0.10, 0.20, 0.30, 0.50, 1.0]
discount_labels = ["0%", "1–10%", "11–20%", "21–30%", "31–50%", ">50%"]
filtered["Discount Band"] = pd.cut(
    filtered["Discount"], bins=discount_bins, labels=discount_labels, include_lowest=True
)

discount_summary = (
    filtered.groupby("Discount Band", observed=True, as_index=False)
    .agg(
        Rows=("Profit", "size"),
        Sales=("Sales", "sum"),
        Profit=("Profit", "sum"),
        Average_Discount=("Discount", "mean"),
    )
)
discount_summary["Profit Margin"] = discount_summary["Profit"] / discount_summary["Sales"]

st.dataframe(
    discount_summary.style.format(
        {
            "Sales": "${:,.0f}",
            "Profit": "${:,.0f}",
            "Average_Discount": "{:.1%}",
            "Profit Margin": "{:.1%}",
        }
    ),
    use_container_width=True,
    hide_index=True,
)

# -----------------------------
# Decision summary
# -----------------------------
st.subheader("Decision summary")

best_category = category_summary.iloc[0]
worst_state = state_summary.sort_values("Profit").iloc[0]
worst_subcategory = subcategory_summary.sort_values("Profit").iloc[0]

st.markdown(
    f"""
- **Best category by profit:** {best_category['Category']} (${best_category['Profit']:,.0f}).
- **Lowest-profit state:** {worst_state['State']} (${worst_state['Profit']:,.0f}).
- **Lowest-profit sub-category:** {worst_subcategory['Sub-Category']} (${worst_subcategory['Profit']:,.0f}).
- Use the filters to test whether those patterns persist by region, segment, category and time period before making a commercial recommendation.
"""
)

with st.expander("View filtered data"):
    st.dataframe(filtered, use_container_width=True, hide_index=True)
