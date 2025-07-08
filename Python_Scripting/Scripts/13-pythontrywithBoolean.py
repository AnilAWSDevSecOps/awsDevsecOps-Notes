# Python try with boolean
# Python program to demonstrate
# use of try with boolean

# Function which returns a/b
def AbyB(a, b):
    try:
        c = ((a+b) / (a-b))
    except ZeroDivisionError:
        print("a/b result in 0")
    else:
        print(c)

# Driver program to test above function
AbyB(2.0, 3.0)
AbyB(3.0, 3.0)
# Output:
# -5.0
# a/b result in 0
# Explanation:
# In the above code, we have defined a function AbyB(a, b) which returns the value of (a+b) / (a-b). In the try block, we are calculating the value of c. If the value of a-b is 0, then ZeroDivisionError will occur. In the except block, we are handling the ZeroDivisionError and printing the message "a/b result in 0". If the value of a-b is not 0, then the else block will be executed and the value of c will be printed.

# In the driver program, we are calling the function AbyB(a, b) with different values of a and b. The output of the above code will be:
# -5.0
# a/b result in 0
# In the first function call, the value of c will be -5.0. In the second function call, the value of a-b will be 0, so ZeroDivisionError will occur and the message "a/b result in 0" will be printed.

# Note: The else block will be executed only if there is no exception in the try block. If any exception occurs in the try block, then the else block will be skipped. The finally block will always be executed whether an exception occurs or not.

# Summary:
# In this tutorial, we have learned about the try with boolean in Python. We have also seen how to use the try block with the else block to handle exceptions and errors in Python programs. We have also seen how to use the finally block in Python to execute the code that must be executed whether an exception occurs or not.
