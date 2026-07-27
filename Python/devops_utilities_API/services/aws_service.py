import boto3
from datetime import datetime, timezone, timedelta

def get_bucket_info():
    s3_client = boto3.client("s3")
    buckets = s3_client.list_buckets()["Buckets"]
    current_datetime = datetime.now(timezone.utc).astimezone()
    print(current_datetime)

    old_buckets = []
    new_buckets = []

    for bucket in buckets:
        bucket_name = bucket["Name"]
        creation_date = bucket["CreationDate"]
        days_ago_90 = current_datetime - timedelta(days=90)
        if creation_date < days_ago_90:
            old_buckets.append(bucket_name)
        else:
            new_buckets.append(bucket_name)
                
    return {
        "total_buckets":len(new_buckets),
        "new_buckets": len(new_buckets),
        "old_buckets":len(old_buckets),
        "new_buckets_names":new_buckets,
        "old_buckets_names":old_buckets,
    }

# buck= get_bucket_info()
# print(buck)