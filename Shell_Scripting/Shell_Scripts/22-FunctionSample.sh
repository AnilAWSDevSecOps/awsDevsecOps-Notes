# Simple Function Sample
#!/bin/bash
# Declaring a function
function hello {
    echo "I am from hello function"
}
# Declaring a function
hello1() {
    echo "I am from hello1 function"
}

# Calling a function
hello
hello1
# Output
# I am from hello function
# I am from hello1 function
# Note: The function name should be unique in the script.
# Note: The function will not execute until it is called.
