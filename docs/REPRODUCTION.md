# Reproduction

## Requirements

- Windows 10 or Windows 11
- Microsoft Power BI Desktop
- Git
- PowerShell 5.1 or later

## Review the latest report

1. Clone the repository.
2. Open `power-bi/OperationsFlow_Dashboard_v1_3.pbix`.
3. Confirm all six pages render:
   - Executive Overview
   - Corrective Actions
   - Training Compliance
   - Document Control
   - Work Orders
   - Risk Register
4. Confirm the report uses the six CSVs in `sample-data`.
5. Update local source paths if Power BI requests it.

## Repository verification

Run:

```powershell
.\tools\verify-repository.ps1
```

The verifier checks all PBIX packages, all CSV datasets, all six screenshots,
the manual-review hash, public boundaries, and closure documents.

## Expected outcome

The latest report opens as a six-page synthetic operations and compliance
dashboard. The Microsoft 365 material remains an implementation design only.
