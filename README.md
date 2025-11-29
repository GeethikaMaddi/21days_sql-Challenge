# 🧠 21 Days SQL Challenge  

### Hosted by: @DPDzero
###  **#SQLWithIDC**  


## 📋 Overview  
This repository contains my daily submissions for the **21 Days SQL Challenge**, a learning initiative by **Indian Data Club** and **DPDzero**.  
Each day features a new SQL problem designed to strengthen understanding of **database querying**, **data manipulation**, and **real-world SQL problem-solving**.

---

## 🗓️ Challenge Goal  
- Strengthen SQL fundamentals (SELECT, WHERE, JOIN, GROUP BY, etc.)  
- Apply advanced SQL concepts like subqueries, window functions, and CTEs  
- Build consistency and hands-on database querying practice over 21 days  


## 🏥 Hospital Database Schema  

Below is the sample **hospital database** used for solving challenge problems.  
It contains 4 key tables that store information about patients, hospital staff, and available services.

| **Table Name** | **Description** |
|----------------|-----------------|
| `patients` | Stores information about patients such as ID, name, age, gender, and admitted service. |
| `service_weekly` | Lists hospital services offered each week (e.g., Cardiology, Orthopedics, Neurology). |
| `staff` | Contains details about doctors, nurses, and other hospital employees. |
| `staff_schedule` | Tracks staff service assignments, shift timings, and weekly work schedules. |



## 🧾 SQL Practice Log

🏷️ [@DPDzero](https://www.linkedin.com/company/dpdzero/)

[@IndianDataClub](https://www.linkedin.com/company/indian-data-club/)


| 🗓️ **Day** | 💭 **Question** |
|:-----:|---|
| **Day 1** | List all unique hospital services available in the hospital. |
| **Day 2** | Find all patients admitted to 'Surgery' service with a satisfaction score below 70, showing their patient_id, name, age, and satisfaction score. |
| **Day 3** | Retrieve the top 5 weeks with the highest patient refusals across all services, showing week, service, patients_refused, and patients_request. Sort by patients_refused in descending order. |
| **Day 4** | Find the 3rd to 7th highest patient satisfaction scores from the patients table, showing patient_id, name, service, and satisfaction. Display only these 5 records. |
| **Day 5** | Calculate the total number of patients admitted, total patients refused, and the average patient satisfaction across all services and weeks. Round the average satisfaction to 2 decimal places. |
| **Day 6** |For each hospital service, calculate the total number of patients admitted, total patients refused, and the admission rate (percentage of requests that were admitted). Order by admission rate descending. |
| **Day 7** | Identify services that refused more than 100 patients in total and had an average patient satisfaction below 80. Show service name, total refused, and average satisfaction. |
| **Day 8** | Create a patient summary that shows patient_id, full name in uppercase, service in lowercase, age category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), and name length. Only show patients whose name length is greater than 10 characters. |
| **Day 9** | Calculate the average length of stay (in days) for each service, showing only services where the average stay is more than 7 days. Also show the count of patients and order by average stay descending. |
| **Day 10** |Create a service performance report showing service name, total patients admitted, and a performance category based on the following: 'Excellent' if avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65, otherwise 'Needs Improvement'. Order by average satisfaction descending. |
| **Day 11** |Find all unique combinations of service and event type from the services_weekly table where events are not null or none, along with the count of occurrences for each combination. Order by count descending. |
| **Day 12** |Analyze the event impact by comparing weeks with events vs weeks without events. Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction, and average staff morale. Order by average patient satisfaction descending. |
| **Day 13** |Create a comprehensive report showing patient_id, patient name, age, service, and the total number of staff members available in their service. Only include patients from services that have more than 5 staff members. Order by number of staff descending, then by patient name. |
| **Day 14** |Create a staff utilisation report showing all staff members (staff_id, staff_name, role, service) and the count of weeks they were present (from staff_schedule). Include staff members even if they have no schedule records. Order by weeks present descending. |
| **Day 15** |Create a comprehensive service analysis report for week 20 showing: service name, total patients admitted that week, total patients refused, average patient satisfaction, count of staff assigned to service, and count of staff present that week. Order by patients admitted descending. |
| **Day 16** |Find all patients who were admitted to services that had at least one week where patients were refused AND the average patient satisfaction for that service was below the overall hospital average satisfaction. Show patient_id, name, service, and their personal satisfaction score. |
| **Day 17** |Find all patients who were admitted to services that had at least one week where patients were refused AND the average patient satisfaction for that service was below the overall hospital average satisfaction. Show patient_id, name, service, and their personal satisfaction score. |
| **Day 18** |Create a comprehensive personnel and patient list showing: identifier (patient_id or staff_id), full name, type ('Patient' or 'Staff'), and associated service. Include only those in 'surgery' or 'emergency' services. Order by type, then service, then name.|
| **Day 19** | For each service, rank the weeks by patient satisfaction score (highest first). Show service, week, patient_satisfaction, patients_admitted, and the rank. Include only the top 3 weeks per service. |
| **Day 20** |Create a trend analysis showing for each service and week: week number, patients_admitted, running total of patients admitted (cumulative), 3-week moving average of patient satisfaction (current week and 2 prior weeks), and the difference between current week admissions and the service average. Filter for weeks 10-20 only. |
| **Day 21** |Create a comprehensive hospital performance dashboard using CTEs. Calculate: 1) Service-level metrics (total admissions, refusals, avg satisfaction), 2) Staff metrics per service (total staff, avg weeks present), 3) Patient demographics per service (avg age, count). Then combine all three CTEs to create a final report showing service name, all calculated metrics, and an overall performance score (weighted average of admission rate and satisfaction). Order by performance score descending.|

Here's my Badge:

![21 days sql badge](https://github.com/user-attachments/assets/f5d3a344-8ae1-464f-a3c5-923dc76c07e8)

