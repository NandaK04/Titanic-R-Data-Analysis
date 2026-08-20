# Titanic R Data Analysis

## Overview
This project analyzes the Titanic dataset using R to explore passenger characteristics and survival patterns.

## Objectives
- Inspect and understand the dataset
- Identify and handle missing values
- Check for duplicate records
- Detect potential outliers
- Normalize numerical variables
- Encode categorical variables
- Analyze relationships between passenger characteristics and survival
- Create visualizations to communicate findings

## Dataset
The analysis uses the Titanic passenger dataset containing information such as:
- Passenger class
- Sex
- Age
- Number of siblings/spouses aboard
- Number of parents/children aboard
- Fare
- Port of embarkation
- Survival status

## Key Findings
- Overall survival rate was approximately **38.38%**.
- Female passengers had a much higher survival rate (**74.20%**) than male passengers (**18.89%**).
- First-class passengers had a higher survival rate (**62.96%**) than second-class (**47.28%**) and third-class passengers (**24.24%**).
- The average fare of survivors was higher than that of non-survivors.
- Passenger class showed a negative relationship with survival, while fare showed a positive relationship with survival.

## Visualizations
The project includes visualizations covering:
- Survival by gender
- Age distribution
- Fare distribution
- Age vs. Fare
- Survival by passenger class

## Tools Used
- R
- RStudio
- Base R visualization
- Statistical analysis

## Project Structure

```text
Titanic-R-Data-Analysis/
│
├── week1_titanic_analysis.R
├── titanic.csv
├── 01_survival_gender.png
├── 02_age_distribution.png
├── 03_fare_distribution.png
├── 04_age_vs_fare.png
└── 05_survival_class.png

Conclusion

This analysis demonstrates how R can be used for data cleaning, exploratory data analysis, statistical analysis, and visualization. The results highlight the strong influence of gender and passenger class on Titanic survival outcomes.
