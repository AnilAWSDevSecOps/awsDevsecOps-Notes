# LINUX Commands:


- ## 1. CHMOD Command
    ```shell
    # Give full permissions to a file
     chmod 777 [file_name]

    # Give full permissions to dir and its sub dirs&files
    chmod 777 -R [dir_name]

    # Give full permissions to user
    chmod u+rwx [file_name]

    # Give only write permissions to group and others
    chmod go-w [file_name]

    # Give only read & write permissions to user and  only read permissions to group and others
    chmod u+rw,go+r [file_name]

    # Give only Execute to all UGO
    chmod +x [file_name]
    ```


- ## 2. CHOWN Command 
    ```shell
    # Change owner and group to a file/dir
    chown user:Group [file-or-dir_name]

    # Change owner and group to dir and its sub dirs&files
    chown anil:Group1 -R [file-or-dir_name]
    ```


- ## 3. CP Command 
    ```shell
    # The `-R` option is typically used to indicate recursive copying for directories.
    cp -R Src_directory Dest_directory

    # regular copy
    cp [Source_file] [Destination_file]

    # Copy by preversion the timestamp and permissions
    cp -pr [Source_file] [Destination_file]

    # Copy by preserving the time stamp
    cp -p [Source_file] [Destination_file]

    # With this option cp Command shows its recursive behavior by copying the entire directory structure recursively
    cp -r [Directory_name1] [Directory_name2]

    # Copy interactively
    cp -i [Source_file] [Destination_file] 

    # Copy Non Interactively or Forcefully
    cp -f [Source_file] [Destination_file]
    ```


- ## 4. MV Command 
    ```shell
    # Recursively
    mv -R source1 source2 destination

    # Normally rename
    mv [source_file_name(s)] [Destination_file_name]

    # Interactively
    mv -i [source_file/directory_name(s)] [Destination_file/directory_name/path]

    # forcefully 
    mv -f [source_file/directory_name(s)] [Destination_file/directory_name/path]

    # With -n option, mv prevents an existing file from being overwritten
    mv -n [source_file/directory_name(s)] [Destination_file/directory_name/path]

    # With this option, it is easier to take a backup of an existing file that will be overwritten 
    # as a result of the mv command. This will create a backup file with the tilde character (~) appended to it
    mv -b [source_file/directory_name(s)] [Destination_file/directory_name/path]
    ```


- ## 5. LN Command
    ```shell
    # Softlink creation
    ln -s [target file] [name for the link]
    ln -s [target folder] [name for the link]

    # Unlink command
    unlink [name of the link file]
    ```


- ## 6. AWK Command 
    ```shell
    # prints every line of data from the specified file
    awk '{print}' [file_name]

    # Print the lines which match the given pattern
    awk '/manager/ {print}' [file_name]

    # Print lines where a column matches a value:
    awk '$2 == "value"' filename

    # Print non-empty lines with line number from original file
    awk 'NF {print NR ": " $0}' filename

    # Number only non-empty lines
    awk 'NF {print ++n ": " $0}' filename

    #  Match only whole word
    awk '/\berror\b/' filename

    # Match lines NOT containing a pattern (negation)
    awk '!/error/' filename
    
    # Match lines where a specific field matches a regex
    awk '/^ERROR/' filename     # Lines that start with "ERROR"
    awk '/failed$/' filename    # Lines that end with "failed"

    # Combine field comparison + regex
        # 2nd column is either "WARN" or "ERROR"
        # 1st column matches uppercase letters + digits (e.g. ABC123)
    awk '$2 ~ /WARN|ERROR/ && $1 ~ /^[A-Z]{3}[0-9]+$/' filename

    
    # Print non-empty lines and count them at the end
    awk 'NF {print; count++} END {print "Total non-empty lines:", count}' filename

    # Print non-empty lines that do not start with a comment (e.g., #)
    awk 'NF && $0 !~ /^[[:space:]]*#/' filename
    
    # Prints only first and 4th column
    awk '{print $1,$4}' [file_name]

    # Prints all the lines along with the line number
    awk '{print NR,$0}' [file_name] 

    # Below example $1 represents FIRST and $NF represents LAST.
    # Prints first and last columns
    awk '{print $1,$NF}' [file_name]

    # Print all columns:
    awk '{print $0}' somefile

    # Prints from row 3 to 6 along with row numbers  -(ROW), |(Column)
    awk 'NR==3, NR==6 {print NR,$0}' [file_name]

    To print the first item along with the row number(NR) separated with ” – “ from each line in [file_name]
    awk '{print NR "- " $1 }' [file_name]

    # Print all but the first column:
    awk '{$1=""; print $0}' somefile

    # Print all but the first two columns:
    awk '{$1=$2=""; print $0}' somefile

    # To print any non empty line if present
    awk 'NF < 0' [file_name]

    # To find the length of the longest line present in the file
    awk '{ if (length($0) > max) max = length($0) } END { print max }' [file_name]

    # To count the lines in a file
    awk 'END { print NR }' [file_name] 

    # To find/check for any string in any specific column
    awk '{ if($3 == "B6") print $0;}' [file_name]

    # To print the squares of first numbers from 1 to n say 6
    awk 'BEGIN { for(i=1;i<=6;i++) print "square of", i, "is",ii; }'
    ```


- ## 7. FIND Command
    ```shell
    # Syntax
    find [path] [options] [expression]

    # Examples
    find [path] -type f -name "*.txt"
    find [path] -type d -name "*.txt"
    find ~ -name "example.txt"
    find . -type d
    find ./ -type f -name "*.txt" -exec grep 'Geek'  {} \;

    #  To find files modified within the last 7 days
    find /path/to/search -mtime -7

    #  To find files modified within the first 7 days
    find /path/to/search -mtime +7

    #  To find files size >10mb
    find /path/to/search -size +10M

    #  To find files size <10mb
    find /path/to/search -size -10M

    # Find Type
    find /path/to/search -type [f|d|l]

    # Finding Files by Size c for bytes k for kilobytes M for megabytes G for gigabytes
    find /path/to/search -size [+|-]size[ckMG]

    # To find log files in /var/log larger than 50MB and older than 30 days
    find /var/log -type f -name "*.log" -size +50M -mtime +30

    # To find files either named example.txt or modified in the last 2 days
    find . -name "example.txt" -or -mtime -2

    # To search for all .log files in the /var directory but exclude the /var/log directory
    find /var -path "/var/log" -prune -o -type f -name "*.log" -print

    # To find all .txt files larger than 1MB and modified within the last 30 days
    find . -type f -name "*.txt" -size +1M -mtime -30

    # To find all files with 777 permissions (read, write, and execute for all users) 
    # in the /home/user directory
    find /home/user -type f -perm 777

    # To find all media files larger than 500MB and move them to the /backup directory
    find /path/to/search -type f \( -name "*.mp4" -o -name "*.mp3" -o -name "*.mkv" \) -size +500M -exec mv {} /backup \;

    # To find all files owned by the user john in the /home directory
    find /home -user john

    # To find and delete all temporary files (ending in .tmp) older than 7 days in the /tmp directory
    find /tmp -type f -name "*.tmp" -mtime +7 -exec rm {} \;

    # To move all .log files from /var/log to /backup/logs
    find /var/log -type f -name "*.log" -exec mv {} /backup/logs \;

    # To change the permissions of all .sh files to be executable
    find /path/to/search -type f -name "*.sh" -exec chmod +x {} \;

    # To rename all .txt files by adding a .bak extension
    find /path/to/search -type f -name "*.txt" -exec mv {} {}.bak \;

    # To delete .log files but ask for confirmation first
    find /var/log -type f -name "*.log" -ok rm {} \;

    # To compress all .log files larger than 100MB in the /var/log directory
    find /var/log -type f -name "*.log" -size +100M -exec gzip {} \;
    ```

- ## 8. GREP Command
    ```shell
    # Syntax
    grep [options] pattern [files]

    #####################################################################################
    # Options       Description
    # -c            This prints only a count of the lines that match a pattern
    # -h            Display the matched lines, but do not display the filenames.
    # –i            Ignores, case for matching
    # -l            Displays list of a filenames only.
    # -n            Display the matched lines and their line numbers.
    # -v            This prints out all the lines that do not matches the pattern
    # -e            exp Specifies expression with this option. Can use multiple times.
    # -f            file    Takes patterns from file, one per line.
    # -E            Treats pattern as an extended regular expression (ERE)
    # -w            Match whole word
    # -o            Print only the matched parts of a matching line, with each such part on a separate output line.
    # -A n          Prints searched line and nlines after the result.
    # -B n          Prints searched line and n line before the result.
    # -C n          Prints searched line and n lines after before the result.
    #####################################################################################

    # Display the File Names that Matches the Pattern Using grep
    grep -l "unix" *

    # To search for a string in your current directory and all other subdirectories
    grep -r "string-name" *

    # Not Ignoring casesensitive
    grep "linux" file name

    # Ignoring casesensitive
    grep -i "linux" welcome.txt

    # To count the total number of lines where the string pattern appears or resides, execute the command below
    grep -c "Linux" welcome.txt

    # To display the lines that don’t contain the string “Linux” run
    grep -v "Linux" welcome.txt

    # Passing then -w flag will search for the line containing the exact matching word as shown
    grep -w "opensource" welcome.txt

    # You can use the -A or -B to dislay number of lines that either precede or come after the search string.
    # The -A flag denotes the lines that come after the search string and 
    # The -B prints the output that appears before the search string
    ifconfig | grep -A 4 ens3
    ifconfig | grep -B 4 ether

    #####################################################################################
    # ^      Matches characters at the beginning of a line
    # $      Matches characters at the end of a line
    # "."    Matches any character
    # [a-z]  Matches any characters between A and Z
    # [^ ..] Matches anything apart from what is contained in the brackets
    #####################################################################################

    # To print lines beginning with a certain character
    grep ^character file_name

    # To display the lines that begin with the letter “d” in our welcome.txt file
    grep ^d welcome.txt

    # To display lines that end with the letter ‘x’
    grep x$ welcome.txt

    # To display lines that end with the letter ‘os’
    grep "os$" geekfile.txt


    grep –e "Agarwal" –e "Aggarwal" –e "Agrawal" geekfile.txt

    # -f file option Takes patterns from file, one per line
    grep –f pattern.txt  geekfile.txt


    # Help
    grep --help


    # Syntax
    # -A prints the searched line and n lines after the result
    # -B prints the searched line and n lines before the result
    # -C prints the searched line and n lines after and before the result. 
    grep -A[NumberOfLines(n)] [search] [file]  
    grep -B[NumberOfLines(n)] [search] [file]  
    grep -C[NumberOfLines(n)] [search] [file] 

    grep -A1 learn geekfile.txt

    # -R prints the searched pattern in the given directory recursively in all the files
    grep -R [Search] [directory]
    grep -iR geeks /home/geeks

    ```
- ## 9. SED Command
    ```shell
    # command to replace the content in a file
    sed -i -e 's/AWS-Full-Notes.md/Amazon_Web_Services/g' README.md

    # command to replace the path structure
    sed 's|/data/projectA/|/archive/projectB/|g' file.txt
    ```
- ## 10. CAT Command
    ```shell
    # Command to display content of file with line numbers
    cat 08-findMemUtil.sh |awk '{print NR,$0}'

    # Command to find the and extract only username from passwd file
    cat /etc/passwd | grep -i -w cloudshell-user|cut -d ":" -f 1
    ```
- ## 11. NETSTAT Command
    ```shell
    # Command to fetch port number listening or not
    netstat -antp|grep PORTNUMBER
    ```
- ## 12. ECHO Command
    ```shell
    # Command to update the username and password in the passwd file
    echo "username:password" | sudo chpasswd
    echo "$USER:$PASSWORD" | sudo chpasswd

    # Command to update multiple entries.
    echo -e "user1:pass1\nuser2:pass2" | sudo chpasswd

    # Command to extract one Special char by shuffling the list of given special chars.
    echo '!@#$%^&*()_+=' | fold -w1 | shuf | head -c1
    
    ```
