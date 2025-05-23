#!/bin/bash

create_and_verify_ec2() {
  AMI_ID=$1
  INSTANCE_TYPE=$2
  KEY_NAME=$3
  SECURITY_GROUP_ID=$4

  if [ -z "$AMI_ID" ] || [ -z "$INSTANCE_TYPE" ] || [ -z "$KEY_NAME" ] || [ -z "$SECURITY_GROUP_ID" ]; then
    echo "Usage: create_and_verify_ec2 <AMI_ID> <INSTANCE_TYPE> <KEY_NAME> <SECURITY_GROUP_ID>"
    return 1
  fi

  echo "Creating EC2 instance..."
  INSTANCE_ID=$(aws ec2 run-instances \
    --image-id "$AMI_ID" \
    --count 1 \
    --instance-type "$INSTANCE_TYPE" \
    --key-name "$KEY_NAME" \
    --security-group-ids "$SECURITY_GROUP_ID" \
    --query 'Instances[0].InstanceId' \
    --output text)

  if [ -z "$INSTANCE_ID" ]; then
    echo "Failed to create EC2 instance."
    return 1
  fi

  echo "Instance created with ID: $INSTANCE_ID"
  echo "Waiting for instance to enter 'running' state..."

  aws ec2 wait instance-running --instance-ids "$INSTANCE_ID"
  if [ $? -ne 0 ]; then
    echo "Instance failed to reach running state."
    return 1
  fi

  echo "Instance is now running. Fetching public IP..."
  PUBLIC_IP=$(aws ec2 describe-instances \
    --instance-ids "$INSTANCE_ID" \
    --query 'Reservations[0].Instances[0].PublicIpAddress' \
    --output text)

  echo "Instance $INSTANCE_ID is running at IP: $PUBLIC_IP"
}

# create S3 bucket and verify its status

create_s3_bucket() {
  local bucket_name=$1
  local region=$2

  if ! aws s3api head-bucket --bucket "$bucket_name" --region "$region" 2>/dev/null; then
    aws s3api create-bucket --bucket "$bucket_name" --region "$region"
    if [ $? -eq 0 ]; then
      echo "Bucket '$bucket_name' created successfully in '$region'."
    else
      echo "Failed to create bucket '$bucket_name'."
    fi
  else
    echo "Bucket '$bucket_name' already exists."
  fi
}

# call create_and_check_s3 function
# create_and_check_s3 <BUCKET_NAME> <REGION>
create_s3_bucket datawisesolution-effiong-11 us-east-1

# call create_and_verify_ec2 function
# create_and_verify_ec2 <AMI_ID> <INSTANCE_TYPE> <KEY_NAME> <SECURITY_GROUP_ID>
create_and_verify_ec2 ami-0953476d60561c955 t2.micro datawise_kp sg-0d78c578c4e61cd48 - publicSG


