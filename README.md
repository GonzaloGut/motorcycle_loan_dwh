# Motorcycle Loan Data Warehouse & Analytics

## Project Overview

This project is an end-to-end Data Engineering and Analytics solution built for a motorcycle financing company. The objective is to transform raw CSV loan and payment schedule data into a scalable analytical data warehouse using modern cloud data stack technologies.

The project includes:
- Data ingestion into BigQuery
- Data transformation and modeling with dbt
- Medallion architecture implementation
- Analytical KPI generation
- Interactive dashboards in Data Studio (Looker Studio)
- Business insights and risk analysis

---

# Architecture

```text
CSV Files
   ↓
BigQuery RAW Layer
   ↓
dbt Staging Models
   ↓
dbt Intermediate Models
   ↓
dbt Mart Layer
   ↓
Data Studio (Looker Studio) Dashboard
```

---

# Technology Stack

| Tool | Purpose |
|---|---|
| BigQuery | Cloud Data Warehouse |
| dbt | Data Transformation & Modeling |
| Data Studio (Looker Studio) | Business Intelligence Dashboard |
| SQL | Data Modeling & Analytics |
| GitHub | Version Control |

---

# Medallion Architecture

The project follows a Medallion Architecture approach:

## RAW Layer
Stores original CSV data loaded into BigQuery without transformations.

## Staging Layer
Performs:
- Data cleaning
- Renaming
- Type casting
- Standardization

## Intermediate Layer
Implements:
- Business logic
- Table joins
- KPI derivations
- Analytical transformations

## Mart Layer
Creates business-ready analytical tables optimized for BI dashboards and reporting.

---

# Main KPIs

| KPI | Description |
|---|---|
| Financial Payment Ratio | Percentage of total expected payment amount successfully recovered |
| Payment Success Rate | Percentage of installments fully paid by the customer |
| Outstanding Amount | Remaining unpaid amount across all scheduled installments |
| Total Paid Amount | Total amount actually paid by the customer |
| Total Expected Payment | Total amount expected to be collected from the loan installments |
| Risk Category | Rule-based customer risk classification derived from payment behavior |

---

# Key Insights

- High Risk loans present significantly larger outstanding balances.
- Financial recovery remains relatively low across most districts.
- Income level does not show a strong relationship with payment performance.
- A considerable portion of loans fail to fully complete scheduled installments.
- Risk segmentation helps identify financially vulnerable loan groups.

---

# Dashboard Pages

## 1. Executive Summary
Includes:
- KPI overview
- Risk distribution
- Outstanding debt analysis
- Financial recovery metrics
- District and income segmentation

## 2. Loan Details
Interactive operational analysis including:
- Loan-level metrics
- Filtering capabilities
- Risk exploration
- Financial performance breakdown

---

# Project Structure

```text
motorcycle_loan_dwh/
│
├── models/
│   ├── staging/
│   ├── intermediate/
│   └── marts/
│
├── analyses/
├── snapshots/
├── tests/
├── dbt_project.yml
├── README.md
└── .gitignore
```

---

# Example dbt Commands

Run models:

```bash
dbt run
```

Run tests:

```bash
dbt test
```

Generate documentation:

```bash
dbt docs generate
```

Serve dbt docs locally:

```bash
dbt docs serve
```

---

# Future Improvements

Potential future enhancements:
- Cohort analysis
- Incremental dbt models
- Orchestration with Airflow
- Predictive risk scoring models
- Automated data quality monitoring
- CI/CD pipeline integration

---

# Author

Gonzalo Gutierrez

Developed as a Data Engineering & Analytics Engineering portfolio project using modern cloud data stack technologies.
