Finance Ops Portfolio — End-to-End Close Automation System
A full month-end close workflow: controls, variances, rollforward, exceptions, evidence, and reporting.

Executive Summary
This repository showcases a complete, audit-ready month-end close system built using Excel, Power Query, SQL, and Power BI.
It simulates how a modern Finance Ops / Controlling team operates: from raw ERP exports to reconciliations, variance explanations, exception detection, evidence packs, and reporting dashboards.
The project demonstrates system design, data engineering, accounting controls, and operational finance automation—all using synthetic, SAP-like datasets.

System Architecture (Visual Diagram)


What’s Inside (System Components)
1. Excel Close Pack
• 	TB & GL pivot views
• 	Mapping tables (Account → FS Line / BS‑PL / ControlFlag)
• 	PL Variance model (Current vs Prior, buckets, drivers, owners, comments)
• 	Variance workflow tracker (Open → Pending → Closed)
• 	BS Rollforward (Opening → Movements → Closing)
• 	Exceptions engine (unmapped accounts, unexpected signs, cut-off issues)
• 	Audit-ready close checklist (tasks, owners, evidence, sign-off)
2. Power Query
• 	 / : type enforcement + header normalization
• 	Parameter-driven refresh (, )
• 	: canonical fact table (star-schema friendly)
3. SQL Checks (SQLite)
• 	GL totals by account/month
• 	Cash / AR / AP control account validation
• 	TB vs GL integrity checks
4. Power BI
• 	Semantic model (fGL + dAccount + dEntity)
• 	Dashboards: TB integrity, BS rollforward, PL variance
5. Evidence Pack
• 	Bank reconciliation
• 	AR/AP tie-outs
• 	Accrual support
• 	Cut-off listings
• 	JE log with EvidenceRef

Repo Structure

/01_raw_exports/        Raw TB, GL, AR, AP, Bank extracts
/02_power_query/        PQ notes + query exports
/03_excel_close_pack/   Close_Pack_Skeleton.xlsx
/04_powerbi/            GL_Close_Report.pbix
/05_sql_checks/         SQL scripts + SQLite DB
/06_docs_evidence/      Evidence folders (bank rec, AR/AP, accruals)
README.md

How to Run
- Excel Close Pack
- Update parameters (ClosePeriod, Entity)
- Refresh All (Power Query loads raw exports)
- SQL Checks
- Export fGL.csv
- Load into SQLite
- Run scripts in /05_sql_checks/
- Power BI
- Open .pbix
- Refresh model (reads Excel tables)

Why This Matters
This project demonstrates how a Finance Ops Engineer:
- Designs audit-ready close systems
- Builds controls that prevent errors
- Ensures data integrity across TB, GL, AR, AP, and Cash
- Automates repetitive close tasks
- Creates variance workflows with ownership and traceability
- Produces evidence packs aligned with audit expectations
- Connects Excel, SQL, and Power BI into a single operational model
It reflects the real workflows used in SaaS, fintech, and multinational finance teams.

Key Learnings
Building this system required mastering:
Finance & Accounting
- Month-end close sequencing
- Cut-off, accruals, and control accounts
- Variance analysis with drivers and explanations
- Balance sheet rollforward logic
- Audit evidence discipline
Data Engineering
- Normalizing ERP-like exports
- Designing a canonical fact table (fGL)
- Parameter-driven ETL with Power Query
- SQL integrity checks
- Star-schema modeling for BI
Systems & Automation
- Workflow design (Open → Pending → Closed)
- Exception detection frameworks
- Mapping logic for FSLine / BS-PL classification
- End-to-end reproducibility
Reporting & Visualization
- Power BI semantic modeling
- TB integrity dashboards
- PL variance visuals
- Close health monitoring

Who This Is For
- Hiring managers evaluating Finance Ops / Controlling / Accounting Systems skills
- Analysts learning how to build a real close workflow
- Anyone wanting a reproducible, audit-ready close simulation

What’s Not Included
- No real company data
- No confidential templates
- No proprietary ERP logic
- No sensitive customer/vendor names


