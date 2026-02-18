-- TB vs GL by account (requires fGL already loaded; TB source can be fTB if you load it too)
-- This script is a placeholder check file for portfolio packaging:
-- It demonstrates the audit pattern: compare totals by account.

SELECT
  Account,
  ROUND(SUM(Amount), 2) AS GL_Amount
FROM fGL
WHERE ClosePeriod IN ('2025-10','2025-11')
GROUP BY Account
ORDER BY Account;
