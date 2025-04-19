# Error Handling

```bash
Error handling is a crucial aspect of scripting that involves anticipating and managing errors that may occur during script execution. These errors could arise from various factors su as incorrect user input, unexpected system behavior, or resource unavailability. Proper error handling is essential for improving the reliability, robustness, and usability of she scripts
```

### Implementing Error Handling

Develop strategies to handle error effectively. Some key steps to think through and implement error handling:

- ***Identify Potential Errors:*** Begin by identifying potential sources of errors in your script, such as user input validation, command execution, or file operations. Anticipate scenarios where errors may occur and how the could impact script execution.

- ***Use Conditional Statements:*** Utilise conditional statements such as `if, elif, else` to check for error conditions and respond accordingly. Evaluate the exit status `$?` of commands to determin whether they executed successfully or encountered error.

- ***Provide informative Messages:*** When errors occur, provide descriptive error messages that clearly indicate what went wrong and how users can resolve the issue.

### Error Handling code

```bash
#!/bin/bash
# Function to create S3 buckets for different departments
create_s3_buckets() {
    company="datawise"
    departments=("Marketing" "Sales" "HR" "Operations" "Media")
    
    for department in "${departments[@]}"; do
        bucket_name="${company,,}-${department,,}-data-bucket.xy"
        
        # Check if the bucket already exists
        if aws s3api head-bucket --bucket "$bucket_name" 2>/dev/null; then
            echo "S3 bucket '$bucket_name' already exists."
        else
            # Create S3 bucket using AWS CLI
            aws s3api create-bucket --bucket "$bucket_name" --region us-east-1
            #    --create-bucket-configuration LocationConstraint=us-east-1

            if [ $? -eq 0 ]; then
                echo "S3 bucket '$bucket_name' created successfully."
            else
                echo "Failed to create S3 bucket '$bucket_name'."
            fi
        fi
    done
}

create_s3_buckets #call create bucket function
aws s3 ls #list all buckets
```

- captured on vscode

![](img/1.%20create%20s3%20bucket%20code.PNG)

- successfully create bucket on aws

![](img/2.%20run%20create%20bucket.PNG)

- successfully capture already exist error

![](img/3.%20file%20already%20exists.PNG)