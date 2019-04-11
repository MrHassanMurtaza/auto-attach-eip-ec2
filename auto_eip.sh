#!/bin/bash
# auto assign ip

# Note: If you're using role don't specify access keys
aws configure set aws_access_key_id <your_access_key>
aws configure set aws_secret_access_key <your_secret_key>

# You need specify if it's anything other then the dafault region
aws configure set region <region_of_instance>

# associate Elastic IP
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
ALLOCATION_ID=<EIP_ALLOC_ID>
aws ec2 associate-address --instance-id $INSTANCE_ID --allocation-id $ALLOCATION_ID --allow-reassociation

