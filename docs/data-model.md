# Data Model

## Overview

OperationsFlow v1 uses three main datasets:

1. Safety Incidents
2. Corrective Actions
3. Training Expiry

The Power BI proof version uses CSV files. The semi-live version is designed to use Microsoft Lists / SharePoint Lists with the same structure.

## Tables

## Safety Incidents

Tracks safety incidents, hazards, near misses, risk levels, assigned managers, and status.

| Column | Purpose |
|---|---|
| IncidentID | Unique incident reference |
| Title / Incident Title | Short incident description |
| IncidentDate | Date the incident occurred or was logged |
| Site | Location/site |
| Category | Incident type/category |
| RiskLevel | Low, Medium, High, Critical |
| ReportedBy | Person who reported it |
| AssignedManager | Person responsible for review |
| Status | New, Under Review, Action Required, Closed |
| RequiresCorrectiveAction | Yes/No flag |
| Description | Longer notes/details |

## Corrective Actions

Tracks actions raised from incidents or compliance issues.

| Column | Purpose |
|---|---|
| ActionID | Unique action reference |
| IncidentID | Related incident reference |
| Title / Action Title | Short action description |
| AssignedTo | Person responsible |
| Priority | Low, Medium, High, Critical |
| DueDate | Action due date |
| Status | Not Started, In Progress, Complete, Cancelled |
| CompletedDate | Completion date |
| Notes | Action notes/update history |

## Training Expiry

Tracks training/certification records and expiry status.

| Column | Purpose |
|---|---|
| TrainingID | Unique training reference |
| Title / Staff Name | Staff member name |
| Role | Staff role |
| TrainingType | Type of training/certification |
| IssueDate | Date training was issued |
| ExpiryDate | Date training expires |
| Status | Valid, Expiring Soon, Expired |
| DaysUntilExpiry | Number of days until expiry |
| Manager | Responsible manager |

## Relationships

The Power BI model links:

Safety Incidents[IncidentID]  
→ Corrective Actions[IncidentID]

This allows corrective actions to be analysed in relation to their originating incident.

Training Expiry is separate in v1 because it tracks people/training rather than incident-linked records.

## Future Improvements

Future versions could add:

- unique SharePoint ID references
- proper lookup fields between incidents and corrective actions
- person/group fields instead of text fields
- audit history
- calculated expiry status
- automatic action creation from high-risk incidents