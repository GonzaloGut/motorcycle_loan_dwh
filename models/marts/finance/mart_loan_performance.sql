WITH loan_payments AS (
    SELECT *
    FROM {{ref('int_loan_payments')}}
),

aggregated AS (

    SELECT 
        loan_id,
        subscription_id,

        sex,
        canal,
        department,
        district,
        district_stratum,

        annual_rate,
        financed_amount,
        capital_balance,
        monthly_income,
        motorcycle_value,

        disbursement_date,
        loan_due_date,
       
        COUNT(payment_id) AS total_installments,                -- Total number of scheduled loan installments.
        SUM(total_pay) AS total_expected_payment,               -- Total amount expected to be collected from the loan installments.
        SUM(total_paid) AS total_paid_amount,                   -- Total amount actually paid by the customer.
        SUM(total_pay - total_paid) AS outstanding_amount,      -- Remaining unpaid amount across all scheduled installments.
        AVG(payment_ratio) AS avg_payment_ratio,                -- Average proportion of payment completed per installment.
        
        -- Percentage of total expected payment amount successfully recovered.
        safe_divide( SUM(total_paid), SUM(total_pay)) AS financial_payment_ratio,

        SUM(fully_paid_flag) AS fully_paid_installments,        -- Number of installments completely paid by the customer.
        SUM(unpaid_flag) AS unpaid_installments,                -- Number of installments with no payment registered.

        -- Percentage of installments fully paid by the customer.
        safe_divide( SUM(fully_paid_flag), COUNT(payment_id) ) AS payment_success_rate,

        -- Rule-based customer risk classification derived from payment behavior.
        CASE
            WHEN AVG(payment_ratio) >= 0.90 THEN 'Low Risk'
            WHEN AVG(payment_ratio) >= 0.70 THEN 'Medium Risk'
            ELSE 'High Risk'
        END AS risk_category

    FROM loan_payments 
    GROUP BY
        loan_id,
        subscription_id,

        sex,
        canal,
        department,
        district,
        district_stratum,

        annual_rate,
        financed_amount,
        capital_balance,
        monthly_income,
        motorcycle_value,

        disbursement_date,
        loan_due_date
)

SELECT *
FROM aggregated



