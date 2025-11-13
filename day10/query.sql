--> Day 10

/*

Question:
Create a service performance report showing service name, total patients admitted, and a performance category based on the following:
'Excellent' if avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65, otherwise 'Needs Improvement'. 
Order by average satisfaction descending.

*/

--> Sql Query
select service,count(patient_id) as tt_patients_admitted, 
    case 
    when avg(satisfaction)>=85 then 'Excellent'
    when avg(satisfaction)>=75 then 'Good'
    when avg(satisfaction)>=65 then 'Fair'
    else 'Needs Improvement'
    end as performance_category
    from patients
    group by service
    order by avg(satisfaction) desc;
    
