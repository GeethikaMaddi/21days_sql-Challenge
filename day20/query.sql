--> Day 20

/*
Question:
Create a trend analysis showing for each service and week: week number, patients_admitted, running total of patients admitted (cumulative), 
3-week moving average of patient satisfaction (current week and 2 prior weeks), and the difference between current week admissions and the service average.
Filter for weeks 10-20 only.
*/

-- Sql Query

WITH base AS (
    SELECT service,week,patients_admitted,patient_satisfaction
    FROM services_weekly
    WHERE week BETWEEN 10 AND 20
),
service_avg AS (
    SELECT service, AVG(patients_admitted) AS avg_admissions
    FROM weekly_service_report
    GROUP BY service
),
calc AS (
    SELECT   b.service,b.week,b.patients_admitted,
        -- Running total (cumulative sum)
        SUM(b.patients_admitted) OVER (
            PARTITION BY b.service
            ORDER BY b.week
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS cumulative_admissions,

        -- 3-week moving average of patient satisfaction
        AVG(b.patient_satisfaction) OVER (
            PARTITION BY b.service
            ORDER BY b.week
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS moving_avg_satisfaction,

        -- Difference with service-level average
        b.patients_admitted - sa.avg_admissions AS diff_from_service_avg
    FROM base b
    JOIN service_avg sa ON b.service = sa.service
)
 SELECT * FROM calc
ORDER BY service, week;



