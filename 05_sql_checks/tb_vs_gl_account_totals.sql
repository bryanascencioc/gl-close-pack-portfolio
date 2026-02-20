-- ============================================================
-- TB vs GL by Account (Multi-Period Integrity Check)
-- Purpose:
--   Provide GL totals by account for reconciliation against TB.
--   This is a standard audit-style control used in month-end close.
--
-- Requirements:
--   - fGL must be loaded
--   - TB source (fTB) can be joined externally if needed
--
-- Periods: 2025-10 and 2025-11
-- Entity : ENT01
-- ============================================================

SELECT
    Account,
    ROUND(SUM(Amount), 2) AS GL_Amount
FROM fGL
WHERE ClosePeriod IN ('2025-10','2025-11')
  AND Entity = 'ENT01'
GROUP BY Account
ORDER BY Account;