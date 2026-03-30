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
        is_international,
        risk_signal,
        rule_high_amount,
        rule_international,
        rule_new_device,
        (rule_high_amount + rule_international + rule_new_device) AS total_risk_score
    FROM rules
),

case_queue AS (
    SELECT
        transaction_id,
        customer_id,
        amount,
        transaction_datetime,
        is_international,
        risk_signal,
        total_risk_score,
        CASE
            WHEN total_risk_score >= 40 THEN 'High Priority'
            WHEN total_risk_score >= 20 THEN 'Medium Priority'
            ELSE 'Low Priority'
        END AS investigation_priority
    FROM scoring
)

-- 1. Volume de casos por prioridade
SELECT
    investigation_priority,
    COUNT(*) AS total_cases
FROM case_queue
GROUP BY investigation_priority
ORDER BY total_cases DESC;

-- 2. Score médio por prioridade
SELECT
    investigation_priority,
    AVG(total_risk_score) AS avg_risk_score
FROM case_queue
GROUP BY investigation_priority
ORDER BY avg_risk_score DESC;

-- 3. Casos internacionais
SELECT
    transaction_id,
    customer_id,
    amount,
    total_risk_score,
    investigation_priority
FROM case_queue
WHERE is_international = TRUE
ORDER BY total_risk_score DESC;

-- 4. Casos com novo dispositivo
SELECT
    transaction_id,
    customer_id,
    amount,
    total_risk_score,
    investigation_priority
FROM case_queue
WHERE risk_signal = 'new_device'
ORDER BY total_risk_score DESC;

-- 5. Top clientes por score acumulado
SELECT
    customer_id,
    COUNT(*) AS total_transactions,
    SUM(total_risk_score) AS accumulated_risk_score
FROM case_queue
GROUP BY customer_id
ORDER BY accumulated_risk_score DESC, total_transactions DESC;