import pandas as pd

data = {
"campaign":["A","B","C"],
"impressions":[10000,12000,9000],
"clicks":[1200,1500,800],
"conversions":[120,170,60]
}

df = pd.DataFrame(data)

df["CTR"] = df["clicks"] / df["impressions"]
df["conversion_rate"] = df["conversions"] / df["clicks"]

print(df)