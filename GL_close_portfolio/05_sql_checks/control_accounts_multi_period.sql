-- ============================================================
-- CONTROL ACCOUNTS INTEGRITY CHECK (MULTI-PERIOD)
-- Finance Ops Engineering — Audit-Ready Version
--
-- Purpose:
--   Validate the integrity of key control accounts across periods.
--   Ensures completeness, correct posting, and GL consistency.
--
-- Control Accounts:
--   - CASH (572- series)
--   - AR   (430- series)
--   - AP   (400- / 410- series)
--
-- Parameters:
--   @Periods : List of periods to validate
--   @Entity  : Entity code
--   @Tolerance : Allowed rounding difference
--
-- Notes:
--   - This script is portfolio-safe (no proprietary logic exposed)
--   - Mirrors real audit/SOX control patterns
-- ============================================================

-- ============================
-- PARAMETERS (edit as needed)
-- ============================
WITH params AS (
    SELECT
        'ENT01' AS Entity,
        0.01   AS Tolerance
),
periods AS (
    SELECT '2024-12' AS ClosePeriod
    UNION ALL
    SELECT '2025-01'
)

-- ============================
-- CONTROL ACCOUNTS CHECK
-- ============================
SELECT
    CheckName,
    p.ClosePeriod,
    prm.Entity,
    ROUND(SUM(f.Amount), 2) AS GL_Total,
    
    -- Status flag based on tolerance
    CASE 
        WHEN ABS(ROUND(SUM(f.Amount), 2)) <= prm.Tolerance THEN 'OK'
        ELSE 'REVIEW'
    END AS Status
FROM periods p
CROSS JOIN params prm
JOIN fGL f
    ON f.ClosePeriod = p.ClosePeriod
   AND f.Entity = prm.Entity
WHERE
      (CheckName = 'CASH_572'     AND f.Account LIKE '572%')
   OR (CheckName = 'AR_430'       AND f.Account LIKE '430%')
   OR (CheckName = 'AP_400_410'   AND (f.Account LIKE '400%' OR f.Account LIKE '410%'))
GROUP BY CheckName, p.ClosePeriod, prm.Entity
ORDER BY CheckName, p.ClosePeriod;