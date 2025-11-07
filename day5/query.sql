--> Day 5

/*
 Question:

Calculate the total number of patients admitted, total patients refused, and 
the average patient satisfaction across all services and weeks. Round the average satisfaction to 2 decimal places.

*/
  

--> ✅ SQL Query

select sum(patients_admitted) as tt_admissions, sum(patients_refused) as tt_refused, 
round(avg(patient_satisfaction),2) as avg_satisfaction
from services_weekly;
