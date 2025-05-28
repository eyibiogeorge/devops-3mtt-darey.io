# Creating AWS resources with functions and introducing Arrays

We'll begin this project by creating two functions:

1. One for provisioning EC2 instances and 

2. Another for setting up S3 buckets

These functions will streamline the process of resource creation and enable us to automate tasks effectively

### Function to provision EC2 instances

To programmatically create EC2 instances, you must use the [official documentation](https://docs.aws.amazon.com/cli/latest/reference/ec2/) to understand how to use [`aws cli` create instances](https://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html) from the available commands, you will be able to interact with AWS programmatically.

![](img/1.%20aws%20available%20commands.PNG)

If you search for for **run-instance** on the page with `Control F` on your keyboard, click on it and it will take you to the detailed documentation on the sub-command to create EC2 instances.

![](img/2.%20press%20control%20f.PNG)

Here is an example of how you would create EC2 instances using the command line.

```bash
    aws ec2 run-instances \
        --image-id "ami-0cd59ecaf368e5ccf" \
        --instance-type "t2.micro" \
        --count 5 \
        --key-name MyKeyPair \
        --region eu-west-2
```

**Note:** Make sure you have a key pair created in your aws console. Then you can replace the `Mykeypair` with your key pair name.

On the same page, if you search for one of the arguments, you will be able to read more about how to pass different arguments to the cli

![](img/3.%20code%20to%20launch%20to%20default%20subnet.PNG)

for the command to work: a keypair must already exit. You must create a keypair from the console. 

**To create a new keypair.**

1. Navigate to the AWS EC2 console

![](img/4.%20key%20pairs.PNG)

![](img/5.%20key%20pairs%20details.PNG)

![](img/5.%20key%20pairs%20details.PNG)

![](img/6.%20key%20pairs%20created.PNG)

```bash
#!/bin/bash

create_ec2_instance() {
    instance_type="t2.micro"
    ami_id="ami-0953476d60561c955"
    count=1
    key_name="programmatic-kp"
    region="us-east-1"

    echo "Creating EC2 instance..."
    aws ec2 run-instances --image-id $ami_id --count $count --instance-type $instance_type --key-name $key_name --region $region
    if [ $? -eq 0 ]; then
        echo "EC2 instance created successfully."
    else
        echo "Failed to create EC2 instance."
        exit 1
    fi
}

create_ec2_instance
```

- **$?:** This is a special variable that holds the exit status of the last executed command. In this case, it checks if the aws ec2 run-instances command was successful. exit status that equals 0 is interpreted as successful. Therefore if exit code is "0", the echo the message to confirm that the previous command was successful.

- We have once again used environment variables to hold the value of ami_id, count and region and replaced with their respective values with ami, count and region.

### Define function to create S3 buckets and learn about Arrays

Before diving into creating S3 buckets, its beneficial to brush up on AWS S3 bucket concepts.

The AWS CLI reference for S3 can be found [here](https://docs.aws.amazon.com/cli/latest/reference/s3api/). We will be using it in the script.

In this section, our objective is to create five distinct S3 buckets, each designated for storing data related to Marketing, Sales, HR, Operations and Media.

To achieve this, we'll utilize a fundamental data structure in shell scripting known as an `array.` This is because, we need one single variable holding all the data, and then have the capability to loop through them.

### Arrays in Shell Scripting

An array is a versatile data structure that allows you to store multiple values under a single variable name. Particularly in shell scripting, arrays offer an efficient means of managing collections of related data, making them invaluable for our task ahead.

Below is what the function would look like.

```bash
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
```

### The complete script till this stage will now look like this

```bash
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
```

Bash scripting allows you to automate the creation and configuration of AWS resources using the AWS CLI
