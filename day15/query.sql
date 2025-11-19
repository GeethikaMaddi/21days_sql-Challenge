-- Day 15

/*
Question:
Create a comprehensive service analysis report for week 20 showing: service name, total patients admitted that week, 
total patients refused, average patient satisfaction, count of staff assigned to service, and count of staff present that week.
 Order by patients admitted descending.
*/


-- Sql Query

SELECT
    sw.service,  COALESCE(SUM(sw.patients_admitted), 0) AS total_admitted,
    COALESCE(SUM(sw.patients_refused), 0) AS total_refused,
    COALESCE(AVG(sw.patient_satisfaction), 0) AS avg_satisfaction,
    COALESCE(COUNT(DISTINCT st.staff_id), 0) AS staff_assigned,
    COALESCE(COUNT(DISTINCT CASE 
            WHEN ss.week = 20 AND ss.present = 1 THEN ss.staff_id
        END), 0) 
    AS staff_present_week
FROM services_weekly sw
LEFT JOIN staff st ON sw.service = st.service
LEFT JOIN staff_schedule ss ON st.service = ss.service
WHERE sw.week = 20
GROUP BY sw.service
ORDER BY total_admitted DESC;
