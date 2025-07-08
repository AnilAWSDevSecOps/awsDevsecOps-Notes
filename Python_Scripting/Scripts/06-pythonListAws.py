# list
region = ['us-east-1', 'us-west-2', 'us-west-1', 'eu-west-1', 'eu-central-1', 'ap-southeast-1', 'ap-southeast-2', 'ap-northeast-1', 'sa-east-1']
print("Region: ", region)

# Python List Sorting
region.sort()   # This will sort the list in place
print("Region Sorted: ", region)

# Python List Append
region.append('ap-south-1')  # This will append the element to the end of the list
print("Region Appended: ", region)

# Python List Remove
region.remove('ap-south-1') # This will remove the first occurrence of the element from the list
print("Region Removed: ", region)

# Python List Reverse
region.reverse()    # This will reverse the list in place
print("Region Reversed: ", region)

# Python List Count
print("Region Count: ", region.count('eu-west-1'))  # This will return the number of occurrences of the element in the list

# Python List Index
print("Region Index: ", region.index('eu-west-1'))  # This will return the index of the first occurrence of the element in the list

# Python List Pop
region.pop()    # This will remove the last element from the list
print("Region Popped: ", region)    # This will return the popped element

# Python List Insert
region.insert(5, 'ap-south-1')  # This will insert the element at the specified index
print("Region Inserted: ", region)

# Python List Extend
region2 = ['ca-central-1', 'ap-northeast-2', 'ap-northeast-3', 'eu-north-1']
region.extend(region2)  # This will extend the list by appending elements from the iterable
print("Region Extended: ", region)

# Python List Clear
region.clear()  # This will remove all the elements from the list
print("Region Cleared: ", region)

# Python List Copy
region2 = ['us-east-1', 'us-west-2', 'us-west-1', 'eu-west-1', 'eu-central-1', 'ap-southeast-1', 'ap-southeast-2', 'ap-northeast-1', 'sa-east-1']
region = region2.copy() # This will return a shallow copy of the list
print("Region Copied: ", region)

# Python List Delete
del region[5]   # This will delete the element at the specified index
print("Region Deleted: ", region)

# Python List Slicing
print("Region Sliced: ", region[2:5])   # This will return a slice of the list from the start index to the end index


# Python List Iterating
for i in region:    # This will iterate over the elements of the list
    print(i)

