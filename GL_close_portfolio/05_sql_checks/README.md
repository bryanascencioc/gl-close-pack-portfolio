# SQL Controls — Month-End Close Integrity Checks

This folder contains the SQL modules used to validate **GL integrity**, **control accounts**, and **Trial Balance (TB) reconciliation** as part of the **month-end close workflow**.

All scripts follow **audit-grade patterns** commonly used in enterprise **Finance Ops / Controlling** environments (including **SOX-style controls**): clear parameter filters, repeatable outputs, tolerance handling, and **OK / REVIEW** flags for evidence-ready review.

---

## Included Checks

### 1) Control Accounts Integrity (Multi-Period)
**File:** `control_accounts_multi_period_enterprise.sql`

Validates key **control accounts** across multiple periods, including:

- **Cash** (572-series)
- **Accounts Receivable (AR)** (430-series)
- **Accounts Payable (AP)** (400/410-series)

**Output highlights:**
- Multi-period rollup
- **Tolerance logic** (rounding / minor differences)
- Status flags: **OK** / **REVIEW**

---

### 2) GL Totals by Account (Multi-Period)
**File:** `gl_totals_by_account_multi_period.sql`

Summarizes **GL balances by account** across periods to ensure:

- **Completeness**
- No **unexpected postings**
- **Period-over-period consistency**

This is typically run **before variance analysis** to confirm the ledger is stable and explainable.

---

### 3) TB vs GL Reconciliation (Account-Level)
**File:** `tb_vs_gl_account_totals.sql`

Provides **GL totals by account** for reconciliation against the **Trial Balance**.

Implements the standard audit pattern for **TB vs GL validation** at the account level (tie-out foundation for close sign-off).

---

## How These Scripts Fit Into the Close Process

These SQL checks support:

- **Balance Sheet integrity**
- **Control account validation**
- **Variance preparation**
- **Audit evidence**
- **SOX-style controls**
- **Data quality assurance**

They are executed **after Power Query** produces the canonical **`fGL` fact table** (the “single source of truth” for close checks).

---

## Execution Notes

- Scripts are **parameterized** for **Entity** and **ClosePeriod** selection.
- Designed to run on **SQLite** for portability (easy to reproduce in a portfolio).
- Safe for public portfolio use (**no proprietary logic exposed**).

---

## Expected Inputs

- `fGL` (canonical ledger fact table produced by Power Query)
- (Optional, depending on your implementation) TB extract table for tie-outs

> Tip: Keep exported query results (CSV) in your Evidence Pack to show *repeatable close controls*.