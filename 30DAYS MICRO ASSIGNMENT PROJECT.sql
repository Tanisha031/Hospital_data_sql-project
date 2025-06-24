DROP DATABASE IF EXISTS hospital_management;
CREATE DATABASE hospital_management;
USE hospital_management;

CREATE TABLE hospital_data (
Hospital_name VARCHAR(50),
Location VARCHAR(50),
Department VARCHAR(50),
Doctors_count INT,
Patients_count INT,
Admission_date DATE,
Discharge_date DATE,
Medical_expenses NUMERIC(10,2)
);

SELECT * FROM hospital_data;

-- 1. Total Number of Patients: Write an SQL query to find the total number of patients across all hospitals.
SELECT SUM(Patients_count) AS total_patients
FROM hospital_data;

-- 2. Average Number of Doctors per Hospital: Retrieve the average count of doctors available in each hospital.
SELECT Hospital_name, AVG(Doctors_count) AS avg_doctors_per_hospital FROM hospital_data GROUP BY Hospital_name;

-- 3. Top 3 Departments with the Highest Number of Patients: Find the top 3 hospital departments that have the highest number of patients.
SELECT Department, COUNT(Patients_count) AS Patients_count 
FROM hospital_data
GROUP BY Department
ORDER BY Patients_count DESC
LIMIT 3;

-- 4. Hospital with the Maximum Medical Expenses: Identify the hospital that recorded the highest medical expenses.
SELECT Hospital_name, SUM(Medical_expenses) AS total_expenses
FROM hospital_data
GROUP BY Hospital_name
ORDER BY total_expenses DESC
LIMIT 1;

-- 5. Daily Average Medical Expenses: Calculate the average medical expenses per day for each hospital.
SELECT Hospital_name, AVG(Medical_expenses) AS daily_avg_expenses
FROM hospital_data
GROUP BY Hospital_name;

-- 6. Longest Hospital Stay: Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
SELECT Patients_count, DATEDIFF(Discharge_date, Admission_date) AS stay_length
FROM hospital_data
ORDER BY stay_length DESC
LIMIT 1;

-- 7. Total Patients Treated Per City: Count the total number of patients treated in each city.
SELECT Location, COUNT(Patients_count) AS total_patients
FROM hospital_data
GROUP BY Location;

-- 8. Average Length of Stay Per Department: Calculate the average number of days patients spend in each department.
SELECT Department, AVG(DATEDIFF(Discharge_date, Admission_date)) AS AVG_stay_per_dept
FROM hospital_data
GROUP BY Department;

-- 9. Identify the Department with the Lowest Number of Patients: Find the department with the least number of patients.
SELECT Department, COUNT(Patients_count) AS Patients_count
FROM hospital_data
GROUP BY Department
ORDER BY Patients_count
LIMIT 1;

-- 10. Monthly Medical Expenses Report: Group the data by month and calculate the total medical expenses for each month.
SELECT MONTH(Admission_date) AS month, SUM(Medical_expenses) AS total_expenses
FROM hospital_data
GROUP BY MONTH(Admission_date)
ORDER BY month;


