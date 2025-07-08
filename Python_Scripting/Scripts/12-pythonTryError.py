# Python program using try and except block to handle exceptions and errors

try:
    a = 10/0
    print(a)
except ZeroDivisionError:
    print("Division by zero is not allowed")
except NameError:
    print("Name is not defined")
except:
    print("Some error occured")
else:
    print("No error occured")
finally:
    print("Finally block is always executed")

# Output:
# Division by zero is not allowed
# Finally block is always executed
# Explanation:
# In the above code, we are trying to divide 10 by 0 which will result in ZeroDivisionError. We are handling the ZeroDivisionError using the except block and printing the message "Division by zero is not allowed". Since the exception occurred, the else block will be skipped and the finally block will be executed. The finally block will always be executed whether an exception occurs or not. The output of the above code will be:
# Division by zero is not allowed
# Finally block is always executed
# Summary:
# In this tutorial, we have learned about the try block in Python. We have also seen how to use the try block with the except block to handle exceptions and errors in Python programs. We have also seen how to use the finally block in Python to execute the code that must be executed whether an exception occurs or not.
