import boto3

s3 = boto3.client('s3')

bucket = "customer-insights-analytics-data"

files = [
"data/raw/events.csv",
"data/raw/users.csv"
]

for file in files:
    s3.upload_file(file, bucket, file.split("/")[-1])

print("Files uploaded to S3")