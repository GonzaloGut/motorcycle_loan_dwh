select
    cast(id as int64) as payment_id,
    cast(loan_id as int64) as loan_id,
    code,
    cast(period as int64) as period,
    cast(quota_status_id as int64) as quota_status_id,
    cast(date as date) as scheduled_payment_date,
    cast(min_payment_date as date) as min_payment_date,
    cast(max_payment_date as date) as max_payment_date,
    cast(amortization as numeric) as amortization,
    cast(amortization_paid as numeric) as amortization_paid,
    cast(interest as numeric) as interest,
    cast(interest_paid as numeric) as interest_paid,
    cast(total_pay as numeric) as total_pay,
    cast(total_paid as numeric) as total_paid,
    cast(total_amount_paid as numeric) as total_amount_paid,
    cast(fees as numeric) as fees,
    cast(fees_paid as numeric) as fees_paid

from {{source('raw', 'payment_schedule_raw')}}