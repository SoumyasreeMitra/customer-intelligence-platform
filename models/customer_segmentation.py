import pandas as pd
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler

df = pd.read_csv("data/processed/customer_features.csv")

features = df[["total_purchases","total_events"]]

scaler = StandardScaler()
scaled = scaler.fit_transform(features)

kmeans = KMeans(n_clusters=4, random_state=42)
df["segment"] = kmeans.fit_predict(scaled)

df.to_csv("data/processed/customer_segments.csv", index=False)

print("Customer segmentation completed")