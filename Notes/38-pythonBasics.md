# Basics of Python 
## Using Boto3 Library
  1. Python 3 Download and Install it.
  2. VS Code.
  3. Install Python Virtual Environment
  4. Install Python Libraries boto3, IPython, requests, fastapi, uvicorn
  5. Understanding Python Data Types like strings, int, lists, dict, sets
  6. Access AWS API with Boto3 Methods.

## Installing Python and VSCode.
- You know how to instal it

## Install Python Virtual Environment
  - ***Command:***
    ```
    madireddydevops@MadireddyOmen:~$ python3 --version
    
    ```
  - ***Output:***
    ```
    Python 3.12.3
    
    ```
  - ***Command:***
    ```
    madireddydevops@MadireddyOmen:~$ pip --version
    
    ```
  - ***Output:***
    ```
    
    pip 24.0 from /usr/lib/python3/dist-packages/pip (python 3.12)
    ```
  - ***Command:***
    ```
    sudo apt install python3-virtualenv
    ```

  - ***Command:***
    ```
    madireddydevops@MadireddyOmen:~$ pip list
  
    ```
  - ***Output:***
    ```
    Package             Version
    ------------------- -------------
    attrs               23.2.0
    Automat             22.10.0
    Babel               2.10.3
    bcrypt              3.2.2
    blinker             1.7.0
    certifi             2023.11.17
    chardet             5.2.0
    click               8.1.6
    cloud-init          24.1.3
    colorama            0.4.6
    command-not-found   0.3
    configobj           5.0.8
    constantly          23.10.4
    cryptography        41.0.7
    dbus-python         1.3.2
    distlib             0.3.8
    distro              1.9.0
    distro-info         1.7+build1
    filelock            3.13.1
    httplib2            0.20.4
    hyperlink           21.0.0
    idna                3.6
    incremental         22.10.0
    Jinja2              3.1.2
    jsonpatch           1.32
    jsonpointer         2.0
    jsonschema          4.10.3
    launchpadlib        1.11.0
    lazr.restfulclient  0.14.6
    lazr.uri            1.0.6
    markdown-it-py      3.0.0
    MarkupSafe          2.1.5
    mdurl               0.1.2
    netifaces           0.11.0
    oauthlib            3.2.2
    pip                 24.0
    platformdirs        4.2.0
    pyasn1              0.4.8
    pyasn1-modules      0.2.8
    pycurl              7.45.3
    Pygments            2.17.2
    PyGObject           3.48.2
    PyHamcrest          2.1.0
    PyJWT               2.7.0
    pyOpenSSL           23.2.0
    pyparsing           3.1.1
    pyrsistent          0.20.0
    pyserial            3.5
    python-apt          2.7.7+ubuntu1
    pytz                2024.1
    PyYAML              6.0.1
    requests            2.31.0
    rich                13.7.1
    service-identity    24.1.0
    setuptools          68.1.2
    six                 1.16.0
    systemd-python      235
    Twisted             24.3.0
    typing_extensions   4.10.0
    ubuntu-pro-client   8001
    unattended-upgrades 0.1
    urllib3             2.0.7
    virtualenv          20.25.0+ds
    wadllib             1.3.6
    wheel               0.42.0
    zope.interface      6.1
    ```
  - ***Command:*** 
    ```
    madireddydevops@MadireddyOmen:~$ mkdir -p pythonVenv/BOTO3
    madireddydevops@MadireddyOmen:~$ python3 -m venv ./pythonVenv/BOTO3/
    ```
  - ***Command:***
    ```
    madireddydevops@MadireddyOmen:~/pythonVenv/BOTO3$ ls -lrth
    
    ```
  - ***Output:***
    ```
    total 16K
    lrwxrwxrwx 1 madireddydevops madireddydevops    3 Sep  4 13:24 lib64 -> lib
    drwxr-xr-x 3 madireddydevops madireddydevops 4.0K Sep  4 13:24 lib
    drwxr-xr-x 3 madireddydevops madireddydevops 4.0K Sep  4 13:24 include
    -rw-r--r-- 1 madireddydevops madireddydevops  177 Sep  4 13:26 pyvenv.cfg
    drwxr-xr-x 2 madireddydevops madireddydevops 4.0K Sep  4 13:26 bin
    ```
- To activate the Virtual Environment in Python
  - ***Command:***
    ```
    madireddydevops@MadireddyOmen:~$ source pythonVenv/BOTO3/bin/activate
    
    ```
- Now list in the BOTO3
  - ***Command:***
    ```
    (BOTO3) madireddydevops@MadireddyOmen:~$ pip list
    ```
  - ***Output:***
    ```
    Package Version
    ------- -------
    pip     24.0
    ```
- Now we will install pip packages using requirements.txt
  - ***Requirements.txt***
    ```
    boto==2.49.0
    ipython==8.27.0
    fastapi==0.112.2
    Faker==28.1.0
    requests==2.32.3
    python-dotenv==1.0.1
    botocore==1.35.11
    jupyter==1.1.1
    ```
  - ***Command:***
    ```
    (BOTO3) madireddydevops@MadireddyOmen:~$ pip install -r pythonVenv/BOTO3/req.txt
    #By this command not only given packages dependencies also will get installed
    ```
  - ***Output:***
    ```
    Successfully installed Faker-28.1.0 annotated-types-0.7.0 anyio-4.4.0 asttokens-2.4.1 boto-2.49.0 botocore-1.35.11 certifi-2024.8.30 charset-normalizer-3.3.2 decorator-5.1.1 executing-2.1.0 fastapi-0.112.2 idna-3.8 ipython-8.27.0 jedi-0.19.1 jmespath-1.0.1 matplotlib-inline-0.1.7 parso-0.8.4 pexpect-4.9.0 prompt-toolkit-3.0.47 ptyprocess-0.7.0 pure-eval-0.2.3 pydantic-2.8.2 pydantic-core-2.20.1 pygments-2.18.0 python-dateutil-2.9.0.post0 python-dotenv-1.0.1 requests-2.32.3 six-1.16.0 sniffio-1.3.1 stack-data-0.6.3 starlette-0.38.4 traitlets-5.14.3 typing-extensions-4.12.2 urllib3-2.2.2 wcwidth-0.2.13
    
    ```
- Now if you list in BOTO3 Venv the pakages will be listed.
  - ***Commadn:***
    ```
    (BOTO3) madireddydevops@MadireddyOmen:~$ pip list
    
    ```
  - ***Output:***
    ```
    Package                   Version
    ------------------------- --------------
    annotated-types           0.7.0
    anyio                     4.4.0
    argon2-cffi               23.1.0
    argon2-cffi-bindings      21.2.0
    arrow                     1.3.0
    asttokens                 2.4.1
    async-lru                 2.0.4
    attrs                     24.2.0
    babel                     2.16.0
    beautifulsoup4            4.12.3
    bleach                    6.1.0
    boto                      2.49.0
    botocore                  1.35.11
    certifi                   2024.8.30
    cffi                      1.17.0
    charset-normalizer        3.3.2
    comm                      0.2.2
    debugpy                   1.8.5
    decorator                 5.1.1
    defusedxml                0.7.1
    executing                 2.1.0
    Faker                     28.1.0
    fastapi                   0.112.2
    fastjsonschema            2.20.0
    fqdn                      1.5.1
    h11                       0.14.0
    httpcore                  1.0.5
    httpx                     0.27.2
    idna                      3.8
    ipykernel                 6.29.5
    ipython                   8.27.0
    ipywidgets                8.1.5
    isoduration               20.11.0
    jedi                      0.19.1
    Jinja2                    3.1.4
    jmespath                  1.0.1
    json5                     0.9.25
    jsonpointer               3.0.0
    jsonschema                4.23.0
    jsonschema-specifications 2023.12.1
    jupyter                   1.1.1
    jupyter_client            8.6.2
    jupyter-console           6.6.3
    jupyter_core              5.7.2
    jupyter-events            0.10.0
    jupyter-lsp               2.2.5
    jupyter_server            2.14.2
    jupyter_server_terminals  0.5.3
    jupyterlab                4.2.5
    jupyterlab_pygments       0.3.0
    jupyterlab_server         2.27.3
    jupyterlab_widgets        3.0.13
    MarkupSafe                2.1.5
    matplotlib-inline         0.1.7
    mistune                   3.0.2
    nbclient                  0.10.0
    nbconvert                 7.16.4
    nbformat                  5.10.4
    nest-asyncio              1.6.0
    notebook                  7.2.2
    notebook_shim             0.2.4
    overrides                 7.7.0
    packaging                 24.1
    pandocfilters             1.5.1
    parso                     0.8.4
    pexpect                   4.9.0
    pip                       24.0
    platformdirs              4.2.2
    prometheus_client         0.20.0
    prompt_toolkit            3.0.47
    psutil                    6.0.0
    ptyprocess                0.7.0
    pure_eval                 0.2.3
    pycparser                 2.22
    pydantic                  2.8.2
    pydantic_core             2.20.1
    Pygments                  2.18.0
    python-dateutil           2.9.0.post0
    python-dotenv             1.0.1
    python-json-logger        2.0.7
    PyYAML                    6.0.2
    pyzmq                     26.2.0
    referencing               0.35.1
    requests                  2.32.3
    rfc3339-validator         0.1.4
    rfc3986-validator         0.1.1
    rpds-py                   0.20.0
    Send2Trash                1.8.3
    setuptools                74.1.1
    six                       1.16.0
    sniffio                   1.3.1
    soupsieve                 2.6
    stack-data                0.6.3
    starlette                 0.38.4
    terminado                 0.18.1
    tinycss2                  1.3.0
    tornado                   6.4.1
    traitlets                 5.14.3
    types-python-dateutil     2.9.0.20240821
    typing_extensions         4.12.2
    uri-template              1.3.0
    urllib3                   2.2.2
    wcwidth                   0.2.13
    webcolors                 24.8.0
    webencodings              0.5.1
    websocket-client          1.8.0
    widgetsnbextension        4.0.13
    ```
- Deactivating the Virtual Environment BOTO3
  - ***Command:***
    ```
    (BOTO3) madireddydevops@MadireddyOmen:~$ deactivate
    
    ```
- Now listing pip see that less modules will be there
  - ***Command:***
    ```
    madireddydevops@MadireddyOmen:~$ pip list
    
    ```
  - ***Output:***
    ```
    Package             Version
    ------------------- -------------
    attrs               23.2.0
    Automat             22.10.0
    Babel               2.10.3
    bcrypt              3.2.2
    blinker             1.7.0
    certifi             2023.11.17
    chardet             5.2.0
    click               8.1.6
    cloud-init          24.1.3
    colorama            0.4.6
    command-not-found   0.3
    configobj           5.0.8
    constantly          23.10.4
    cryptography        41.0.7
    dbus-python         1.3.2
    distlib             0.3.8
    distro              1.9.0
    distro-info         1.7+build1
    filelock            3.13.1
    httplib2            0.20.4
    hyperlink           21.0.0
    idna                3.6
    incremental         22.10.0
    Jinja2              3.1.2
    jsonpatch           1.32
    jsonpointer         2.0
    jsonschema          4.10.3
    launchpadlib        1.11.0
    lazr.restfulclient  0.14.6
    lazr.uri            1.0.6
    markdown-it-py      3.0.0
    MarkupSafe          2.1.5
    mdurl               0.1.2
    netifaces           0.11.0
    oauthlib            3.2.2
    pip                 24.0
    platformdirs        4.2.0
    pyasn1              0.4.8
    pyasn1-modules      0.2.8
    pycurl              7.45.3
    Pygments            2.17.2
    PyGObject           3.48.2
    PyHamcrest          2.1.0
    PyJWT               2.7.0
    pyOpenSSL           23.2.0
    pyparsing           3.1.1
    pyrsistent          0.20.0
    pyserial            3.5
    python-apt          2.7.7+ubuntu1
    pytz                2024.1
    PyYAML              6.0.1
    requests            2.31.0
    rich                13.7.1
    service-identity    24.1.0
    setuptools          68.1.2
    six                 1.16.0
    systemd-python      235
    Twisted             24.3.0
    typing_extensions   4.10.0
    ubuntu-pro-client   8001
    unattended-upgrades 0.1
    urllib3             2.0.7
    virtualenv          20.25.0+ds
    wadllib             1.3.6
    wheel               0.42.0
    zope.interface      6.1
    ```
- Now we need to work on IPython but in normal env it is not listed
  - ***Command:***
    ```
    madireddydevops@MadireddyOmen:~$ pip list|grep -i python
    
    ```
  - ***Output:***
    ```
    dbus-python         1.3.2
    python-apt          2.7.7+ubuntu1
    systemd-python      235
    ```
- So again we move to BOTO3 Environment
  - ***Command:***
    ```
    madireddydevops@MadireddyOmen:~$ source pythonVenv/BOTO3/bin/activate
    
    ```
  - ***Output:****
    ```
    (BOTO3) madireddydevops@MadireddyOmen:~$
    
    ```
- Now we list it in BOTO3 Env
  - ***Command:***
    ```
    (BOTO3) madireddydevops@MadireddyOmen:~$ pip list|grep -i Ipython
    ```
  - ***Output:****
    ```
    
    ipython                   8.27.0
    ```
- Now we will go into IPython
  - ***Command:***
    ```
    (BOTO3) madireddydevops@MadireddyOmen:~$ python -m IPython
    
    ```
  - ***Output:***
    ```
    Python 3.12.3 (main, Jul 31 2024, 17:43:48) [GCC 13.2.0]
    Type 'copyright', 'credits' or 'license' for more information
    IPython 8.27.0 -- An enhanced Interactive Python. Type '?' for help.
    
    In [1]:
    ```
- Now we shall use sample code in here
- Now mainthing is with IPython is indentation is easy.
  ```
  (BOTO3) madireddydevops@MadireddyOmen:~$ python -m IPython
  Python 3.12.3 (main, Jul 31 2024, 17:43:48) [GCC 13.2.0]
  Type 'copyright', 'credits' or 'license' for more information
  IPython 8.27.0 -- An enhanced Interactive Python. Type '?' for help.
  
  In [1]: def hello(num):
     ...:     if num % 2 == 0:
     ...:         return f"{num} is an EVEN"
     ...:     else:
     ...:         return f"{num} is an ODD"
     ...:
  
  In [2]: hello(234)
  Out[2]: '234 is an EVEN'
  
  In [3]:
  ```
  ```
  In [12]: def hello(*nums):
    ...:     EVEN_NUM = []
    ...:     ODD_NUM = []
    ...:     for num in nums:
    ...:         if num % 2 == 0:
    ...:             EVEN_NUM.append(num)
    ...:         else:
    ...:             ODD_NUM.append(num)
    ...:     return f'The EVEN nums are {EVEN_NUM} &  The ODD nums are {ODD_NUM}'
    ...:

  In [13]: hello(1, 2, 3, 5, 66, 88, 99)
  Out[13]: 'The EVEN nums are [2, 66, 88] &  The ODD nums are [1, 3, 5, 99]'
  ```
## Python Strings
  - ***Single Line String:***
    ```
    name = 'Anil Kumar Reddy'
    name1 = "Madireddy Anil Kumar"
    ```
  - ***Multiline String:***
    ```
    name = '''
    Anil Kumar Reddy
    Madireddy Anil Kumar
    '''
    ```
```
```

## Python List
  ```
  aws_regions = ["us-east-1", "us-west-1", "us-west-2", "eu-west-1", "eu-central-1"]
  print("Type of aws_regions: ", type(aws_regions))   # Type of aws_regions:  <class 'list'>
  print("Regions:", aws_regions)  # Regions: ['us-east-1', 'us-west-1', 'us-west-2', 'eu-west-1', 'eu-central-1']
  print("First region:", aws_regions[0])  # First region: us-east-1
  print("Second region:", aws_regions[1]) # Second region: us-west-1
  print("Third region:", aws_regions[2])  # Third region: us-west-2
  print("Fourth region:", aws_regions[3]) # Fourth region: eu-west-1
  print("Fifth region:", aws_regions[4])  # Fifth region: eu-central-1
  print("Last region:", aws_regions[-1])  # Last region: eu-central-1
  print("Second to last region:", aws_regions[-2])    # Second to last region: eu-west-1
  print("Third to last region:", aws_regions[-3])     # Third to last region: us-west-2
  print("Fourth to last region:", aws_regions[-4])    # Fourth to last region: us-west-1
  print("Fifth to last region:", aws_regions[-5])     # Fifth to last region: us-east-1
  print("Second to fifth region:", aws_regions[2:5])  # Second to fifth region: ['us-west-2', 'eu-west-1', 'eu-central-1']
  print("Second to fourth region:", aws_regions[2:4]) # Second to fourth region: ['us-west-2', 'eu-west-1'] 
  print("First to fourth region:", aws_regions[:4])   # First to fourth region: ['us-east-1', 'us-west-1', 'us-west-2', 'eu-west-1']       
  print("Third to last region:", aws_regions[2:])     # Third to last region: ['us-west-2', 'eu-west-1', 'eu-central-1']
  print("Second to last region:", aws_regions[-4:-1]) # Second to last region: ['us-west-2', 'eu-west-1', 'eu-central-1']
  print("Third to last region:", aws_regions[-4:-2])  # Third to last region: ['us-west-2', 'eu-west-1']
  print("Fourth to last region:", aws_regions[-4:])   # Fourth to last region: ['us-west-2', 'eu-west-1', 'eu-central-1']
  print("Length of aws_regions:", len(aws_regions))   # Length of aws_regions: 5
  aws_regions.append("ap-southeast-1")    # Add an element to the end of the list using append method
  print("Regions:", aws_regions)  # Regions: ['us-east-1', 'us-west-1', 'us-west-2', 'eu-west-1', 'eu-central-1', 'ap-southeast-1']
  aws_regions.insert(2, "ap-southeast-2") # Add an element to a specific index using insert method
  print("Regions:", aws_regions)  # Regions: ['us-east-1', 'us-west-1', 'ap-southeast-2', 'us-west-2', 'eu-west-1', 'eu-central-1', 'ap-southeast-1']
  aws_regions.remove("us-west-2") # Remove an element by value
  print("Regions:", aws_regions)  # Regions: ['us-east-1', 'us-west-1', 'ap-southeast-2', 'eu-west-1', 'eu-central-1', 'ap-southeast-1']
  aws_regions.pop()   # Remove the last element
  print("Regions:", aws_regions)  # Regions: ['us-east-1', 'us-west-1', 'ap-southeast-2', 'eu-west-1', 'eu-central-1']
  aws_regions.pop(2)  # Remove an element by index
  print("Regions:", aws_regions)  # Regions: ['us-east-1', 'us-west-1', 'eu-west-1', 'eu-central-1']
  aws_regions.reverse()   # Reverse the list
  print("Regions:", aws_regions)  # Regions: ['eu-central-1', 'eu-west-1', 'us-west-1', 'us-east-1']
  aws_regions.sort()  # Sort the list
  print("Regions:", aws_regions)  # Regions: ['eu-central-1', 'eu-west-1', 'us-east-1', 'us-west-1']
  aws_regions.sort(reverse=True)  # Sort the list in reverse order
  print("Regions:", aws_regions)  # Regions: ['us-west-1', 'us-east-1', 'eu-west-1', 'eu-central-1']
  aws_regions.clear() # Remove all elements from the list
  print("Regions:", aws_regions)  # Regions: []
  # aws_regions[0] = "us-east-2" # This will throw an error as list is mutable
  ```

## Python Tuple:
  ```
  # Tuple:
  # 1. Tuple is a collection of items.
  # 2. Tuple is immutable. It means that we cannot change the elements of a tuple once it is assigned.
  # 3. Tuple is ordered. It means that the items have a defined order, and that order will not change.
  # 4. Tuple items are indexed, the first item has index [0], the second item has index [1] and so on.
  # 5. Tuple allows duplicate values.
  # 6. Tuple allows different data types.
  # 7. Tuple allows nested tuple.
  # 8. Tuple is written with round brackets.
  # # Create a Tuple:
  import sys
  tuple_1 = (1,2,3)
  size_of_tuple = sys.getsizeof(tuple_1)  # 72
  print("Tuple:",tuple_1)  # (1, 2, 3)
  # # Tuple allows duplicate values.
  tuple_2 = (1,2,3,1,2,3)
  print("Tuple:",tuple_2)  # (1, 2, 3, 1, 2, 3)
  # # Tuple allows different data types.
  tuple_3 = (1,2,3,"Hello","World")
  print("Tuple:",tuple_3)  # (1, 2, 3, 'Hello', 'World')
  # # Tuple allows nested tuple.
  tuple_4 = (1,2,3,(4,5,6))   # (1, 2, 3, (4, 5, 6))
  print("Tuple:",tuple_4) # (1, 2, 3, (4, 5, 6))
  # # Tuple is ordered. It means that the items have a defined order, and that order will not change.
  tuple_5 = (1,2,3)
  print("Tuple:",tuple_5)  # (1, 2, 3)
  # # Tuple items are indexed, the first item has index [0], the second item has index [1] and so on.
  print("Tuple:",tuple_5[0])    # 1
  print("Tuple:",tuple_5[1])    # 2
  print("Tuple:",tuple_5[2])    # 3
  # # Tuple is immutable. It means that we cannot change the elements of a tuple once it is assigned.
  # # tuple_5[0] = 4 # TypeError: 'tuple' object does not support item assignment
  # # Tuple is written with round brackets.
  tuple_6 = (1,2,3)
  print("Tuple:",tuple_6)  # (1, 2, 3)
  # # Tuple is written with round brackets.
  tuple_7 = 1,2,3
  print("Tuple:",tuple_7)  # (1, 2, 3)
  # # Tuple is written with round brackets.
  tuple_8 = (1)
  print("Tuple:",tuple_8)  # 1
  # # Tuple Methods:
  # # Tuple has only two methods. count() and index().
  # # count() method returns the number of times a specified value appears in the tuple.
  # # index() method returns the index of the specified value.
  
  # Tuple Operations:
  # # 1. Tuple Concatenation:
  tuple_9 = (1,2,3)
  tuple_10 = (4,5,6)
  tuple_11 = tuple_9 + tuple_10
  print("Tuple:",tuple_11)    # (1, 2, 3, 4, 5, 6)
  # # 2. Tuple Repetition:
  tuple_12 = (1,2,3)
  tuple_13 = tuple_12 * 3
  print("Tuple:",tuple_13)    # (1, 2, 3, 1, 2, 3, 1, 2, 3)
  # # 3. Tuple Membership:
  tuple_14 = (1,2,3)
  print(1 in tuple_14)    # True
  print(4 in tuple_14)    # False
  # # 4. Tuple Iteration:
  tuple_15 = (1,2,3)
  for i in tuple_15:
      print(i)
  # # 5. Tuple Length:
  tuple_16 = (1,2,3)
  print(len(tuple_16))    # 3
  # # 6. Tuple Slicing:
  tuple_17 = (1,2,3,4,5,6)
  print("Tuple:",tuple_17[1:4])  # (2, 3, 4)
  # # 7. Tuple Sorting:
  tuple_18 = (4,2,1,3,5)
  print("Tuple:",sorted(tuple_18))   # [1, 2, 3, 4, 5]
  # # 8. Tuple Reverse:
  tuple_19 = (1,2,3,4,5)
  print("Tuple:",tuple_19[::-1])    # (5, 4, 3, 2, 1)
  # # 9. Tuple Clear:
  # # tuple_19.clear() # AttributeError: 'tuple' object has no attribute 'clear'
  # # 10. Tuple Copy:
  tuple_20 = (1,2,3)
  tuple_21 = tuple_20
  print("Tuple:",tuple_21)    # (1, 2, 3)
  # # Tuple Unpacking:
  # # Tuple unpacking is also possible in Python.
  # # # Unpacking a Tuple:
  tuple_22 = (1,2,3)
  a,b,c = tuple_22
  print("Tuple:",a)   # 1
  print("Tuple:",b)   # 2
  print("Tuple:",c)   # 3
  # # Tuple Packing:
  # # Tuple packing is the reverse of tuple unpacking.
  # # # Packing a Tuple:
  a = 1
  b = 2
  c = 3
  tuple_23 = a,b,c
  print("Tuple:",tuple_23)    # (1, 2, 3)
  # # Tuple Comparison:
  # # Tuple comparison is similar to list comparison.
  # # # Compare two tuples:
  tuple_24 = (1,2,3)
  tuple_25 = (1,2,3)
  print(tuple_24 == tuple_25) # True
  ```


  

