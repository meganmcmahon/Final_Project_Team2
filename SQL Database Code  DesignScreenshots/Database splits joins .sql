-- Create large table for full data table
CREATE TABLE full_data(
	EmployeeID INT NOT NULL,
	Age INT,
	Attrition VARCHAR(4), 
	BusinessTravel VARCHAR(40),
	DailyRate INT,
	Department VARCHAR(40),
	DistanceFromHome INT,
	Education INT,
	EducationField VARCHAR(40),
	EmployeeCount INT,
	EnvironmentSatisfaction INT,
	Gender VARCHAR(10),
	HourlyRate INT,
	JobInvolvement INT,
	JobLevel INT,
	JobRole VARCHAR(40),
	JobSatisfaction INT,
	MaritalStatus VARCHAR(40),
	MonthlyIncome INT,
	MonthlyRate INT,
	NumCompaniesWorked INT,
	Over18 VARCHAR(1),
	OverTime VARCHAR(3),
	PercentSalaryHike INT,
	PerformanceRating INT,
	RelationshipSatisfaction INT,
	StandardHours INT,
	Shift INT,
	TotalWorkingYears INT,
	TrainingTimesLastYear INT,
	WorkLifeBalance INT,
	YearsAtCompany INT,
	YearsInCurrentRole INT,
	YearsSinceLastPromotion INT,
	YearsWithCurrManager INT,
	PRIMARY KEY (EmployeeID),
	UNIQUE (EmployeeID)
);

-- Import data from watson_healthcare_modified

-- View table
SELECT * from full_data;

-- Create Table 1 basic_personal_information table
SELECT EmployeeID, Age, Gender, Education, EducationField, MaritalStatus, RelationshipSatisfaction, DistanceFromHome
INTO basic_personal_information
FROM full_data;

SELECT * from basic_personal_information;

-- Create Table 2 employee_work_history table
SELECT EmployeeID, NumCompaniesWorked, TotalWorkingYears
INTO employee_work_history
FROM full_data;

-- Create Table 3 employee_current_job table
SELECT EmployeeID, YearsAtCompany, Department, JobLevel, JobRole, YearsInCurrentRole, YearsWithCurrManager, StandardHours, Shift, JobInvolvement, BusinessTravel, TrainingTimesLastYear
INTO employee_current_job
FROM full_data;

-- Create Table 4 employee_finances table
SELECT EmployeeID, DailyRate, HourlyRate, MonthlyRate, MonthlyIncome, OverTime, PercentSalaryHike
INTO employee_finances
FROM full_data;

-- Create Table 5 employee_feedback table
SELECT EmployeeID, PerformanceRating, YearsSinceLastPromotion
INTO employee_feedback
FROM full_data;

-- Create Table 6 employee_satisfaction table
SELECT EmployeeID, JobSatisfaction, WorkLifeBalance, EnvironmentSatisfaction, Attrition
INTO employee_satisfaction
FROM full_data;

-- Export data from PGAdmin into CSV files with the same name as the table
-- Includes at least one join using the database language (not including any joins in Pandas)
-- basic_personal_information and employee_current_job 
SELECT b.EmployeeID, b.Age, b.Gender, b.Education, b.educationField, 
b.MaritalStatus, b.RelationshipSatisfaction, b.DistanceFromHome,
e.EmployeeID, e.YearsAtCompany, e.Department, e.JobLevel, e.JobRole, e.YearsInCurrentRole, 
e.YearsWithCurrManager, e.StandardHours, e.Shift, e.JobInvolvement, e.BusinessTravel, e.TrainingTimesLastYear
from basic_personal_information as b Left join employee_current_job as e
on b.EmployeeID = e.EmployeeID
left join 

-- after giving alias to the two tables we (joined basic_personal_information as b Left join employee_current_job as e)we can apply this sql join to the  multiple tables we have 
 