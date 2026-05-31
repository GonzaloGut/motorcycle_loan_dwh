WITH loans AS (
    SELECT *
    FROM {{ref('stg_loans')}}
),

payments AS (
    SELECT *
    FROM {{ref('stg_payment_schedule')}}
),

joined AS (
    SELECT 
        p.loan_id,
        p.payment_id,
        p.period,
        l.subscription_id,

        l.annual_rate,
        l.financed_amount,
        l.capital_balance,
        l.monthly_income,
        l.motorcycle_value,

        l.sex,
        l.canal,
        l.department,
        l.district,
        l.district_stratum,

        l.disbursement_date,
        l.loan_due_date,

        p.scheduled_payment_date, 
        p.min_payment_date, 
        p.max_payment_date,
        
        p.amortization, 
        p.amortization_paid, 
        
        p.interest, 
        p.interest_paid,

        p.fees, 
        p.fees_paid, 

        p.total_pay,
        p.total_paid, 
        p.total_amount_paid,

        -- Attribute of fully paid loans
        CASE
            WHEN p.total_paid >= p.total_pay THEN 1
            ELSE 0
        END AS fully_paid_flag,

        -- Attribute of unpaid loans
        CASE
            WHEN p.total_paid = 0 THEN 1
            ELSE 0
        END AS unpaid_flag,

        -- Atribute of payment ratio
        safe_divide(p.total_paid, p.total_pay) AS payment_ratio

    FROM payments p
    LEFT JOIN loans l
        ON p.loan_id = l.loan_id
)

SELECT *
FROM joined