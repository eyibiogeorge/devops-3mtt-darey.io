# Generating Multiplication Table using Bash Script

### Bash script code

```bash
#!/bin/bash

read -p "Enter a numer for the multiplication table: " num #enter number for multiplication table

# Check if number is empty
if [ -z "$num" ]; then
    echo "No number provided. Exiting."
    exit 1
fi

# check if the number is valid
if ! [[ "$num" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid number."
    exit 1
fi

# check if the number is between 1 and 10
if [ "$num" -lt 1 ] || [ "$num" -gt 10 ]; then
    echo "Number out of range. Please enter a number between 1 and 10."
    exit 1
fi
read -p "Do you want a full table or a partial table? (Enter 'f' for full, 'p' for partial): " choice
if [ "$choice" == "f" ]; then # full table choice is selected
    echo "Full multiplication table for $num:"
    for i in {1..10}; do
        echo "$num x $i = $((num * i))"
    done
elif [ "$choice" == "p" ]; then # partial table choice is selected
    read -p "Enter a starting number (between 1 and 10): " startNum
    read -p "Enter a ending number (between 1 and 10): " endNum
    if [ $startNum -lt $endNum ]; then
        for ((i=$startNum; i<=endNum; i++)); do
            echo "$num x $i = $((num * i))"
        done
    elif [ $startNum -gt $endNum ]; then
        echo "INVALID RANGE: start number is greater end number."
        echo "Showing full table instead."
        echo "Full multiplication table for $num:"
        for i in {1..10}; do
            echo "$num x $i = $((num * i))"
        done
    fi
else
    echo "Invalid choice. Please enter 'f' or 'p'."
fi
```
- full multiplication table selected.

![](img/1.%20full%20multiple.PNG)

- invalid multiplication table selected

![](img/4.%20invalid%20input.PNG)

- partial multiplication table selected

![](img/2.%20partial%20multiple.PNG)

- partial multiplication table selected with invalid range

![](img/3.%20invalid%20range.PNG)

