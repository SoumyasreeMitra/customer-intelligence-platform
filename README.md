# Customer Insights & Digital Engagement Analytics Platform

## Project Overview

This project builds an **end-to-end analytics platform** to analyze digital user interaction data and generate actionable business insights.

The system simulates large-scale clickstream activity, processes the data through a **Python ETL pipeline**, performs **customer segmentation using machine learning**, and visualizes key business metrics through an **interactive Power BI dashboard**.

The platform demonstrates how organizations can **capture insights from digital engagement channels, measure customer behavior, and optimize marketing initiatives using data analytics**.

---

# Architecture


User Interaction Data
↓
Python Data Generator
↓
AWS S3 Data Lake
↓
AWS Athena SQL Analytics
↓
Customer Segmentation (Machine Learning)
↓
Power BI Business Intelligence Dashboard


---

# Technologies Used

**Programming & Data Processing**

- Python
- Pandas
- NumPy

**Machine Learning**

- Scikit-learn (K-Means clustering)

**Cloud & Data Infrastructure**

- AWS S3 (Data Lake)
- AWS Athena (SQL Analytics)

**Data Analysis & Statistics**

- SQL
- SciPy (A/B testing)

**Visualization**

- Power BI

---

# Dataset

The project simulates **digital clickstream interaction data** representing user engagement on a platform.

### Dataset Characteristics

- **Users:** ~10,000 simulated users  
- **Interaction Events:** ~200,000+ digital events  
- **Tracked Events**
  - `page_view`
  - `product_view`
  - `cart_add`
  - `purchase`

These events represent **typical digital channel engagement signals used by analytics teams**.

---

# Key Features

## Data Pipeline

A Python-based **ETL pipeline** generates and processes user interaction data.

Pipeline tasks include:

- Data ingestion
- Data cleaning
- Feature engineering
- Engagement metric aggregation
- Analytics dataset generation

---

## Cloud Data Architecture

Interaction data is stored in an **AWS S3 data lake** and analyzed using **AWS Athena**.

Athena enables scalable SQL queries on large interaction datasets without managing infrastructure.

Analytics queries calculate metrics such as:

- event distribution
- conversion funnel metrics
- user engagement levels
- daily activity trends

Example Athena queries are included in:


aws/athena_queries.sql


---

## Customer Segmentation (Machine Learning)

Customer behavior is analyzed using **K-Means clustering**.

Users are grouped into behavioral segments:

| Segment | Description |
|-------|-------------|
| Segment 0 | Low engagement users |
| Segment 1 | Casual visitors |
| Segment 2 | Frequent users |
| Segment 3 | High-value customers |

This segmentation supports **targeted marketing and personalization strategies**.

---

## Marketing Experimentation (A/B Testing)

The project includes a **marketing campaign experiment simulation**.

Example experiment results:

| Campaign | Conversion Rate |
|--------|----------------|
| Campaign A | ~12% |
| Campaign B | ~16% |

Analysis shows **Campaign B achieves ~33% higher conversion performance**, suggesting improved marketing strategy effectiveness.

---

# Power BI Dashboard

The Power BI dashboard visualizes key platform metrics including:

- Total users
- Total interaction events
- Total purchases
- Event distribution
- Customer segmentation
- Daily engagement trends
- Conversion funnel

### Dashboard Preview

![Dashboard](dashboards/powerbi-dashboard.png)

---

# Business Insights

Key insights derived from the analytics pipeline:

- **Page views account for ~50% of all platform interactions**, indicating strong browsing activity.
- The conversion funnel shows a **~60% drop-off between page view and product view**, highlighting opportunities to improve product discovery.
- Customer segmentation reveals **high-value users responsible for a significant share of purchases**.
- A/B testing results indicate **Campaign B delivers ~33% higher conversion rates** than Campaign A.
- Users generate an average of **~20 interaction events per session**, demonstrating strong digital engagement.

---