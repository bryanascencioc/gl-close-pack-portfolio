-- Control accounts checks (multi-period)
-- Periods: 2024-12 and 2025-01
-- Entity : ENT01

-- CASH (572-like)
SELECT
  'CASH_572' AS CheckName,
  ClosePeriod,
  Entity,
  ROUND(SUM(Amount), 2) AS GL_Total
FROM fGL
WHERE ClosePeriod IN ('2024-12','2025-01')
  AND Entity = 'ENT01'
  AND Account LIKE '572%'
GROUP BY ClosePeriod, Entity

UNION ALL

-- AR control (430-like)
SELECT
  'AR_430' AS CheckName,
  ClosePeriod,
  Entity,
  ROUND(SUM(Amount), 2) AS GL_Total
FROM fGL
WHERE ClosePeriod IN ('2024-12','2025-01')
  AND Entity = 'ENT01'
  AND Account LIKE '430%'
GROUP BY ClosePeriod, Entity

UNION ALL

-- AP control (400/410-like)
SELECT
  'AP_400_410' AS CheckName,
  ClosePeriod,
  Entity,
  ROUND(SUM(Amount), 2) AS GL_Total
FROM fGL
WHERE ClosePeriod IN ('2024-12','2025-01')
  AND Entity = 'ENT01'
  AND (Account LIKE '400%' OR Account LIKE '410%')
GROUP BY ClosePeriod, Entity

ORDER BY CheckName, ClosePeriod;
