select
    cast(loan_id as int64) as loan_id,
    code,
    loan_code_clean,
    cast(subscription_id as int64) as subscription_id,
    cast(loan_annual_rate as numeric) as annual_rate,
    cast(monto_financiado as numeric) as financed_amount,
    cast(total_interest_fees as numeric) as total_interest_fees,
    cast(capital_balance as numeric) as capital_balance,
    cast(subscription_monthly_income as numeric) as monthly_income,
    cast(subscription_motorcycle_value as numeric) as motorcycle_value,
    sex,
    canal,
    subscription_department_description as department,
    subscription_district_description as district,
    subscription_district_stratum_description as district_stratum,
    cast(subscription_latitude as numeric) as latitude,
    cast(subscription_longitude as numeric) as longitude,
    cast(disbursement_date as date) as disbursement_date,
    cast(loan_due_date as date) as loan_due_date,
    loan_refinanced

from {{source('raw', 'loan_raw')}}