--> Day 18
/*
Question:

Create a comprehensive personnel and patient list showing: identifier (patient_id or staff_id), full name, 
type ('Patient' or 'Staff'), and associated service.
 Include only those in 'surgery' or 'emergency' services. Order by type, then service, then name.

*/

-- Sql query


SELECT p.patient_id AS identifier, p.name AS full_name,'Patient' AS type,p.service
FROM patients p
WHERE LOWER(p.service) IN ('surgery', 'emergency')

UNION ALL

SELECT s.staff_id AS identifier,s.staff_name AS full_name,'Staff' AS type,s.service
FROM staff s
WHERE LOWER(s.service) IN ('surgery', 'emergency')
ORDER BY type,service,full_name;

