/*
Obj: Calculate what % of High and Urgent tickets were resolved within the 24 hr SLA
Why: Most important metric for management to ensure they aren't breaking contracts
*/

WITH ticket_processing AS (
    SELECT 
      priority,
      ticket_id,
      TIMESTAMP_DIFF(resolved_at, created_at, HOUR) AS resolution_hours,
      CASE
        WHEN TIMESTAMP_DIFF(resolved_at, created_at, HOUR) <=24 THEN 'Met SLA'
        ELSE 'Breached SLA' END AS sla_status
    FROM `helpdesk_data.tickets`
    WHERE status = 'Closed'
    AND priority IN ('High', 'Urgent')
)

SELECT
  sla_status,
  COUNT(*) AS ticket_count,
  ROUND(COUNT(*) * 100/SUM(COUNT(*)) OVER(), 2) AS compliance_rate_pct
FROM ticket_processing
GROUP BY 1;
