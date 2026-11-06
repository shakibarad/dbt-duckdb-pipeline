# Automated Job Postings Pipeline — dbt v2 + DuckDB

![dbt build](https://github.com/shakibarad/dbt-duckdb-pipeline/actions/workflows/dbt_build.yml/badge.svg)

![dbt pipeline diagram](img/dbt_pipeline.png)

An end-to-end data engineering project that transforms approximately 692k real-world job postings into analytics-ready datasets using Python, DuckDB, and dbt v2.

The pipeline automates data ingestion, transformation, testing, and publishing with GitHub Actions.

## 🚀 Project Overview

This project demonstrates a modern analytics engineering workflow:

- Downloads raw job-posting data using Python.
- Stores raw data in Parquet format.
- Uses DuckDB as the analytical database.
- Transforms data with dbt v2.
- Applies data quality tests.
- Automates builds using GitHub Actions.
- Publishes dbt documentation using GitHub Pages.

## 🛠️ Technologies

| Technology | Purpose |
|---|---|
| Python | Data ingestion |
| Parquet | Raw data storage |
| DuckDB | Analytical database |
| dbt v2 | Data transformation and testing |
| uv | Python dependency management |
| SQL | Data modeling |
| Git & GitHub | Version control |
| GitHub Actions | CI/CD automation |
| GitHub Pages | Documentation hosting |

## 📊 What I Built

| Component | Implementation |
|---|---|
| Data ingestion | Python download script |
| Data storage | Parquet files |
| Data transformation | dbt SQL models |
| Data quality | `unique` and `not_null` tests |
| Model dependencies | dbt `source()` and `ref()` |
| Materializations | Tables and views |
| Environments | Development and production |
| Automation | GitHub Actions |
| Documentation | dbt documentation and lineage graph |

## ⚙️ dbt Pipeline

The pipeline transforms raw job-posting data into useful analytical models.

Main models include:

- `job_postings`
- `job_per_month`
- `monthly_summary`
- `top_locations`

The project uses dbt features such as:

- **Sources:** Define raw data inputs.
- **ref():** Define dependencies between models.
- **Materializations:** Store transformations as tables or views.
- **Tests:** Validate data quality.
- **Documentation:** Describe models and visualize data lineage.

## 🔄 Automated Workflow

GitHub Actions automates the pipeline.

The workflow runs:

- On every push to the `master` branch.
- Every Monday on a scheduled basis.
- Manually through GitHub Actions.

The workflow:

1. Checks out the repository.
2. Installs dependencies using uv.
3. Downloads the latest raw data.
4. Runs `dbt build`.
5. Publishes the production DuckDB database as a GitHub Release asset.

[View GitHub Actions](https://github.com/shakibarad/dbt-duckdb-pipeline/actions)

## 🦆 Query the Published Warehouse

The production DuckDB database is available through the GitHub Release.

You can query it using DuckDB:

```sql
INSTALL httpfs;
LOAD httpfs;

ATTACH 'https://github.com/shakibarad/dbt-duckdb-pipeline/releases/download/warehouse/prod.duckdb' AS jobs;

USE jobs;

SHOW TABLES;

SELECT * FROM top_locations;

SELECT * FROM monthly_summary;
```

## 📖 dbt Documentation

The project documentation is generated using dbt and hosted on GitHub Pages.

**[Explore the live dbt documentation](https://shakibarad.github.io/dbt-duckdb-pipeline/)**

The documentation includes:

- Model descriptions
- Column information
- Data tests
- Model dependencies
- Data lineage graph

## 💻 Run the Project Locally

Clone the repository:

```bash
git clone https://github.com/shakibarad/dbt-duckdb-pipeline.git

cd dbt-duckdb-pipeline
```

Install dependencies:

```bash
uv sync
```

Download the raw data:

```bash
uv run python scripts/download_data.py
```

Build the dbt models:

```bash
cd analytics

uv run dbt build --profiles-dir ../ci --target prod
```

## 📁 Project Structure

```text
dbt-duckdb-pipeline/
│
├── .github/
│   └── workflows/
│       └── dbt_build.yml
│
├── analytics/
│   ├── models/
│   │   ├── job_postings.sql
│   │   ├── job_per_month.sql
│   │   ├── monthly_summary.sql
│   │   ├── top_locations.sql
│   │   ├── schema.yml
│   │   └── sources.yml
│   │
│   └── dbt_project.yml
│
├── ci/
│   └── profiles.yml
│
├── data/
├── docs/
├── img/
├── scripts/
│   └── download_data.py
│
├── src/
├── .gitignore
├── pyproject.toml
├── uv.lock
└── README.md
```

## 🎯 What I Learned

Through this project, I gained practical experience with:

- Building end-to-end data pipelines.
- Working with Parquet and DuckDB.
- Developing SQL models with dbt.
- Implementing data quality tests.
- Managing development and production environments.
- Automating data workflows with GitHub Actions.
- Generating and publishing technical documentation.

## 🔗 Project Links

- **GitHub Repository:** https://github.com/shakibarad/dbt-duckdb-pipeline
- **Live dbt Documentation:** https://shakibarad.github.io/dbt-duckdb-pipeline/

---

*Built as a hands-on project to develop practical data engineering and analytics engineering skills.*
