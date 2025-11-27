-- Day 21

/*
Question:
Create a comprehensive hospital performance dashboard using CTEs. Calculate: 1) Service-level metrics (total admissions, refusals, avg satisfaction), 
2) Staff metrics per service (total staff, avg weeks present), 3) Patient demographics per service (avg age, count). Then combine all three CTEs 
to create a final report showing service name, all calculated metrics, and an overall performance score (weighted average of admission rate and satisfaction). 
Order by performance score descending.
*/

--Sql Query
WITH
service_metrics AS (
    SELECT
        service,
        SUM(patients_admitted) AS total_admissions,
        SUM(patients_refused) AS total_refusals,
        AVG(patient_satisfaction) AS avg_satisfaction
    FROM services_weekly
    GROUP BY service
),

staff_metrics AS (
    SELECT
        s.service,
        COUNT(DISTINCT s.staff_name) AS total_staff,
        AVG(COALESCE(w.weeks_present, 0)) AS avg_weeks_present
    FROM staff s
    LEFT JOIN (
        SELECT 
            staff_name,
            SUM(present) AS weeks_present
        FROM staff_schedule
        GROUP BY staff_name
    ) w ON s.staff_name = w.staff_name
    GROUP BY s.service
),

patient_metrics AS (
    SELECT
        service,
        AVG(age) AS avg_age,
        COUNT(*) AS patient_count
    FROM patients
    GROUP BY service
)

SELECT
    sm.service,
    sm.total_admissions,
    sm.total_refusals,
    sm.avg_satisfaction,
    st.total_staff,
    st.avg_weeks_present,
    pm.avg_age,
    pm.patient_count,
    (
        (sm.total_admissions / NULLIF(sm.total_admissions + sm.total_refusals, 0)) * 0.7 +
        (sm.avg_satisfaction / 100) * 0.3
    ) AS performance_score
FROM service_metrics sm
LEFT JOIN staff_metrics st ON sm.service = st.service
LEFT JOIN patient_metrics pm ON sm.service = pm.service
ORDER BY performance_score DESC;


