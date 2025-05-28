#!/bin/bash

# Environment variables
ENVIRONMENT="$1"
region="us-east-1"

check_num_of_args() {
# Checking the number of arguments
    if [ "$#" -ne 0 ]; then
        echo "Usage: $0 <environment>"   
        exit 1
    fi
}

activate_infra_environment() {
# Acting based on the argument value
    if ["$ENVIRONMENT" =="local" ]; then
        echo "Running script for Local Environment..."
    elif [ "$ENVIRONMENT" == "testing" ]; then
        echo "Running script for Testing Environment..."
    elif [ "$ENVIRONMENT" == "production" ]; then  
        echo "Running script for Production Environment..."
    else  
        echo "Invalid environment specified. Please use 'local', 'testing', or 'production'."
        exit 2
    fi
}

# Function to check if AWS CLI is installed
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it before proceeding."
        return 1
    fi
    }

# Function to check if AWS profile is set
check_aws_profile() {
    if [ -z "$AWS_PROFILE" ]; then
        echo "AWS profile environment variable is not set."
        return 1
    fi
}

create_ec2_instance() {
    instance_type="t2.micro"
    ami_id="ami-0953476d60561c955"
    count=1
    key_name="programmatic-kp"
    #region="us-east-1"

    echo "Creating EC2 instance..."
    aws ec2 run-instances --image-id $ami_id --count $count --instance-type $instance_type --key-name $key_name --region $region
    if [ $? -eq 0 ]; then
        echo "EC2 instance created successfully."
    else
        echo "Failed to create EC2 instance."
        exit 1
    fi
}

create_s3_buckets() {
    
    company="datawise" #Define a company name as prefix

    departments=("marketing" "sales" "hr" "operations" "media") #Array of department

    for department in "${departments[@]}"; do
        bucket_name="${company}-${department}-data-bucket-effiong"
    # Create S3 bucket using AWS CLI
        if ! aws s3api head-bucket --bucket "$bucket_name" --region "$region" 2>/dev/null; then
            aws s3api create-bucket --bucket "$bucket_name" --region $region
            if [ $? -eq 0 ]; then
                echo "Bucket '$bucket_name' created successfully in '$region'."
            else
                echo "Failed to create bucket '$bucket_name'."
            fi
        else
            echo "Bucket '$bucket_name' already exists."
        fi

    done
 
}



check_num_of_args
activate_infra_environment local
check_aws_cli
check_aws_profile
create_ec2_instances
create_s3_buckets
