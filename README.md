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
| **Day 11** |Find all unique combinations of service and event type from the services_weekly table 
where events are not null or none, along with the count of occurrences for each combination. 
Order by count descending. |


