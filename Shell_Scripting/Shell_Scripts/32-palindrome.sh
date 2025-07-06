# Shell script to identify the given name and number is palindrome or not.
#!/bin/bash

string_list=$@

# Function to check if the given string is palindrome or not
function is_palindrome {

    # Looping through the given strings
    for string in $string_list; do

        # Reversing the string
        reverse_string=$(echo $string | rev)

        # Checking if the string is palindrome or not
        if [ $string == $reverse_string ]; then
            echo "$string is a palindrome"
        else
            echo "$string is not a palindrome"
        fi
    done
}

# Main function to check if the given string is palindrome or not
function main {

    # Checking if the string is provided or not
    if [ $# -eq 0 ]; then
        echo "Please provide the string to check if it is palindrome or not"
        exit 1
    else
        echo "Checking if the given string is palindrome or not"
        is_palindrome
    fi
}

# Calling the main function
main $@
