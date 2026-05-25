# SharePoint / Microsoft Lists Design

## Overview

The semi-live version of OperationsFlow is designed to use Microsoft Lists or SharePoint Lists as the backend data layer.

The first implementation uses three lists:

1. Safety Incidents
2. Corrective Actions
3. Training Expiry

These lists mirror the CSV sample data used in the Power BI proof version.

## List 1: Safety Incidents

Purpose: Track safety incidents, hazards, near misses, risk level, assigned manager, and review status.

### Columns

| Column Name | Type | Notes |
|---|---|---|
| Title / Incident Title | Single line text | Default Title column renamed for readability |
| IncidentID | Single line text | Example: INC-001 |
| IncidentDate | Date and time | Date only |
| Site | Choice | Whakatāne, Rotorua, Tauranga, Auckland, Hamilton |
| Category | Choice | Hazard, Near Miss, Incident, Injury, Property Damage, Environmental |
| RiskLevel | Choice | Low, Medium, High, Critical |
| ReportedBy | Single line text | Text field for demo version |
| AssignedManager | Single line text | Text field for demo version |
| Status | Choice | New, Under Review, Action Required, Closed |
| RequiresCorrectiveAction | Yes/No | Flags whether follow-up is required |
| Description | Multiple lines of text | Incident details |

### Choice Values

Site:
- Whakatāne
- Rotorua
- Tauranga
- Auckland
- Hamilton

Category:
- Hazard
- Near Miss
- Incident
- Injury
- Property Damage
- Environmental

RiskLevel:
- Low
- Medium
- High
- Critical

Status:
- New
- Under Review
- Action Required
- Closed

## List 2: Corrective Actions

Purpose: Track corrective actions raised from incidents or compliance issues.

### Columns

| Column Name | Type | Notes |
|---|---|---|
| Title / Action Title | Single line text | Default Title column renamed for readability |
| ActionID | Single line text | Example: ACT-001 |
| IncidentID | Single line text | Lightweight link to Safety Incidents |
| AssignedTo | Single line text | Text field for demo version |
| Priority | Choice | Low, Medium, High, Critical |
| DueDate | Date and time | Date only |
| Status | Choice | Not Started, In Progress, Complete, Cancelled |
| CompletedDate | Date and time | Optional |
| Notes | Multiple lines of text | Action updates/details |

### Choice Values

Priority:
- Low
- Medium
- High
- Critical

Status:
- Not Started
- In Progress
- Complete
- Cancelled

## List 3: Training Expiry

Purpose: Track training and certification expiry status.

### Columns

| Column Name | Type | Notes |
|---|---|---|
| Title / Staff Name | Single line text | Default Title column renamed for readability |
| TrainingID | Single line text | Example: TRN-001 |
| Role | Single line text | Staff role |
| TrainingType | Choice | Type of training/certification |
| IssueDate | Date and time | Date only |
| ExpiryDate | Date and time | Date only |
| Status | Choice | Valid, Expiring Soon, Expired |
| DaysUntilExpiry | Number | Whole number |
| Manager | Single line text | Responsible manager |

### Choice Values

TrainingType:
- First Aid
- Forklift Licence
- Fire Warden
- Driver Safety
- Working at Heights
- Hazardous Substances
- Site Induction

Status:
- Valid
- Expiring Soon
- Expired

## Suggested Views

### Safety Incidents

View name: Open Incidents

Filter:
- Status is not equal to Closed

### Corrective Actions

View name: Open Actions

Filter:
- Status is not equal to Complete

### Training Expiry

View name: Training Needs Attention

Filter:
- Status is not equal to Valid

## Future Improvements

Future versions could use:

- Lookup fields between Safety Incidents and Corrective Actions
- Person/group fields for AssignedTo and Manager
- calculated columns for DaysUntilExpiry
- automatic status calculation
- list formatting for risk/priority/status colours
- item-level permissions if required