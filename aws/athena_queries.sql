/*
========================================================
AWS ATHENA ANALYTICS QUERIES
Customer Insights & Digital Engagement Platform
========================================================
Dataset: Clickstream user interaction data
Stored in: AWS S3 Data Lake
Queried using: AWS Athena
========================================================
*/


/*
--------------------------------------------------------
1. CREATE DATABASE
--------------------------------------------------------
*/

CREATE DATABASE IF NOT EXISTS customer_analytics;



/*
--------------------------------------------------------
2. CREATE EVENTS TABLE (EXTERNAL TABLE)
--------------------------------------------------------
*/

CREATE EXTERNAL TABLE IF NOT EXISTS customer_analytics.events (
    user_id INT,
    event_type STRING,
    timestamp STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
LOCATION 's3://customer-insights-analytics-data/'
TBLPROPERTIES ("skip.header.line.count"="1");



/*
--------------------------------------------------------
3. TOTAL USERS ON PLATFORM
--------------------------------------------------------
*/

SELECT 
COUNT(DISTINCT user_id) AS total_users
FROM customer_analytics.events;



/*
--------------------------------------------------------
4. TOTAL EVENTS GENERATED
--------------------------------------------------------
*/

SELECT 
COUNT(*) AS total_events
FROM customer_analytics.events;



/*
--------------------------------------------------------
5. EVENT DISTRIBUTION
--------------------------------------------------------
User interaction distribution across event types
*/

SELECT 
event_type,
COUNT(*) AS total_events
FROM customer_analytics.events
GROUP BY event_type
ORDER BY total_events DESC;



/*
--------------------------------------------------------
6. PURCHASE EVENTS
--------------------------------------------------------
*/

SELECT 
COUNT(*) AS total_purchases
FROM customer_analytics.events
WHERE event_type = 'purchase';



/*
--------------------------------------------------------
7. USER ACTIVITY LEVEL
--------------------------------------------------------
*/

SELECT 
user_id,
COUNT(*) AS activity_count
FROM customer_analytics.events
GROUP BY user_id
ORDER BY activity_count DESC
LIMIT 20;



/*
--------------------------------------------------------
8. CONVERSION FUNNEL
--------------------------------------------------------
User journey across product interaction stages
*/

SELECT
SUM(CASE WHEN event_type='page_view' THEN 1 ELSE 0 END) AS page_views,
SUM(CASE WHEN event_type='product_view' THEN 1 ELSE 0 END) AS product_views,
SUM(CASE WHEN event_type='cart_add' THEN 1 ELSE 0 END) AS cart_adds,
SUM(CASE WHEN event_type='purchase' THEN 1 ELSE 0 END) AS purchases
FROM customer_analytics.events;



/*
--------------------------------------------------------
9. CONVERSION RATE
--------------------------------------------------------
*/

SELECT
ROUND(
SUM(CASE WHEN event_type='purchase' THEN 1 ELSE 0 END) * 100.0 /
SUM(CASE WHEN event_type='page_view' THEN 1 ELSE 0 END),
2
) AS conversion_rate_percentage
FROM customer_analytics.events;



/*
--------------------------------------------------------
10. TOP PURCHASING USERS
--------------------------------------------------------
*/

SELECT
user_id,
COUNT(*) AS purchase_count
FROM customer_analytics.events
WHERE event_type='purchase'
GROUP BY user_id
ORDER BY purchase_count DESC
LIMIT 10;



/*
--------------------------------------------------------
11. DAILY USER ACTIVITY
--------------------------------------------------------
*/

SELECT
DATE_PARSE(timestamp,'%Y-%m-%d %H:%i:%s') AS activity_date,
COUNT(*) AS events_per_day
FROM customer_analytics.events
GROUP BY activity_date
ORDER BY activity_date;



/*
--------------------------------------------------------
12. MOST COMMON EVENT TYPE
--------------------------------------------------------
*/

SELECT
event_type,
COUNT(*) AS frequency
FROM customer_analytics.events
GROUP BY event_type
ORDER BY frequency DESC
LIMIT 1;



/*
--------------------------------------------------------
13. USER ENGAGEMENT SEGMENTATION (SIMPLE RULE)
--------------------------------------------------------
*/

SELECT
user_id,
COUNT(*) AS event_count,
CASE
WHEN COUNT(*) > 50 THEN 'High Engagement'
WHEN COUNT(*) BETWEEN 20 AND 50 THEN 'Medium Engagement'
ELSE 'Low Engagement'
END AS engagement_segment
FROM customer_analytics.events
GROUP BY user_id;



/*
--------------------------------------------------------
14. EVENTS PER USER (AVERAGE)
--------------------------------------------------------
*/

SELECT
ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT user_id),2) AS avg_events_per_user
FROM customer_analytics.events;



/*
--------------------------------------------------------
15. FUNNEL DROP-OFF ANALYSIS
--------------------------------------------------------
*/

WITH funnel_counts AS (

SELECT
SUM(CASE WHEN event_type='page_view' THEN 1 ELSE 0 END) AS page_views,
SUM(CASE WHEN event_type='product_view' THEN 1 ELSE 0 END) AS product_views,
SUM(CASE WHEN event_type='cart_add' THEN 1 ELSE 0 END) AS cart_adds,
SUM(CASE WHEN event_type='purchase' THEN 1 ELSE 0 END) AS purchases
FROM customer_analytics.events

)

SELECT
page_views,
product_views,
cart_adds,
purchases,
ROUND(product_views * 100.0 / page_views,2) AS product_view_rate,
ROUND(cart_adds * 100.0 / product_views,2) AS cart_add_rate,
ROUND(purchases * 100.0 / cart_adds,2) AS purchase_rate
FROM funnel_counts;