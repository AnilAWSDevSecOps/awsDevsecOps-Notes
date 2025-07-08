# Python Variables
# Variable Names
# Variable names are case-sensitive
# Variable names must start with a letter or an underscore
# Variable names cannot start with a number
# Variable names can only contain alpha-numeric characters and underscores (A-z, 0-9, and _ )
# Variable names cannot contain spaces
# Variable names are case-sensitive (age, Age and AGE are three different variables)
# Variable names should be descriptive (age is better than a)
# Variable names cannot be a reserved keyword

a = 10
b = 20
c = a + b
s = "Hello World"
s1 = 'Hello World'
s2 = '''Hello World'''
s3 = """Hello World"""
x = 10
X = 20
print('Integers:', a, b, c)
print('Strings:', 's:', s, 's1:', s1, 's2:', s2, 's3:', s3)
print ('Type of a:', type(a))
print ('Type of s:', type(s))
print('x:', x, 'X:', X)
print('Type of x:', type(x), 'Type of X:', type(X))
# f strings
name = 'John'
age = 36
print(f'His name is {name}. He is {age} years old.')

# Multiple Variables
# Python allows you to assign values to multiple variables in one line:
x, y, z = 5, 10, 15
print('x:', x, 'y:', y, 'z:', z)
# And you can assign the same value to multiple variables in one line:
x = y = z = 10
print('x:', x, 'y:', y, 'z:', z)
# Unpack a Collection
# If you have a collection of values in a list, tuple etc. Python allows you extract the values into variables. This is called unpacking.
fruits = ['apple', 'banana', 'cherry']
x, y, z = fruits
print('x:', x, 'y:', y, 'z:', z)

