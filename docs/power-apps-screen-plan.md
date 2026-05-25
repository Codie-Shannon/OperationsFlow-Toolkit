# Power Apps Screen Plan

## Overview

The planned Power Apps interface will provide a simple front-end for the OperationsFlow / SafetyFlow workflow.

The app will allow users to:

- log new incidents
- view open incidents
- review corrective actions
- update action status
- view training expiry records
- identify items needing attention

The app is designed to connect to Microsoft Lists / SharePoint Lists.

## Data Sources

Planned data sources:

- Safety Incidents
- Corrective Actions
- Training Expiry

## Screen 1: Home

### Purpose

Provide a simple landing screen and navigation hub.

### Elements

- App title: OperationsFlow / SafetyFlow
- Navigation buttons:
  - New Incident
  - Incident Register
  - Corrective Actions
  - Training Expiry
  - Dashboard Link / Reporting Notes

### Business Value

Gives users a central place to access the workflow.

## Screen 2: New Incident

### Purpose

Allow users to submit a new safety incident or hazard.

### Data Source

Safety Incidents

### Fields

- Incident Title
- Incident Date
- Site
- Category
- Risk Level
- Reported By
- Assigned Manager
- Requires Corrective Action
- Description
- Status

### Buttons

- Submit Incident
- Cancel / Back

### Submit Logic

When the user submits the form:

1. A new item is created in the Safety Incidents list.
2. Status defaults to New or Action Required depending on risk/follow-up.
3. If RiskLevel is High or Critical, Power Automate can trigger an alert.

## Screen 3: Incident Register

### Purpose

Show existing incident records and allow filtering by site, risk level, and status.

### Data Source

Safety Incidents

### Elements

- Search box
- Gallery/list of incidents
- Filters:
  - Site
  - RiskLevel
  - Status
- Incident detail navigation

### Business Value

Allows managers/admin users to see what has been reported and what still requires attention.

## Screen 4: Incident Detail

### Purpose

Show full details for one incident.

### Data Source

Safety Incidents

### Elements

- Incident details
- Risk level
- Assigned manager
- Status
- Description
- Related corrective actions filtered by IncidentID

### Buttons

- Edit Incident
- Create Corrective Action
- Back

### Future Improvement

A future version could automatically create a corrective action when a high-risk incident is logged.

## Screen 5: Corrective Actions

### Purpose

Track follow-up actions, ownership, priority, due dates, and status.

### Data Source

Corrective Actions

### Elements

- Gallery/table of corrective actions
- Filters:
  - AssignedTo
  - Priority
  - Status
- Highlight overdue actions
- Action detail form

### Editable Fields

- AssignedTo
- Priority
- DueDate
- Status
- CompletedDate
- Notes

### Business Value

Helps prevent follow-up actions from being missed or forgotten.

## Screen 6: Training Expiry

### Purpose

Show training/certification records and identify expired or expiring records.

### Data Source

Training Expiry

### Elements

- Gallery/table of training records
- Filters:
  - Role
  - TrainingType
  - Status
  - Manager
- Highlight Expired and Expiring Soon records

### Business Value

Helps managers identify training that needs renewal before it becomes a compliance issue.

## Screen 7: Reporting / Dashboard

### Purpose

Provide a link or note explaining the Power BI reporting layer.

### Elements

- Power BI report location/link if available
- Description of dashboard pages:
  - Executive Overview
  - Corrective Actions
  - Training Compliance

## App Navigation

Suggested navigation flow:

Home  
→ New Incident  
→ Incident Register  
→ Incident Detail  
→ Corrective Actions  
→ Training Expiry  
→ Reporting

## Future App Improvements

- role-based screens
- Teams integration
- mobile-friendly layout
- automatic corrective action creation
- manager-specific views
- attachment upload for incident evidence
- Power BI embedded/report link