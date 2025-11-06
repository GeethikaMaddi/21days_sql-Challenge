--> Day 4

/*
 Question:

 Find the 3rd to 7th highest patient satisfaction scores from the patients table,
showing patient_id, name, service, and satisfaction. Display only these 5 records.
*/
  

--> ✅ SQL Query

select patient_id,name ,service,satisfaction 
from patients
order by satisfaction desc
limit 5 offset 2;
