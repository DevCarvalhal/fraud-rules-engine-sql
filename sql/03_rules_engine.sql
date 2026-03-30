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
        *,
        
        -- Regra 1: valor alto
        CASE WHEN amount > 3000 THEN 20 ELSE 0 END AS rule_high_amount,
        
        -- Regra 2: transação internacional
        CASE WHEN is_international = TRUE THEN 25 ELSE 0 END AS rule_international,
        
        -- Regra 3: dispositivo novo
        CASE WHEN risk_signal = 'new_device' THEN 15 ELSE 0 END AS rule_new_device

    FROM base
)

SELECT * FROM rules;