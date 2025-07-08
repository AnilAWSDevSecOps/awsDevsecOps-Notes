# Dictionary
# Dictionary is a collection which is unordered, changeable and indexed. In Python dictionaries are written with curly brackets, and they have keys and values.

# Example
# Create and print a dictionary:
thisdict = {
    "brand": "Ford",
    "model": "Mustang",
    "year": 1964
}
print(thisdict)
# Output
# {'brand': 'Ford', 'model': 'Mustang', 'year': 1964}

# Dictionary Items
# Dictionary items are ordered, changeable, and does not allow duplicates.

# Dictionary items are presented in key:value pairs, and can be referred to by using the key name.

# Example
# Print the "brand" value of the dictionary:
print(thisdict["brand"])
# Output
# Ford

# Ordered or Unordered?
# As of Python version 3.7, dictionaries are ordered. In Python 3.6 and earlier, dictionaries are unordered.

# Changeable
# Dictionaries are changeable, meaning that we can change, add or remove items after the dictionary has been created.

# Example
# Change the "year" to 2018:
thisdict["year"] = 2018
print(thisdict)
# Output
# {'brand': 'Ford', 'model': 'Mustang', 'year': 2018}

# Dictionary Length
# To determine how many items a dictionary has, use the len() function:

# Example
# Print the number of items in the dictionary:
print(len(thisdict))
# Output
# 3

# Dictionary Items - Data Types
# The values in dictionary items can be of any data type:

# Example
# String, int, boolean, and list data types:
thisdict1 = {
    "brand": "Ford",
    "electric": False,
    "year": 1964,
    "colors": ["red", "white", "blue"]
}
print(thisdict1)
# Output
# {'brand': 'Ford', 'electric': False, 'year': 1964, 'colors': ['red', 'white', 'blue']}
# type() function
# From Python's perspective, dictionaries are defined as objects with the data type 'dict':
# <class 'dict'>
# Example
# Print the data type of a dictionary:
print(type(thisdict1))
# Output
# <class 'dict'>

# Python - Access Dictionary Items
# Accessing Items
# You can access the items of a dictionary by referring to its key name, inside square brackets:

# Example
# Get the value of the "model" key:
x = thisdict1["model"]
print(x)
# Output
# 1964

# There is also a method called get() that will give you the same result:

# Example
# Get the value of the "model" key:
x = thisdict1.get("model")
print(x)
# Output
# 1964

# Get Keys
# The keys() method will return a list of all the keys in the dictionary.

# Example
# Get a list of the keys:
x = thisdict1.keys()
print(x)
# Output
# dict_keys(['brand', 'electric', 'year', 'colors'])

# The list of the keys is a view of the dictionary, meaning that any changes done to the dictionary will be reflected in the keys list.

# Add a new item to the original dictionary, and see that the keys list gets updated as well:

# Example
# Add a new item to the original dictionary, and see that the keys list gets updated as well:
thisdict1["color"] = "red"
print(x)
# Output
# dict_keys(['brand', 'electric', 'year', 'colors', 'color'])

# Get Values
# The values() method will return a list of all the values in the dictionary.

# Example
# Get a list of the values:
x = thisdict1.values()
print(x)
# Output
# dict_values(['Ford', False, 1964, ['red', 'white', 'blue'], 'red'])

# The list of the values is a view of the dictionary, meaning that any changes done to the dictionary will be reflected in the values list.

# Make a change in the original dictionary, and see that the values list gets updated as well:

# Example
# Make a change in the original dictionary, and see that the values list gets updated as well:
thisdict1["year"] = 2018
print(x)
# Output
# dict_values(['Ford', False, 2018, ['red', 'white', 'blue'], 'red'])

# Get Items
# The items() method will return each item in a dictionary, as tuples in a list.

# Example
# Get a list of the key:value pairs
x = thisdict1.items()
print(x)
# Output
# dict_items([('brand', 'Ford'), ('electric', False), ('year', 2018), ('colors', ['red', 'white', 'blue']), ('color', 'red')])
# The returned list is a view of the items of the dictionary, meaning that any changes done to the dictionary will be reflected in the items list.


# Check if Key Exists
# To determine if a specified key is present in a dictionary use the in keyword:

# Example
# Check if "model" is present in the dictionary:
if "model" in thisdict1:
    print("Yes, 'model' is one of the keys in the thisdict dictionary")
else:
    print("No, 'model' is not one of the keys in the thisdict dictionary")
# Output
# Yes, 'model' is one of the keys in the thisdict dictionary

# Change Dictionary Items
# Change Values
# You can change the value of a specific item by referring to its key name:

# Example
# Change the "year" to 2018:
thisdict1["year"] = 2018
print(thisdict1)
# Output
# {'brand': 'Ford', 'electric': False, 'year': 2018, 'colors': ['red', 'white', 'blue'], 'color': 'red'}

# Update Dictionary
# The update() method will update the dictionary with the items from the given argument.

# The argument must be a dictionary, or an iterable object with key:value pairs.

# Example
# Update the "year" of the car by using the update() method:
thisdict1.update({"year": 2020})
print(thisdict1)
# Output
# {'brand': 'Ford', 'electric': False, 'year': 2020, 'colors': ['red', 'white', 'blue'], 'color': 'red'}

# Add Dictionary Items
# Adding Items
# Adding an item to the dictionary is done by using a new index key and assigning a value to it:

# Example
# Add a color item to the dictionary by using a new key name:
thisdict1["color"] = "red"
print(thisdict1)
# Output
# {'brand': 'Ford', 'electric': False, 'year': 2020, 'colors': ['red', 'white', 'blue'], 'color': 'red'}

# Remove Dictionary Items
# Removing Items
# There are several methods to remove items from a dictionary:

# Example
# The pop() method removes the item with the specified key name:
thisdict1.pop("color")
print(thisdict1)
# Output
# {'brand': 'Ford', 'electric': False, 'year': 2020, 'colors': ['red', 'white', 'blue']}
# Example
# The popitem() method removes the last inserted item (in versions before 3.7, a random item is removed instead):
thisdict1.popitem()
print(thisdict1)
# Output
# {'brand': 'Ford', 'electric': False, 'year': 2020, 'colors': ['red', 'white', 'blue']}
# Example
# The del keyword removes the item with the specified key name:
del thisdict1["brand"]
print(thisdict1)
# Output
# {'electric': False, 'year': 2020, 'colors': ['red', 'white', 'blue']}
# Example
# The del keyword can also delete the dictionary completely:
del thisdict1
print(thisdict1) #this will cause an error because "thisdict" no longer exists.

