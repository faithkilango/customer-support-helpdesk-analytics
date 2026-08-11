/*
2. Efficiency : Speed
Goal: Get to answer: How fast are we helping customers
Fast = Happy customers
*/

SELECT 
  priority,
  ROUND(AVG(TIMESTAMP_DIFF(first_response_at, created_at, MINUTE)),1) AS avg_first_response_mins,
  ROUND(AVG(TIMESTAMP_DIFF(resolved_at, created_at, HOUR)),1) AS avg_resolution_hours
FROM `helpdesk_data.tickets`
WHERE status = 'Closed'
GROUP BY priority
ORDER BY avg_resolution_hours ASC;
