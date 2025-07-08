import os
import sys
import time

# Python List
aws_region = ['us-east-1', 'us-west-2', 'us-west-1', 'eu-west-1', 'eu-central-1']
print("AWS Region: ", aws_region)

# Python List Append
aws_region.append('ap-southeast-1')  # This will append the element to the end of the list
print("AWS Region Appended: ", aws_region)

# Python List Insert
aws_region.insert(3, 'ap-southeast-2')  # This will insert the element at the specified index
print("AWS Region Inserted: ", aws_region)

# Python List Extend
aws_region2 = ['ap-northeast-1', 'sa-east-1']
aws_region.extend(aws_region2)  # This will extend the list by appending elements from the iterable

# Python List Iterating
for region in aws_region:    # This will iterate over the elements of the list
    print(region)

# Python List Slicing
print("AWS Region Sliced: ", aws_region[2:5])   # This will return a slice of the list from the start index to the end index

# Python List Index
print("AWS Region Index: ", aws_region.index('eu-west-1'))  # This will return the index of the first occurrence of the element in the list

# Python List Count
print("AWS Region Count: ", aws_region.count('eu-west-1'))  # This will return the number of occurrences of the element in the list

# Python List Remove
aws_region.remove('eu-west-1') # This will remove the first occurrence of the element from the list

# Python List Pop
aws_region.pop()    # This will remove the last element from the list
print("AWS Region Popped: ", aws_region)    # This will return the popped element

# Python List Sorting
aws_region.sort()   # This will sort the list in place
print("AWS Region Sorted: ", aws_region)

# Python List Reverse
aws_region.reverse()    # This will reverse the list in place
print("AWS Region Reversed: ", aws_region)

# Python List Clear
aws_region.clear()  # This will remove all the elements from the list
print("AWS Region Cleared: ", aws_region)

# Python List Copy
aws_region2 = ['us-east-1', 'us-west-2', 'us-west-1', 'eu-west-1', 'eu-central-1', 'ap-southeast-1', 'ap-southeast-2', 'ap-northeast-1', 'sa-east-1']
aws_region = aws_region2.copy() # This will return a shallow copy of the list
print("AWS Region Copied: ", aws_region)