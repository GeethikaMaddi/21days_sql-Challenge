--> Day 11

/*
Question:

Find all unique combinations of service and event type from the services_weekly table 
where events are not null or none, along with the count of occurrences for each combination. 
Order by count descending.

*/

--> Sql Query

select distinct service,event ,count(*) as occurences from services_weekly 
where event <> 'none' and service is not null
group by service,event
order by occurences desc;
