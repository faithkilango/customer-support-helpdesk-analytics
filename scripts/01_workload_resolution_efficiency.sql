/*

 PROJECT: Customer Support & Helpdesk Analytics
 SCRIPT: 01_Ticket_Volume_and_status
 OBJECTIVE: Analyze the total volume of tickets and their    distribution by status and priority
 AUTHOUR:Faith Kilango
 DATE: 8/8/2026
 
*/

/*
1. KPI: Average Resolution Time (ART)
Objective: Measure the time from ticket creation to resolution.
*/

SELECT *
FROM `helpdesk_data.tickets`;

/*
The Overview (Vol & Stats)
Goal: How much work do we have? Understanding the total workload and the state of tickets
Why: Tells us if the support team is overwhelmed
*/

SELECT
  status,
  COUNT(ticket_id) AS total_tickets,
  ROUND(COUNT(*) *100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM `helpdesk_data.tickets`
GROUP BY status;


