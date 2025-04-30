# Capstone Project: Shell Script for AWS IAM Management

### Project Scenario

CloudOps Solutions is a growing company that recently adopted AWS to manage its cloud infrastructure. As the company scales, they have decided to automate the process of managing AWS Identity and Access Management (IAM) resources. This includes the creation of users, user groups, and the assignment of permissions for new hires, especially for their DevOps team.

### Purpose

In this capstone project, you will extend your shell scripting capabilities by creating more functions that extends the "aws_cloud_manager.sh" script.

### Objectives:

1. `Script Enhancement:` Extend the provided script to include IAM management.

2. `Define IAM User Names Array:` Store the names of the five IAM users in an array for easy iteration during user creation.

3. `Create IAM Users:` Iterate through the IAM user names array and create IAM users for each employee using AWS CLI commands.

4. `Create IAM Group:` Define a function to create an IAM group named "admin" using the AWS CLI.

5. `Attach Administrative Policy to Group:` Attach an AWS-managed administrative policy (e.g., "AdministratorAccess") to the "admin" group to grant administrative privileges.

6. `Assign Users to Group:` Iterate through the array of IAM user names and assign each user to the "admin" group using AWS CLI commands.

```bash
#!/bin/bash

# AWS IAM Management Script
# Extends aws_cloud_manager.sh to handle IAM user and group management

# Define IAM user names array
iam_users=("dev1" "dev2" "dev3" "dev4" "dev5")

# Function to create IAM users

create_iam_users() {
    echo "Creating IAM users..."
    for user in "${iam_users[@]}"; do
        aws iam create-user --user-name "$user"
        if [ $? -eq 0 ]; then
            echo "Successfully created IAM user: $user"
        else
            echo "Failed to create IAM user: $user"
        fi
    done
}

# Function to create admin group
create_admin_group() {
    echo "Creating admin group..."
    aws iam create-group --group-name "cloudops-admin"
    if [ $? -eq 0 ]; then
        echo "Successfully created cloudops admin group"
    else
        echo "Failed to create cloudops admin group"
    fi
}

# Function to attach admin policy to group
attach_admin_policy() {
    echo "Attaching AdministratorAccess policy to admin group..."
    aws iam attach-group-policy \
        --group-name "cloudops-admin" \
        --policy-arn "arn:aws:iam::aws:policy/AdministratorAccess"
    if [ $? -eq 0 ]; then
        echo "Successfully attached AdministratorAccess policy"
    else
        echo "Failed to attach AdministratorAccess policy"
    fi
}

# Function to add users to admin group
add_users_to_group() {
    echo "Adding users to admin group..."
    for user in "${iam_users[@]}"; do
        aws iam add-user-to-group \
            --group-name "cloudops-admin" \
            --user-name "$user"
        if [ $? -eq 0 ]; then
            echo "Successfully added $user to cloudops admin group"
        else
            echo "Failed to add $user to cloudops admin group"
        fi
    done
}

# Main execution
main() {
    # Check if AWS CLI is installed
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it first."
        exit 1
    fi

    # Execute IAM management functions
    create_iam_users
    create_admin_group
    attach_admin_policy
    add_users_to_group

    echo "IAM management completed."
}

# Execute main function
main
```

## Project Deliverables/Script output

- User created

![](img/1.%20users%20created.PNG)

- Cloudops group created

![](img/2.%20cloudops%20group%20created.PNG)

- Administrator access policy attached to group and users are added to group
![](img/3.%20attached%20policy%20to%20group.PNG)

- cloudops group created on aws console

![](img/4.%20cloudops-admin%20created%20in%20aws.PNG)

- cloudops users created

![](img/5.%20cloudops-users%20created.PNG)

- confirmed administrator access permission attached to cloudops group

![](img/6.%20adminstratoraccess%20attached.PNG)

### AWS IAM Management Script Overview

This script provides automated management of AWS IAM resources with the following features:

### Script Functionality

1. Defines an array of IAM users to be created
2. Provides functions to:
    - Create IAM users
    - Create an admin group
3. Attach the AdministratorAccess policy to the group
4. Add all users to the admin group
5. Includes error checking for each AWS CLI operation
6. Implements a main function that orchestrates the execution flow
