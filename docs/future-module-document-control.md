# Future Module: Document Control

## Overview

The Document Control module is a planned expansion for OperationsFlow Toolkit.

This module would help businesses track policies, procedures, forms, registers, templates, and other controlled documents so review dates, version updates, ownership, and document status are easier to manage.

The module follows the same OperationsFlow pattern:

Document created  
→ owner assigned  
→ review date set  
→ status tracked  
→ reminders sent when review is due or overdue  
→ dashboard provides visibility

## Business Problem

Many businesses manage controlled documents through folders, spreadsheets, emails, or informal reminders.

This can lead to:

- outdated policies or procedures
- missed document review dates
- unclear document ownership
- duplicate or conflicting document versions
- poor visibility over what needs updating
- manual admin follow-up
- compliance risk when documents are not reviewed on time

## Solution

The Document Control module would provide a central document register using Microsoft Lists or SharePoint Lists.

Each document record would track the document name, owner, version, type, department, review dates, status, document link, and notes.

Power Automate could send reminders when documents are due for review or overdue. Power BI could report on overdue reviews, documents by status, and review workload by owner or department.

## Planned Data Source

Microsoft Lists / SharePoint Lists

## Planned List: Document Control Register

| Column Name | Type | Purpose |
|---|---|---|
| Title / Document Name | Single line text | Name of the document |
| DocumentID | Single line text | Unique reference, e.g. DOC-001 |
| DocumentType | Choice | Policy, Procedure, Form, Register, Template, Checklist |
| Department | Choice | Operations, Safety, Admin, HR, Finance, Other |
| Owner | Single line text | Person responsible for the document |
| Version | Single line text | Current version, e.g. v1.0, v1.1, v2.0 |
| Status | Choice | Draft, Current, Under Review, Overdue Review, Archived |
| LastReviewedDate | Date and time | Last review date |
| NextReviewDate | Date and time | Next required review date |
| DaysUntilReview | Number | Days until next review |
| DocumentLink | Hyperlink | Link to document file/location |
| Notes | Multiple lines of text | Review notes or change summary |

## Choice Values

### DocumentType

- Policy
- Procedure
- Form
- Register
- Template
- Checklist

### Department

- Operations
- Safety
- Admin
- HR
- Finance
- Other

### Status

- Draft
- Current
- Under Review
- Overdue Review
- Archived

## Planned Views

### Current Documents

Filter:

- Status equals Current

### Documents Due for Review

Filter:

- Status equals Under Review
- OR DaysUntilReview is less than or equal to 30

### Overdue Reviews

Filter:

- Status equals Overdue Review
- OR DaysUntilReview is less than 0

### Archived Documents

Filter:

- Status equals Archived

## Planned Power Apps Screens

### Document Register

Shows all controlled documents with filters for:

- Document Type
- Department
- Owner
- Status

### Document Detail

Shows full metadata for a selected document:

- DocumentID
- Document Name
- Document Type
- Department
- Owner
- Version
- Status
- Last Reviewed Date
- Next Review Date
- Document Link
- Notes

### New / Edit Document

Allows an admin user to add or update document records.

### Review Queue

Shows documents that are due soon or overdue for review.

## Planned Power Automate Flows

### Flow 1: Document Review Reminder

Trigger:

- Scheduled recurrence, e.g. weekly Monday 8:00 AM

Logic:

- Get documents where Status is not Archived
- Identify documents where NextReviewDate is within 30 days or already overdue

Actions:

- Send reminder to document owner/admin
- Include DocumentID, Document Name, Owner, Version, NextReviewDate, Status, and DocumentLink

Business value:

- Reduces missed document reviews and manual chasing.

### Flow 2: Overdue Document Escalation

Trigger:

- Scheduled recurrence, e.g. weekly

Logic:

- Get documents where NextReviewDate is before today
- Status is not Archived

Actions:

- Send overdue review notification
- Optionally update Status to Overdue Review

Business value:

- Makes overdue document reviews visible and harder to miss.

### Flow 3: Document Status Update

Trigger:

- When a document item is modified

Logic:

- If NextReviewDate is updated and Status is Overdue Review, allow status to return to Current or Under Review.

Business value:

- Keeps the register cleaner and reduces manual status correction.

## Planned Dashboard Metrics

A Power BI Document Control page could show:

- Total controlled documents
- Current documents
- Documents due for review soon
- Overdue document reviews
- Archived documents
- Documents by status
- Documents by department
- Documents by type
- Review workload by owner

## Example Dashboard Page

### KPI Cards

- Total Documents
- Current Documents
- Due for Review Soon
- Overdue Reviews
- Archived Documents

### Charts

- Documents by Status
- Documents by Department
- Documents by Type
- Reviews by Owner
- Reviews Due by Month

### Table

Documents requiring attention:

- DocumentID
- Document Name
- Owner
- Department
- Version
- NextReviewDate
- DaysUntilReview
- Status

## Business Value

This module would help businesses:

- reduce missed document reviews
- improve version control visibility
- make document ownership clearer
- support safety/admin/compliance processes
- reduce manual follow-up
- create a single source of truth for controlled documents
- improve reporting visibility for managers

## Future Enhancements

- automatic status calculation from review date
- SharePoint document library integration
- approval workflow for new document versions
- Teams notification to document owners
- PDF/email monthly document review report
- audit trail of review history
- version history tracking
- link to actual controlled document files