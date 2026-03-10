# Student-Dropout-Risk-Analysis-Using-SQL
## Project Overview 
This project analyzes key risk factors associated with student dropout using SQL-based exploratory data analysis.
--- 
## Tools used 
- SQL 
- Excel 
- GitHub
- VS.Code
----
## Dataset
The dataset for this project comes from kaggle and contains contains 10,000 rows and 19 columns with student demographic, behavioral, and academic features along with the dropout target variable.

Source: https://www.kaggle.com/datasets/meharshanali/student-dropout-prediction-dataset

The dataset includes: 
- Student demographics
- Enviromental factors
- Educational paths/performance
- Dropout rate

The raw dataset is available here: [student_dropout_dataset_v3.csv](Data/raw/student_dropout_dataset_v3.csv).

--- 
## Data Cleaning 

Before analysis, the raw data required the following cleaning steps: 
- Removed duplicate rows
- Checked for null values
- Checked for validity and range of important

The cleaned dataset is available in the `Data/Processed` folder: [cleaned_dropoutdata.cvs.numbers](Data/Processed/cleaned_dropoutdata.cvs.numbers)

---
## Exploratory Data Analysis (SQL)
The SQl Quieries used to analyze the data are located in the [sql folder](sql/analysis_queries.sql).

Key analysis included: 
- Data Cleaning Validation Queries
- Exploratory Analysis Queries
- Risk Segmentation Queries
- Insight Interpretation

---
## Visualizations

### Dropout Rate by GPA and Attendance

![Dropout Heatmap](Visualizations/dropout_heatmap.png)

### Parental Education vs. Dropout 

![Parental_Education vs Dropout](Visualizations/Parental_Education vs Dropout.png)
