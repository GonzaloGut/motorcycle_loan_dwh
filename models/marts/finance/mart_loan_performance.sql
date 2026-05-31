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
       
        COUNT(payment_id) AS total_installments,
        SUM(total_pay) AS total_expected_payment,
        SUM(total_paid) AS total_paid_amount,
        SUM(total_pay - total_paid) AS outstanding_amount,
        AVG(payment_ratio) AS avg_payment_ratio,
        SUM(fully_paid_flag) AS fully_paid_installments,
        SUM(unpaid_flag) AS unpaid_installments,

        -- Calculate the payment success rate based on the number of fully paid installments over the total installments
        safe_divide( SUM(fully_paid_flag), COUNT(payment_id) ) AS payment_success_rate,

        -- Categorize risk based on average payment ratio
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



