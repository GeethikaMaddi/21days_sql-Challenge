--> 🏥 Day 2 – SQL Challenge  

--> Database Used: hospital

/*
Question:
Find all patients admitted to 'Surgery' service with a satisfaction score below 70, 
showing their patient_id, name, age, and satisfaction score.
*/

--> sql query

select patient_id,name,age,satisfaction from patients
where service = 'surgery' and satisfaction < 70;
