Dataset Overview

Total Users: ~10,000 simulated users

Total Interaction Events: ~200,000+ digital interactions

Tracked Events: page_view, product_view, cart_add, purchase

Analysis Tools: Python, SQL (AWS Athena), Power BI

Key Insights
1️⃣ User Engagement Distribution

Page views account for ~50% of all platform interactions, indicating high browsing activity.

Product views represent ~20% of events, suggesting moderate interest in product exploration.

Cart additions make up ~20% of interactions, indicating strong purchase intent among engaged users.

Purchases represent ~10% of total interactions, reflecting the final stage of the conversion funnel.

📊 Insight: While browsing activity is high, only a portion of users progress to purchasing, highlighting an opportunity to improve conversion strategies.

2️⃣ Conversion Funnel Analysis

Customer journey analysis shows the following drop-off:

Page View → Product View → Cart Add → Purchase

~100K page views

~40K product views (60% drop-off from browsing)

~40K cart additions

~20K purchases

📊 Insight: The largest drop-off occurs between page view and product view, suggesting users browse the platform but do not explore products deeply.

3️⃣ Customer Segmentation Insights

Using K-Means clustering, users were grouped into four behavioral segments:

Segment	Behavior
Segment 0	Low engagement users
Segment 1	Casual visitors
Segment 2	Frequent users
Segment 3	High-value customers

📊 Insight:
The top 20% of users generate a disproportionate share of purchase events, indicating the presence of high-value customer segments suitable for targeted marketing campaigns.

4️⃣ Daily Engagement Trends

Daily activity analysis shows:

Peak activity periods during mid-week, suggesting higher engagement on weekdays.

Interaction volumes range between 2K–4K events per day, indicating stable platform engagement.

📊 Insight: Marketing campaigns and promotions should be scheduled during peak activity windows to maximize visibility and conversion.

5️⃣ Marketing Experiment (A/B Testing)

Simulated campaign experiment results:

Campaign	Conversion Rate
Campaign A	~12%
Campaign B	~16%

📊 Insight:
Campaign B shows a ~33% higher conversion rate than Campaign A and is statistically significant based on hypothesis testing.

This suggests that campaign messaging or targeting strategies used in Campaign B are more effective.

6️⃣ Business KPI Summary

Key platform performance indicators:

Total Users: ~10K

Total Events: ~200K+

Total Purchases: ~50K

Average Events per User: ~20 interactions

📊 Insight:
High average interaction counts indicate strong engagement with digital channels, but improving the conversion funnel could further increase revenue generation.

Strategic Recommendations

Based on the analysis:

Improve product discovery to reduce drop-off after browsing

Target high-value customer segments with personalized recommendations

Deploy marketing campaigns similar to Campaign B

Optimize conversion funnel stages through UI improvements and nudges

Tools Used

Python: Data generation, ETL pipeline

Scikit-learn: Customer segmentation (K-Means clustering)

SQL (AWS Athena): KPI analytics queries

Power BI: Business intelligence dashboard