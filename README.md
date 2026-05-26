# OperationsFlow Toolkit

OperationsFlow Toolkit is a modular internal business workflow and reporting demo designed to show how common admin, safety, compliance, and follow-up processes can be centralised, tracked, automated, and reported on.

Version 1 focuses on the **SafetyFlow** module, which demonstrates incident tracking, corrective action management, training/certification expiry tracking, and Power BI dashboard reporting.

## Current Status

Completed:

- Power BI dashboard proof layer
- Executive Overview dashboard page
- Corrective Actions dashboard page
- Training Compliance dashboard page
- Sample CSV dataset
- Data model documentation
- SharePoint / Microsoft Lists design
- Power Apps screen plan
- Power Automate flow plan
- Deployment plan
- Document Control future module design
- GitHub repository package

Pending:

- Microsoft 365 tenant/test area access
- Microsoft Lists / SharePoint Lists deployment
- Power Apps canvas app build
- Power Automate flow build
- Power BI connection to live list data
- Optional Document Control dashboard/module build

## Business Problem

Many small businesses track safety incidents, corrective actions, training expiry, document reviews, and compliance tasks across spreadsheets, emails, folders, and manual follow-ups.

This can lead to:

- missed follow-ups
- overdue corrective actions
- expired training records
- outdated policies or procedures
- unclear document ownership
- slow reporting
- limited management visibility
- duplicated admin effort

## Solution

OperationsFlow centralises key records, tracks ownership and due dates, highlights overdue work, and provides dashboard reporting for management visibility.

The planned semi-live version extends this by using Microsoft Lists / SharePoint Lists as the backend, Power Apps as the user interface, and Power Automate for reminders and alerts.

## Version 1 Modules

- Safety Incidents
- Corrective Actions
- Training / Certification Expiry
- Compliance Dashboard
- Semi-live Microsoft 365 implementation plan

## Planned Expansion Modules

- Document Control
- Risk Register
- Equipment Inspections
- Contractor Inductions
- PPE / Gear Register
- Monthly Compliance Reporting
- Teams notifications
- PDF/email report generation

## Tools Used

- Power BI Desktop
- CSV sample data
- Microsoft Lists / SharePoint Lists design
- Power Apps screen plan
- Power Automate flow plan
- GitHub documentation

## Dashboard Pages

### Executive Overview

Shows high-level safety and compliance status, including open incidents, high-risk incidents, overdue actions, training expiry, and a management summary.

### Corrective Actions

Tracks corrective action status, priority, assigned ownership, overdue work, high-priority work, and completion rate.

### Training Compliance

Tracks training records, valid training, expiring soon records, expired training, compliance rate, and training records requiring attention.

## Screenshots

### Executive Overview

![Executive Overview](screenshots/OperationsFlow_SafetyFlow_ExecutiveOverview_v1.png)

### Corrective Actions

![Corrective Actions](screenshots/OperationsFlow_SafetyFlow_CorrectiveActions_v1.png)

### Training Compliance

![Training Compliance](screenshots/OperationsFlow_SafetyFlow_TrainingCompliance_v1.png)

## Sample Data

Sample CSV data is stored in the `sample-data` folder:

- `Safety_Incidents.csv`
- `Corrective_Actions.csv`
- `Training_Expiry.csv`

## Data Note

All data used in this project is fake/sample data created for demonstration purposes only. No real business, client, employee, or safety data is included.

## Power BI File

The Power BI report file is stored in the `power-bi` folder:

- `OperationsFlow_Dashboard_v1.pbix`

## Documentation

Supporting documentation is stored in the `docs` folder:

- `project-summary.md`
- `data-model.md`
- `sharepoint-list-design.md`
- `power-apps-screen-plan.md`
- `power-automate-flows.md`
- `deployment-plan.md`
- `future-module-document-control.md`

## Current Workflow

Incident logged  
→ risk level assigned  
→ corrective action created  
→ owner and due date tracked  
→ overdue / high-risk items identified  
→ dashboard updates with current status

## Planned Semi-Live Workflow

Incident submitted through Power Apps  
→ record saved to Microsoft Lists / SharePoint Lists  
→ high-risk incident alert triggered through Power Automate  
→ corrective actions tracked by owner and due date  
→ overdue reminders sent automatically  
→ Power BI reports from live list data

## Document Control Expansion

The Document Control module is a planned expansion for OperationsFlow Toolkit.

This module would help businesses track policies, procedures, forms, registers, templates, and other controlled documents so review dates, version updates, ownership, and document status are easier to manage.

The planned Document Control workflow is:

Document created  
→ owner assigned  
→ review date set  
→ status tracked  
→ reminders sent when review is due or overdue  
→ dashboard provides visibility

The module would use Microsoft Lists / SharePoint Lists to track:

- document name
- document ID
- document type
- department
- owner
- version
- status
- last reviewed date
- next review date
- days until review
- document link
- notes

The full design is documented in:

- `docs/future-module-document-control.md`

## Why This Project Matters

This project demonstrates how a manual spreadsheet-based process can be turned into a structured business workflow.

The dashboard layer gives management visibility over open incidents, overdue corrective actions, and training compliance. The planned Microsoft 365 semi-live version would allow users to submit records through Power Apps, store them in Microsoft Lists / SharePoint Lists, trigger reminders through Power Automate, and report on live data through Power BI.

The same workflow pattern can be reused across other business areas, including document control, risk management, equipment checks, contractor onboarding, and monthly reporting.

## Future Improvements

Future versions could include:

- Microsoft Lists / SharePoint Lists deployment
- Power Apps incident submission form
- Power Apps corrective action tracker
- Power Automate high-risk incident alerts
- Power Automate overdue action reminders
- Power Automate training expiry reminders
- Power BI connection to live Microsoft Lists / SharePoint data
- Document Control dashboard page
- Risk Register module
- Equipment Inspection module
- Contractor Induction module
- Teams notifications
- PDF/email reporting
- role-based views
- manager-specific dashboards

## Repository Structure

```text
OperationsFlow-Toolkit
├── README.md
├── docs
│   ├── project-summary.md
│   ├── data-model.md
│   ├── sharepoint-list-design.md
│   ├── power-apps-screen-plan.md
│   ├── power-automate-flows.md
│   ├── deployment-plan.md
│   └── future-module-document-control.md
├── sample-data
│   ├── Safety_Incidents.csv
│   ├── Corrective_Actions.csv
│   └── Training_Expiry.csv
├── screenshots
│   ├── OperationsFlow_SafetyFlow_ExecutiveOverview_v1.png
│   ├── OperationsFlow_SafetyFlow_CorrectiveActions_v1.png
│   └── OperationsFlow_SafetyFlow_TrainingCompliance_v1.png
└── power-bi
    └── OperationsFlow_Dashboard_v1.pbix