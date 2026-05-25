# Deployment Plan

## Overview

OperationsFlow / SafetyFlow is currently built as a Power BI proof-of-concept using sample CSV data.

The next stage is to deploy the workflow into a Microsoft 365 environment using Microsoft Lists or SharePoint Lists, Power Apps, Power Automate, and Power BI.

## Current Version

### Completed

- Sample CSV data created
- Power BI dashboard built
- Executive Overview page completed
- Corrective Actions page completed
- Training Compliance page completed
- Dashboard screenshots captured
- Data model documented
- SharePoint / Microsoft Lists structure documented
- Power Apps screen plan documented
- Power Automate flow plan documented

### Pending Access

The semi-live version requires access to a Microsoft 365 work/school tenant with permission to create:

- Microsoft Lists / SharePoint Lists
- Power Apps canvas app
- Power Automate cloud flows
- Power BI data connection to list data

## Deployment Stage 1: Create List Backend

Create three Microsoft Lists / SharePoint Lists:

1. Safety Incidents
2. Corrective Actions
3. Training Expiry

Use the list designs documented in:

`docs/sharepoint-list-design.md`

### Initial Data

Use fake/sample data only.

Start with:

- 5 safety incidents
- 5 corrective actions
- 5 training expiry records

Once the structure is confirmed, import or add the larger sample dataset.

## Deployment Stage 2: Build Power Apps Interface

Create a canvas app connected to the three lists.

Initial screens:

- Home
- New Incident
- Incident Register
- Incident Detail
- Corrective Actions
- Training Expiry
- Reporting / Dashboard

Use the screen plan documented in:

`docs/power-apps-screen-plan.md`

### Minimum Working App

The minimum app should allow a user to:

- submit a new incident
- view open incidents
- view corrective actions
- update corrective action status
- view training records needing attention

## Deployment Stage 3: Build Power Automate Flows

Create the following flows:

1. High-risk incident alert
2. Overdue corrective action reminder
3. Training expiry reminder

Optional flows:

- corrective action completion date update
- weekly management summary

Use the flow plan documented in:

`docs/power-automate-flows.md`

## Deployment Stage 4: Connect Power BI to Live Lists

Replace CSV data sources with Microsoft Lists / SharePoint Lists.

Power BI report pages:

- Executive Overview
- Corrective Actions
- Training Compliance

Existing Power BI report:

`power-bi/OperationsFlow_Dashboard_v1.pbix`

## Deployment Stage 5: Test Workflow

Test the full workflow using fake/sample data.

### Test 1: High-Risk Incident

1. Create a new incident with RiskLevel = Critical.
2. Confirm the incident saves to the list.
3. Confirm Power Automate sends an alert.
4. Confirm the incident appears in reporting.

### Test 2: Overdue Corrective Action

1. Create a corrective action with a due date before today.
2. Confirm it appears in the overdue action view.
3. Confirm reminder flow identifies it.
4. Confirm it appears in Power BI overdue counts.

### Test 3: Training Expiry

1. Create a training record with an expiry date within 30 days.
2. Confirm it appears as Expiring Soon.
3. Confirm reminder flow identifies it.
4. Confirm it appears in the Training Compliance dashboard.

## Deployment Stage 6: Screenshots and Documentation

Capture screenshots of:

- Microsoft Lists backend
- Power Apps home screen
- Power Apps new incident form
- Power Apps incident register
- Power Automate high-risk alert flow
- Power Automate overdue action reminder flow
- Power BI dashboard connected to live list data

Suggested screenshot names:

- `sharepoint-safety-incidents-list-v1.png`
- `sharepoint-corrective-actions-list-v1.png`
- `sharepoint-training-expiry-list-v1.png`
- `power-app-home-v1.png`
- `power-app-new-incident-v1.png`
- `power-automate-high-risk-alert-v1.png`
- `power-automate-overdue-reminder-v1.png`

## Deployment Notes

The first deployment should remain separate from any live business data.

Before using with real data:

- confirm permission from the organisation
- confirm list ownership
- confirm flow ownership
- confirm notification recipients
- confirm data retention expectations
- test with sample data first
- document changes before going live

## Current Blocker

Power Apps, Power Automate, and SharePoint deployment require access to a Microsoft 365 work/school tenant.

Current status:

- Power BI proof layer is complete.
- Microsoft 365 semi-live deployment is designed.
- Tenant/test-area access is pending.