# Shell Scripting Functions

### Creating a function Syntax"

```bash
function_name() {"\n    # Function body\n    # You can place any commands or logic here\n"}
```

### Function: Check if script has an argument

```bash
#!/bin/bash

# Checking the number of arguments
if [ "$#" -ne 0 ]; then
    echo "Usage: $0 <environment>"
    exit 1
fi

# Accessing the first argument
ENVIRONMENT=$1

# Acting based on the argument value
if [ "$ENVIRONMENT" == "local" ]; then
  echo "Running script for Local Environment..."
elif [ "$ENVIRONMENT" == "testing" ]; then
  echo "Running script for Testing Environment..."
elif [ "$ENVIRONMENT" == "production" ]; then
  echo "Running script for Production Environment..."
else
  echo "Invalid environment specified. Please use 'local', 'testing', or 'production'."
  exit 2
fi
```

```bash
#!/bin/bash

# Environment variables
ENVIRONMENT=$1

check_num_of_args() {
if [ "$#" -ne 0 ]; then    
echo "Usage: $0 <environment>"  
exit 1
fi
}

activate_infra_environment() {
if [ "$ENVIRONMENT" == "local" ]; then
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

check_num_of_args
activate_infra_environment
```

- Check if environment variable exists to authenticate to AWS

`~/.aws/credentials` and `~/.aws/config`

- Check if AWS CLI is installed

```bash
Example: check_aws_cli() uses command -v aws to check if AWS CLI is installed.

Redirects output to /dev/null to suppress errors.

Syntax:
```
```bash
#!/bin/bash

# Function to check if AWS CLI is installed
check_aws_cli() {    
    if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it before proceeding."       
    return 1
    fi
    }
check_aws_cli
```
Validating AWS authentication

```bash
Example: check_aws_profile() checks if $AWS_PROFILE is set.

Uses -z to test for empty variables.

Syntax:
```

```bash

    check_aws_profile() {
      if [ -z "$AWS_PROFILE" ]; then
        echo "AWS_PROFILE environment variable not set."
        return 1
      fi
    }
```
```bash
#!/bin/bash

# Environment Variables
ENVIRONMENT=$1

check_num_of_args() {
    if [ "$#" -ne 0 ]; then    
        echo "Usage: $0 <environment>"  
        exit 1
    fi
}

activate_infra_environment() {
    if [ "$ENVIRONMENT" == "local" ]; then
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
 check_aws_profile() {
      if [ -z "$AWS_PROFILE" ]; then
        echo "AWS_PROFILE environment variable not set."
        return 1
      fi
}
check_num_of_args
activate_infra_environment
check_aws_cli
check_aws_profile
```
Summary

The guide demonstrates modular shell scripting for AWS automation, emphasizing function usage for argument checks, dependency validation, and environment-specific actions. It highlights AWS configuration files (credentials and config) and advocates a structured approach—defining variables, functions, and function calls—to ensure maintainability.