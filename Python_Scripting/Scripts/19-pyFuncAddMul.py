# Function for adding two numbers and multiplying two numbers
def add(num1, num2):
    return num1 + num2

def mul(num1, num2):
    return num1 * num2

def add_mul(add, mul):
    x = add
    y = mul
    return x, y

print(add_mul(add(3, 4), mul(3, 4)))
# Output:
'''
(7, 12)
'''