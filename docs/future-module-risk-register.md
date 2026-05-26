# Module: Risk Register

## Overview

The Risk Register module is an expansion of OperationsFlow Toolkit focused on identifying, tracking, reviewing, and reporting business risks.

This module is designed to help businesses maintain visibility over safety, compliance, operational, IT, reporting, and data quality risks.

The module follows the OperationsFlow pattern:

Risk identified  
→ likelihood and impact assessed  
→ risk rating calculated  
→ owner assigned  
→ mitigation recorded  
→ review date set  
→ dashboard provides visibility

## Business Problem

Many businesses track risks informally through spreadsheets, meeting notes, emails, or scattered documents.

This can lead to:

- high risks being missed or forgotten
- unclear risk ownership
- no consistent review process
- poor visibility over critical risks
- limited reporting for management
- duplicated or outdated risk records
- manual follow-up work

## Solution

The Risk Register module provides a central risk tracking register with likelihood, impact, rating, owner, review date, status, mitigation, and notes.

The Power BI dashboard highlights active risks, high-rated risks, critical risks, risks under review, and upcoming risk reviews.

The planned Microsoft 365 version could use Microsoft Lists or SharePoint Lists for the register, Power Apps for risk entry/review, and Power Automate for review reminders and escalation alerts.

## Data Source

Current proof version:

- CSV sample data

Planned semi-live version:

- Microsoft Lists / SharePoint Lists

## Sample Data File

Sample data is stored in:

`sample-data/Risk_Register.csv`

## Planned List / Dataset: Risk Register

| Column Name | Type | Purpose |
|---|---|---|
| RiskID | Single line text | Unique risk reference, e.g. RSK-001 |
| RiskTitle | Single line text | Short description of the risk |
| Category | Choice | Safety, Compliance, Operations, IT, Data Quality, Reporting |
| Likelihood | Number | Likelihood score, usually 1–5 |
| Impact | Number | Impact score, usually 1–5 |
| RiskRating | Number | Calculated or entered score, usually Likelihood × Impact |
| Owner | Single line text | Person responsible for monitoring the risk |
| ReviewDate | Date | Next review date |
| Status | Choice | Active, Under Review, Monitoring, Closed |
| Mitigation | Multiple lines of text | Planned or current risk control/mitigation |
| Notes | Multiple lines of text | Supporting notes or context |

## Choice Values

### Category

- Safety
- Compliance
- Operations
- IT
- Data Quality
- Reporting

### Status

- Active
- Under Review
- Monitoring
- Closed

### Risk Rating Bands

Suggested interpretation:

| Rating | Meaning |
|---|---|
| 1–7 | Low |
| 8–11 | Medium |
| 12–15 | High |
| 16+ | Critical |

## Dashboard Page

The Power BI dashboard includes a Risk Register page.

### KPI Cards

- Total Risks
- Active Risks
- High Risks
- Critical Risks
- Risks Under Review
- Average Risk Rating

### Charts

- Risks by Status
- Risks by Category
- Risks by Owner
- Risks by Rating
- Risk Reviews by Month

### Detail Table

The table shows high and critical risks with:

- RiskID
- RiskTitle
- Category
- Owner
- Likelihood
- Impact
- RiskRating
- ReviewDate
- Status
- Mitigation

## Power BI Measures

The module uses measures such as:

- Total Risks
- Active Risks
- High Risks
- Critical Risks
- Risks Under Review
- Monitoring Risks
- Average Risk Rating

## Planned Power Apps Screens

### Risk Register

Shows all risks with filters for:

- Category
- Status
- Owner
- Risk Rating

### Risk Detail

Shows full details for a selected risk, including likelihood, impact, rating, owner, review date, mitigation, and notes.

### New / Edit Risk

Allows users to create or update risk records.

### Risk Review Queue

Shows risks that are due for review or currently under review.

## Planned Power Automate Flows

### Flow 1: Risk Review Reminder

Trigger:

- Scheduled recurrence, e.g. weekly Monday morning

Logic:

- Find risks where Status is Active, Monitoring, or Under Review
- Find risks where ReviewDate is within the next 30 days or overdue

Actions:

- Send reminder to the risk owner or admin
- Include RiskID, RiskTitle, Category, Owner, RiskRating, ReviewDate, Status, and Mitigation

### Flow 2: Critical Risk Alert

Trigger:

- When a risk item is created or modified

Condition:

- RiskRating is greater than or equal to 16

Actions:

- Notify manager/admin
- Include the risk details and mitigation notes

### Flow 3: Review Status Update

Trigger:

- When a risk item is modified

Logic:

- If ReviewDate is updated and Status is Under Review, allow status to return to Active or Monitoring

Business value:

- Helps keep risk records up to date after review.

## Business Value

The Risk Register module helps businesses:

- identify and track risks in one place
- make ownership clearer
- highlight high and critical risks
- improve management visibility
- reduce missed reviews
- support compliance and audit readiness
- connect risk tracking with corrective actions, training, document control, and work orders

## Relationship to Other OperationsFlow Modules

The Risk Register module connects naturally with other OperationsFlow modules:

### SafetyFlow

High-risk incidents may create or update risks.

### Corrective Actions

Risks may require corrective actions to reduce likelihood or impact.

### Training Compliance

Expired or missing training can become a compliance or safety risk.

### Document Control

Outdated policies and procedures can become document control risks.

### Work Orders

Overdue or incomplete work orders can create operational risks.

## Future Enhancements

- SharePoint List backend
- Power Apps risk entry/review form
- automated risk review reminders
- critical risk alerts
- calculated risk rating from likelihood and impact
- risk heat map
- risk trend reporting over time
- relationship between risks and corrective actions
- owner-specific risk views
- monthly risk summary email
- Teams notifications
- PDF/email risk report generation