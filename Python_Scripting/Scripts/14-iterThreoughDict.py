# Dictionary iteration

# Dictionary iteration
# Iterating through a dictionary is similar to iterating through a list, but with a few differences.

# When iterating through a dictionary, the return value are the keys of the dictionary, but there are methods to return the values as well.

# Example
# Print all key names in the dictionary, one by one:
thisdict = {
    "brand": "Ford",
    "model": "Mustang",
    "year": 1964
    }
for x in thisdict:
    print(x)
# Output
# brand
# model
# year
# Example

# iterate through the keys and values of a dictionary:
thisdict = {
    "brand": "Ford",
    "model": "Mustang",
    "year": 1964
    }
for x, y in thisdict.items():
    print(x, y)
# Output
# brand Ford
# model Mustang
# year 1964

# iterating through a dictionary using a count and enumerate:
thisdict = {
    "brand": "Ford",
    "model": "Mustang",
    "year": 1964
    }
for i, j in enumerate(thisdict):
    print(i, j)
# Output
# 0 brand
# 1 model
# 2 year

