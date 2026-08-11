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

