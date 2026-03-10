import sqlite3
import pandas as pd

conn = sqlite3.connect("analytics.db")

events = pd.read_csv("data/raw/events.csv")
users = pd.read_csv("data/raw/users.csv")

events.to_sql("events", conn, if_exists="replace", index=False)
users.to_sql("users", conn, if_exists="replace", index=False)

query = """
SELECT event_type, COUNT(*) AS total_events
FROM events
GROUP BY event_type
"""

result = pd.read_sql(query, conn)

print(result)