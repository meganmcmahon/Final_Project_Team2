-- EDA & Predictive Analysis on Healthcare Attrition



-- 01- create database employee_attritionfor_healthcare;
use employee_attritionfor_healthcare;

-- Part 1 - EDA
/*Reading and cleaning the data
We first loading the csv file 'watson_healthcare' to the database 
and check for the types of columns present.
Ensure that there are no null values.*/

-- 02- upload the dataset watson_healthcare_modified from the csv file
-- 03- create a copy of the original dataset to perform some EDA with the following querry:
-- create table watson_healthcare_rda as (select * from watson_healthcare) ;


-- 04- displaying the data
select * from watson_healthcare_rda;

-- 05- check the type of columns
describe watson_healthcare_rda;

-- 06- set EmployeeID as index column for the data set
create index employeeid_index on watson_healthcare_rda(EmployeeID);

-- 07- set EmployeeID as a primery key column for the data set
ALTER TABLE watson_healthcare_rda ADD CONSTRAINT PK_WHR PRIMARY KEY (EmployeeID);

-- 08- check for null values
select count(*) as rows_with_null_values
from watson_healthcare_rda
where coalesce(EmployeeID,Age,Attrition,
BusinessTravel,DailyRate,Department,DistanceFromHome,Education,EducationField,
EmployeeCount,EnvironmentSatisfaction,Gender,HourlyRate,JobInvolvement,JobLevel,
JobRole,JobSatisfaction,MaritalStatus,MonthlyIncome,MonthlyRate,NumCompaniesWorked,
Over18,OverTime,PercentSalaryHike,PerformanceRating,RelationshipSatisfaction,
StandardHours,Shift,TotalWorkingYears,TrainingTimesLastYear,WorkLifeBalance,
YearsAtCompany,YearsInCurrentRole,YearsSinceLastPromotion,
YearsWithCurrManager) is null; 

-- 09- Next lets check for the uniqueness in values for each column
-- select distinct EmployeeID from watson_healthcare_rda;
select distinct Age from watson_healthcare_rda;
select distinct Attrition from watson_healthcare_rda;
select distinct BusinessTravel from watson_healthcare_rda;
select distinct DailyRate from watson_healthcare_rda; -- drop this column
select distinct Department from watson_healthcare_rda;
select distinct DistanceFromHome from watson_healthcare_rda;
select distinct Education from watson_healthcare_rda;
select distinct EducationField from watson_healthcare_rda;
select distinct EmployeeCount from watson_healthcare_rda; -- drop this column
select distinct EnvironmentSatisfaction from watson_healthcare_rda;
select distinct Gender from watson_healthcare_rda;
select distinct HourlyRate from watson_healthcare_rda; -- drop this column
select distinct JobInvolvement from watson_healthcare_rda;
select distinct JobLevel from watson_healthcare_rda;
select distinct JobRole from watson_healthcare_rda; -- modify the values this column as admin and administrative are the same
select distinct JobSatisfaction from watson_healthcare_rda;
select distinct MaritalStatus from watson_healthcare_rda;
select distinct MonthlyIncome from watson_healthcare_rda;
select distinct MonthlyRate from watson_healthcare_rda; -- drop this column
select distinct NumCompaniesWorked from watson_healthcare_rda;
select distinct Over18 from watson_healthcare_rda;
select distinct OverTime from watson_healthcare_rda;
select distinct PercentSalaryHike from watson_healthcare_rda;
select distinct PerformanceRating from watson_healthcare_rda;
select distinct RelationshipSatisfaction from watson_healthcare_rda;
select distinct StandardHours from watson_healthcare_rda; -- drop this column
select distinct Shift from watson_healthcare_rda;
select distinct TotalWorkingYears from watson_healthcare_rda;
select distinct TrainingTimesLastYear from watson_healthcare_rda;
select distinct WorkLifeBalance from watson_healthcare_rda;
select distinct YearsAtCompany from watson_healthcare_rda;
select distinct YearsInCurrentRole from watson_healthcare_rda;
select distinct YearsSinceLastPromotion from watson_healthcare_rda;
select distinct YearsWithCurrManager from watson_healthcare_rda;


/*As we can see, there are some columns which lack clarification 
or are not meaningful from the source. These columns will be dropped.
EmployeeCount is always 1
StandardHours is always 80
Over18 is always Yes
Daily, hourly, monthly rate (no meaningful given)
JobRoles have both Administrative and Admin, which both should refer to the same category,
 we will rename this value.*/
 
 -- 10 - drop useless columns
alter table watson_healthcare_rda
drop column EmployeeCount,
drop column StandardHours,
drop column Over18,
drop column MonthlyRate,
drop column DailyRate,
drop column HourlyRate;


-- 11- replace the value of 'admin' by 'administrative' in jobrole column
select distinct jobrole from watson_healthcare_rda;
select count(*) from watson_healthcare_rda where jobrole='administrative';
select count(*) from watson_healthcare_rda where jobrole='admin';

/*select count(*) as total , jobrole from watson_healthcare_rda where jobrole='nurse'
group by JobRole
union
select count(*) as total , jobrole from watson_healthcare_rda where jobrole='admin'
group by JobRole
union
select count(*) as total , jobrole from watson_healthcare_rda where jobrole='other'
group by JobRole
union
select count(*) as total , jobrole from watson_healthcare_rda where jobrole='therapist'
group by JobRole
union
select count(*) as total , jobrole from watson_healthcare_rda where jobrole='administrative'
group by JobRole;*/

update watson_healthcare_rda
set jobrole='administrative'
where jobrole='admin';



-- 12- dispalying the clean data
select * from watson_healthcare_rda;









