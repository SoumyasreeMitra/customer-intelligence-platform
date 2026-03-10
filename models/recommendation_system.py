import pandas as pd

events = pd.read_csv("data/raw/events.csv")

purchases = events[events["event_type"]=="purchase"]

recommendations = purchases.groupby("user_id") \
                    .size() \
                    .reset_index(name="purchase_count")

recommendations = recommendations.sort_values(
                    by="purchase_count",
                    ascending=False)

recommendations.to_csv("data/processed/recommendations.csv", index=False)

print("Recommendation insights generated")