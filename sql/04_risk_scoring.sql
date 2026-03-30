WITH base AS (
    SELECT
        transaction_id,
        customer_id,
        amount,
        transaction_datetime,
        is_international,
        risk_signal
    FROM transactions
),

rules AS (
    SELECT
        transaction_id,
        customer_id,
        amount,
        transaction_datetime,
        is_international,
        risk_signal,

        CASE WHEN amount > 3000 THEN 20 ELSE 0 END AS rule_high_amount,
        CASE WHEN is_international = TRUE THEN 25 ELSE 0 END AS rule_international,
        CASE WHEN risk_signal = 'new_device' THEN 15 ELSE 0 END AS rule_new_device
    FROM base
),

scoring AS (
    SELECT
        transaction_id,
        customer_id,
        amount,
        transaction_datetime,
        rule_high_amount,
        rule_international,
        rule_new_device,
        (rule_high_amount + rule_international + rule_new_device) AS total_risk_score
    FROM rules
)

SELECT *
FROM scoring
ORDER BY total_risk_score DESC, transaction_datetime DESC;