# if statement
if [ 1 -eq 1 ]; then
    echo "1 is equal to 1"
fi
# if-else statement
if [ 1 -eq 2 ]; then
    echo "1 is equal to 2"
else
    echo "1 is not equal to 2"
fi
# if-elif-else statement
if [ 1 -eq 2 ]; then
    echo "1 is equal to 2"
elif [ 1 -eq 1 ]; then
    echo "1 is equal to 1"
else
    echo "1 is not equal to 1 or 2"
fi
# Nested if statement
if [ 1 -eq 1 ]; then
    if [ 2 -eq 2 ]; then
        echo "1 is equal to 1 and 2 is equal to 2"
    fi
fi
# if statement with logical AND operator
if [ 1 -eq 1 ] && [ 2 -eq 2 ]; then
    echo "1 is equal to 1 and 2 is equal to 2"
fi
# if statement with logical OR operator
if [ 1 -eq 1 ] || [ 2 -eq 1 ]; then
    echo "1 is equal to 1 or 2 is equal to 1"
fi
# if statement with logical NOT operator
if [ ! 1 -eq 2 ]; then
    echo "1 is not equal to 2"
fi
# if statement with arithmetic comparison
if [ 1 -lt 2 ]; then
    echo "1 is less than 2"
fi
# if statement with string comparison
if [ "hello" = "hello" ]; then
    echo "hello is equal to hello"
fi
# if statement with file test operators
if [ -f /etc/passwd ]; then
    echo "/etc/passwd is a regular file"
fi
if [ -d /etc ]; then
    echo "/etc is a directory"
fi
if [ -r /etc/passwd ]; then
    echo "/etc/passwd is readable"
fi
if [ -w /etc/passwd ]; then
    echo "/etc/passwd is writable"
fi
if [ -x /etc/passwd ]; then
    echo "/etc/passwd is executable"
fi
# if statement with multiple conditions
if [ 1 -eq 1 ] && [ 2 -eq 2 ]; then
    echo "1 is equal to 1 and 2 is equal to 2"
fi
# if statement with multiple commands
if [ 1 -eq 1 ]; then
    echo "1 is equal to 1"
    echo "This is another command"
fi
# if statement with command substitution
if [ $(echo "1") -eq 1 ]; then
    echo "1 is equal to 1"
fi
# if statement with arithmetic expression
if [ $((1 + 1)) -eq 2 ]; then
    echo "1 + 1 is equal to 2"
fi
# if statement with string comparison
if [ "hello" = "hello" ]; then
    echo "hello is equal to hello"
fi
# if statement with case-insensitive string comparison
if [ "${var,,}" = "hello" ]; then
    echo "hello is equal to hello"
fi
# if statement with pattern matching
if [[ "hello" == h* ]]; then
    echo "hello starts with h"
fi
# if statement with regular expression matching
if [[ "hello" =~ ^h ]]; then
    echo "hello starts with h"
fi
# if statement with command substitution
if [ $(echo "1") -eq 1 ]; then
    echo "1 is equal to 1"
fi
