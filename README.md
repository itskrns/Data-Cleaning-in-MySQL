# HR Data Cleaning Project

## Overview
This project focuses on cleaning and standardizing messy HR data to make it suitable for analysis.  
The raw dataset contains inconsistent data types, missing values, duplicate records, and multiple date formats.  
SQL-based data cleaning techniques are applied to generate a clean, analysis-ready dataset.

---

## Dataset
- **Input (Raw Data):** `messy_HR_data.csv`  
- **Output (Cleaned Data):** `HR-Data-Cleaned.csv`

---

## Objectives
- Improve overall data quality and consistency  
- Handle missing and invalid values  
- Standardize formats and data types  
- Remove duplicate records  
- Prepare data for reporting and analytics  

---

## Data Cleaning Steps

### 1. Data Inspection
- Inspected table structure and column count  
- Reviewed data types and identified inconsistencies  

### 2. Data Standardization
- Converted employee names to **Title Case**  
- Standardized `Joining_Date` using multiple date format patterns  

### 3. Data Validation
- Identified non-numeric values in `Age` and `Salary`  
- Replaced invalid values with appropriate numeric values  

### 4. Missing Value Handling
- Converted empty strings and NaN values to `NULL`  
- Imputed missing `Age` and `Salary` values using:
  - Mean / Median  
  - Group-wise logic where applicable  

### 5. Data Type Conversion
- Converted:
  - `Age` → INTEGER  
  - `Salary` → DECIMAL / NUMERIC  
  - `Joining_Date` → DATE  

### 6. Duplicate Removal
- Removed duplicate records based on:
  - Name  
  - Email  
  - Phone Number  

### 7. Null Value Analysis
- Calculated null value counts for each column to verify data completeness  

### 8. Primary Key Addition
- Added a unique primary key column for reliable record identification  

---

## Tools & Technologies
- SQL (MySQL or any SQL-compatible database)

---

## How to Use

### Prerequisites
- MySQL or any SQL-compatible database  
- Basic understanding of SQL  

### Steps to Reproduce
1. Import `messy_HR_data.csv` into your SQL database  
2. Execute the provided SQL data cleaning queries  
3. Validate the cleaned data  
4. Export the final table as `HR-Data-Cleaned.csv`  

---

## Notes
- Imputation logic can be customized based on business rules  

