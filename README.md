Customer Insights & Digital Engagement Analytics Platform
Project Overview

This project builds an end-to-end analytics platform to analyze digital user interaction data and generate actionable business insights.

The system simulates large-scale clickstream activity, processes the data through an ETL pipeline, performs behavioral analytics and machine learning segmentation, and visualizes business KPIs using an interactive Power BI dashboard.

The platform demonstrates how organizations can capture insights from digital channels, measure customer engagement, and optimize marketing initiatives through data analytics.

Architecture
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
Technologies Used
Category	Tools
Data Processing	Python, Pandas
Machine Learning	Scikit-learn
Cloud Data Lake	AWS S3
Cloud Analytics	AWS Athena
SQL Analytics	Athena SQL Queries
Visualization	Power BI
Statistical Testing	SciPy
Data Engineering	Python ETL Pipeline
Dataset

The project simulates large-scale user interaction data from a digital platform.

Dataset Characteristics

~10,000 users

~200,000+ interaction events

Event types include:

page_view

product_view

cart_add

purchase

These events represent typical digital channel engagement signals used by analytics teams.

Key Features
Data Pipeline

A Python-based ETL pipeline generates and processes user interaction data.

Data ingestion

Feature engineering

Aggregation of engagement metrics

Export to analytics datasets

Cloud Data Architecture

Interaction data is stored in AWS S3 and analyzed using AWS Athena for scalable SQL analytics.

Example analytics queries include:

event distribution analysis

conversion funnel metrics

daily activity trends

customer engagement levels

Customer Segmentation (Machine Learning)

Customer behavior is analyzed using K-Means clustering.

Users are segmented into behavioral groups:

Segment	Description
Segment 0	Low engagement users
Segment 1	Casual visitors
Segment 2	Frequent users
Segment 3	High value customers

This enables targeted marketing and personalization strategies.

Marketing Experimentation (A/B Testing)

A/B testing simulation evaluates marketing campaign effectiveness.

Example:

Campaign	Conversion Rate
Campaign A	~12%
Campaign B	~16%

Results indicate Campaign B achieves ~33% higher conversion performance, suggesting improved campaign design.

Power BI Dashboard

The interactive Power BI dashboard visualizes key business metrics including:

Total users

Total interaction events

Total purchases

Event distribution

Customer segments

Daily engagement trends

Conversion funnel

Dashboard preview:

dashboards/powerbi-dashboard.png
Business Insights

Key insights derived from the analysis:

Page views account for approximately 50% of user interactions, indicating high browsing activity.

The conversion funnel shows a 60% drop-off between page view and product view, highlighting opportunities to improve product discovery.

High-value customer segments generate a disproportionate share of purchase events.

Marketing campaign B demonstrates 33% higher conversion rates compared to campaign A.

Users generate an average of ~20 interaction events per session, indicating strong engagement with digital channels.