# Healthcare Attrition

UT McCombs School of Business - Data Analytics & Visualization Bootcamp

Team 2's Final Project - Segment One

- - - - 

## Presentation
### Content
Team members have drafted their project, including the following:
- Selected topic 
Predicting employee attrition in the healthcare industry

- Reason why they selected their topic 
The COVID pandemic put intense strain on the healthcare industry and led to unprecedented levels of attrition. Being able to predict which employees will attrit can help hospitals prepare for tighter staffing and lessen the impact to their patients and their bottom line. In short, this topic is very relevant and applicable to the current challenges faced in this industry.

- Description of their source of data 
The synthetic data we’re using is based on an IBM Watson dataset for attrition, but tailored to the healthcare industry.

- Questions they hope to answer with the data
We hope to understand 1. which factors most heavily influence a person’s likelihood of attritting and 2. the typical profile of a healthcare worker who is likely to attrit.

#### Note: The content does not yet need to be in the form of a presentation; text in the README.md works as well.

We have started an outline for our presentation in the “Team 2 Deliverable 1.pptx” powerpoint file. 

- - - - 

## GitHub
### Main Branch 
- Includes a README.md 
- README.md must include: Description of the communication protocols 
- Includes a .gitignore that ignores .DS_Store and python files

### Communication Protocols
- Created private Slack channel: group2_final_challenge
- Team members have editor access to group agenda on GoogleDocs
- Team members will meet via Zoom each Tuesday & Thursday from 7-9 pm CST
- Established roles: Square - Megan, Circle - Sahih, Triangle - Sara, X - Claire & Molly

### Individual Branches 
- At least one branch for each team member 
- Each team member has at least four commits from the duration of the first segment 
- Note: The descriptions and explanations required in all other project deliverables should also be in your README.md as part of your outline, unless otherwise noted.

- - - - 

## Machine Learning Model
### Team members present a provisional machine learning model that stands in for the final machine learning model and accomplishes the following:
- Takes in data in from the provisional database 
- Outputs label(s) for input data

### ML Model Overview:

You will find all the current code for our machine learning model in the “ML_Model_Draft1.ipynb” Jupyter Notebook file. In the code, you will see that we have imported our dependencies, connected to our Postgres SQL database, loaded the data as a dataframe into JN, and defined our features and target variables. We’ve also started drafting out the rest of the code for splitting the data, creating and training our model, and printing our prediction results.  

Below, please see an overview of the type of model we’re using and why. 

#### Supervised (labels) vs Unsupervised (clustering): 
We will use a supervised ML model for this project since our data has labels (it is already in a clean table format with labeled columns).

#### Classification (predict discrete outcomes) vs Regression (predict continuous variables):
We will use classification in this project because we are determining discrete outcomes (attriting or not attriting) This is also known as binary classification and we will employ a logistic regression model.

#### Features vs. Target: 
The features are the variables used to make a prediction (all of the columns except the attrition column). The target is the predicted outcome (Attrition).

- - - - 

## Database
### Team members present a provisional database that stands in for the final database and accomplishes the following:
- Sample data that mimics the expected final database structure or schema
- Draft machine learning model is connected to the provisional database

### Data Used:
Data on healthcare worker attrition was pulled from Kaggle. The Kaggle data contains the following columns of data: EmployeeID, Age, Attrition, BusinessTravel, DailyRate, Department, DistanceFromHome, Education, EducationField, EmployeeCount, EnvironmentSatisfaction, Gender, HourlyRate, JobInvolvement, JobLevel, JobRole, JobSatisfaction, MaritalStatus, MonthlyIncome, MonthlyRate, NumCompaniesWorked, Over18, OverTime, PercentSalaryHike, PerformanceRating, RelationshipSatisfaction, StandardHours, Shift, TotalWorkingYears, TrainingTimesLastYear, WorkLifeBalance, YearsAtCompany, YearsInCurrentRole, YearsSinceLastPromotion, YearsWithCurrManager.

The original Kaggle data is entirely either integers or strings, which may require future cleaning for ML purposes.

Additionally, while sifting through the data, we were able to initially identify potential unnecessary or extra data.

### Table Structure:
In order to meet the requirement for merging data in a database, the original Kaggle data was split into the individual tables as seen below, with EmployeeID acting as the primary key to reconnect the data.

![Fig 1] (QuickDBD-export.png)
Please see quickdbd-export.png file for a mockup of the database.

The DatabaseDecisions.xlsx and DatabaseDecisions.txt files outline the plant for splitting up the data. The original Kaggle data was divided up into categories based on theme (i.e. money, employer information, employee information).

Using PGAdmin, the original Kaggle data was added to a database and then divided up into the individual tables using the script outlined in splittingdata.txt. The individual tables were then exported for upload onto GitHub. From this point, the individual tables will act as the starting point for future database use and analysis.

- - - - 

## Dashboard
### Not yet necessary
- We plan to create an outline of our dashboard to submit with the second project segment.
