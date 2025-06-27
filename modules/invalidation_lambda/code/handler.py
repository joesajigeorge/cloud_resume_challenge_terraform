import boto3
import os
import time

def lambda_handler(event, context):
    client = boto3.client('cloudfront')
    batch = {
        'Paths': {
            'Quantity': 1,
            'Items': ['/*']
        },
        'CallerReference': str(time.time())
    }
    try:
        invalidation = client.create_invalidation(
            DistributionId=os.environ['CLOUDFRONT_DISTRIBUTION_ID'],
            InvalidationBatch=batch
        )
        print(f"Invalidation started: {invalidation['Invalidation']['Id']}")
        return {"status": "success", "invalidation_id": invalidation['Invalidation']['Id']}
    except Exception as e:
        print(f"Error: {str(e)}")
        return {"status": "error", "error": str(e)}
