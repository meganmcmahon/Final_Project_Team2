# Healthcare Attrition
UT McCombs School of Business - Data Analytics & Visualization Bootcamp
Team 2's Final Project - Segment Two

## Repository Overview:
This README serves as a high-level overview of the second section of our project. The Google Slides deck we created is a more in-depth view and demonstrates that we’ve fulfilled all Section 2 project objectives. 

### Communication Protocols
Created private Slack channel: group2_final_challenge
Team members have editor access to group agenda on GoogleDocs
Team members will meet via Zoom each Tuesday & Thursday from 7-9 pm CST

### Roles for Section 2:
Square: ML model (Molly)
Triangle: Database (Sahih)
Circle: Analysis + images (Claire)
X: Dashboard mockup (Megan)

## Presentation Deck:
The work-in-progress presentation can be found in the following Google Slides deck:
Team 2 Project Presentation
Presentation Outline:
Project Overview
Data Analysis
Machine Learning
Database
Dashboard

### Project overview (slides 3-5):

Selected topic: 
Predicting employee attrition in the healthcare industry
Reason for topic selection: 
The COVID pandemic put intense strain on the healthcare industry and led to unprecedented levels of attrition. Being able to predict which employees will attrit can help hospitals prepare for tighter staffing and lessen the impact to their patients and their bottom line. In short, this topic is very relevant and applicable to the current challenges faced in this industry.
Description of source data: 
The synthetic data we’re using is based on an IBM Watson dataset for attrition.
Questions we hope to answer with the data:
We hope to understand 1. Which factors most heavily influence a person’s likelihood of attritting? 2. What is the typical profile of a healthcare worker who is likely to attrit?
### Data Analysis (slides 6-12):
#### Description of the data exploration + Analysis phase of the project:
Jupyter Notebook and Pandas were used to look at the DataFrame shape and structure (there are 1,676 rows and 35 columns) and identify if there were any missing values (there were not). Initially, the data looks very clean.
Next, we identified the data type for each column of data. Of the 35 columns, there are 26 columns of integer data and 9 columns of string data.
The following integer columns contained integer values to describe categorical data: Education (scale 1-5), EnvironmentSatisfaction (scale 1-4), JobInvolvement (scale 1-4), JobSatisfaction (scale 1-4), PerformanceRating (scale 1-4), RelationshipSatisfaction (scale 1-4), WorkLifeBalance (scale 1-4).
Looking at the possible values for the string columns, there are still fairly limited response options– columns with object data types had at most 6 different possible responses.
Descriptive data (count, mean, std, min, 25%, 50%, 75%, max) were calculated for each of the numerical columns. The mean and standard deviations were useful in identifying the common responses and spread of responses for the Education, EnvironmentSatisfaction, JobInvolvement, JobSatisfaction, PerformanceRating, RelationshipSatisfaction, and WorkLifeBalance scaled data columns. Additionally, it was useful in identifying that the EmployeeCount and StandardHours columns do not contribute useful data, and that the DailyRate, HourlyRate, MonthlyIncome, and MonthlyRate columns contain equivalent (and therefore redundant) data.

### Machine Learning (slides 13-21):
#### The most up-to-date code for our machine learning modes can be found in the ML_Model_Draft2.ipynb file in the “Machine Learning Code” folder.
Description of preliminary data preprocessing after loading in the data:
Ran df.describe() to review the distribution of the data in each column
Ran df.isnull().sum() to double check for any null values
Ran df.dtypes to see what types of data are in each column
Ran df.drop() to drop any unnecessary columns: [EmployeeID, Over18,  EmployeeCount, StandardHours,  DailyRate,  HourlyRate,  MonthlyRate]
Description of preliminary feature engineering:
Binary encoding using Pandas
Columns = ["BusinessTravel", "Department"," EducationField", "Gender", "JobRole", "MaritalStatus", "OverTime"
From sklearn.preprocessing import LabelEncoder
Encode the “Attrition” column
Scale continuous data using StandardScaler 
Description of preliminary feature selection, including their decision-making process:
After preprocessing the data by dropping unnecessary columns and completing feature engineering, we narrowed down the features to use for our ML model.
To refine our feature selection we will:
Run the model
Check the accuracy score
Rank the feature importance
Remove the least important features to improve the efficiency of the model
Description of how data was split into training and testing sets:
Import train_test_split from sklearn > The train_test_split function of the sklearn. model_selection package in Python splits arrays or matrices into random subsets for train and test data
Create X and y training and testing variables
Use train_test_split code to assign values to the variables as seen below
Explanation of model choice, including limitations and benefits:
We chose a supervised logistic regression model because our data already has labels (column names) and we are simply looking to perform a binary classification in order to help us predict if a healthcare employee will attrit or not.  
Limitations: 1. Only able to predict discrete functions and 2.Not as capable of determining complex relationships as Neural Networks
Benefits: 1. Relatively easy/efficient to implement, interpret + train and 2. Not as prone  to overfitting as other types of models

### Database (slides 22-27):
#### Database Requirements:

We’ve created a fully integrated PostgreSQL database + have met the following requirements:
Database stores static data for use during the project: full_data table
Database interfaces with the project: data is separated + joined into tables and then connected to the ML model with a SQLAlchemy connection string
Database includes at least two tables:  basic_personal_information, employee_current_job, employee_feedback, employee_finances, employee_satisfaction, employee_work_history, full_data
Database includes at least one join using SQL: See Database splits joins .sql file 
Database includes at least one connection string: using SQLAlchemy: ML_Model_Draft2.ipynb file 
Presentation includes an ERD with relationships: see QuickDBD-export.png file

### Dashboard(slides 28-30):
#### A blueprint for the dashboard is created and includes all of the following:
Storyboard on a Google Slide(s): The storyboard outlines our Tableau dashboard, which will visualize the answers to 1. who is most likely to attrit, 2. when are they most likely to attrit, and 3. why they are most likely to attrit.
Description of the tool(s) that will be used to create the final dashboard: The final dashboard will be created using multiple graph types in Tableau. These graphs will help visualize which factors most heavily influence a person’s likelihood of attritting, and the typical profile of a healthcare worker  who is likely to attrit.
Description of interactive element(s): We will incorporate interactive elements into the graphs by toggling between male and female filters to show the difference in attrition data by gender.





