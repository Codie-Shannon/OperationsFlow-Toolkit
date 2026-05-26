# OperationsFlow Toolkit

OperationsFlow Toolkit is a modular internal business workflow and reporting demo designed to show how common admin, safety, compliance, document control, work order, and follow-up processes can be centralised, tracked, automated, and reported on.

Version 1 started with the **SafetyFlow** module, which demonstrates incident tracking, corrective action management, training/certification expiry tracking, and Power BI dashboard reporting.

The project has since been expanded with:

- Document Control
- Work Orders / Job Tracking

## Current Status

Completed:

- Power BI dashboard proof layer
- Executive Overview dashboard page
- Corrective Actions dashboard page
- Training Compliance dashboard page
- Document Control dashboard page
- Work Orders dashboard page
- Sample CSV datasets
- Data model documentation
- SharePoint / Microsoft Lists design
- Power Apps screen plan
- Power Automate flow plan
- Deployment plan
- Document Control module documentation
- Work Orders module documentation
- GitHub repository package

Pending:

- Microsoft 365 tenant/test area access
- Microsoft Lists / SharePoint Lists deployment
- Power Apps canvas app build
- Power Automate flow build
- Power BI connection to live list data
- Optional Risk Register module build
- Optional Equipment Inspection module build
- Optional Contractor Induction module build

## Business Problem

Many small businesses track safety incidents, corrective actions, training expiry, document reviews, work orders, compliance tasks, and follow-ups across spreadsheets, emails, folders, and manual reminders.

This can lead to:

- missed follow-ups
- overdue corrective actions
- expired training records
- outdated policies or procedures
- unclear document ownership
- overdue work orders
- poor visibility over job status
- duplicated admin effort
- slow reporting
- limited management visibility

## Solution

OperationsFlow centralises key records, tracks ownership and due dates, highlights overdue work, and provides dashboard reporting for management visibility.

The planned semi-live version extends this by using Microsoft Lists / SharePoint Lists as the backend, Power Apps as the user interface, and Power Automate for reminders and alerts.

## Current Modules

- Safety Incidents
- Corrective Actions
- Training / Certification Expiry
- Document Control
- Work Orders / Job Tracking
- Compliance Dashboard
- Semi-live Microsoft 365 implementation plan

## Planned Expansion Modules

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
- DAX measures
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

### Document Control

Tracks controlled documents, review dates, document status, document ownership, overdue reviews, and documents requiring attention.

### Work Orders

Tracks operational jobs, job status, due dates, assigned ownership, overdue work, priority, estimated/actual hours, and workload reporting.

## Screenshots

### Executive Overview

![Executive Overview](screenshots/OperationsFlow_SafetyFlow_ExecutiveOverview_v1.png)

### Corrective Actions

![Corrective Actions](screenshots/OperationsFlow_SafetyFlow_CorrectiveActions_v1.png)

### Training Compliance

![Training Compliance](screenshots/OperationsFlow_SafetyFlow_TrainingCompliance_v1.png)

### Document Control

![Document Control](screenshots/OperationsFlow_DocumentControl_v1.png)

### Work Orders

![Work Orders](screenshots/OperationsFlow_WorkOrders_v1.png)

## Sample Data

Sample CSV data is stored in the `sample-data` folder:

- `Safety_Incidents.csv`
- `Corrective_Actions.csv`
- `Training_Expiry.csv`
- `Document_Control.csv`
- `Work_Orders.csv`

## Data Note

All data used in this project is fake/sample data created for demonstration purposes only. No real business, client, employee, or safety data is included.

## Power BI Files

The Power BI report files are stored in the `power-bi` folder:

- `OperationsFlow_Dashboard_v1.pbix`
- `OperationsFlow_Dashboard_v1_1.pbix`
- `OperationsFlow_Dashboard_v1_2.pbix`

Version meaning:

- `v1` = SafetyFlow base dashboard
- `v1_1` = Document Control module added
- `v1_2` = Work Orders module added

## Documentation

Supporting documentation is stored in the `docs` folder:

- `project-summary.md`
- `data-model.md`
- `sharepoint-list-design.md`
- `power-apps-screen-plan.md`
- `power-automate-flows.md`
- `deployment-plan.md`
- `future-module-document-control.md`
- `future-module-work-orders.md`

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

The Document Control module helps businesses track policies, procedures, forms, registers, templates, and other controlled documents so review dates, version updates, ownership, and document status are easier to manage.

The planned Document Control workflow is:

Document created  
→ owner assigned  
→ review date set  
→ status tracked  
→ reminders sent when review is due or overdue  
→ dashboard provides visibility

The module tracks:

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

## Work Orders Expansion

The Work Orders module helps businesses track operational jobs, service tasks, internal work, support requests, and follow-up work.

The planned Work Orders workflow is:

Job created  
→ owner assigned  
→ due date set  
→ priority assigned  
→ status tracked  
→ overdue work highlighted  
→ dashboard provides visibility

The module tracks:

- job ID
- job name
- client
- site
- job type
- status
- created date
- due date
- completed date
- assigned person
- priority
- estimated hours
- actual hours
- notes

The full design is documented in:

- `docs/future-module-work-orders.md`

## Why This Project Matters

This project demonstrates how manual spreadsheet-based processes can be turned into structured business workflows.

The dashboard layer gives management visibility over open incidents, overdue corrective actions, training compliance, document reviews, and work order status.

The planned Microsoft 365 semi-live version would allow users to submit and update records through Power Apps, store them in Microsoft Lists / SharePoint Lists, trigger reminders through Power Automate, and report on live data through Power BI.

The same workflow pattern can be reused across other business areas, including document control, risk management, equipment checks, contractor onboarding, job tracking, and monthly reporting.

## Future Improvements

Future versions could include:

- Microsoft Lists / SharePoint Lists deployment
- Power Apps incident submission form
- Power Apps corrective action tracker
- Power Apps work order register
- Power Apps document review register
- Power Automate high-risk incident alerts
- Power Automate overdue action reminders
- Power Automate training expiry reminders
- Power Automate document review reminders
- Power Automate overdue work order reminders
- Power BI connection to live Microsoft Lists / SharePoint data
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
│   ├── future-module-document-control.md
│   └── future-module-work-orders.md
├── sample-data
│   ├── Safety_Incidents.csv
│   ├── Corrective_Actions.csv
│   ├── Training_Expiry.csv
│   ├── Document_Control.csv
│   └── Work_Orders.csv
├── screenshots
│   ├── OperationsFlow_SafetyFlow_ExecutiveOverview_v1.png
│   ├── OperationsFlow_SafetyFlow_CorrectiveActions_v1.png
│   ├── OperationsFlow_SafetyFlow_TrainingCompliance_v1.png
│   ├── OperationsFlow_DocumentControl_v1.png
│   └── OperationsFlow_WorkOrders_v1.png
└── power-bi
    ├── OperationsFlow_Dashboard_v1.pbix
    ├── OperationsFlow_Dashboard_v1_1.pbix
    └── OperationsFlow_Dashboard_v1_2.pbix