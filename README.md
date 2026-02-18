# GL Close Portfolio — Close Pack (Excel + Power Query + SQL + Power BI)

## What this is
A mini month-end close system built to simulate an enterprise close workflow:
raw exports → cleaning → tie-outs/controls → variance review → evidence habits → reporting.

## Data sources (SAP-like exports)
Inputs are modeled as standard finance exports:
- Trial Balance (TB)
- GL Detail
- Bank Statement
- AR / AP subledger extracts (for controls and tie-outs)

## Process (end-to-end)
1) Excel Close Pack skeleton (tabs + parameters + checklist)
2) Excel controls:
   - Bank vs GL cash tie-out
   - AR control vs GL
   - AP control vs GL
3) Pivot views for TB and GL
4) Mapping (Account → FS Line / BS-PL / ControlFlag)
5) Variance page structure (Current vs Prior + bucket explanations)
6) Power Query:
   - qTB_Clean / qGL_Clean: enforce types + normalize headers
   - pClosePeriod / pEntity: parameter-driven refresh
   - fGL: canonical fact table (star-schema friendly)
7) SQL checks:
   - GL totals by account / month
   - control accounts checks (cash / AR / AP)
8) Power BI:
   - semantic model (fGL + dAccount + dEntity)
   - close dashboards (TB, BS integrity, PL variance)

## Controls (audit-style)
- TB vs GL totals reconcile (same totals, different granularity)
- Cash/AR/AP control accounts highlighted for review
- Bank reconciliation template + reconciling items aging
- JE log with EvidenceRef for traceability

## Repo structure
- /01_raw_exports/     raw exports (TB, GL, AP, AR, Bank)
- /02_power_query/     PQ notes / query exports if needed
- /03_excel_close_pack/ Close_Pack_Skeleton.xlsx
- /04_powerbi/         GL_Close_Report.pbix
- /05_sql_checks/      .sql scripts + SQLite db
- /06_docs_evidence/   evidence folders and references

## How to run
1) Update parameters in Excel (ClosePeriod, Entity) → Refresh All
2) Export fGL.csv → load into SQLite → run SQL checks
3) Refresh Power BI model from Excel tables

## Who this is for
This project is designed for:
- hiring managers evaluating my finance ops / accounting systems skills
- anyone wanting to see a realistic month-end close workflow
- analysts learning how to combine Excel, Power Query, SQL, and Power BI in a close process

## What’s not included
- No real company data
- No confidential templates
- No proprietary ERP logic
- No sensitive customer/vendor names

## Refresh workflow
1. Open Excel Close Pack → Refresh All (Power Query loads raw exports)
2. Export fGL.csv → load into SQLite → run SQL checks in /05_sql_checks/
3. Open Power BI → Refresh (model reads Excel tables)

## Tech stack
- Excel (Power Query, pivots, mapping tables)
- SQL (SQLite)
- Power BI (semantic model + dashboards)
- Evidence pack habits (CSV + PDF)
