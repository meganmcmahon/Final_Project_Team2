# Healthcare Attrition

#### UT McCombs School of Business: Data Analytics & Visualization Bootcamp 
#### Team 2's Final Project - Segment Three

- - - - 

## Repository Overview :

This README serves as a high-level overview of our project. Our FINAL Presentation deck is saved as a PDF file in the "Power Point Decks" folder in this repo and can also be reviewed through the following Google Slides link, which also shows the speaker notes for our presentation.

#### [Team 2 FINAL Project Presentation](https://docs.google.com/presentation/d/1hwFlfPzdQL078yApkk1e9whpe-HaVYWZqgzrIQJpIlo/edit#slide=id.p)

- - - - 

## Presentation Deck :

The more comprehensive presentation deck, which demonstrates that we’ve fulfilled all Section 1-4 project objectives can be found in the following Google Slides deck: [Team 2 Project Presentation](https://docs.google.com/presentation/d/1tdAcC5qe8PwP9i62jdcyTuN2kitAb_tAN8MCmW_nyGg/edit#slide=id.p)
- Project Overview
- Data Analysis
- Machine Learning
- Database
- Dashboard
- Project Conclusion

- - - - 

### Project Overview (slides 3-6):

#### Selected topic: 
Predicting employee attrition in the healthcare industry

#### Reason for topic selection: 
The COVID pandemic put intense strain on the healthcare industry and led to unprecedented levels of attrition. Being able to predict which employees will attrit can help hospitals prepare for tighter staffing and lessen the impact to their patients and their bottom line. In short, this topic is very relevant and applicable to the current challenges faced in this industry.

#### Description of source data: 
The synthetic data we’re using is based on an IBM Watson dataset for attrition.

#### Questions we hope to answer with the data: 
We hope to understand 1. Which factors most heavily influence a person’s likelihood of attritting? 2. What is the typical profile of a healthcare worker who is likely to attrit?

#### Technologies, languages, tools, and algorithms used throughout the project :
* Technologies: PostgreSQL, Quick Database Diagrams
* Languages: SQL, Python
* Tools: PgAdmin, Tableau, Jupyter Notebook
* Algorithms: Logistic Regression, Random Forest

- - - - 

### Data Analysis (slides 7-13): 

#### Description of the data exploration + Analysis phase of the project:

1. Jupyter Notebook and Pandas were used to look at the DataFrame shape and structure (there are 1,676 rows and 35 columns) and identify if there were any missing values (there were not). Initially, the data looks very clean.

![Data Analysis Initial Shape](https://github.com/meganmcmahon/Final_Project_Team2/blob/main/Images/Data%20Analysis%20Initial%20Shape.png)

2. Next, we identified the data type for each column of data. Of the 35 columns, there are 26 columns of integer data and 9 columns of string data.

![Data Analysis Data Types](https://github.com/meganmcmahon/Final_Project_Team2/blob/main/Images/Data%20Analysis%20Data%20Types.png)

3. The following integer columns contained integer values to describe categorical data: Education (scale 1-5), EnvironmentSatisfaction (scale 1-4), JobInvolvement (scale 1-4), JobSatisfaction (scale 1-4), PerformanceRating (scale 1-4), RelationshipSatisfaction (scale 1-4), WorkLifeBalance (scale 1-4).

4. Looking at the possible values for the string columns, there are still fairly limited response options– columns with object data types had at most 6 different possible responses.

5. Descriptive data (count, mean, std, min, 25%, 50%, 75%, max) were calculated for each of the numerical columns. The mean and standard deviations were useful in identifying the common responses and spread of responses for the Education, EnvironmentSatisfaction, JobInvolvement, JobSatisfaction, PerformanceRating, RelationshipSatisfaction, and WorkLifeBalance scaled data columns. Additionally, it was useful in identifying that the EmployeeCount and StandardHours columns do not contribute useful data, and that the DailyRate, HourlyRate, MonthlyIncome, and MonthlyRate columns contain equivalent (and therefore redundant) data.

![Data Analysis Scaled Data](https://github.com/meganmcmahon/Final_Project_Team2/blob/main/Images/Data%20Analysis%20Scaled%20Data.png)

- - - -

### Machine Learning (slides 14-26):

#### The most up-to-date code for our machine learning modes can be found in the ML_Model_Draft2.ipynb file in the “Machine Learning Code” folder.

##### Description of preliminary data preprocessing after loading in the data :

1. Ran df.describe() to review the distribution of the data in each column
2. Ran df.isnull().sum() to double check for any null values
3. Ran df.dtypes to see what types of data are in each column
4. Ran df.drop() to drop any unnecessary columns: [EmployeeID, Over18,  EmployeeCount, StandardHours,  DailyRate, HourlyRate,  MonthlyRate]

##### Description of preliminary feature engineering:
1. Binary encoding using Pandas
2. Columns = ["BusinessTravel", "Department"," EducationField", "Gender", "JobRole", "MaritalStatus", "OverTime"
3. From sklearn.preprocessing import LabelEncoder
4. Encode the “Attrition” column
5. Scale continuous data using StandardScaler 

##### Description of preliminary feature selection, including their decision-making process:

After preprocessing the data by dropping unnecessary columns and completing feature engineering, we narrowed down the features to use for our ML model.

To refine our feature selection we will :

1. Run the model
2. Check the accuracy score
3. Rank the feature importance
4. Remove the least important features to improve the efficiency of the model

##### Description of how data was split into training and testing sets:
1. Import train_test_split from sklearn > The train_test_split function of the sklearn. model_selection package in Python splits arrays or matrices into random subsets for train and test data
2. Create X and y training and testing variables
3. Use train_test_split code to assign values to the variables as seen below

##### Explanation of model choice, including limitations and benefits:

We chose a supervised logistic regression model because our data already has labels (column names) and we are simply looking to perform a binary classification in order to help us predict if a healthcare employee will attrit or not.  

* Limitations: 1. Only able to predict discrete functions and 2. Not as capable of determining complex relationships as Neural Networks
* Benefits: 1. Relatively easy/efficient to implement, interpret + train and 2. Not as prone  to overfitting as other types of models

##### Explanation of changes in model choice and changes that occurred between the Segment 2 and Segment 3 deliverables
* Moved from using a Logistic Regression model to a RandomForestClassifier model, based on results outlined on slide 23

##### Description of how we have trained the model thus far, and any additional training that will take place
* Achieved first round results after initial data preprocessing, feature engineering + selection outlined on slides 19-22
* Next, in ML_Model_Draft3, we will update the Logistic Regression model by increasing the # of estimators (100 >1000) and use Oversampling on our X_train and y_train variables

##### Description of current accuracy score

* See slides 23-24 and ML Code in ML_Model_Draft3.ipynb file in the Machine Learning Code folder in our repo

##### Additionally, the model obviously addresses the question or problem we are solving:
* The model does a good job of predicting that someone will not attrit, but it is not as accurate at predicting with precision that someone will attrit. 
* The stakes are not as high as with needing precision for predicting, for example, if someone has cancer or not.
* We still have options to fine tune the data more in order to achieve an even higher accuracy score: we could bucket out the monthly income into chunks of 500-1000, drop additional unnecessary columns, try undersampling our variables, etc.

- - - -

### Database (slides 27-32):

#### Database Requirements:
We’ve created a fully integrated PostgreSQL database + have met the following requirements:

1. Database stores static data for use during the project: full_data table
2. Database interfaces with the project: data is separated + joined into tables and then connected to the ML model with a SQLAlchemy connection string
3. Database includes at least two tables:  basic_personal_information, employee_current_job, employee_feedback, employee_finances, employee_satisfaction, employee_work_history, full_data
4. Database includes at least one join using SQL: See Database splits joins .sql file 
5. Database includes at least one connection string: using SQLAlchemy: ML_Model_Draft2.ipynb file 
6. Presentation includes an ERD with relationships: see QuickDBD-export.png file

- - - - 

### Dashboard(slides 33-36):

#### A blueprint for the dashboard is created and includes all of the following:

* Storyboard on a Google Slide(s): The storyboard, displayed in the next slide, outlines our Tableau dashboard, which will visualize the answers to 1. who is most likely to attrit, 2. when are they most likely to attrit, and 3. why they are most likely to attrit.

* Description of the tool(s) that will be used to create the final dashboard: The final dashboard will be created using multiple graph types in Tableau. These graphs will help visualize which factors most heavily influence a person’s likelihood of attritting, and the typical profile of a healthcare worker  who is likely to attrit.

* Description of interactive element(s): We will incorporate interactive elements into the graphs by toggling between groups who did attrit and who did not attrit.

![Dashboard](https://github.com/meganmcmahon/Final_Project_Team2/blob/main/Images/Dashboard.png)

#### The dashboard presents a data story that is logical and easy to follow for someone unfamiliar with the topic. It includes the following:

* Images from the initial analysis: See slides 9-13
* Data (images or report) from the machine learning task: See slides 22, 24-25
* At least one interactive element: all graphs can be filtered by attrition. See Tableau Public Link: https://public.tableau.com/app/profile/megan.mcmahon/viz/Final_Project_Dashboard_16626658098950/ProjectDashboard?publish=yes

- - - - 

### Project Conclusion(slides 37-39):

#### Analysis Results:
* Age, if someone works overtime or not, total working years and monthly income were the variables that contributed most to the model

#### Recommendations for future analysis:
* We could bucket out the monthly income into chunks of 500-1000, drop additional unnecessary columns, try undersampling our variables, etc., in order to increase the model’s accuracy score

#### What we would have done differently: 
1. Explore other employee/attrition data sets and test them against the model
2. Conduct more statistical analysis on the data in order to further understand the distribution + the most relevant/dependable variables for the ML model
