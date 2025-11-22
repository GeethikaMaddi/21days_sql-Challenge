-- Day 17

/*
Question:
Create a report showing each service with: service name, total patients admitted, the difference between their total admissions and
the average admissions across all services, and a rank indicator ('Above Average', 'Average', 'Below Average').
Order by total patients admitted descending.
*/


-- Sql query


WITH service_stats AS (
    SELECT 
        service,
        COUNT(*) AS total_admissions
    FROM patients
    GROUP BY service
),
avg_stats AS (
    SELECT 
        AVG(total_admissions) AS avg_admissions
    FROM service_stats
)
SELECT 
    ss.service,
    ss.total_admissions,
    ss.total_admissions - a.avg_admissions AS difference_from_average,
    CASE
        WHEN ss.total_admissions > a.avg_admissions THEN 'Above Average'
        WHEN ss.total_admissions = a.avg_admissions THEN 'Average'
        ELSE 'Below Average'
    END AS rank_indicator
FROM service_stats ss
CROSS JOIN avg_stats a
ORDER BY ss.total_admissions DESC;



