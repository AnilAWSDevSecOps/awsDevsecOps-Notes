# Function for adding two numbers and multiplying two numbers

def add(num1, num2):
    return num1 + num2

def mul(num1, num2):
    return num1 * num2

def add_mul(add, mul, num3, num4):
    x = add(num3, num4)
    y = mul(num3, num4)
    return x, y

print(add_mul(add, mul, 3, 4))
# Output:
'''
(7, 12)
'''