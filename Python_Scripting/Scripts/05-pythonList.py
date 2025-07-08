# Lists in Python
# Lists are used to store multiple items in a single variable.
# Lists are created using square brackets [].
# List items are ordered, changeable, and allow duplicate values.
# List items are indexed, the first item has index [0], the second item has index [1] etc.
# Example:
# Create a List:
fruits = ['apple', 'banana', 'cherry']
print('fruits:', fruits)
# List Length
# To determine how many items a list has, use the len() function:
print('Length of fruits:', len(fruits))
# List Items - Data Types
# A list can contain different data types:
list1 = ['apple', 'banana', 'cherry']
list2 = [1, 5, 7, 9, 3]
list3 = [True, False, False]
print('list1:', list1)
print('list2:', list2)
print('list3:', list3)
# A list with strings, integers and boolean values:
list4 = ['apple', 'banana', 'cherry', 1, 5, 7, 9, 3, True, False, False]
print('list4:', list4)
# type() function
# From Python's perspective, lists are defined as objects with the data type 'list':
print('Type of list1:', type(list4))

# Access Items
# You access the list items by referring to the index number:
# Example:
# Get the second item of the list:
print('Second item of list4:', list4[1])
# Negative Indexing
# Negative indexing means start from the end
# -1 refers to the last item, -2 refers to the second last item etc.
# Example:
# Get the last item of the list:
print('Last item of list4:', list4[-1])
# Range of Indexes
# You can specify a range of indexes by specifying where to start and where to end the range.
# When specifying a range, the return value will be a new list with the specified items.
# Example:
# Return the third, fourth, and fifth item:
print('Third, fourth and fifth item of list4:', list4[2:5])
# Note: The search will start at index 2 (included) and end at index 5 (not included).
# Remember that the first item has index 0.
# By leaving out the start value, the range will start at the first item:
# Example:
# This example returns the items from the beginning to "cherry":
print('Items from the beginning to "cherry":', list4[:3])
# By leaving out the end value, the range will go on to the end of the list:
# Example:
# This example returns the items from "cherry" and to the end:
print('Items from "cherry" and to the end:', list4[2:])
# Range of Negative Indexes
# Specify negative indexes if you want to start the search from the end of the list:
# Example:
# This example returns the items from index -4 (included) to index -1 (excluded)
print('Items from index -4 (included) to index -1 (excluded):', list4[-4:-1])
# Change Item Value
# To change the value of a specific item, refer to the index number:
# Example:
# Change the second item:
list4[1] = 'blackcurrant'
print('Change the second item:', list4)
# Change a Range of Item Values
# To change the value of items within a specific range, define a list with the new values, and refer to the range of index numbers where you want to insert the new values:
# Example:
# Change the values "banana" and "cherry" with the values "blackcurrant" and "watermelon":
list4[1:3] = ['blackcurrant', 'watermelon']
print('Change the values "banana" and "cherry" with the values "blackcurrant" and "watermelon":', list4)
# If you insert more items than you replace, the new items will be inserted where you specified, and the remaining items will move accordingly:
# Example:
# Change the second value by replacing it with two new values:
list4[1:2] = ['blackcurrant', 'watermelon']
print('Change the second value by replacing it with two new values:', list4)
# Note: The length of the list will change when the number of items inserted does not match the number of items replaced.
# If you insert fewer items than you replace, the new items will be inserted where you specified, and the remaining items will move accordingly:
# Example:
# Change the second and third value by replacing it with one value:
list4[1:3] = ['blackcurrant']
print('Change the second and third value by replacing it with one value:', list4)
# Insert Items
# To insert a new list item, without replacing any of the existing values, we can use the insert() method.
# The insert() method inserts an item at the specified index:
# Example:
# Insert "orange" as the third item:
list4.insert(2, 'orange')
print('Insert "orange" as the third item:', list4)
# Append Items
# To add an item to the end of the list, use the append() method:
# Example:
# Append "orange" to the end of the list:
list4.append('orange')
print('Append "orange" to the end of the list:', list4)
# Extend List
# To append elements from another list to the current list, use the extend() method.
# Example:
# Add the elements of tropical to thislist:
tropical = ['mango', 'pineapple', 'papaya']
list4.extend(tropical)
print('Add the elements of tropical to list4:', list4)
# Remove Item
# There are several methods to remove items from a list:
# The remove() method removes the specified item:
# Example:
# Remove "banana":
list4.remove('banana')
print('Remove "banana":', list4)
# The pop() method removes the specified index, (or the last item if index is not specified):
# Example:
# Remove the second item:
list4.pop(1)
print('Remove the second item:', list4)
# If you do not specify the index, the pop() method removes the last item:
# Example:
# Remove the last item:
list4.pop()
print('Remove the last item:', list4)
# The del keyword removes the specified index:
# Example:
# Remove the first item:
del list4[0]
print('Remove the first item:', list4)
# The del keyword can also delete the list completely:
# Example:
# Delete the entire list:
del list4
print('Delete the entire list:', list4)  # This will raise an error because "list4" no longer exists.
# The clear() method empties the list:
# Example:
# Clear the list content:
tropical.clear()
print('Clear the list content:', tropical)
# Loop Through a List
# You can loop through the list items by using a for loop:
# Example:
# Print all items in the list, one by one:
tropical1 = ['mango', 'pineapple', 'papaya']
for x in tropical1:
    print('tropical1:', x)
# You will learn more about for loops in the next chapter.
# Loop Through the Index Numbers
# You can also loop through the list items by referring to their index number.
# Use the range() and len() functions to create a suitable iterable.
# Example:
# Print all items by referring to their index number:
for i in range(len(tropical1)):
    print('tropical1:', tropical1[i])
# The iterable created in the example above is [0, 1, 2].
# Example Explained
# tropical1 = ['mango', 'pineapple', 'papaya']
# tropical1[0] = 'mango'
# tropical1[1] = 'pineapple'
# tropical1[2] = 'papaya'
# Check if Item Exists
# To determine if a specified item is present in a list use the in keyword:
# Example:
# Check if "apple" is present in the list:
if 'apple' in tropical1:
    print('Yes, "apple" is in the tropical1 list')
else:
    print('No, "apple" is not in the tropical1 list')
# List Length
# To determine how many items a list has, use the len() method:
# Example:
# Print the number of items in the list:
print('Number of items in the list:', len(tropical1))


# List Methods
# Python has a set of built-in methods that you can use on lists.
# Method	Description
# append()	Adds an element at the end of the list
# clear()	Removes all the elements from the list
# copy()	Returns a copy of the list
# count()	Returns the number of elements with the specified value
# extend()	Add the elements of a list (or any iterable), to the end of the current list
# index()	Returns the index of the first element with the specified value
# insert()	Adds an element at the specified position
# pop()	Removes the element at the specified position
# remove()	Removes the first item with the specified value
# reverse()	Reverses the order of the list
# sort()	Sorts the list
# Note: Python does not have built-in support for Arrays, but Python Lists can be used instead.
# List Comprehension
# List comprehension offers a shorter syntax when you want to create a new list based on the values of an existing list.
# Example:
# Based on a list of fruits, you want a new list, containing only the fruits with the letter "a" in the name.
# Without list comprehension you will have to write a for statement with a conditional test inside:
# Example:
newlist = []
for x in fruits:
    if 'a' in x:
        newlist.append(x)
print('newlist:', newlist)
# With list comprehension you can do all that with only one line of code:
# Example:
newlist1 = [x for x in fruits if 'a' in x]
print('newlist1:', newlist1)
# The Syntax
# newlist = [expression for item in iterable if condition == True]
# The return value is a new list, leaving the old list unchanged.

# The expression is the current item in the iteration, but it is also the outcome, which you can manipulate before it ends up like a list item in the new list.
# Example:
# You can use the range() function to create an iterable:

# Example:
newlist2 = [x for x in range(10)]
print('newlist2:', newlist2)
# The iterable can be any iterable object, like a list, tuple, set etc.
# Example:
# Accept only numbers lower than 5:
newlist3 = [x for x in range(10) if x < 5]
print('newlist3:', newlist3)
# The expression can also contain conditions, not like a filter, but as a way to manipulate the outcome.
# Example:
# Set the values in the new list to upper case:
newlist4 = [x.upper() for x in fruits]
print('newlist4:', newlist4)
# You can set the outcome to whatever you like:
# Example:
# Set all values in the new list to 'hello':
newlist5 = ['hello' for x in fruits]
print('newlist5:', newlist5)
# The expression can also contain conditions, not like a filter, but as a way to manipulate the outcome.
# Example:
# Return "orange" instead of "banana":
newlist6 = [x if x != 'banana' else 'orange' for x in fruits]
print('newlist6:', newlist6)
# Sort Lists
# List objects have a sort() method that will sort the list alphanumerically, ascending, by default:
# Example:
# Sort the list alphabetically:
fruits.sort()
print('Sort the list alphabetically:', fruits)
# Example:
# Sort the list numerically:
list2.sort()
print('Sort the list numerically:', list2)
# Sort Descending
# To sort descending, use the keyword argument reverse = True:
# Example:
# Sort the list descending:
fruits.sort(reverse=True)
print('Sort the list descending:', fruits)
# Customize Sort Function
# You can also customize your own function by using the keyword argument key = function.
# The function will return a number that will be used to sort the list (the lowest number first):
# Example:
# Sort the list based on how close the number is to 50:
def myfunc(n):
    return abs(n - 50)
list2 = [100, 50, 65, 82, 23]
list2.sort(key=myfunc)
print('Sort the list based on how close the number is to 50:', list2)
# Case Insensitive Sort
# By default the sort() method is case sensitive, resulting in all capital letters being sorted before lower case letters:
# Example:
# Case sensitive sorting can give an unexpected result:
list3 = ['banana', 'Orange', 'Kiwi', 'cherry']
list3.sort()
print('Case sensitive sorting can give an unexpected result:', list3)
# Luckily we can use built-in functions as key functions when sorting a list.
# So if you want a case-insensitive sort function, use str.lower as a key function:
# Example:
# Perform a case-insensitive sort of the list:
list3.sort(key=str.lower)
print('Perform a case-insensitive sort of the list:', list3)
# Reverse Order
# What if you want to reverse the order of a list, regardless of the alphabet?
# The reverse() method reverses the current sorting order of the elements.
# Example:
# Reverse the order of the list items:
list3.reverse()
print('Reverse the order of the list items:', list3)
# Copy a List
# You cannot copy a list simply by typing list2 = list1, because: list2 will only be a reference to list1, and changes made in list1 will automatically also be made in list2.
# There are ways to make a copy, one way is to use the built-in List method copy().
# Example:
# Make a copy of a list with the copy() method:
list4 = list3.copy()
print('Make a copy of a list with the copy() method:', list4)
# Another way to make a copy is to use the built-in method list().
# Example:
# Make a copy of a list with the list() method:
list5 = list(list4)
print('Make a copy of a list with the list() method:', list5)
# Join Two Lists
# There are several ways to join, or concatenate, two or more lists in Python.
# One of the easiest ways are by using the + operator.
# Example:
# Join two list:
list6 = list3 + fruits
print('Join two list:', list6)
# Another way to join two lists are by appending all the items from list2 into list1, one by one:
# Example:
# Append list2 into list1:
for x in list2:
    list3.append(x)
print('Append list2 into list1:', list3)
# Or you can use the extend() method, which purpose is to add elements from one list to another list:
# Example:
# Use the extend() method to add list2 at the end of list1:
list3.extend(list2)
print('Use the extend() method to add list2 at the end of list1:', list3)