--> Day 7

/*
 Question:

Identify services that refused more than 100 patients in total and had an average patient 
satisfaction below 80. Show service name, total refused, and average satisfaction.

*/
  

--> ✅ SQL Query

select sum(patients_admitted) as tt_admissions, sum(patients_refused) as tt_refused, 
round(avg(patient_satisfaction),2) as avg_satisfaction
from services_weekly;
