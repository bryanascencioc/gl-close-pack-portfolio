-- ============================================================
-- GL Totals by Account (Multi-Period Integrity Check)
-- Purpose:
--   Validate completeness and consistency of GL postings
--   across multiple periods for a given entity.
--
-- Use case:
--   Month-end close, audit controls, SOX, variance preparation.
--
-- Periods: 2024-12 and 2025-01
-- Entity : ENT01
-- ============================================================

SELECT
    ClosePeriod,
    Entity,
    Account,
    ROUND(SUM(Amount), 2) AS GL_Amount
FROM fGL
WHERE ClosePeriod IN ('2024-12','2025-01')
  AND Entity = 'ENT01'
GROUP BY ClosePeriod, Entity, Account
ORDER BY ClosePeriod, Account;