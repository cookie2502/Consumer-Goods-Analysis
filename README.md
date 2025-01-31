# Consumer-Goods-Analysis
This repository serves as my documentation for the Consumer Goods: Ad-Hoc Analysis - MySQL Project.
It was created as part of [Resume Project Challenge 4: Provide Insights to Management in Consumer Goods Domain](https://codebasics.io/challenge/codebasics-resume-project-challenge/7) by [Codebasics](https://codebasics.io/).

The entire project has been implemented using MySQL Workbench 8.0 CE.

The project raw data files have not been uploaded to this repository in compliance with Codebasics Data & Content Distribution Policy.

---

## Contents:
Please find the sectional links for the project below:
- [Introduction to AtliQ Hardware](#introduction-to-atliq-hardware)
  - [Project Objective](#project-objective)
- [Tools used & Methodologies implemented](#tools-used)
- [About the Dataset](#about-the-dataset)
  - [Data Dictionary](#data-dictionary)
  - [Data Integrity](#data-integrity)
  - [Data Model - ERD](#data-model---erd)
- [Project Implementation](#project-implementation)
- [Ad-Hoc Analysis Insights](#ad-hoc-analysis-insights)
- [Presentation](#presentation)
- [Conclusion](#conclusion)

---

## Introduction to AtliQ Hardware:
**Domain:** Consumer Goods | **Functions:** Finance & Supply Chain

- AtliQ Hardwares is company that sells computer hardware and peripherals like PC, mouse, printer etc. to clients across the world.
- They have a major B2B business model wherein they sell to stores like Croma, Best Buy, Staples, Flipkart etc. who then sell it to the end users (consumers). These stores are their main customers.
- They sell through 3 channels: Retailer, Direct and Distributor.
- AtliQ Hardwares’s Customers are of two types. Both these Platforms are called Retailer channels.
  1. Brick & Mortar Customer: Actual physical stores e.g. Croma, Best Buy
  2. E-commerce Customer: Online websites E.g. Amazon, Flipkart
- AtliQ Hardwares also has a minor B2C business model wherein they own stores: AtliQ E-store and AtliQ Exclusive. These are called Direct channels.
- They also have Distributors in some countries with restricted trade. E.g. Neptune

## Project Objective:
Business growth analysis is essential for any company that wants to remain competitive and successful in the long term.

The goal is to write effective SQL queries to answer 10 ad-hoc business requests from the Data Analytics Director, aiming to secure valuable insights into the consumer goods sector. By fulfilling these different ad-hoc requests, I delivered specific answers to important business questions enabling the company to understand its product portfolio, sales trends across diverse customer segments and a monthly overview of products sold.

## Tools used:
1. MySQL Workbench - for Data Cleaning, Data Manipulation, Normalization and Analysis process
2. Datawrapper - to create data visualizations
3. Miro - to create Entity Relationship Diagram (ERD)
4. Powerpoint - to create project presentation
5. GitHub - for documentation

## Skills & Methodologies implemented:
1. Data Cleaning - **CRUD Operations**
2. Data Manipulation - **Sub Queries, CTEs (Common Table Expression), Views, Temporary tables, Window Functions, UDFs (User-defined Functions), Stored Procedures and Database Triggers**
3. Database Modelling and Normalization - **ERD**
4. Exploratory Data Analysis - **Selection, Filtering, Aggregation, Grouping, Joining, Conditional Expressions**
5. Data Visualization
6. Documentation

---

## About the Dataset:
### Data Sources: Finance & Supply Chain
The dataset contains 9 tables in total, namely -
- dim_customer: 209 records | 7 columns
- dim_product: 397 records | 6 columns
- fact_forecast_monthly: 1,880,064 records | 5 columns
- dim_freight_cost: 135 records | 4 columns
- dim_gross_price: 1,182 records | 3 columns
- dim_manufacturing_cost: 1,182 records | 3 columns
- dim_post_invoice_deductions: 2,057,704 records | 5 columns
- dim_pre_invoice_deductions: 1,045 records | 3 columns
- fact_sales_monthly: 1,436,905 records | 5 columns

### Data Dictionary:
[Link to the Data Dictionary Documentation](https://github.com/cookie2502/Consumer-Goods-Analysis/blob/9d97e23ecffc51767467740019deb420b486c248/Data%20Dictionary.md)

### Data Model - ERD:
[Link to the Data Model - ERD](https://github.com/cookie2502/Consumer-Goods-Analysis/blob/9d97e23ecffc51767467740019deb420b486c248/AtliQ%20Hardware%20ERD.jpg)

## Data Integrity:
ROCCC Evaluation:
- Reliability: MED - The raw dataset is created and updated by Codebasics. It has total 9 files. All of them were utilized in the analysis.
- Originality: HIGH - First party provider (Codebasics)
- Comprehensiveness: HIGH - Total 9 Files with a total of around 5.3 Million records were provided. Dataset contains multiple dimension parameters for Customers & Products as well as comprehensive Finance & Supply Chain transaction data.
- Current: LOW - Dataset was updated upto FY 2022 i.e almost 2 years old. So its not very relevant. Any trends observed and insights gained need to be comprehended as a general (not FY-specific) trend.
- Citation: LOW - No official citation/reference available.

---

## Project Implementation:
Please find the documentation links for the project phase-wise implementation below:
- 1. Data Import
- [2. Data Cleaning](https://github.com/cookie2502/Consumer-Goods-Analysis/blob/9d97e23ecffc51767467740019deb420b486c248/codes/project_functional_queries/data_cleaning.sql)
- [3. Database Design]
- [4. Calculate FiscalYear & Fiscal Quarter using Functions]
  - [Fiscal Year]
  - [Fiscal Quarter]
- [5. Finance Analytics]
  - [5.1 Gross Sales Report: Croma FY 2021 Monthly Product Transactions]
  - [5.2 Gross Sales Report: Croma Monthly Gross Sales]
  - [5.3 Gross Sales Report: Croma Yearly Gross Sales]
  - [5.4 Stored Procedure: Monthly Gross Sales Report]
  - [5.5 Stored Procedure: Market Badge]
- [6. Query Optimization]
  - [6.1 Creating dim_date table]
  - [6.2 Modifying fact_sales_monthly table to include fiscal_year]
- [7. Configuring Database Views]
  - [7.1 View: Gross Sales]
  - [7.2 View: Sales Pre Invoice Discount]
  - [7.3 View: Sales Post Invoice Discount]
  - [7.4 View: Net Sales]
- [8. Top Customers, Products & Markets Reports]
  - [8.1 Top Markets report for a given FY by Net Sales (in millions)]
  - [8.2 Top Customers report for a given FY by Net Sales (in millions)]
  - [8.3 Top Products report for a given FY by Net Sales (in millions)]
  - [8.4 Top Customer-wise Net Sales % contribution report for a given FY]
  - [8.5 Top Customer-wise Net Sales % contribution report per Region for a given FY]
  - [8.6 Top Products report in each Division for a given FY by their Quantity Sold]
  - [8.7 Top Markets report in each Region for a given FY by their Gross Sales]
- [9. Supply Chain Analytics]
  - [9.1 Actual & Estimate Sales Qty Helper Table]
  - [9.2 Auto Updating Actual & Estimate Sales Qty Helper Table using Database Triggers]
  - [9.3 Forecast Accuracy Report for a given FY by Customer]
  - [9.4 Comparative Forecast Accuracy Report across consecutive FY by Customer]
