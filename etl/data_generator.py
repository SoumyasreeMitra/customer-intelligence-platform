import os

os.makedirs("data/raw", exist_ok=True)
os.makedirs("data/processed", exist_ok=True)
import pandas as pd
import numpy as np
from faker import Faker
import random

fake = Faker()

num_users = 10000
num_events = 200000

users = []

for i in range(num_users):
    users.append({
        "user_id": i,
        "age": random.randint(18,60),
        "location": fake.city(),
        "signup_date": fake.date_between(start_date='-2y', end_date='today')
    })

users_df = pd.DataFrame(users)
users_df.to_csv("data/raw/users.csv", index=False)

events = []

event_types = ["page_view","product_view","cart_add","purchase"]

for i in range(num_events):
    events.append({
        "user_id": random.randint(0,num_users-1),
        "event_type": random.choice(event_types),
        "timestamp": fake.date_time_this_year()
    })

events_df = pd.DataFrame(events)
events_df.to_csv("data/raw/events.csv", index=False)

print("Data generated successfully")