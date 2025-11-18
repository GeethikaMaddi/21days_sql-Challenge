-- Day 14
/*
Create a staff utilisation report showing all staff members (staff_id, staff_name, role, service) and the count of weeks they were present (from staff_schedule). 
Include staff members even if they have no schedule records. Order by weeks present descending.
*/

-- Sql Query
select staff_id, staff_name, role, service,coalesce(count(week),0) as weeks_present
from staff_schedule
group by staff_id,staff_name, role, service
order by count(week) desc;
  
  
