/*
=====================================
CUSTOMER INTELLIGENCE PLATFORM
KPI ANALYSIS SQL QUERIES
=====================================
*/


/* -------------------------------------------------
1. TOTAL USERS
------------------------------------------------- */

SELECT 
COUNT(DISTINCT user_id) AS total_users
FROM users;



/* -------------------------------------------------
2. TOTAL EVENTS BY TYPE
------------------------------------------------- */

SELECT 
event_type,
COUNT(*) AS total_events
FROM events
GROUP BY event_type
ORDER BY total_events DESC;



/* -------------------------------------------------
3. TOTAL PURCHASES
------------------------------------------------- */

SELECT 
COUNT(*) AS total_purchases
FROM events
WHERE event_type = 'purchase';



/* -------------------------------------------------
4. TOP 10 MOST ACTIVE USERS
------------------------------------------------- */

SELECT 
user_id,
COUNT(*) AS activity_count
FROM events
GROUP BY user_id
ORDER BY activity_count DESC
LIMIT 10;



/* -------------------------------------------------
5. USERS WITH MOST PURCHASES
------------------------------------------------- */

SELECT 
user_id,
COUNT(*) AS purchase_count
FROM events
WHERE event_type = 'purchase'
GROUP BY user_id
ORDER BY purchase_count DESC
LIMIT 10;



/* -------------------------------------------------
6. EVENT DISTRIBUTION (USER FUNNEL)
------------------------------------------------- */

SELECT 
event_type,
COUNT(*) AS event_count,
ROUND(
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),
    2
) AS percentage
FROM events
GROUP BY event_type
ORDER BY event_count DESC;



/* -------------------------------------------------
7. USER ENGAGEMENT LEVEL
------------------------------------------------- */

SELECT 
user_id,
COUNT(*) AS total_events,
CASE 
    WHEN COUNT(*) > 50 THEN 'High Engagement'
    WHEN COUNT(*) BETWEEN 20 AND 50 THEN 'Medium Engagement'
    ELSE 'Low Engagement'
END AS engagement_level
FROM events
GROUP BY user_id
ORDER BY total_events DESC;



/* -------------------------------------------------
8. DAILY USER ACTIVITY
------------------------------------------------- */

SELECT 
DATE(timestamp) AS activity_date,
COUNT(*) AS total_events
FROM events
GROUP BY activity_date
ORDER BY activity_date;



/* -------------------------------------------------
9. DAILY PURCHASE TREND
------------------------------------------------- */

SELECT 
DATE(timestamp) AS purchase_date,
COUNT(*) AS purchases
FROM events
WHERE event_type = 'purchase'
GROUP BY purchase_date
ORDER BY purchase_date;



/* -------------------------------------------------
10. CONVERSION FUNNEL
------------------------------------------------- */

SELECT
SUM(CASE WHEN event_type = 'page_view' THEN 1 ELSE 0 END) AS page_views,
SUM(CASE WHEN event_type = 'product_view' THEN 1 ELSE 0 END) AS product_views,
SUM(CASE WHEN event_type = 'cart_add' THEN 1 ELSE 0 END) AS cart_adds,
SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchases
FROM events;



/* -------------------------------------------------
11. CONVERSION RATE
------------------------------------------------- */

SELECT 
ROUND(
    SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) * 100.0 /
    SUM(CASE WHEN event_type = 'page_view' THEN 1 ELSE 0 END),
    2
) AS conversion_rate_percentage
FROM events;



/* -------------------------------------------------
12. USER PURCHASE FREQUENCY
------------------------------------------------- */

SELECT 
user_id,
COUNT(*) AS purchase_count
FROM events
WHERE event_type = 'purchase'
GROUP BY user_id
ORDER BY purchase_count DESC;



/* -------------------------------------------------
13. AVERAGE EVENTS PER USER
------------------------------------------------- */

SELECT 
ROUND(
    COUNT(*) * 1.0 / COUNT(DISTINCT user_id),
    2
) AS avg_events_per_user
FROM events;



/* -------------------------------------------------
14. MOST COMMON EVENT TYPE
------------------------------------------------- */

SELECT 
event_type,
COUNT(*) AS total_count
FROM events
GROUP BY event_type
ORDER BY total_count DESC
LIMIT 1;



/* -------------------------------------------------
15. USER RETENTION (SIMPLE APPROXIMATION)
------------------------------------------------- */

SELECT 
COUNT(DISTINCT user_id) AS returning_users
FROM events
GROUP BY user_id
HAVING COUNT(*) > 5;