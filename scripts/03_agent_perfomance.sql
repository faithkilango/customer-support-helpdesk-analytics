/*
Goal: Who are our top performers? and their quality score
The people(agent performance) -
WHY: Helps identify who needs more training and who deserves a promotion

*/

SELECT
  a.name AS agent_name,
  COUNT(t.ticket_id) AS tickets_solved,
  ROUND(AVG(s.rating), 2) AS avg_csat_score
FROM `helpdesk_data.agents` a
JOIN `helpdesk_data.tickets` t
  ON  a.agent_id = t.agent_id
LEFT JOIN `helpdesk_data.surveys` s 
  ON t.ticket_id = s.ticket_id
WHERE t.status = 'Closed'
GROUP BY agent_name
ORDER BY tickets_solved DESC;
