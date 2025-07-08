# Python Class for add, sub, mul, div

class Calculator:
    def add(self, num1, num2):
        return num1 + num2

    def sub(self, num1, num2):
        return num1 - num2

    def mul(self, num1, num2):
        return num1 * num2

    def div(self, num1, num2):
        return num1 / num2

calc = Calculator()
print(calc.add(3, 4))
print(calc.sub(3, 4))
print(calc.mul(3, 4))

# Output:
'''
7
-1
12
'''