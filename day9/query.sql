--> Day 9

/*

Question:
Calculate the average length of stay (in days) for each service, showing only services where the average stay is more than 7 days.
Also show the count of patients and order by average stay descending.

*/

--> Sql Query
SELECT 
    service,
    ROUND(AVG(DATEDIFF(departure_date, arrival_date)), 2) AS avg_stay_days,
    COUNT(patient_id) AS patient_count
FROM 
    patients
WHERE 
    departure_date IS NOT NULL 
    AND arrival_date IS NOT NULL
GROUP BY 
    service
HAVING 
    AVG(DATEDIFF(departure_date, arrival_date)) > 7
ORDER BY 
    avg_stay_days DESC;

