# Business Insights - Motorcycle Loan Analytics

## Overview

This document summarizes the exploratory analysis, business findings, and key insights identified during the development of the motorcycle loan analytics project.

The analysis was performed using the `mart_loan_performance` analytical model built in BigQuery and transformed with dbt.

---

# Analysis 1 — Risk Distribution Analysis

## Objective

Understand how loans are distributed across risk categories and evaluate payment behavior and outstanding debt levels.

---

## Finding 1 — Low Risk Loans

### Hallazgo
- Low Risk loans represent the largest portion of the portfolio with approximately 1437 loans.
- The average payment success rate is approximately 53%.

### Interpretation
Although Low Risk loans dominate the portfolio, only around 53% of installments are fully paid, suggesting that even low-risk customers frequently fail to completely fulfill scheduled payments.

### Business Impact
This may reduce expected cash flow recovery and negatively impact financial predictability despite lower customer risk segmentation.

---

## Finding 2 — High Risk Loans

### Hallazgo
- High Risk loans represent approximately 687 loans.
- The average payment success rate is only around 17%.

### Interpretation
Only a small portion of installments are fully paid within the High Risk segment, indicating a recurring pattern of payment non-compliance.

### Business Impact
This segment represents significant financial exposure and elevated collection risk for the company.

---

## Finding 3 — Outstanding Debt by Risk

### Hallazgo
- High Risk loans show an average outstanding amount of approximately 5059.34 PEN.
- Medium Risk loans show an average outstanding amount of approximately 1544.52 PEN.

### Interpretation
High Risk customers accumulate substantially larger unpaid balances, suggesting weaker payment capacity or repayment discipline.

### Business Impact
Growing unpaid debt concentrations may increase delinquency exposure and reduce overall portfolio recovery performance.

---

# Analysis 2 — District Performance Analysis

## Objective

Evaluate whether geographic location influences payment behavior and financial recovery.

---

## Finding 1 — Payment Performance by District

### Hallazgo
- Average payment rates across districts range approximately between 0.25 and 0.54.
- Districts with the lowest performance include Bellavista, Rimac, San Isidro, Carabayllo, La Perla, and San Borja.

### Interpretation
Although some districts perform worse than others, all districts display relatively low installment completion rates, suggesting that geography may not be the primary explanatory factor behind payment behavior.

### Business Impact
Collection strategies may need to focus more heavily on behavioral or financial variables rather than geographic segmentation alone.

---

## Finding 2 — Outstanding Amount by District

### Hallazgo
- Average outstanding amounts range approximately between 648.78 PEN and 3624.53 PEN across districts.

### Interpretation
No strong or consistent relationship was observed between district location and outstanding debt levels.

### Business Impact
Geographic segmentation alone may not be sufficient for identifying financially risky customer groups.

---

# Analysis 3 — Income Segment Analysis

## Objective

Analyze the relationship between customer income level and payment performance.

---

## Finding 1 — Income vs Payment Behavior

### Hallazgo
- Average payment rates range approximately between 0.38 and 0.58 across income segments.
- Average outstanding debt ranges approximately between 1090.29 PEN and 1652.22 PEN.

### Interpretation
No strong relationship was identified between reported customer income levels and loan payment performance.

### Business Impact
Income alone may not be a reliable predictor of repayment success within this portfolio.

---

# KPI Definitions

| KPI | Definition |
|---|---|
| Financial Payment Ratio | Percentage of total expected payment amount successfully recovered |
| Payment Success Rate | Percentage of installments fully paid by the customer |
| Outstanding Amount | Remaining unpaid amount across all scheduled installments |
| Total Paid Amount | Total amount actually paid by the customer |
| Total Expected Payment | Total amount expected to be collected from the loan installments |
| Risk Category | Rule-based customer risk classification derived from payment behavior |

---

# Overall Conclusions

## Key Portfolio Observations

- High Risk loans concentrate significantly larger unpaid balances.
- Financial recovery remains consistently low across multiple customer segments.
- Geographic variables alone do not strongly explain repayment behavior.
- Customer income level does not appear to strongly correlate with payment success.
- Risk segmentation provides valuable visibility into financially vulnerable loan groups.

---

# Potential Future Analysis

Future analytical improvements may include:

- Cohort analysis
- Time-series delinquency analysis
- Predictive risk scoring
- Collection efficiency modeling
- Customer behavioral segmentation
- Loan refinancing analysis

---

# Final Business Perspective

The portfolio demonstrates meaningful repayment challenges across multiple segments. While risk categorization helps identify vulnerable customer groups, repayment behavior appears to be influenced by factors beyond geography or income level alone.

The analytical warehouse and dashboard developed in this project provide a scalable foundation for future financial risk analysis, portfolio monitoring, and operational decision-making.
