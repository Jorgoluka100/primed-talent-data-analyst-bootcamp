"""Fast integrity checks for the recruiter-facing analyst portfolio.

The checks deliberately use only the Python standard library so they can run
quickly on every pull request without installing the full notebook stack.
"""

from __future__ import annotations

import ast
import csv
import hashlib
import json
from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[1]

NOTEBOOKS = (
    "notebooks/01_retail_margin_pipeline.ipynb",
    "notebooks/02_housing_price_pipeline.ipynb",
    "notebooks/03_ride_demand_pipeline.ipynb",
)

DATASETS = {
    "data/SampleSuperstore.csv": {
        "encoding": "latin-1",
        "required": {"Sales", "Profit", "Discount", "Region", "Category"},
        "expected_rows": 9_994,
        "sha256": "949c930faf0f4f75151c5f9dd1c61232bd1525f6b6d4257026b88ea1847e8b33",
    },
    "data/AmesHousing.csv": {
        "encoding": "utf-8",
        "required": {"SalePrice"},
        "expected_rows": 2_930,
        "sha256": "65a1cbb89c2b58b11674097135dd04e710df5db726bcfe6ec551de38b44e4911",
    },
    "data/uber_raw_apr14.csv": {
        "encoding": "utf-8",
        "required": {"Date/Time", "Lat", "Lon", "Base"},
        "expected_rows": 564_516,
        "sha256": "4c92b95b9918e73ae84bade0bffef6e758e792c247469523130d3c1ad7b646e0",
    },
}


def fail(message: str, failures: list[str]) -> None:
    failures.append(message)
    print(f"FAIL: {message}")


def validate_notebooks(failures: list[str]) -> None:
    for relative in NOTEBOOKS:
        path = ROOT / relative
        if not path.is_file():
            fail(f"missing notebook: {relative}", failures)
            continue

        try:
            payload = json.loads(path.read_text(encoding="utf-8"))
        except Exception as exc:
            fail(f"invalid notebook JSON in {relative}: {exc}", failures)
            continue

        cells = payload.get("cells", [])
        code_cells = [cell for cell in cells if cell.get("cell_type") == "code"]
        markdown_cells = [cell for cell in cells if cell.get("cell_type") == "markdown"]
        if not code_cells:
            fail(f"{relative} contains no code cells", failures)
        if not markdown_cells:
            fail(f"{relative} contains no narrative markdown", failures)

        stored_errors = [
            output.get("ename", "unknown error")
            for cell in code_cells
            for output in cell.get("outputs", [])
            if output.get("output_type") == "error"
        ]
        if stored_errors:
            fail(f"{relative} retains execution errors: {stored_errors}", failures)
        else:
            print(f"PASS notebook: {relative}")


def validate_datasets(failures: list[str]) -> None:
    for relative, contract in DATASETS.items():
        path = ROOT / relative
        if not path.is_file():
            fail(f"missing dataset: {relative}", failures)
            continue

        try:
            with path.open(encoding=contract["encoding"], newline="") as handle:
                reader = csv.DictReader(handle)
                headers = set(reader.fieldnames or [])
                rows = sum(1 for _ in reader)
        except Exception as exc:
            fail(f"could not read {relative}: {exc}", failures)
            continue

        missing = contract["required"] - headers
        if missing:
            fail(f"{relative} is missing columns: {sorted(missing)}", failures)
        if rows != contract["expected_rows"]:
            fail(
                f"{relative} has {rows:,} rows; expected {contract['expected_rows']:,}",
                failures,
            )
        if not missing and rows == contract["expected_rows"]:
            digest = hashlib.sha256(path.read_bytes()).hexdigest()
            if digest != contract["sha256"]:
                fail(f"{relative} checksum changed: {digest}", failures)
            else:
                print(f"PASS dataset: {relative} ({rows:,} rows, checksum verified)")


def validate_source_and_links(failures: list[str]) -> None:
    dashboard = ROOT / "dashboard/app.py"
    try:
        ast.parse(dashboard.read_text(encoding="utf-8"), filename=str(dashboard))
        print("PASS dashboard source")
    except Exception as exc:
        fail(f"dashboard/app.py does not parse: {exc}", failures)

    readme = (ROOT / "README.md").read_text(encoding="utf-8")
    required_links = (*NOTEBOOKS, "dashboard/", "sql/")
    for link in required_links:
        if link not in readme:
            fail(f"README.md does not link to {link}", failures)

    sql_files = sorted((ROOT / "sql").glob("*.sql"))
    if len(sql_files) < 4:
        fail("expected at least four SQL evidence files", failures)
    for path in sql_files:
        if "select" not in path.read_text(encoding="utf-8").lower():
            fail(f"{path.relative_to(ROOT)} contains no SELECT statement", failures)


def main() -> int:
    failures: list[str] = []
    validate_notebooks(failures)
    validate_datasets(failures)
    validate_source_and_links(failures)

    print(f"Failures: {len(failures)}")
    if failures:
        return 1
    print("Analyst portfolio integrity PASSED.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
