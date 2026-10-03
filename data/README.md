# Dataset

This project uses a structured recruitment dataset containing **3,000 candidate records** covering the period from **January 2025 to September 2026**.

The dataset includes information related to:

* Candidate applications
* Job roles and locations
* Experience and education
* Recruitment sources and recruiters
* Screening and interview outcomes
* Interview scores
* Selection and joining status
* Offer salary
* Rejection reasons
* Time to hire
* Candidate ratings

## Data Preparation

The original dataset was maintained in **Google Sheets** and cleaned before being loaded into BigQuery.

The cleaning process included:

* Standardizing categorical values
* Handling missing values
* Validating candidate IDs
* Creating experience and salary bands
* Creating recruitment-stage classifications
* Deriving application month and year fields

The cleaned dataset was then connected to **BigQuery** as an external table and used for SQL-based analysis.

## Data Availability

The candidate-level dataset is not included in this repository because it is used primarily as a demonstration dataset for the analytics workflow.

The repository instead contains the SQL queries used to transform and analyze the data, along with the resulting dashboard.

## Data Pipeline

```text
Google Sheets
      ↓
Data Cleaning
      ↓
BigQuery
      ↓
SQL Analysis
      ↓
Looker Studio
      ↓
Recruitment Analytics Dashboard
```
