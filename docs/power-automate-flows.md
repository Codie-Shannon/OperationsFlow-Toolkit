# Power Automate Flow Plan

## Overview

The semi-live version of OperationsFlow is designed to use Power Automate to reduce manual follow-up and alert managers when safety/compliance items need attention.

The first version focuses on three flows:

1. High-risk incident alert
2. Overdue corrective action reminder
3. Training expiry reminder

## Flow 1: High-Risk Incident Alert

### Purpose

Notify the appropriate person when a high-risk or critical incident is logged.

### Trigger

When an item is created in the Safety Incidents list.

### Condition

If:

RiskLevel is High  
OR  
RiskLevel is Critical

### Actions

- Send email or Teams notification to assigned manager/admin
- Include incident details:
  - IncidentID
  - Incident Title
  - Site
  - Category
  - RiskLevel
  - ReportedBy
  - Description
- Optionally update Status to Action Required

### Business Value

Ensures serious incidents are noticed quickly and not lost in a list or spreadsheet.

## Flow 2: Overdue Corrective Action Reminder

### Purpose

Remind responsible people about corrective actions that are overdue.

### Trigger

Scheduled recurrence.

Suggested schedule:

- daily at 8:00 AM
- or weekdays only

### Logic

Get items from Corrective Actions where:

- Status is not Complete
- DueDate is before today

### Actions

- Send email/Teams reminder to assigned person or admin
- Include:
  - ActionID
  - Action Title
  - IncidentID
  - AssignedTo
  - Priority
  - DueDate
  - Status
  - Notes

### Business Value

Reduces missed follow-ups and gives managers visibility over overdue work.

## Flow 3: Training Expiry Reminder

### Purpose

Notify managers when training records are expiring soon or already expired.

### Trigger

Scheduled recurrence.

Suggested schedule:

- daily or weekly

### Logic

Get items from Training Expiry where:

- Status is Expiring Soon
- OR Status is Expired

Alternative calculated logic:

- ExpiryDate is less than or equal to 30 days from today
- OR ExpiryDate is before today

### Actions

- Send reminder to manager/admin
- Include:
  - TrainingID
  - Staff Name
  - Role
  - TrainingType
  - ExpiryDate
  - DaysUntilExpiry
  - Status
  - Manager

### Business Value

Helps avoid expired training and supports better compliance tracking.

## Optional Flow 4: Corrective Action Completion Update

### Purpose

Automatically populate CompletedDate when an action is marked Complete.

### Trigger

When an item is modified in Corrective Actions.

### Condition

If Status equals Complete  
AND CompletedDate is empty

### Action

Update item:

- CompletedDate = today

### Business Value

Improves data quality and completion reporting.

## Optional Flow 5: Weekly Management Summary

### Purpose

Send managers a weekly summary of open incidents, overdue actions, and training expiry.

### Trigger

Scheduled recurrence.

Suggested schedule:

- Monday 8:00 AM

### Data

- Count open incidents
- Count high/critical incidents
- Count overdue corrective actions
- Count expired/expiring training records

### Action

Send email/Teams message with summary.

### Business Value

Provides regular visibility without requiring managers to open the dashboard manually.

## Deployment Notes

Initial flows should be built using fake/sample data in a test environment.

Flows should not be connected to live business data until:

- permissions are approved
- test data is confirmed
- notification recipients are confirmed
- flow ownership is clear
- error handling is reviewed