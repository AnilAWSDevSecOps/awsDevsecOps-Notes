# Python Data Types
# Python has the following data types built-in by default, in these categories:
# Text Type:	str
# Numeric Types:	int, float, complex
# Sequence Types:	list, tuple, range
# Mapping Type:	dict
# Set Types:	set, frozenset
# Boolean Type:	bool
# Binary Types:	bytes, bytearray, memoryview

# Getting the Data Type
# You can get the data type of any object by using the type() function:
x1 = 5
x2 = 5.0
x3 = 5 + 2j
x4 = ['apple', 'banana', 'cherry']
x5 = ('apple', 'banana', 'cherry')
x6 = range(6)
x7 = {'name' : 'John', 'age' : 36}
x8 = {'apple', 'banana', 'cherry'}
x9 = frozenset({'apple', 'banana', 'cherry'})
x10 = True
x11 = b'Hello'
x12 = bytearray(5)
x13 = memoryview(bytes(5))
print('x1:', x1, 'Type of x1:',type(x1))
print('x2:', x2, 'Type of x2:',type(x2))
print('x3:', x3, 'Type of x3:',type(x3))
print('x4:', x4, 'Type of x4:',type(x4))
print('x5:', x5, 'Type of x5:',type(x5))
print('x6:', x6, 'Type of x6:',type(x6))
print('x7:', x7, 'Type of x7:',type(x7))
print('x8:', x8, 'Type of x8:',type(x8))
print('x9:', x9, 'Type of x9:',type(x9))
print('x10:', x10, 'Type of x10:',type(x10))
print('x11:', x11, 'Type of x11:',type(x11))
print('x12:', x12, 'Type of x12:',type(x12))
print('x13:', x13, 'Type of x13:',type(x13))
#
# Setting the Data Type
# In Python, the data type is set when you assign a value to a variable:
# x1 = 5    # int
# x2 = 5.0  # float
# x3 = 5 + 2j   # complex
# x4 = ['apple', 'banana', 'cherry']  # list
# x5 = ('apple', 'banana', 'cherry')  # tuple
# x6 = range(6)  # range
# x7 = {'name' : 'John', 'age' : 36}  # dict
# x8 = {'apple', 'banana', 'cherry'}  # set
# x9 = frozenset({'apple', 'banana', 'cherry'})  # frozenset
# x10 = True  # bool
# x11 = b'Hello'  # bytes
# x12 = bytearray(5)  # bytearray
# x13 = memoryview(bytes(5))  # memoryview

# Setting the Specific Data Type
# If you want to specify the data type, you can use the following constructor functions:
# x = str("Hello World")	str
# x = int(20)	int
# x = float(20.5)	float
# x = complex(1j)	complex
# x = list(("apple", "banana", "cherry"))	list
# x = tuple(("apple", "banana", "cherry"))	tuple
# x = range(6)	range
# x = dict(name="John", age=36)	dict
# x = set(("apple", "banana", "cherry"))	set
# x = frozenset(("apple", "banana", "cherry"))	frozenset
# x = bool(5)	bool
# x = bytes(5)	bytes
# x = bytearray(5)	bytearray
# x = memoryview(bytes(5))	memoryview

# Type Conversion
# You can convert from one type to another with the int(), float(), and complex() methods:
# Convert from one type to another:
x14 = 1    # int
x15 = 2.8  # float
x16 = 1j   # complex
#convert from int to float:
a = float(x14)

#convert from float to int:
b = int(x15)

#convert from int to complex:
c = complex(x14)

print('x14:', x14, 'Type of x14:',type(x14))
print('x15:', x15, 'Type of x15:',type(x15))
print('x16:', x16, 'Type of x16:',type(x16))
print('a:', a, 'Type of a:',type(a))
print('b:', b, 'Type of b:',type(b))
print('c:', c, 'Type of c:',type(c))

# Note: You cannot convert complex numbers into another number type.




