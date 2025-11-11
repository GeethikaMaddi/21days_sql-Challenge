--> Day 8

/*
 Question:

Create a patient summary that shows patient_id, full name in uppercase, service in lowercase, 
age category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), and name length.
Only show patients whose name length is greater than 10 characters.

*/
  

--> ✅ SQL Query

select patient_id,upper(name) as name,lower(service) as service,
case when age>=65 then 'senior'
      when age>=18 then 'adult'
      else 'minor'
end as age_category,length(name) as length
from patients
where length(name)>10;
