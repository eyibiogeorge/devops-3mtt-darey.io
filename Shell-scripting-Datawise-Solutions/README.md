# Mini Project - 5 Essential Skills to Elevate your Shell Scripting Journey into Cloud Computing

As we emback on the next phase of your journey into tech, getting your feet strong in shell scripting is one of the most important, and foundational skills you must not miss. The skills and concepts you've mastered so far have laid the groundwork for what comes next. However, the journey ahead is not just a continuation-it's a leap towards achieveing great success in the realms of Cloud, DevOps, Systm Engineering, and related fields. The areas we are about to explore are not merely topics; they are the keys to unlocking profound capabilities in automation, problem-solving, and innovation in the digital world.

### Objective

Our objectinve for the next series of projects is to advance your shell scripting skills while also integrating and utilizing cloud services. By focusing on the following 5 critical concepts, we aim to elevate your capabilities to a level where you can confidently navigate. By focusing on the following 5 critical concepts, we aim to elevate your capabilities to a level where you can confidently navigate and harness the power of both shell scripting and cloud computing. This combination is not just about learning commands and servies; it's about understanding how to leverage these tools in unison to build, deploy, and manage scalable, efficient and robust systems in the cloud.

1. Functions

2. Arrays

3. Environment Variables

4. Command Line Arguments

5. Error Handling

### Background:

**DataWise Solutions** is a forward-thinking Data Science Consulting Company that specializes in deploying analytical and machine learning environments to support data-driven decision-making for its clients. Recongnizing the need for agility and efficiency in setting up such environments, DataWise has decided to streamline its deployment process on AWS, focusing on simplicity and automation.

```batch
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
```

### Project Screenshot

- EC2 dashboard with no instance

![](img/1.%20ec2%20dashboard.PNG)

- S3 dashboard with no bucket

![](img/2.%20S3%20bucket%20dashboard.PNG)

- call create_s3_bucket and create_and_verify_ec2 functions

![](img/7.%20function%20calls.PNG)

- run datawise_solution script: This capture the creation of an ec2 instance and creation of S3 bucket.

![](img/3.%20create%20S3%20and%20ec2.PNG)

- Error handling of creating an existing S3 bucket

![](img/4.%20bucket%20already%20exist.PNG)

- display created EC2 instanc on AWS console

![](img/5.%20created%20ec2.PNG)

- display created S3 bucket on AWS console

![](img/6.%20created%20S3%20bucket.PNG)
