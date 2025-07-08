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
