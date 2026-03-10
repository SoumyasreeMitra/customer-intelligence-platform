import pandas as pd

users = pd.read_csv("data/raw/users.csv")
events = pd.read_csv("data/raw/events.csv")

purchase_counts = events[events["event_type"]=="purchase"] \
                    .groupby("user_id") \
                    .size() \
                    .reset_index(name="total_purchases")

session_counts = events.groupby("user_id") \
                        .size() \
                        .reset_index(name="total_events")

features = users.merge(purchase_counts, on="user_id", how="left")
features = features.merge(session_counts, on="user_id", how="left")

features.fillna(0, inplace=True)

features.to_csv("data/processed/customer_features.csv", index=False)

print("ETL pipeline completed")