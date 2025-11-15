-->Day 12

/*

Analyze the event impact by comparing weeks with events vs weeks without events. Show: event status ('With Event' or 'No Event'), 
count of weeks, average patient satisfaction, and average staff morale. Order by average patient satisfaction descending.

*/

--> Sql query

select case when event='none' then 'No Event'
            else 'With Event'
            end as event_status,
            count(week),avg(patient_satisfaction),avg(staff_morale) 
from services_weekly
group by event_status
order by avg(patient_satisfaction) desc;
            
