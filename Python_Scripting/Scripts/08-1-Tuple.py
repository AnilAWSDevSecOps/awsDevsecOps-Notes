# Python Tuple Explonation with Example Code
# A tuple is a collection which is ordered and unchangeable. In Python tuples are written with round brackets.

# Example
# Create a Tuple:
thistuple = ("apple", "banana", "cherry")
print(thistuple)
# Note: The tuple is ordered, meaning that the items have a defined order, and that order will not change.
# Output
# ('apple', 'banana', 'cherry')

# Access Tuple Items
# You can access tuple items by referring to the index number, inside square brackets:
thistuple = ("apple", "banana", "cherry")
print(thistuple[1])
# Output
# banana

# Negative Indexing
# Negative indexing means beginning from the end, -1 refers to the last item, -2 refers to the second last item etc.
thistuple = ("apple", "banana", "cherry")
print(thistuple[-1])
# Output
# cherry

# Range of Indexes
# You can specify a range of indexes by specifying where to start and where to end the range.
# When specifying a range, the return value will be a new tuple with the specified items.
thistuple = ("apple", "banana", "cherry", "orange", "kiwi", "melon", "mango")
print(thistuple[2:5])
# Output
# ('cherry', 'orange', 'kiwi')

# Range of Negative Indexes
# Specify negative indexes if you want to start the search from the end of the tuple:
thistuple = ("apple", "banana", "cherry", "orange", "kiwi", "melon", "mango")
print(thistuple[-4:-1])
# Output
# ('orange', 'kiwi', 'melon')

# Change Tuple Values
# Once a tuple is created, you cannot change its values. Tuples are unchangeable, or immutable as it also is called.
# But there is a workaround. You can convert the tuple into a list, change the list, and convert the list back into a tuple.
x = ("apple", "banana", "cherry")
y = list(x)
y[1] = "kiwi"
x = tuple(y)
print(x)
# Output
# ('apple', 'kiwi', 'cherry')

# Loop Through a Tuple
# You can loop through the tuple items by using a for loop.
thistuple = ("apple", "banana", "cherry")
for x in thistuple:
  print(x)
# Output
# apple
# banana
# cherry


# Check if Item Exists
# To determine if a specified item is present in a tuple use the in keyword:
thistuple = ("apple", "banana", "cherry")
if "apple" in thistuple:
  print("Yes, 'apple' is in the fruits tuple")
# Output
# Yes, 'apple' is in the fruits tuple


# Tuple Length
# To determine how many items a tuple has, use the len() method:
thistuple = ("apple", "banana", "cherry")
print(len(thistuple))
# Output
# 3


# Add Items
# Once a tuple is created, you cannot add items to it. Tuples are unchangeable.
# But there is a workaround. You can convert the tuple into a list, add items to the list, and convert the list back into a tuple.
x = ("apple", "banana", "cherry")
y = list(x)
y.append("orange")
x = tuple(y)
print(x)
# Output
# ('apple', 'banana', 'cherry', 'orange')


# Remove Items
# Tuples are unchangeable, so you cannot remove items from it, but you can use the same workaround as we used for changing and adding tuple items:
x = ("apple", "banana", "cherry")
y = list(x)
y.remove("apple")
x = tuple(y)
print(x)
# Output
# ('banana', 'cherry')


# The del keyword can delete the tuple completely:
thistuple = ("apple", "banana", "cherry")
del thistuple
print(thistuple) #this will raise an error because the tuple no longer exists
# Output
# Traceback (most recent call last):
#   File "demo_tuple.py", line 3, in <module>


# Join Two Tuples
# To join two or more tuples you can use the + operator:
tuple1 = ("a", "b" , "c")
tuple2 = (1, 2, 3)
tuple3 = tuple1 + tuple2
print(tuple3)
# Output
# ('a', 'b', 'c', 1, 2, 3)


# The tuple() Constructor
# It is also possible to use the tuple() constructor to make a tuple.
thistuple = tuple(("apple", "banana", "cherry")) # note the double round-brackets
print(thistuple)
# Output
# ('apple', 'banana', 'cherry')


# Tuple Methods
# Python has two built-in methods that you can use on tuples.
# Method	Description
# count()	Returns the number of times a specified value occurs in a tuple
# index()	Searches the tuple for a specified value and returns the position of where it was found
# Example
# Using the count() method:
thistuple = (1, 3, 7, 8, 7, 5, 4, 6, 8, 5)
x = thistuple.count(5)
print(x)
# Output
# 2


# Using the index() method:
thistuple = (1, 3, 7, 8, 7, 5, 4, 6, 8, 5)
x = thistuple.index(8)
print(x)
# Output
# 3


# Tuple with one item
# To create a tuple with only one item, you have to add a comma after the item, otherwise Python will not recognize it as a tuple.
thistuple = ("apple",)
print(type(thistuple))
# Output
# <class 'tuple'>

#NOT a tuple
thistuple = ("apple")
print(type(thistuple))
# Output
# <class 'str'>


# Set
# A set is a collection which is both unordered and unindexed.
# Sets are written with curly brackets.
# Example
# Create a Set:
thisset = {"apple", "banana", "cherry"}
print(thisset)
# Output
# {'cherry', 'banana', 'apple'}


# Note: Sets are unordered, so you cannot be sure in which order the items will appear.

# Access Items
# You cannot access items in a set by referring to an index or a key.
# But you can loop through the set items using a for loop, or ask if a specified value is present in a set, by using the in keyword.
# Example
# Loop through the set, and print the values:
thisset = {"apple", "banana", "cherry"}
for x in thisset:
  print(x)
# Output
# cherry
# banana
# apple


# Example
# Check if "banana" is present in the set:
thisset = {"apple", "banana", "cherry"}
print("banana" in thisset)
# Output
# True


# Change Items
# Once a set is created, you cannot change its items, but you can add new items.
# Add Items
# To add one item to a set use the add() method.
# To add more than one item to a set use the update() method.
# Example
# Add an item to a set, using the add() method:
thisset = {"apple", "banana", "cherry"}
thisset.add("orange")
print(thisset)
# Output
# {'cherry', 'orange', 'banana', 'apple'}

# Example
# Add multiple items to a set, using the update() method:
thisset = {"apple", "banana", "cherry"}
thisset.update(["orange", "mango", "grapes"])
print(thisset)
# Output
# {'orange', 'banana', 'grapes', 'apple', 'mango', 'cherry'}

# Get the Length of a Set
# To determine how many items a set has, use the len() method.
# Example
# Get the number of items in a set:
thisset = {"apple", "banana", "cherry"}
print(len(thisset))
# Output
# 3

# Remove Item
# To remove an item in a set, use the remove(), or the discard() method.
# Example
# Remove "banana" by using the remove() method:
thisset = {"apple", "banana", "cherry"}
thisset.remove("banana")
print(thisset)
# Output
# {'cherry', 'apple'}

# Note: If the item to remove does not exist, remove() will raise an error.

# Example
# Remove "banana" by using the discard() method:
thisset = {"apple", "banana", "cherry"}
thisset.discard("banana")
print(thisset)
# Output
# {'cherry', 'apple'}

# Note: If the item to remove does not exist, discard() will NOT raise an error.

# You can also use the pop(), method to remove an item, but this method will remove the last item. Remember that sets are unordered, so you will not know what item that gets removed.
# The return value of the pop() method is the removed item.
# Example
# Remove the last item by using the pop() method:
thisset = {"apple", "banana", "cherry"}
x = thisset.pop()
print(x)
print(thisset)
# Output
# cherry
# {'banana', 'apple'}

# Example
# The clear() method empties the set:
thisset = {"apple", "banana", "cherry"}
thisset.clear()
print(thisset)
# Output
# set()

# Example
# The del keyword will delete the set completely:
thisset = {"apple", "banana", "cherry"}
del thisset
print(thisset)
# Output
# NameError: name 'thisset' is not defined

# Join Two Sets
# There are several ways to join two or more sets in Python.
# You can use the union() method that returns a new set containing all items from both sets, or the update() method that inserts all the items from one set into another:
# Example
# The union() method returns a new set with all items from both sets:
set1 = {"a", "b" , "c"}
set2 = {1, 2, 3}
set3 = set1.union(set2)
print(set3)
# Output
# {1, 2, 3, 'c', 'b', 'a'}

# Example
# The update() method inserts the items in set2 into set1:
set1 = {"a", "b" , "c"}
set2 = {1, 2, 3}
set1.update(set2)
print(set1)
# Output
# {1, 2, 3, 'c', 'b', 'a'}

# Note: Both union() and update() will exclude any duplicate items.

# The set methods are well described in the Python documentation:

# Method	Description
# add()	Adds an element to the set
# clear()	Removes all the elements from the set
# copy()	Returns a copy of the set
# difference()	Returns a set containing the difference between two or more sets
# difference_update()	Removes the items in this set that are also included in another, specified set
# discard()	Remove the specified item
# intersection()	Returns a set, that is the intersection of two other sets
# intersection_update()	Removes the items in this set that are not present in other, specified set(s)
# isdisjoint()	Returns whether two sets have a intersection or not
# issubset()	Returns whether another set contains this set or not
# issuperset()	Returns whether this set contains another set or not
# pop()	Removes an element from the set
# remove()	Removes the specified element
# symmetric_difference()	Returns a set with the symmetric differences of two sets
# symmetric_difference_update()	inserts the symmetric differences from this set and another
# union()	Return a set containing the union of sets
# update()	Update the set with the union of this set and others
# Example
# The copy() method copies the set.
thisset = {"apple", "banana", "cherry"}
myset = thisset.copy()
print(myset)
# Output
# {'cherry', 'banana', 'apple'}

# Example
# The difference() method returns a set that contains the difference between two sets.
# Meaning: The returned set contains items that exist only in the first set, and not in both sets.
set1 = {"apple", "banana", "cherry"}
set2 = {"google", "microsoft", "apple"}
set3 = set1.difference(set2)
print(set3)
# Output
# {'banana', 'cherry'}

# Example
# The difference_update() method removes the items that exist in both sets.
# The difference_update() method is different from the difference() method, because the difference() method returns a new set, without the unwanted items, and the difference_update() method removes the unwanted items from the original set.
set1 = {"apple", "banana", "cherry"}
set2 = {"google", "microsoft", "apple"}
set1.difference_update(set2)
print(set1)
# Output
# {'banana', 'cherry'}

# Example
# The intersection() method returns a set that contains the similarity between two or more sets.
# Meaning: The returned set contains only items that exist in both sets, or in all sets if the comparison is done with more than two sets.
set1 = {"apple", "banana", "cherry"}
set2 = {"google", "microsoft", "apple"}
set3 = set1.intersection(set2)
print(set3)
# Output
# {'apple'}

# Example
# The intersection_update() method removes the items that is not present in both sets (or in all sets if the comparison is done between more than two sets).
# The intersection_update() method is different from the intersection() method, because the intersection() method returns a new set, without the unwanted items, and the intersection_update() method removes the unwanted items from the original set.
set1 = {"apple", "banana", "cherry"}
set2 = {"google", "microsoft", "apple"}
set1.intersection_update(set2)
print(set1)
# Output
# {'apple'}

# Example
# The isdisjoint() method returns True if none of the items are present in both sets, otherwise it returns False.
set1 = {"apple", "banana", "cherry"}
set2 = {"google", "microsoft", "facebook"}
x = set1.isdisjoint(set2)
print(x)
# Output
# True

# Example
# The issubset() method returns True if all items in the set exists in the specified set, otherwise it retuns False.
set1 = {"a", "b", "c"}
set2 = {"f", "e", "d", "c", "b", "a"}
x = set1.issubset(set2)
print(x)
# Output
# True

# Example
# The issuperset() method returns True if all items in the specified set exists in the original set, otherwise it retuns False.
set1 = {"f", "e", "d", "c", "b", "a"}
set2 = {"a", "b", "c"}
x = set1.issuperset(set2)
print(x)
# Output
# True

# Example
# The symmetric_difference() method returns a set that contains all items from both set, but not the items that are present in both sets.
# Meaning: The returned set contains a mix of items that are not present in both sets.
set1 = {"apple", "banana", "cherry"}
set2 = {"google", "microsoft", "apple"}
set3 = set1.symmetric_difference(set2)
print(set3)
# Output
# {'banana', 'cherry', 'google', 'microsoft'}

# Example
# The symmetric_difference_update() method updates the original set by removing items that are present in both sets, and inserting the other items.
set1 = {"apple", "banana", "cherry"}
set2 = {"google", "microsoft", "apple"}
set1.symmetric_difference_update(set2)
print(set1)
# Output
# {'microsoft', 'banana', 'cherry', 'google'}

# Example
# The union() method returns a set that contains all items from the original set, and all items from the specified sets.
# You can specify as many sets you want, separated by commas.
set1 = {"a", "b" , "c"}
set2 = {1, 2, 3}
set3 = {4, 5, 6}
set4 = set1.union(set2, set3)
print(set4)
# Output
# {1, 2, 3, 4, 5, 6, 'c', 'b', 'a'}

# Example
# The update() method updates the current set, by adding items from another set.
set1 = {"apple", "banana", "cherry"}
set2 = {"google", "microsoft", "apple"}
set1.update(set2)
print(set1)
# Output
# {'banana', 'cherry', 'google', 'microsoft', 'apple'}