# Palindrome Logic
#!/bin/bash
WORDS=$@

# Function to check if the given string is palindrome or not
function is_palindrome {

    # Looping through the given strings
    for WORD in $WORDS; do

        # Reversing the string
        # reverse_string=$(echo $string | rev)

        # Length of the word
        WORD_LEN=${#WORD}

        # Reversing the word
        REVERSE=''
        LENGTH=$(expr $WORD_LEN - 1)

        # Looping through the word to reverse it
        for ((i = $LENGTH; i >= 0; i--)); do
            REVERSE=${REVERSE}${WORD[@]:$i:1}
        done

        echo reverse of $WORD is: $REVERSE

        # Checking if the word is palindrome or not
        if [[ $WORD = $REVERSE ]]; then
            echo "$WORD is a Palindrome"
        else
            echo "$WORD is not a Palindrome"
        fi
    done
}
function main {
    if [ $# -eq 0 ]; then
        echo "Please provide the strings to check if it is palindrome or not"
        exit 1
    else
        echo "Checking if the given strings are palindrome or not"
        is_palindrome
    fi
}
main $@
