# Module: Work Orders / Job Tracking

## Overview

The Work Orders module is an expansion of OperationsFlow Toolkit focused on tracking operational jobs, service work, internal tasks, support requests, and follow-up work.

This module is designed to show how a business can track jobs from creation through to completion, monitor overdue work, review workload by staff member, and report on job volume and performance.

## Business Problem

Many businesses manage work orders, job requests, service jobs, or internal tasks across spreadsheets, emails, job folders, and manual follow-ups.

This can lead to:

- unclear job ownership
- missed due dates
- overdue work not being visible
- limited reporting on workload
- slow follow-up with clients or staff
- poor visibility over job status
- manual reporting effort

## Solution

The Work Orders module provides a central job tracking register with due dates, ownership, job type, status, priority, estimated hours, and actual hours.

The module follows the OperationsFlow pattern:

Job created  
→ owner assigned  
→ due date set  
→ status tracked  
→ overdue work highlighted  
→ dashboard provides visibility

## Data Source

Current proof version:

- CSV sample data

Planned semi-live version:

- Microsoft Lists / SharePoint Lists

## Sample Data File

Sample data is stored in:

`sample-data/Work_Orders.csv`

## Planned List / Dataset: Work Orders

| Column Name | Type | Purpose |
|---|---|---|
| JobID | Single line text | Unique job reference, e.g. JOB-001 |
| JobName | Single line text | Short job description |
| Client | Single line text | Client/internal department |
| Site | Choice/Text | Job location or site |
| JobType | Choice | Maintenance, Installation, Inspection, Repair, Admin, Automation, Reporting, Support |
| Status | Choice | New, In Progress, Waiting on Client, On Hold, Completed, Overdue, Cancelled |
| CreatedDate | Date | Date job was created |
| DueDate | Date | Date job is due |
| CompletedDate | Date | Date job was completed |
| AssignedTo | Single line text | Person responsible for the job |
| Priority | Choice | Low, Medium, High, Critical |
| EstimatedHours | Number | Estimated work hours |
| ActualHours | Number | Actual work hours recorded |
| Notes | Multiple lines of text | Job notes or update history |

## Choice Values

### JobType

- Maintenance
- Installation
- Inspection
- Repair
- Admin
- Automation
- Reporting
- Support

### Status

- New
- In Progress
- Waiting on Client
- On Hold
- Completed
- Overdue
- Cancelled

### Priority

- Low
- Medium
- High
- Critical

## Dashboard Page

The Power BI dashboard includes a Work Orders page.

### KPI Cards

- Total Jobs
- Open Jobs
- Completed Jobs
- Overdue Jobs
- High Priority Jobs
- Average Actual Hours

### Charts

- Jobs by Status
- Jobs by Type
- Jobs by Assigned To
- Jobs by Priority
- Jobs Due by Month

### Detail Table

The table shows open or overdue work orders with:

- JobID
- JobName
- Client
- Site
- JobType
- AssignedTo
- Priority
- DueDate
- Status
- EstimatedHours
- ActualHours

## Power BI Measures

The module uses measures such as:

- Total Jobs
- Open Jobs
- Completed Jobs
- Overdue Jobs
- High Priority Jobs
- Total Estimated Hours
- Total Actual Hours
- Average Actual Hours
- Hours Variance

## Planned Power Apps Screens

### Work Order Register

Shows all work orders with filters for:

- Site
- Job Type
- Status
- Assigned To
- Priority

### Work Order Detail

Shows a selected job’s full details, including status, due date, assigned person, hours, and notes.

### New / Edit Work Order

Allows users to create or update work orders.

### My Open Jobs

Shows jobs assigned to the current user or selected staff member.

## Planned Power Automate Flows

### Flow 1: Overdue Work Order Reminder

Trigger:

- Scheduled recurrence, e.g. weekday morning

Logic:

- Find work orders where Status is not Completed or Cancelled
- Find work orders where DueDate is before today

Actions:

- Send reminder to assigned person or admin
- Include JobID, JobName, Client, Site, DueDate, Priority, Status, and Notes

### Flow 2: High Priority Job Alert

Trigger:

- When a new work order is created

Condition:

- Priority equals High or Critical

Actions:

- Notify manager/admin
- Include key job details

### Flow 3: Completed Date Auto Update

Trigger:

- When a work order is modified

Condition:

- Status equals Completed
- CompletedDate is empty

Action:

- Set CompletedDate to today

## Business Value

The Work Orders module helps businesses:

- track operational work in one place
- reduce missed follow-ups
- make overdue jobs visible
- understand workload by staff member
- report on job status and job volume
- compare estimated vs actual effort
- support better planning and accountability

## Future Enhancements

- SharePoint List backend
- Power Apps job submission form
- Teams reminders for overdue jobs
- automatic completed date updates
- job ageing calculation
- SLA or target completion tracking
- client-specific views
- staff workload dashboard
- monthly job performance reporting