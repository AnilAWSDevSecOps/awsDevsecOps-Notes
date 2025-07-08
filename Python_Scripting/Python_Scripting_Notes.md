# 3 Python Scripting

## 3.1 Python Installation and Setup:

### 3.1.1 Linux Installation

- Installation steps of python in linux
  ```
  sudo apt install python3
  sudo apt install python3-ipython
  sudo apt install python3-venv
  ```

### 3.1.2 Python Virtual Environment Setup

- Steps to setup Python Virtual Environment  
  ***awsProject:***
  ```
  mkdir Projects/awsProject
  python3 -m venv Projects/awsProject/
  source Projects/awsProject/bin/activate
  ```
- When you list the pip packages you see only little as it is fresh environment.  
  ***Command:***
  ```
  (awsProject) ubuntu@shellscripting:~/WorkSpace/DevSecOps2024$ pip list
  
  ```
  ***Output:***
  ```
  Package Version
  ------- -------
  pip     24.0
  ```
  ***azProject:***
  ```
  mkdir Projects/azProject
  python3 -m venv Projects/azProject/
  source Projects/azProject/bin/activate
  ```
- Installing pip packages using requirement.txt file  
  ***requirements.txt***
  ```
  boto3
  requests
  botocore
  ```
- Now we will install it using the below command.  
  ***Command:***
  ```
  (awsProject) ubuntu@shellscripting:~/awsProject$ pip install -r requirements.txt

  ```
  ***Output:***
  ```
  Downloading boto3-1.35.19-py3-none-any.whl (139 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 139.2/139.2 kB 7.8 MB/s eta 0:00:00
  Downloading requests-2.32.3-py3-none-any.whl (64 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 64.9/64.9 kB 5.9 MB/s eta 0:00:00
  Downloading botocore-1.35.19-py3-none-any.whl (12.5 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 12.5/12.5 MB 89.5 MB/s eta 0:00:00
  Downloading certifi-2024.8.30-py3-none-any.whl (167 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 167.3/167.3 kB 23.9 MB/s eta 0:00:00
  Downloading charset_normalizer-3.3.2-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (141 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 141.9/141.9 kB 15.7 MB/s eta 0:00:00
  Downloading idna-3.9-py3-none-any.whl (71 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 71.7/71.7 kB 7.2 MB/s eta 0:00:00
  Downloading jmespath-1.0.1-py3-none-any.whl (20 kB)
  Downloading python_dateutil-2.9.0.post0-py2.py3-none-any.whl (229 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 229.9/229.9 kB 26.2 MB/s eta 0:00:00
  Downloading s3transfer-0.10.2-py3-none-any.whl (82 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 82.7/82.7 kB 8.7 MB/s eta 0:00:00
  Downloading urllib3-2.2.3-py3-none-any.whl (126 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 126.3/126.3 kB 15.7 MB/s eta 0:00:00
  Downloading six-1.16.0-py2.py3-none-any.whl (11 kB)
  Installing collected packages: urllib3, six, jmespath, idna, charset-normalizer, certifi, requests, python-dateutil, botocore, s3transfer, boto3
  Successfully installed boto3-1.35.19 botocore-1.35.19 certifi-2024.8.30 charset-normalizer-3.3.2 idna-3.9 jmespath-1.0.1 python-dateutil-2.9.0.post0 requests-2.32.3 s3transfer-0.10.2 six-1.16.0 urllib3-2.2.3
  ```
- Now if you list packages  
  ***Command:***
  ```
  (awsProject) ubuntu@shellscripting:~/awsProject$ pip list

  ```
  ***Output:***
  ```
  Package            Version
  ------------------ -----------
  boto3              1.35.19
  botocore           1.35.19
  certifi            2024.8.30
  charset-normalizer 3.3.2
  idna               3.9
  jmespath           1.0.1
  pip                24.0
  python-dateutil    2.9.0.post0
  requests           2.32.3
  s3transfer         0.10.2
  six                1.16.0
  urllib3            2.2.3
  ```

## 3.2. Python Variables

- Variable names are case-sensitive
- Variable names must start with a letter or an underscore
- Variable names cannot start with a number
- Variable names can only contain alpha-numeric characters and underscores (A-z, 0-9, and _ )
- Variable names cannot contain spaces
- Variable names are case-sensitive (age, Age and AGE are three different variables)
- Variable names should be descriptive (age is better than a)
- Variable names cannot be a reserved keyword  
  ***1-pythonVariables.py***
  ```python
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
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/python$ python3 01-pythonVariables.py
  
  ```
  ***Output***
  ```
  Integers: 10 20 30
  Strings: s: Hello World s1: Hello World s2: Hello World s3: Hello World
  Type of a: <class 'int'>
  Type of s: <class 'str'>
  x: 10 X: 20
  Type of x: <class 'int'> Type of X: <class 'int'>
  ```

## 3.3. Datatypes in Python

- Python Data Types
- Python has the following data types built-in by default, in these categories:
- Text Type:    str
- Numeric Types:    int, float, complex
- Sequence Types:    list, tuple, range
- Mapping Type:    dict
- Set Types:    set, frozenset
- Boolean Type:    bool
- Binary Types:    bytes, bytearray, memoryview  
  ***02-pythonDataTypes.py***
  ```python
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
  
  # Type Conversion
  # You can convert from one type to another with the int(), float(), and complex() methods:
  # Convert from one type to another:
    x14 = 1    # int
    x15 = 2.8  # float
    x16 = 1j   # complex
  
  # convert from int to float:
    a = float(x14)
    
  # convert from float to int:
    b = int(x15)
    
  # convert from int to complex:
    c = complex(x14)
    
    print('x14:', x14, 'Type of x14:',type(x14))
    print('x15:', x15, 'Type of x15:',type(x15))
    print('x16:', x16, 'Type of x16:',type(x16))
    print('a:', a, 'Type of a:',type(a))
    print('b:', b, 'Type of b:',type(b))
    print('c:', c, 'Type of c:',type(c))

  # Note: You cannot convert complex numbers into another number type.
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/python$ python3 02-pythonDataTypes.py
  
  ```
  ***Output:***
  ```
  x1: 5 Type of x1: <class 'int'>
  x2: 5.0 Type of x2: <class 'float'>
  x3: (5+2j) Type of x3: <class 'complex'>
  x4: ['apple', 'banana', 'cherry'] Type of x4: <class 'list'>
  x5: ('apple', 'banana', 'cherry') Type of x5: <class 'tuple'>
  x6: range(0, 6) Type of x6: <class 'range'>
  x7: {'name': 'John', 'age': 36} Type of x7: <class 'dict'>
  x8: {'apple', 'cherry', 'banana'} Type of x8: <class 'set'>
  x9: frozenset({'apple', 'cherry', 'banana'}) Type of x9: <class 'frozenset'>
  x10: True Type of x10: <class 'bool'>
  x11: b'Hello' Type of x11: <class 'bytes'>
  x12: bytearray(b'\x00\x00\x00\x00\x00') Type of x12: <class 'bytearray'>
  x13: <memory at 0x7c6bab7347c0> Type of x13: <class 'memoryview'>
  x14: 1 Type of x14: <class 'int'>
  x15: 2.8 Type of x15: <class 'float'>
  x16: 1j Type of x16: <class 'complex'>
  a: 1.0 Type of a: <class 'float'>
  b: 2 Type of b: <class 'int'>
  c: (1+0j) Type of c: <class 'complex'>
  ```
  ***03-pythonAvgofNumbers.py***
  ```python
  # Function to calculate the average of numbers by using the input() function in Python
  def calculate_avarage():
      # Get the number of elements
      n = int(input('Enter the number of elements: '))
      # Initialize the sum of numbers
      sum = 0
      # Get the numbers from the user
      for i in range(n):
          num = float(input('Enter number: '))
          sum += num
      # Calculate the average
      avg = sum/n
      # Display the average
      print('The average of', n, 'numbers is:', round(avg, 2))
  
  if __name__ == '__main__':
      calculate_avarage()
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/python$ python3 03-pythonAvgofNumbers.py
  
  ```
  ***Output:***
  ```
  Enter the number of elements: 4
  Enter number: 44
  Enter number: 3.123
  Enter number: 26.99
  Enter number: 55
  The average of 4 numbers is: 32.28
  ```

## 3.4. Python List:

- List Explonation and code.
- Lists in Python
- Lists are used to store multiple items in a single variable.
- Lists are created using square brackets [].
- List items are ordered, changeable, and allow duplicate values.
- List items are indexed, the first item has index [0], the second item has index [1] etc.
- Example:
- Create a List:

```python
fruits = ['apple', 'banana', 'cherry']
print('fruits:', fruits)
```

- List Length
- To determine how many items a list has, use the len() function:

```python
print('Length of fruits:', len(fruits))

```

- List Items - Data Types
- A list can contain different data types:

```python
list1 = ['apple', 'banana', 'cherry']
list2 = [1, 5, 7, 9, 3]
list3 = [True, False, False]
print('list1:', list1)
print('list2:', list2)
print('list3:', list3)
```

- A list with strings, integers and boolean values:

```python
list4 = ['apple', 'banana', 'cherry', 1, 5, 7, 9, 3, True, False, False]
print('list4:', list4)
```

- type() function
- From Python's perspective, lists are defined as objects with the data type 'list':

```python
print('Type of list1:', type(list4))

```

- Access Items
- You access the list items by referring to the index number:
- Example:
- Get the second item of the list:

```python
print('Second item of list4:', list4[1])

```

- Negative Indexing
- Negative indexing means start from the end
- -1 refers to the last item, -2 refers to the second last item etc.
- Example:
- Get the last item of the list:

```python
print('Last item of list4:', list4[-1])

```

- Range of Indexes
- You can specify a range of indexes by specifying where to start and where to end the range.
- When specifying a range, the return value will be a new list with the specified items.
- Example:
- Return the third, fourth, and fifth item:

```python
print('Third, fourth and fifth item of list4:', list4[2:5])

```

- Note: The search will start at index 2 (included) and end at index 5 (not included).
- Remember that the first item has index 0.
- By leaving out the start value, the range will start at the first item:
- Example:
- This example returns the items from the beginning to "cherry":

```python
print('Items from the beginning to "cherry":', list4[:3])

```

- By leaving out the end value, the range will go on to the end of the list:
- Example:
- This example returns the items from "cherry" and to the end:

```python
print('Items from "cherry" and to the end:', list4[2:])

```

- Range of Negative Indexes
- Specify negative indexes if you want to start the search from the end of the list:
- Example:
- This example returns the items from index -4 (included) to index -1 (excluded)

```python
print('Items from index -4 (included) to index -1 (excluded):', list4[-4:-1])

```

- Change Item Value
- To change the value of a specific item, refer to the index number:
- Example:
- Change the second item:

```python
list4[1] = 'blackcurrant'
print('Change the second item:', list4)
```

- Change a Range of Item Values
- To change the value of items within a specific range, define a list with the new values, and refer to the range of
  index numbers where you want to insert the new values:
- Example:
- Change the values "banana" and "cherry" with the values "blackcurrant" and "watermelon":

```python
list4[1:3] = ['blackcurrant', 'watermelon']
print('Change the values "banana" and "cherry" with the values "blackcurrant" and "watermelon":', list4)
```

- If you insert more items than you replace, the new items will be inserted where you specified, and the remaining items
  will move accordingly:
- Example:
- Change the second value by replacing it with two new values:

```python
list4[1:2] = ['blackcurrant', 'watermelon']
print('Change the second value by replacing it with two new values:', list4)
```

- Note: The length of the list will change when the number of items inserted does not match the number of items
  replaced.
- If you insert fewer items than you replace, the new items will be inserted where you specified, and the remaining
  items will move accordingly:
- Example:
- Change the second and third value by replacing it with one value:

```python
list4[1:3] = ['blackcurrant']
print('Change the second and third value by replacing it with one value:', list4)
```

- Insert Items
- To insert a new list item, without replacing any of the existing values, we can use the insert() method.
- The insert() method inserts an item at the specified index:
- Example:
- Insert "orange" as the third item:

```python
list4.insert(2, 'orange')
print('Insert "orange" as the third item:', list4)
```

- Append Items
- To add an item to the end of the list, use the append() method:
- Example:
- Append "orange" to the end of the list:

```python
list4.append('orange')
print('Append "orange" to the end of the list:', list4)
```

- Extend List
- To append elements from another list to the current list, use the extend() method.
- Example:
- Add the elements of tropical to thislist:

```python
tropical = ['mango', 'pineapple', 'papaya']
list4.extend(tropical)
print('Add the elements of tropical to list4:', list4)
```

- Remove Item
- There are several methods to remove items from a list:
- The remove() method removes the specified item:
- Example:
- Remove "banana":

```python
list4.remove('banana')
print('Remove "banana":', list4)
```

- The pop() method removes the specified index, (or the last item if index is not specified):
- Example:
- Remove the second item:

```python
list4.pop(1)
print('Remove the second item:', list4)
```

- If you do not specify the index, the pop() method removes the last item:
- Example:
- Remove the last item:

```python
list4.pop()
print('Remove the last item:', list4)
```

- The del keyword removes the specified index:
- Example:
- Remove the first item:

```python
del list4[0]
print('Remove the first item:', list4)
```

- The del keyword can also delete the list completely:
- Example:
- Delete the entire list:

```python
del list4
print('Delete the entire list:', list4)  
```

- This will raise an error because "list4" no longer exists.
- The clear() method empties the list:
- Example:
- Clear the list content:

```python
tropical.clear()
print('Clear the list content:', tropical)
```

- Loop Through a List
- You can loop through the list items by using a for loop:
- Example:
- Print all items in the list, one by one:

```python
tropical1 = ['mango', 'pineapple', 'papaya']
for x in tropical1:
    print('tropical1:', x)
```    

- You will learn more about for loops in the next chapter.
- Loop Through the Index Numbers
- You can also loop through the list items by referring to their index number.
- Use the range() and len() functions to create a suitable iterable.
- Example:
- Print all items by referring to their index number:

```python
for i in range(len(tropical1)):
    print('tropical1:', tropical1[i])
```    

- The iterable created in the example above is [0, 1, 2].
- Example Explained
- tropical1 = ['mango', 'pineapple', 'papaya']
- tropical1[0] = 'mango'
- tropical1[1] = 'pineapple'
- tropical1[2] = 'papaya'
- Check if Item Exists
- To determine if a specified item is present in a list use the in keyword:
- Example:
- Check if "apple" is present in the list:

```python
if 'apple' in tropical1:
    print('Yes, "apple" is in the tropical1 list')
else:
    print('No, "apple" is not in the tropical1 list')
```

- List Length
- To determine how many items a list has, use the len() method:
- Example:
- Print the number of items in the list:

```python
print('Number of items in the list:', len(tropical1))

```

- List Methods
- Python has a set of built-in methods that you can use on lists.
- Method Description
- append()    Adds an element at the end of the list
- clear()    Removes all the elements from the list
- copy()    Returns a copy of the list
- count()    Returns the number of elements with the specified value
- extend()    Add the elements of a list (or any iterable), to the end of the current list
- index()    Returns the index of the first element with the specified value
- insert()    Adds an element at the specified position
- pop()    Removes the element at the specified position
- remove()    Removes the first item with the specified value
- reverse()    Reverses the order of the list
- sort()    Sorts the list
- Note: Python does not have built-in support for Arrays, but Python Lists can be used instead.
- List Comprehension
- List comprehension offers a shorter syntax when you want to create a new list based on the values of an existing list.
- Example:
- Based on a list of fruits, you want a new list, containing only the fruits with the letter "a" in the name.
- Without list comprehension you will have to write a for statement with a conditional test inside:
- Example:

```python
newlist = []
for x in fruits:
    if 'a' in x:
        newlist.append(x)
print('newlist:', newlist)
```

- With list comprehension you can do all that with only one line of code:
- Example:

```python
newlist1 = [x for x in fruits if 'a' in x]
print('newlist1:', newlist1)
```

- The Syntax
- newlist = [expression for item in iterable if condition == True]
- The return value is a new list, leaving the old list unchanged.

- The expression is the current item in the iteration, but it is also the outcome, which you can manipulate before it
  ends up like a list item in the new list.
- Example:
- You can use the range() function to create an iterable:

- Example:

```python
newlist2 = [x for x in range(10)]
print('newlist2:', newlist2)
```

- The iterable can be any iterable object, like a list, tuple, set etc.
- Example:
- Accept only numbers lower than 5:

```python
newlist3 = [x for x in range(10) if x < 5]
print('newlist3:', newlist3)
```

- The expression can also contain conditions, not like a filter, but as a way to manipulate the outcome.
- Example:
- Set the values in the new list to upper case:

```python
newlist4 = [x.upper() for x in fruits]
print('newlist4:', newlist4)
```

- You can set the outcome to whatever you like:
- Example:
- Set all values in the new list to 'hello':

```python
newlist5 = ['hello' for x in fruits]
print('newlist5:', newlist5)
```

- The expression can also contain conditions, not like a filter, but as a way to manipulate the outcome.
- Example:
- Return "orange" instead of "banana":

```python
newlist6 = [x if x != 'banana' else 'orange' for x in fruits]
print('newlist6:', newlist6)
```

- Sort Lists
- List objects have a sort() method that will sort the list alphanumerically, ascending, by default:
- Example:
- Sort the list alphabetically:

```python
fruits.sort()
print('Sort the list alphabetically:', fruits)
- Example:
- Sort
the
list
numerically:
```python
list2.sort()
print('Sort the list numerically:', list2)
```

- Sort Descending
- To sort descending, use the keyword argument reverse = True:
- Example:
- Sort the list descending:

```python
fruits.sort(reverse=True)
print('Sort the list descending:', fruits)
```

- Customize Sort Function
- You can also customize your own function by using the keyword argument key = function.
- The function will return a number that will be used to sort the list (the lowest number first):
- Example:
- Sort the list based on how close the number is to 50:

```python
def myfunc(n):
    return abs(n - 50)


list2 = [100, 50, 65, 82, 23]
list2.sort(key=myfunc)
print('Sort the list based on how close the number is to 50:', list2)
```

- Case Insensitive Sort
- By default the sort() method is case sensitive, resulting in all capital letters being sorted before lower case
  letters:
- Example:
- Case sensitive sorting can give an unexpected result:

```python
list3 = ['banana', 'Orange', 'Kiwi', 'cherry']
list3.sort()
print('Case sensitive sorting can give an unexpected result:', list3)
```

- Luckily we can use built-in functions as key functions when sorting a list.
- So if you want a case-insensitive sort function, use str.lower as a key function:
- Example:
- Perform a case-insensitive sort of the list:

```python
list3.sort(key=str.lower)
print('Perform a case-insensitive sort of the list:', list3)
```

- Reverse Order
- What if you want to reverse the order of a list, regardless of the alphabet?
- The reverse() method reverses the current sorting order of the elements.
- Example:
- Reverse the order of the list items:

```python
list3.reverse()
print('Reverse the order of the list items:', list3)
```

- Copy a List
- You cannot copy a list simply by typing list2 = list1, because: list2 will only be a reference to list1, and changes
  made in list1 will automatically also be made in list2.
- There are ways to make a copy, one way is to use the built-in List method copy().
- Example:
- Make a copy of a list with the copy() method:

```python
list4 = list3.copy()
print('Make a copy of a list with the copy() method:', list4)
```

- Another way to make a copy is to use the built-in method list().
- Example:
- Make a copy of a list with the list() method:

```python
list5 = list(list4)
print('Make a copy of a list with the list() method:', list5)
```

- Join Two Lists
- There are several ways to join, or concatenate, two or more lists in Python.
- One of the easiest ways are by using the + operator.
- Example:
- Join two list:

```python
list6 = list3 + fruits
print('Join two list:', list6)
```

- Another way to join two lists are by appending all the items from list2 into list1, one by one:
- Example:
- Append list2 into list1:

```python
for x in list2:
    list3.append(x)
print('Append list2 into list1:', list3)
```

- Or you can use the extend() method, which purpose is to add elements from one list to another list:
- Example:
- Use the extend() method to add list2 at the end of list1:

```python
list3.extend(list2)
print('Use the extend() method to add list2 at the end of list1:', list3)
```

- Code Explaining Lists  
  ***06-pythonListAws.py***
  ```python
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
  ```

  ***Command:***
  ```
  ubuntu@shellscripting:~/python$ python3 06-pythonListAws.py
  
  ```
  ***Output:***
  ```
  Region:  ['us-east-1', 'us-west-2', 'us-west-1', 'eu-west-1', 'eu-central-1', 'ap-southeast-1', 'ap-southeast-2', 'ap-northeast-1', 'sa-east-1']
  Region Sorted:  ['ap-northeast-1', 'ap-southeast-1', 'ap-southeast-2', 'eu-central-1', 'eu-west-1', 'sa-east-1', 'us-east-1', 'us-west-1', 'us-west-2']
  Region Appended:  ['ap-northeast-1', 'ap-southeast-1', 'ap-southeast-2', 'eu-central-1', 'eu-west-1', 'sa-east-1', 'us-east-1', 'us-west-1', 'us-west-2', 'ap-south-1']
  Region Removed:  ['ap-northeast-1', 'ap-southeast-1', 'ap-southeast-2', 'eu-central-1', 'eu-west-1', 'sa-east-1', 'us-east-1', 'us-west-1', 'us-west-2']
  Region Reversed:  ['us-west-2', 'us-west-1', 'us-east-1', 'sa-east-1', 'eu-west-1', 'eu-central-1', 'ap-southeast-2', 'ap-southeast-1', 'ap-northeast-1']
  Region Count:  1
  Region Index:  4
  Region Popped:  ['us-west-2', 'us-west-1', 'us-east-1', 'sa-east-1', 'eu-west-1', 'eu-central-1', 'ap-southeast-2', 'ap-southeast-1']
  Region Inserted:  ['us-west-2', 'us-west-1', 'us-east-1', 'sa-east-1', 'eu-west-1', 'ap-south-1', 'eu-central-1', 'ap-southeast-2', 'ap-southeast-1']
  Region Extended:  ['us-west-2', 'us-west-1', 'us-east-1', 'sa-east-1', 'eu-west-1', 'ap-south-1', 'eu-central-1', 'ap-southeast-2', 'ap-southeast-1', 'ca-central-1', 'ap-northeast-2', 'ap-northeast-3', 'eu-north-1']
  Region Cleared:  []
  Region Copied:  ['us-east-1', 'us-west-2', 'us-west-1', 'eu-west-1', 'eu-central-1', 'ap-southeast-1', 'ap-southeast-2', 'ap-northeast-1', 'sa-east-1']
  Region Deleted:  ['us-east-1', 'us-west-2', 'us-west-1', 'eu-west-1', 'eu-central-1', 'ap-southeast-2', 'ap-northeast-1', 'sa-east-1']
  Region Sliced:  ['us-west-1', 'eu-west-1', 'eu-central-1']
  us-east-1
  us-west-2
  us-west-1
  eu-west-1
  eu-central-1
  ap-southeast-2
  ap-northeast-1
  sa-east-1
  ```

  ***07-python-os-sys-time.py***
  ```python
  import time
  import os
  import sys
  
  # Python time
  print("Current Time: ", time.time())    # This will return the current time in seconds since the epoch
  print("Current Time: ", time.localtime())   # This will return the current time in a time.struct_time object
  print("Current Time: ", time.asctime()) # This will return the current time in a string format
  print("Current Time: ", time.ctime())    # This will return the current time in
  print("Current Time: ", time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))  # This will return the current time in the specified format
  print("Current Time: ", time.strptime("2020-01-01 12:00:00", "%Y-%m-%d %H:%M:%S"))    # This will return the time.struct_time object from the string in the specified format
  
  # Python os
  print("Current Directory: ", os.getcwd())    # This will return the current working directory
  print("List Directory: ", os.listdir())  # This will return the list of files in the directory
  print("List Environment: ", os.environ)   # This will return the environment variables
  print("List Environment: ", os.environ['HOME'])   # This will return the value of the specified environment variable
  print("List Environment: ", os.getenv('HOME'))   # This will return the value of the specified environment variable
  print("List Environment: ", os.getenv('HOME', 'Not Found'))   # This will return the value of the specified environment variable or the default value if not found
  print("List Environment: ", os.path.exists('/etc/passwd'))    # This will return True if the path exists
  print("List Environment: ", os.path.isfile('/etc/passwd'))    # This will return True if the path is a file
  print("List Environment: ", os.path.isdir('/etc/passwd')) # This will return True if the path is a directory
  print("List Environment: ", os.path.getsize('/etc/passwd'))   # This will return the size of the file in bytes
  print("List Environment: ", os.path.getatime('/etc/passwd'))  # This will return the last access time of the file
  print("List Environment: ", os.path.getmtime('/etc/passwd'))  # This will return the last modification time of the file
  print("List Environment: ", os.path.getctime('/etc/passwd'))  # This will return the creation time of the file
  print("List Environment: ", os.path.join('/etc', 'passwd'))   # This will join the paths with the correct separator
  print("List Environment: ", os.path.split('/etc/passwd')) # This will split the path into the directory and the file
  print("List Environment: ", os.path.splitext('/etc/passwd'))  # This will split the path into the file and the extension
  print("List Environment: ", os.path.abspath('passwd'))    # This will return the absolute path of the file
  print("List Environment: ", os.path.dirname('/etc/passwd'))    # This will return the directory of the file
  print("List Environment: ", os.path.basename('/etc/passwd'))   # This will return the file of the file
  print("List Environment: ", os.path.commonpath(['/etc/passwd', '/etc/hosts']))    # This will return the common path of the files
  print("List Environment: ", os.path.commonprefix(['/etc/passwd', '/etc/hosts']))   # This will return the common prefix of the files
  print("List Environment: ", os.path.relpath('/etc/passwd', '/etc'))    # This will return the relative path of the file
  print("List Environment: ", os.path.normpath('/etc/passwd/../hosts'))    # This will return the normalized path of the file
  print("List Environment: ", os.path.realpath('/etc/passwd'))    # This will return the real path of the file
  print("List Environment: ", os.path.expanduser('~/passwd'))    # This will expand the user path
  print("List Environment: ", os.path.expandvars('$HOME/passwd'))    # This will expand the environment variables
  print("List Environment: ", os.path.getlogin())    # This will return the login name of the user
  print("List Environment: ", os.getpid())   # This will return the process id
  print("List Environment: ", os.getppid())  # This will return the parent process id
  print("List Environment: ", os.getuid())   # This will return the user id
  print("List Environment: ", os.getgid())   # This will return the group id
  print("List Environment: ", os.geteuid())  # This will return the effective user id
  print("List Environment: ", os.getegid())  # This will return the effective group id
  print("List Environment: ", os.getgroups())    # This will return the list of group ids
  print("List Environment: ", os.getloadavg())   # This will return the load average
  print("List Environment: ", os.getpriority(os.PRIO_PROCESS, 0))    # This will return the priority of the process
  print("List Environment: ", os.getresuid())    # This will return the real, effective and saved user ids
  print("List Environment: ", os.getresgid())    # This will return the real, effective and saved group ids
  print("List Environment: ", os.setresuid(1000, 1000, 1000))    # This will set the real, effective and saved user ids
  print("List Environment: ", os.setresgid(1000, 1000, 1000))    # This will set the real, effective and saved group ids
  print("List Environment: ", os.getresuid())    # This will return the real, effective and saved user ids
  print("List Environment: ", os.getresgid())    # This will return the real, effective and saved group ids
  print("List Environment: ", os.setuid(1000))    # This will set the user id
  print("List Environment: ", os.setgid(1000))    # This will set the group id
  print("List Environment: ", os.seteuid(1000))   # This will set the effective user id
  print("List Environment: ", os.setegid(1000))   # This will set the effective group id
  
  # Python sys
  print("Python Version: ", sys.version)    # This will return the Python version
  print("Python Version: ", sys.version_info)   # This will return the Python version in a tuple
  print("Python Path: ", sys.path)    # This will return the Python path
  print("Python Platform: ", sys.platform)    # This will return the Python platform
  print("Python Executable: ", sys.executable)    # This will return the Python executable
  print("Python Prefix: ", sys.prefix)    # This will return the Python prefix
  print("Python Byte Order: ", sys.byteorder)    # This will return the Python byte order
  print("Python Max Size: ", sys.maxsize)    # This will return the Python max size
  print("Python Max Unicode: ", sys.maxunicode)    # This will return the Python max unicode
  print("Python Modules: ", sys.modules)    # This will return the Python modules
  
  # Python sys.argv
  print("Python Arguments: ", sys.argv)    # This will return the Python arguments
  print("Python Arguments: ", sys.argv[0]) # This will return the Python script name
  print("Python Arguments: ", sys.argv[1]) # This will return the first argument
  print("Python Arguments: ", sys.argv[2]) # This will return the second argument
  print("Python Arguments: ", sys.argv[3]) # This will return the third argument
  
  # Python sys.stdin
  print("Python Standard Input: ", sys.stdin)   # This will return the standard input
  print("Python Standard Input: ", sys.stdin.readline())    # This will read the standard input
  print("Python Standard Input: ", sys.stdin.readlines())   # This will read the standard input
  print("Python Standard Input: ", sys.stdin.read())    # This will read the standard
  
  # Python sys.stdout
  print("Python Standard Output: ", sys.stdout) # This will return the standard output
  print("Python Standard Output: ", sys.stdout.write("Hello World\n"))    # This will write the standard output
  print("Python Standard Output: ", sys.stdout.writelines(["Hello World\n", "Hello World\n"]))    # This will write the standard
  
  # Python sys.stderr
  print("Python Standard Error: ", sys.stderr) # This will return the standard error
  print("Python Standard Error: ", sys.stderr.write("Hello World\n"))    # This will write the standard error
  print("Python Standard Error: ", sys.stderr.writelines(["Hello World\n", "Hello World\n"]))    # This will write the standard
  
  # Python sys.exit
  sys.exit(0) # This will exit the program with the specified exit code
  print("Hello World")    # This will not be executed as the program has exited
  ```
  ***08-pyList.py***
  ```python
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
  ```

## 3.4. Python Tuple and SET:

- Python Tuple Explonation with Example Code
- A tuple is a collection which is ordered and unchangeable. In Python tuples are written with round brackets.

***Example***

- Create a Tuple:

```python
thistuple = ("apple", "banana", "cherry")
print(thistuple)
```

- Note: The tuple is ordered, meaning that the items have a defined order, and that order will not change.
  ***Output***

```
```

- ('apple', 'banana', 'cherry')

- Access Tuple Items
- You can access tuple items by referring to the index number, inside square brackets:

```python
thistuple = ("apple", "banana", "cherry")
print(thistuple[1])
```

***Output***

```
banana

```

- Negative Indexing
- Negative indexing means beginning from the end, -1 refers to the last item, -2 refers to the second last item etc.

```python
thistuple = ("apple", "banana", "cherry")
print(thistuple[-1])
```

***Output***

```
cherry

```

- Range of Indexes
- You can specify a range of indexes by specifying where to start and where to end the range.
- When specifying a range, the return value will be a new tuple with the specified items.

```python
thistuple = ("apple", "banana", "cherry", "orange", "kiwi", "melon", "mango")
print(thistuple[2:5])
```

***Output***

```
('cherry', 'orange', 'kiwi')

```

- Range of Negative Indexes
- Specify negative indexes if you want to start the search from the end of the tuple:

```python
thistuple = ("apple", "banana", "cherry", "orange", "kiwi", "melon", "mango")
print(thistuple[-4:-1])
```

***Output***

```
('orange', 'kiwi', 'melon')

```

- Change Tuple Values
- Once a tuple is created, you cannot change its values. Tuples are unchangeable, or immutable as it also is called.
- But there is a workaround. You can convert the tuple into a list, change the list, and convert the list back into a
  tuple.

```python
x = ("apple", "banana", "cherry")
y = list(x)
y[1] = "kiwi"
x = tuple(y)
print(x)
```

***Output***

```
('apple', 'kiwi', 'cherry')

```

- Loop Through a Tuple
- You can loop through the tuple items by using a for loop.

```python
thistuple = ("apple", "banana", "cherry")
for x in thistuple:
    print(x)
```

***Output***

```
apple
banana
cherry
```

- Check if Item Exists
- To determine if a specified item is present in a tuple use the in keyword:

```python
thistuple = ("apple", "banana", "cherry")
if "apple" in thistuple:
    print("Yes, 'apple' is in the fruits tuple")
```

***Output***

```
Yes, 'apple' is in the fruits tuple

```

- Tuple Length
- To determine how many items a tuple has, use the len() method:

```python
thistuple = ("apple", "banana", "cherry")
print(len(thistuple))
```

***Output***

```
3

```

- Add Items
- Once a tuple is created, you cannot add items to it. Tuples are unchangeable.
- But there is a workaround. You can convert the tuple into a list, add items to the list, and convert the list back
  into a tuple.

```python
x = ("apple", "banana", "cherry")
y = list(x)
y.append("orange")
x = tuple(y)
print(x)
```

***Output***

```
('apple', 'banana', 'cherry', 'orange')

```

- Remove Items
- Tuples are unchangeable, so you cannot remove items from it, but you can use the same workaround as we used for
  changing and adding tuple items:

```python
x = ("apple", "banana", "cherry")
y = list(x)
y.remove("apple")
x = tuple(y)
print(x)
```

***Output***

```
('banana', 'cherry')

```

- The del keyword can delete the tuple completely:

```python
thistuple = ("apple", "banana", "cherry")
del thistuple
print(thistuple) - this
will
raise an
error
because
the
tuple
no
longer
exists
```

***Output***

```
Traceback (most recent call last):
File "demo_tuple.py", line 3, in <module>
```

- Join Two Tuples
- To join two or more tuples you can use the + operator:

```python
tuple1 = ("a", "b", "c")
tuple2 = (1, 2, 3)
tuple3 = tuple1 + tuple2
print(tuple3)
```

***Output***

```
('a', 'b', 'c', 1, 2, 3)

```

- The tuple() Constructor
- It is also possible to use the tuple() constructor to make a tuple.

```python
thistuple = tuple(("apple", "banana", "cherry")) - note
the
double
round - brackets
print(thistuple)
```

***Output***

```
('apple', 'banana', 'cherry')

```

- Tuple Methods
- Python has two built-in methods that you can use on tuples.
- Method Description
- count()    Returns the number of times a specified value occurs in a tuple
- index()    Searches the tuple for a specified value and returns the position of where it was found
  ***Example***
- Using the count() method:

```python
thistuple = (1, 3, 7, 8, 7, 5, 4, 6, 8, 5)
x = thistuple.count(5)
print(x)
```

***Output***

```
2

```

- Using the index() method:

```python
thistuple = (1, 3, 7, 8, 7, 5, 4, 6, 8, 5)
x = thistuple.index(8)
print(x)
```

***Output***

```
3

```

- Tuple with one item
- To create a tuple with only one item, you have to add a comma after the item, otherwise Python will not recognize it
  as a tuple.

```python
thistuple = ("apple",)
print(type(thistuple))
```

***Output***

```
<class 'tuple'>

```

- NOT a tuple

```python
thistuple = ("apple")
print(type(thistuple))
```

***Output***

```
<class 'str'>

```

- Set
- A set is a collection which is both unordered and unindexed.
- Sets are written with curly brackets.
  ***Example***
- Create a Set:

```python
thisset = {"apple", "banana", "cherry"}
print(thisset)
```

***Output***

```
{'cherry', 'banana', 'apple'}

```

- Note: Sets are unordered, so you cannot be sure in which order the items will appear.

- Access Items
- You cannot access items in a set by referring to an index or a key.
- But you can loop through the set items using a for loop, or ask if a specified value is present in a set, by using the
  in keyword.
  ***Example***
- Loop through the set, and print the values:

```python
thisset = {"apple", "banana", "cherry"}
for x in thisset:
    print(x)
```

***Output***

```
cherry
banana
apple
```

***Example***

- Check if "banana" is present in the set:

```python
thisset = {"apple", "banana", "cherry"}
print("banana" in thisset)
```

***Output***

```
True

```

- Change Items
- Once a set is created, you cannot change its items, but you can add new items.
- Add Items
- To add one item to a set use the add() method.
- To add more than one item to a set use the update() method.
  ***Example***
- Add an item to a set, using the add() method:

```python
thisset = {"apple", "banana", "cherry"}
thisset.add("orange")
print(thisset)
```

***Output***

```
{'cherry', 'orange', 'banana', 'apple'}

```

***Example***

- Add multiple items to a set, using the update() method:

```python
thisset = {"apple", "banana", "cherry"}
thisset.update(["orange", "mango", "grapes"])
print(thisset)
```

***Output***

```
{'orange', 'banana', 'grapes', 'apple', 'mango', 'cherry'}

```

- Get the Length of a Set
- To determine how many items a set has, use the len() method.
  ***Example***
- Get the number of items in a set:

```python
thisset = {"apple", "banana", "cherry"}
print(len(thisset))
```

***Output***

```
3

```

- Remove Item
- To remove an item in a set, use the remove(), or the discard() method.
  ***Example***
- Remove "banana" by using the remove() method:

```python
thisset = {"apple", "banana", "cherry"}
thisset.remove("banana")
print(thisset)
```

***Output***

```
{'cherry', 'apple'}

```

- Note: If the item to remove does not exist, remove() will raise an error.

***Example***

- Remove "banana" by using the discard() method:

```python
thisset = {"apple", "banana", "cherry"}
thisset.discard("banana")
print(thisset)
```

***Output***

```
{'cherry', 'apple'}

```

- Note: If the item to remove does not exist, discard() will NOT raise an error.

- You can also use the pop(), method to remove an item, but this method will remove the last item. Remember that sets
  are unordered, so you will not know what item that gets removed.
- The return value of the pop() method is the removed item.
  ***Example***
- Remove the last item by using the pop() method:

```python
thisset = {"apple", "banana", "cherry"}
x = thisset.pop()
print(x)
print(thisset)
```

***Output***

```
cherry
{'banana', 'apple'}
```

***Example***

- The clear() method empties the set:

```python
thisset = {"apple", "banana", "cherry"}
thisset.clear()
print(thisset)
```

***Output***

```
set()

```

***Example***

- The del keyword will delete the set completely:

```python
thisset = {"apple", "banana", "cherry"}
del thisset
print(thisset)
```

***Output***

```
NameError: name 'thisset' is not defined

```

- Join Two Sets
- There are several ways to join two or more sets in Python.
- You can use the union() method that returns a new set containing all items from both sets, or the update() method that
  inserts all the items from one set into another:
  ***Example***
- The union() method returns a new set with all items from both sets:

```python
set1 = {"a", "b", "c"}
set2 = {1, 2, 3}
set3 = set1.union(set2)
print(set3)
```

***Output***

```
{1, 2, 3, 'c', 'b', 'a'}

```

***Example***

- The update() method inserts the items in set2 into set1:

```python
set1 = {"a", "b", "c"}
set2 = {1, 2, 3}
set1.update(set2)
print(set1)
```

***Output***

```
{1, 2, 3, 'c', 'b', 'a'}

```

- Note: Both union() and update() will exclude any duplicate items.

- The set methods are well described in the Python documentation:

- Method Description
- add()    Adds an element to the set
- clear()    Removes all the elements from the set
- copy()    Returns a copy of the set
- difference()    Returns a set containing the difference between two or more sets
- difference_update()    Removes the items in this set that are also included in another, specified set
- discard()    Remove the specified item
- intersection()    Returns a set, that is the intersection of two other sets
- intersection_update()    Removes the items in this set that are not present in other, specified set(s)
- isdisjoint()    Returns whether two sets have a intersection or not
- issubset()    Returns whether another set contains this set or not
- issuperset()    Returns whether this set contains another set or not
- pop()    Removes an element from the set
- remove()    Removes the specified element
- symmetric_difference()    Returns a set with the symmetric differences of two sets
- symmetric_difference_update()    inserts the symmetric differences from this set and another
- union()    Return a set containing the union of sets
- update()    Update the set with the union of this set and others
  ***Example***
- The copy() method copies the set.

```python
thisset = {"apple", "banana", "cherry"}
myset = thisset.copy()
print(myset)
```

***Output***

```
{'cherry', 'banana', 'apple'}

```

***Example***

- The difference() method returns a set that contains the difference between two sets.
- Meaning: The returned set contains items that exist only in the first set, and not in both sets.

```python
set1 = {"apple", "banana", "cherry"}
set2 = {"google", "microsoft", "apple"}
set3 = set1.difference(set2)
print(set3)
```

***Output***

```
{'banana', 'cherry'}

***Example***
- The difference_update() method removes the items that exist in both sets.
- The difference_update() method is different from the difference() method, because the difference() method returns a new set, without the unwanted items, and the difference_update() method removes the unwanted items from the original set.
```python
set1 = {"apple", "banana", "cherry"}
set2 = {"google", "microsoft", "apple"}
set1.difference_update(set2)
print(set1)
```

***Output***

```
{'banana', 'cherry'}

```

***Example***

- The intersection() method returns a set that contains the similarity between two or more sets.
- Meaning: The returned set contains only items that exist in both sets, or in all sets if the comparison is done with
  more than two sets.

```python
set1 = {"apple", "banana", "cherry"}
set2 = {"google", "microsoft", "apple"}
set3 = set1.intersection(set2)
print(set3)
```

***Output***

```
{'apple'}

```

***Example***

- The intersection_update() method removes the items that is not present in both sets (or in all sets if the comparison
  is done between more than two sets).
- The intersection_update() method is different from the intersection() method, because the intersection() method
  returns a new set, without the unwanted items, and the intersection_update() method removes the unwanted items from
  the original set.

```python
set1 = {"apple", "banana", "cherry"}
set2 = {"google", "microsoft", "apple"}
set1.intersection_update(set2)
print(set1)
```

***Output***

```
{'apple'}

```

***Example***

- The isdisjoint() method returns True if none of the items are present in both sets, otherwise it returns False.

```python
set1 = {"apple", "banana", "cherry"}
set2 = {"google", "microsoft", "facebook"}
x = set1.isdisjoint(set2)
print(x)
```

***Output***

```
True

```

***Example***

- The issubset() method returns True if all items in the set exists in the specified set, otherwise it retuns False.

```python
set1 = {"a", "b", "c"}
set2 = {"f", "e", "d", "c", "b", "a"}
x = set1.issubset(set2)
print(x)
```

***Output***

```
True

```

***Example***

- The issuperset() method returns True if all items in the specified set exists in the original set, otherwise it retuns
  False.

```python
set1 = {"f", "e", "d", "c", "b", "a"}
set2 = {"a", "b", "c"}
x = set1.issuperset(set2)
print(x)
```

***Output***

```
True

```

***Example***

- The symmetric_difference() method returns a set that contains all items from both set, but not the items that are
  present in both sets.
- Meaning: The returned set contains a mix of items that are not present in both sets.

```python
set1 = {"apple", "banana", "cherry"}
set2 = {"google", "microsoft", "apple"}
set3 = set1.symmetric_difference(set2)
print(set3)
```

***Output***

```
{'banana', 'cherry', 'google', 'microsoft'}

```

***Example***

- The symmetric_difference_update() method updates the original set by removing items that are present in both sets, and
  inserting the other items.

```python
set1 = {"apple", "banana", "cherry"}
set2 = {"google", "microsoft", "apple"}
set1.symmetric_difference_update(set2)
print(set1)
```

***Output***

```
{'microsoft', 'banana', 'cherry', 'google'}

```

***Example***

- The union() method returns a set that contains all items from the original set, and all items from the specified sets.
- You can specify as many sets you want, separated by commas.

```python
set1 = {"a", "b", "c"}
set2 = {1, 2, 3}
set3 = {4, 5, 6}
set4 = set1.union(set2, set3)
print(set4)
```

***Output***

```
{1, 2, 3, 4, 5, 6, 'c', 'b', 'a'}

```

## 3.5. Python Dictionary:

- Dictionary
- Dictionary is a collection which is unordered, changeable and indexed. In Python dictionaries are written with curly
  brackets, and they have keys and values.

***Example***

- Create and print a dictionary:

```python
thisdict = {
    "brand": "Ford",
    "model": "Mustang",
    "year": 1964
}
print(thisdict)
```

***Output:***

```
{'brand': 'Ford', 'model': 'Mustang', 'year': 1964}

```

- Dictionary Items
- Dictionary items are ordered, changeable, and does not allow duplicates.

- Dictionary items are presented in key:value pairs, and can be referred to by using the key name.

***Example***

- Print the "brand" value of the dictionary:

```python
print(thisdict["brand"])
```

***Output:***

```
Ford

```

- Ordered or Unordered?
- As of Python version 3.7, dictionaries are ordered. In Python 3.6 and earlier, dictionaries are unordered.

- Changeable
- Dictionaries are changeable, meaning that we can change, add or remove items after the dictionary has been created.

***Example***

- Change the "year" to 2018:

```python
thisdict["year"] = 2018
print(thisdict)
```

***Output:***

```
{'brand': 'Ford', 'model': 'Mustang', 'year': 2018}

```

- Dictionary Length
- To determine how many items a dictionary has, use the len() function:

***Example***

- Print the number of items in the dictionary:

```python
print(len(thisdict))

```

***Output:***

```
3

```

- Dictionary Items - Data Types
- The values in dictionary items can be of any data type:

***Example***

- String, int, boolean, and list data types:

```python
thisdict1 = {
    "brand": "Ford",
    "electric": False,
    "year": 1964,
    "colors": ["red", "white", "blue"]
}
print(thisdict1)
```

***Output:***

```
{'brand': 'Ford', 'electric': False, 'year': 1964, 'colors': ['red', 'white', 'blue']}

```

- type() function
- From Python's perspective, dictionaries are defined as objects with the data type 'dict':
- <class 'dict'>
  ***Example***
- Print the data type of a dictionary:

```python
print(type(thisdict1))

```

***Output:***

```
<class 'dict'>

```

- Python - Access Dictionary Items
- Accessing Items
- You can access the items of a dictionary by referring to its key name, inside square brackets:

***Example***

- Get the value of the "model" key:

```python
x = thisdict1["model"]
print(x)
```

***Output:***

```
1964

```

- There is also a method called get() that will give you the same result:

***Example***

- Get the value of the "model" key:

```python
x = thisdict1.get("model")
print(x)
```

***Output:***

```
1964

```

- Get Keys
- The keys() method will return a list of all the keys in the dictionary.

***Example***

- Get a list of the keys:

```python
x = thisdict1.keys()
print(x)
```

***Output:***

```
dict_keys(['brand', 'electric', 'year', 'colors'])

```

- The list of the keys is a view of the dictionary, meaning that any changes done to the dictionary will be reflected in
  the keys list.

- Add a new item to the original dictionary, and see that the keys list gets updated as well:

***Example***

- Add a new item to the original dictionary, and see that the keys list gets updated as well:

```python
thisdict1["color"] = "red"
print(x)
```

***Output:***

```
dict_keys(['brand', 'electric', 'year', 'colors', 'color'])

```

- Get Values
- The values() method will return a list of all the values in the dictionary.

***Example***

- Get a list of the values:

```python
x = thisdict1.values()
print(x)
```

***Output:***

```
dict_values(['Ford', False, 1964, ['red', 'white', 'blue'], 'red'])

```

- The list of the values is a view of the dictionary, meaning that any changes done to the dictionary will be reflected
  in the values list.

- Make a change in the original dictionary, and see that the values list gets updated as well:

***Example***

- Make a change in the original dictionary, and see that the values list gets updated as well:

```python
thisdict1["year"] = 2018
print(x)
```

***Output:***

```
dict_values(['Ford', False, 2018, ['red', 'white', 'blue'], 'red'])

```

- Get Items
- The items() method will return each item in a dictionary, as tuples in a list.

***Example***

- Get a list of the key:value pairs

```python
x = thisdict1.items()
print(x)
```

***Output:***

```
dict_items([('brand', 'Ford'), ('electric', False), ('year', 2018), ('colors', ['red', 'white', 'blue']), ('color', 'red')])

```

- The returned list is a view of the items of the dictionary, meaning that any changes done to the dictionary will be
  reflected in the items list.


- Check if Key Exists
- To determine if a specified key is present in a dictionary use the in keyword:

***Example***

- Check if "model" is present in the dictionary:

```python
if "model" in thisdict1:
    print("Yes, 'model' is one of the keys in the thisdict dictionary")
else:
    print("No, 'model' is not one of the keys in the thisdict dictionary")
```    

***Output:***

```
Yes, 'model' is one of the keys in the thisdict dictionary

```

- Change Dictionary Items
- Change Values
- You can change the value of a specific item by referring to its key name:

***Example***

- Change the "year" to 2018:

```python
thisdict1["year"] = 2018
print(thisdict1)
```

***Output:***

```
{'brand': 'Ford', 'electric': False, 'year': 2018, 'colors': ['red', 'white', 'blue'], 'color': 'red'}

```

- Update Dictionary
- The update() method will update the dictionary with the items from the given argument.

- The argument must be a dictionary, or an iterable object with key:value pairs.

***Example***

- Update the "year" of the car by using the update() method:

```python
thisdict1.update({"year": 2020})
print(thisdict1)
```

***Output:***

```
{'brand': 'Ford', 'electric': False, 'year': 2020, 'colors': ['red', 'white', 'blue'], 'color': 'red'}

```

- Add Dictionary Items
- Adding Items
- Adding an item to the dictionary is done by using a new index key and assigning a value to it:

***Example***

- Add a color item to the dictionary by using a new key name:

```python
thisdict1["color"] = "red"
print(thisdict1)
```

***Output:***

```
{'brand': 'Ford', 'electric': False, 'year': 2020, 'colors': ['red', 'white', 'blue'], 'color': 'red'}

```

- Remove Dictionary Items
- Removing Items
- There are several methods to remove items from a dictionary:

***Example***

- The pop() method removes the item with the specified key name:

```python
thisdict1.pop("color")
print(thisdict1)
```

***Output:***

```
{'brand': 'Ford', 'electric': False, 'year': 2020, 'colors': ['red', 'white', 'blue']}

```

***Example***

- The popitem() method removes the last inserted item (in versions before 3.7, a random item is removed instead):

```python
thisdict1.popitem()
print(thisdict1)
```

***Output:***

```
{'brand': 'Ford', 'electric': False, 'year': 2020, 'colors': ['red', 'white', 'blue']}
```

***Example***

- The del keyword removes the item with the specified key name:

```python
del thisdict1["brand"]
print(thisdict1)
```

***Output:***

```
{'electric': False, 'year': 2020, 'colors': ['red', 'white', 'blue']}

```

***Example***

- The del keyword can also delete the dictionary completely:

```python
del thisdict1
print(thisdict1) 
```

- this will cause an error because "thisdict" no longer exists.
- Python Dictionary Examples    
  ***10-pythonDict.py***
  ```python
  # list inside a list in a dictionary
  # # Example
  # # The values in the dictionary can be of any data type:
  dict1 = {
      "brand": "Ford",
      "electric": False,
      "year": 1964,
      "colors": ["red", "white", "blue"],
      "services": [
          {"IaaS":["AWS", "Azure", "GCP"]},
          {"PaaS":["RDS", "DyDB", "EB"]},
          {"SaaS":["Chime", "Mail", "Xyz"]}
      ]
  }
  
  print(type(dict1))
  print(dict1)
  print(dict1["services"])
  print(dict1["services"][0])
  print(dict1["services"][1])
  print(dict1["services"][2])
  print(dict1["services"][0]["IaaS"])
  print(dict1["services"][1]["PaaS"])
  print(dict1["services"][2]["SaaS"])
  print(dict1["services"][0]["IaaS"][0])
  print(dict1["services"][0]["IaaS"][1])
  print(dict1["services"][0]["IaaS"][2])
  print(dict1["services"][1]["PaaS"][0])
  print(dict1["services"][1]["PaaS"][1])
  print(dict1["services"][1]["PaaS"][2])
  print(dict1["services"][2]["SaaS"][0])
  print(dict1["services"][2]["SaaS"][1])
  print(dict1["services"][2]["SaaS"][2])
  
  for key, value in dict1.items():
      print(key, value)
      if key == "services":
          for i in value:
              for k, v in i.items():
                  print(k, v)
                  for j in v:
                      print(j)
      else:
          print(value)
  ```
  ***Output***
  ```
  <class 'dict'>
  {'brand': 'Ford', 'electric': False, 'year': 1964, 'colors': ['red', 'white', 'blue'], 'services': [{'IaaS': ['AWS', 'Azure', 'GCP']}, {'PaaS': ['RDS', 'DyDB', 'EB']}, {'SaaS': ['Chime', 'Mail', 'Xyz']}]}
  [{'IaaS': ['AWS', 'Azure', 'GCP']}, {'PaaS': ['RDS', 'DyDB', 'EB']}, {'SaaS': ['Chime', 'Mail', 'Xyz']}]
  {'IaaS': ['AWS', 'Azure', 'GCP']}
  {'PaaS': ['RDS', 'DyDB', 'EB']}
  {'SaaS': ['Chime', 'Mail', 'Xyz']}
  ['AWS', 'Azure', 'GCP']
  ['RDS', 'DyDB', 'EB']
  ['Chime', 'Mail', 'Xyz']
  AWS
  Azure
  GCP
  RDS
  DyDB
  EB
  Chime
  Mail
  Xyz
  brand Ford
  electric False
  year 1964
  colors ['red', 'white', 'blue']
  services [{'IaaS': ['AWS', 'Azure', 'GCP']}, {'PaaS': ['RDS', 'DyDB', 'EB']}, {'SaaS': ['Chime', 'Mail', 'Xyz']}]
  IaaS ['AWS', 'Azure', 'GCP']
  AWS
  Azure
  GCP
  PaaS ['RDS', 'DyDB', 'EB']
  RDS
  DyDB
  EB
  SaaS ['Chime', 'Mail', 'Xyz']
  Chime
  Mail
  Xyz
  ```
  ***11-Python VpcDetails.py***
  ```
  # Python Code to fetch the details of the VPCs in the region
  
  import boto3
  import json
  def region_list():
      ec2 = boto3.client('ec2' , region_name='us-east-1')
      response = ec2.describe_regions()
      region_list = []
      for region in response['Regions']:
          region_list.append(region['RegionName'])
      return region_list
  
  def main():
      for region in region_list():
          ec2 = boto3.client('ec2', region_name=region)
          response = ec2.describe_vpcs().get('Vpcs')
          print('-'*20 + 'Region:'+ region + '-'*20)
          for vpc in response:
              # print(f"VPC ID: {vpc.get('VpcId')} with CIDR: {vpc.get('CidrBlock')} in region: {region}")
              print(f"VpcId: {vpc.get('VpcId')} with CidrBlock: {vpc.get('CidrBlock')}")
              
  
  if __name__ == '__main__':
      main()
  ```
  ***Output:***
  ```
  (awsProject) ubuntu@shellscripting:~/python$ python3 11-PythonVpcDetails.py
  --------------------Region:ap-south-1--------------------
  VpcId: vpc-0471febd7c5844ce8 with CidrBlock: 172.31.0.0/16
  --------------------Region:eu-north-1--------------------
  VpcId: vpc-0b93e9e809362000a with CidrBlock: 172.31.0.0/16
  --------------------Region:eu-west-3--------------------
  VpcId: vpc-0506d62bec218afc9 with CidrBlock: 172.31.0.0/16
  --------------------Region:eu-west-2--------------------
  VpcId: vpc-0c2b4827dc0683349 with CidrBlock: 172.31.0.0/16
  --------------------Region:eu-west-1--------------------
  VpcId: vpc-07aab6270e86f86b8 with CidrBlock: 172.31.0.0/16
  --------------------Region:ap-northeast-3--------------------
  VpcId: vpc-0fcab97bb3e74e44b with CidrBlock: 172.31.0.0/16
  --------------------Region:ap-northeast-2--------------------
  VpcId: vpc-04e8052d89bc16231 with CidrBlock: 172.31.0.0/16
  --------------------Region:ap-northeast-1--------------------
  VpcId: vpc-0eec83afeda89edae with CidrBlock: 172.31.0.0/16
  --------------------Region:ca-central-1--------------------
  VpcId: vpc-0181d58473b9af32b with CidrBlock: 172.31.0.0/16
  --------------------Region:sa-east-1--------------------
  VpcId: vpc-09333555a54eb07c7 with CidrBlock: 172.31.0.0/16
  --------------------Region:ap-southeast-1--------------------
  VpcId: vpc-0ac23815b1a3bd722 with CidrBlock: 172.31.0.0/16
  --------------------Region:ap-southeast-2--------------------
  VpcId: vpc-0cc729daba17f34c2 with CidrBlock: 172.31.0.0/16
  --------------------Region:eu-central-1--------------------
  VpcId: vpc-0c804487de4885a6c with CidrBlock: 172.31.0.0/16
  --------------------Region:us-east-1--------------------
  VpcId: vpc-0c9b8e8edd97d425a with CidrBlock: 10.88.0.0/16
  VpcId: vpc-02b48296aa54f91c7 with CidrBlock: 10.1.0.0/16
  --------------------Region:us-east-2--------------------
  VpcId: vpc-0c291bff74ff23073 with CidrBlock: 172.31.0.0/16
  --------------------Region:us-west-1--------------------
  VpcId: vpc-0b7c13d6119f67226 with CidrBlock: 172.31.0.0/16
  --------------------Region:us-west-2--------------------
  VpcId: vpc-08815e8601b5dfb89 with CidrBlock: 172.31.0.0/16
  ```

  ***15-pythonBoto3.py***
  ```python
  import boto3
  
  ec2 = boto3.client('ec2', region_name="us-east-1")
  Regions = ec2.describe_regions().get('Regions')
  
  # Print the Region names
  for Region in Regions:
      print(Region['RegionName'])
  
  # Output
  '''
  ap-south-1
  eu-north-1
  eu-west-3
  eu-west-2
  eu-west-1
  ap-northeast-3
  ap-northeast-2
  ap-northeast-1
  ca-central-1
  sa-east-1
  ap-southeast-1
  ap-southeast-2
  eu-central-1
  us-east-1
  us-east-2
  us-west-1
  us-west-2
  '''
  # Append the Region names to a list without a list comprehension
  Region_List = []
  for Region in Regions:
      Region_List.append(Region['RegionName'])
  
  print(Region_List)
      
  # Output
  '''
  ['ap-south-1', 'eu-north-1', 'eu-west-3', 'eu-west-2', 'eu-west-1', 'ap-northeast-3', 'ap-northeast-2', 'ap-northeast-1', 'ca-central-1', 'sa-east-1', 'ap-southeast-1', 'ap-southeast-2', 'eu-central-1', 'us-east-1', 'us-east-2', 'us-west-1', 'us-west-2']
  '''
  
  # appending the Region names to list with a list comprehension
  Region_List1 = [Region['RegionName'] for Region in Regions]
  print(Region_List1)
  
  # Output
  '''
  ['ap-south-1', 'eu-north-1', 'eu-west-3', 'eu-west-2', 'eu-west-1', 'ap-northeast-3', 'ap-northeast-2', 'ap-northeast-1', 'ca-central-1', 'sa-east-1', 'ap-southeast-1', 'ap-southeast-2', 'eu-central-1', 'us-east-1', 'us-east-2', 'us-west-1', 'us-west-2']
  '''
  ```

## 3.6. Python Functions:

- Python Functions

- A function is a block of code which only runs when it is called. You can pass data, known as parameters, into a
  function. A function can return data as a result.

- Creating a Function
- In Python a function is defined using the def keyword:

- Calling a Function
- To call a function, use the function name followed by parenthesis:

```python
def my_function():
    print("Hello from a function")


my_function()
```

***Output:***

```
Hello from a function

```

- Arguments
- Information can be passed into functions as arguments.

- Arguments are specified after the function name, inside the parentheses. You can add as many arguments as you want,
  just separate them with a comma.

- The following example has a function with one argument (fname). When the function is called, we pass along a first
  name, which is used inside the function to print the full name:

```python
def my_function(fname):
    print(fname + " Refsnes")


my_function("Emil")
my_function("Tobias")
my_function("Linus")
```

***Output:***

```
Emil Refsnes
Tobias Refsnes
Linus Refsnes
```

- Parameters or Arguments?
- The terms parameter and argument can be used for the same thing: information that are passed into a function.

- From a function's perspective:

- A parameter is the variable listed inside the parentheses in the function definition.

- An argument is the value that is sent to the function when it is called.

- Number of Arguments
- By default, a function must be called with the correct number of arguments. Meaning that if your function expects 2
  arguments, you have to call the function with 2 arguments, not more, and not less.

- This function expects 2 arguments, and gets 2 arguments:

```python
def my_function(fname, lname):
    print(fname + " " + lname)


my_function("Emil", "Refsnes")
```

***Output:***

```
Emil Refsnes

```

- If you try to call the function with 1 or 3 arguments, you will get an error:

- This function expects 2 arguments, but gets only 1:

```python
def my_function(fname, lname):
    print(fname + " " + lname)


my_function("Emil")
```

***Output:***

```
TypeError: my_function() missing 1 required positional argument: 'lname'

```

- Arbitrary Arguments, *args
- If you do not know how many arguments that will be passed into your function, add a * before the parameter name in the
  function definition.

- This way the function will receive a tuple of arguments, and can access the items accordingly:

```python
def my_function(*kids):
    print("The youngest child is " + kids[2])


my_function("Emil", "Tobias", "Linus")
```

***Output:***

```
The youngest child is Linus

```

- Arbitrary Keyword Arguments, **kwargs
- If you do not know how many keyword arguments that will be passed into your function, add two asterisk: ** before the
  parameter name in the function definition.

- This way the function will receive a dictionary of arguments, and can access the items accordingly:

```python
def my_function(**kid):
    print("His last name is " + kid["lname"])


my_function(fname="Tobias", lname="Refsnes")
```

***Output:***

```
His last name is Refsnes

```

- Default Parameter Value
- The following example shows how to use a default parameter value.

- If we call the function without argument, it uses the default value:

```python
def my_function(country="Norway"):
    print("I am from " + country)


my_function("Sweden")
my_function("India")
my_function()
my_function("Brazil")
```

***Output:***

```
I am from Sweden
I am from India
I am from Norway
I am from Brazil
```

- Passing a List as an Argument
- You can send any data types of argument to a function (string, number, list, dictionary etc.), and it will be treated
  as the same data type inside the function.

- E.g. if you send a List as an argument, it will still be a List when it reaches the function:

```python
def my_function(food):
    for x in food:
        print(x)


fruits = ["apple", "banana", "cherry"]

my_function(fruits)
```

***Output:***

```
apple
banana
cherry
```

- Return Values
- To let a function return a value, use the return statement:

```python
def my_function(x):
    return 5 * x


print(my_function(3))
print(my_function(5))
print(my_function(9))
```

***Output:***

```
15
25
45
```

- The pass Statement
- function definitions cannot be empty, but if you for some reason have a function definition with no content, put in
  the pass statement to avoid getting an error.

```python
def myfunction():
    pass
```

- Recursion
- Python also accepts function recursion, which means a defined function can call itself.

- Recursion is a common mathematical and programming concept. It means that a function calls itself. This has the
  benefit of meaning that you can loop through data to reach a result.

- The developer should be very careful with recursion as it can be quite easy to slip into writing a function which
  never terminates, or one that uses excess amounts of memory or processor power. However, when written correctly
  recursion can be a very efficient and mathematically-elegant approach to programming.

- In this example, tri_recursion() is a function that we have defined to call itself ("recurse"). We use the k variable
  as the data, which decrements (-1) every time we recurse. The recursion ends when the condition is not greater than
  0 (i.e. when it is 0).

```python
def tri_recursion(k):
    if (k > 0):
        result = k + tri_recursion(k - 1)
        print(result)
    else:
        result = 0
    return result


print("\n\nRecursion Example Results")
tri_recursion(6)
```

***Output:***

```
1
3
6
10
15
21
Recursion Example Results
21
21
21
21
```

- Note: In this example, the recursion ends when k is not greater than 0, i.e. when it is 0. This means that the
  function will return 0 when the recursion ends.
- Python Function Examples.
  ***17-pythonFunEvnOdd.py***
  ```python
  # Python Function Even odd
  
  def even_odd(num1, num2):
      for i in range(num1, num2):
          if i % 2 == 0:
              print(f"{i} is even")
          else:
              print(f"{i} is odd")
  
  even_odd(1, 10)
  ```
  ***Output:***
  ```
  1 is odd
  2 is even
  3 is odd
  4 is even
  5 is odd
  6 is even
  7 is odd
  8 is even
  9 is odd
  ```
  ***18-pyFuncAddMul.py***
  ```python
  # Function for adding two numbers and multiplying two numbers
  
  def add(num1, num2):
      return num1 + num2
  
  def mul(num1, num2):
      return num1 * num2
  
  def add_mul(add, mul, num3, num4):
      x = add(num3, num4)
      y = mul(num3, num4)
      return x, y
  
  print(add_mul(add, mul, 3, 4))
  ```
  ***Output:***
  ```
  (7, 12)
  ```
  ***19-pyFuncAddMul.py***
  ```python
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
  ```
  ***Output:***
  ```
  (7, 12)
  ```
  ***20-pythonClass.py***
  ```python
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
  ```
  ***Output:***
  ```
  7
  -1
  12
  ```
  ***22-pythonForAWS.py***
  ```python
  import boto3
  import json
  
  def region_list():
      ec2 = boto3.client('ec2' , region_name='us-east-1')
      response = ec2.describe_regions()
      region_list = []
      for region in response['Regions']:
          region_list.append(region['RegionName'])
      return region_list
  
  def vpc_list(region):
      ec2 = boto3.client('ec2' , region_name=region)
      response = ec2.describe_vpcs()
      vpc_list = []
      for vpc in response['Vpcs']:
          vpc_list.append(vpc['VpcId'])
      return vpc_list
  
  def check_cidr_block(region):
      cidr = str(input("Enter the CIDR block: "))
      ec2 = boto3.client('ec2' , region_name=region)
      response = ec2.describe_vpcs()
      cidr_block = [vpc['CidrBlock'] for vpc in response['Vpcs']]
      if cidr in cidr_block:
          return f"VPC with CIDR {cidr} exists in region {region} -----> you can't use this CIDR"
      else:
          return f"VPC with CIDR {cidr} does not exist in region {region} -----> you can create a VPC with this CIDR"
      
  def main():
      print(region_list())
      region = str(input("Enter the region: "))
      if region not in region_list():
          print("Invalid region")
      else:
          print(vpc_list(region))
          print(check_cidr_block(region))
  
  if __name__ == '__main__':
      main()
  ```

## 3.7. python FastAPI

- Now create one venv for FastAPI
  ```shell
  mkdir WorkSpace/Projects/fastAPI
  python3 -m venv  WorkSpace/Projects/fastAPI
  source  WorkSpace/Projects/fastAPI/bin/activate
  ```
- Now we have created the fast api Venv and not pip packages in it for now.  
  ***Command:***
  ```shell
  (fastAPI) ubuntu@shellscripting:~$ pip list
  
  ```
  ***Output:***
  ```
  Package Version
  ------- -------
  pip     24.0
  ```
- Now we install FAST API Required packages
  ```
  (fastAPI) ubuntu@shellscripting:~$ pip install boto3 fastapi uvicorn["full"] ipython
  
  ```
  ***Command:***
  ```
  (fastAPI) ubuntu@shellscripting:~$ pip list
  
  ```
  ***Output:***
  ```
  Package           Version
  ----------------- -------
  annotated-types   0.7.0
  anyio             4.4.0
  click             8.1.7
  fastapi           0.114.2
  h11               0.14.0
  idna              3.10
  pip               24.0
  pydantic          2.9.1
  pydantic_core     2.23.3
  sniffio           1.3.1
  starlette         0.38.5
  typing_extensions 4.12.2
  uvicorn           0.30.6
  ```
- Now we will code for the basic fastAPI
  ***23-fastAPIapp.py***
  ```python
  # Importing boto3 module from boto3 package
  import boto3
  
  # Importing FastAPI module from fastapi package
  from fastapi import FastAPI
  
  # Creating an instance of FastAPI class
  app = FastAPI()
  
  # Creating a home page for the FastAPI application
  @app.get('/')
  def home():
      return {
          "message": "Welcome to the Python Practice with FastAPI",
          "description": "This is a simple FastAPI application",
          "month": "September",
          "year": 2024
      }
  ```
- Now we will start the app using uvicorn
  ```
  (fastAPI) ubuntu@shellscripting:~/python$ uvicorn 23-fastAPIapp:app --port 8000 --reload
  
  ```
  ### OR
  ```
  (fastAPI) ubuntu@shellscripting:~/python$ uvicorn 23-fastAPIapp:app --host 0.0.0.0 --port 8000 --reload
  
  ```
  ***Output:***
  ```
  INFO:     Will watch for changes in these directories: ['/home/ubuntu/WorkSpace/DevSecOps2024/02-PythonScripting']
  INFO:     Uvicorn running on http://127.0.0.1:8000 (Press CTRL+C to quit)
  INFO:     Started reloader process [1343] using StatReload
  INFO:     Started server process [1345]
  INFO:     Waiting for application startup.
  INFO:     Application startup complete.
  
  ```
- Now browse the application with IP:8000  
  ![012](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Python_Scripting/Notes-Images/01-499/012.png)

- Now we will update this with the pokemon and vpc list and see
  ***23-fastAPIapp.py***
  ```python
  # Importing boto3 module from boto3 package
  import boto3
  
  # Importing requests module from requests package
  import requests
  
  # Importing FastAPI module from fastapi package
  from fastapi import FastAPI
  
  # Creating an instance of FastAPI class
  app = FastAPI()
  
  # Creating a home page for the FastAPI application
  @app.get('/')
  def home():
      return {
          "message": "Welcome to the Python Practice with FastAPI",
          "description": "This is a simple FastAPI application",
          "author": "Anil Kumar Reddy",
          "month": "September",
          "year": 2024
      }
  
  @app.get('/pokemon')
  def get_pokemon():
      pokemon_list = []
      get_data = requests.get('https://pokeapi.co/api/v2/pokemon?limit=5&offset=10')
      for i in get_data.json()['results']:
          pokemon_list.append(i['name'])
      return pokemon_list
  
  @app.get('/vpcs/{region}')
  def get_vpcs(region: str):
      vpc_list = []
      ec2 = boto3.client('ec2', region_name=region)
      for vpc in ec2.describe_vpcs()['Vpcs']:
          vpc_list.append(vpc['VpcId'])
      return vpc_list
  ```
- Now we will start the app using uvicorn  
  ***Command:***
  ```
  (fastAPI) ubuntu@shellscripting:~/python$ uvicorn 23-fastAPIapp:app --host 0.0.0.0 --port 8000 --reload
  
  ```
- Now if you browse the application with below url you will get pokemon and VPCs
  ```
  http://3.82.28.32:8000/pokemon

  ```
  ![013](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Python_Scripting/Notes-Images/01-499/013.png)
  ```
  http://3.82.28.32:8000/vpcs/us-east-1

  ```
  ![014](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Python_Scripting/Notes-Images/01-499/014.png)

- Now to make front end look wise good we need to add few things.
  ```
  http://3.82.28.32:8000/docs

  ```
  ![015](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Python_Scripting/Notes-Images/01-499/015.png)
