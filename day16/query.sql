--> Day 16

/*
Find all patients who were admitted to services that had at least one week where patients were refused AND 
the average patient satisfaction for that service was below the overall hospital average satisfaction. 
Show patient_id, name, service, and their personal satisfaction score.
*/



-- Sql Query

WITH overall_avg AS (
    SELECT AVG(satisfaction) AS overall_avg_satisfaction
    FROM patients
),

services_with_refusal AS (
    SELECT DISTINCT service
    FROM sevices_weekly
    WHERE patients_refused > 0
),


low_satisfaction_services AS (
    SELECT a.service
    FROM services_weekly a
    CROSS JOIN overall_avg oa
    GROUP BY a.service, oa.overall_avg_satisfaction
    HAVING AVG(a.patient_satisfaction) < oa.overall_avg_satisfaction
)

(
    SELECT 
        p.patient_id,
        p.patient_name,
        p.service,
        p.satisfaction
    FROM patients p
    JOIN services_with_refusal swr 
        ON p.service = swr.service
)
UNION
(
    SELECT 
        p.patient_id,
        p.patient_name,
        p.service,
        p.satisfaction
    FROM patients p
    JOIN low_satisfaction_services lss
        ON p.service = lss.service
)
ORDER BY patient_id;




