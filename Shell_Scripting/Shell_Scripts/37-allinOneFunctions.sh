#!/bin/bash

# Function to determine even and odd numbers in the given list
function even_odd_number {
    read -p "Enter the list of numbers : " -a numbers
    for number in ${numbers[@]}; do
        if [ $((number % 2)) -eq 0 ]; then
            echo "$number is even"
        else
            echo "$number is odd"
        fi
    done
}

# Function to determine the largest number in the given list
function largest_number {
    read -p "Enter the list of numbers : " -a numbers
    largest=${numbers[0]}
    for number in ${numbers[@]}; do
        if [ $number -gt $largest ]; then
            largest=$number
        fi
    done
    echo "The largest number is $largest"
}

# Function to determine the smallest number in the given list
function smallest_number {
    read -p "Enter the list of numbers : " -a numbers
    smallest=${numbers[0]}
    for number in ${numbers[@]}; do
        if [ $number -lt $smallest ]; then
            smallest=$number
        fi
    done
    echo "The smallest number is $smallest"
}

# Function to determine the sum of the given list
function sum_of_numbers {
    read -p "Enter the list of numbers : " -a numbers
    sum=0
    for number in ${numbers[@]}; do
        sum=$((sum + number))
    done
    echo "The sum of the numbers is $sum"
}

# Function to determine the average of the given list
function average_of_numbers {
    read -p "Enter the list of numbers : " -a numbers
    sum=0
    for number in ${numbers[@]}; do
        sum=$((sum + number))
    done
    average=$(echo "scale=2; $sum / ${#numbers[@]}" | bc)
    echo "The average of the numbers is $average"
}

# Function to determine the factorial of a given number
function factorial_of_number {
    read -p "Enter a number : " number
    factorial=1
    for ((i = 1; i <= number; i++)); do
        factorial=$((factorial * i))
    done
    echo "The factorial of $number is $factorial"
}

# Function to determine the Fibonacci series up to a given number
function fibonacci_series {
    read -p "Enter a number : " number
    a=0
    b=1
    echo "The Fibonacci series up to $number is :"
    for ((i = 0; i < number; i++)); do
        echo -n "$a "
        fn=$((a + b))
        a=$b
        b=$fn
    done
    echo
}

# Function to determine the prime numbers up to a given number
function prime_numbers {
    read -p "Enter a number : " number
    echo "The prime numbers up to $number are :"
    for ((i = 2; i <= number; i++)); do
        is_prime=1
        for ((j = 2; j < i; j++)); do
            if [ $((i % j)) -eq 0 ]; then
                is_prime=0
                break
            fi
        done
        if [ $is_prime -eq 1 ]; then
            echo -n "$i "
        fi
    done
    echo
}

# Function to determine the given number is prime or not
function is_prime {
    read -p "Enter a number : " number
    is_prime=1
    for ((i = 2; i < number; i++)); do
        if [ $((number % i)) -eq 0 ]; then
            is_prime=0
            break
        fi
    done
    if [ $is_prime -eq 1 ]; then
        echo "$number is a prime number"
    else
        echo "$number is not a prime number"
    fi
}

# Function to determine the given list of string are palindrome or not
function is_palindrome {
    read -p "Enter the list of strings : " -a strings
    for string in ${strings[@]}; do
        reverse=$(echo $string | rev)
        if [ $string == $reverse ]; then
            echo "$string is a palindrome"
        else
            echo "$string is not a palindrome"
        fi
    done
}

# Function to determine disk usage of the given directory
function disk_usage {
    read -p "Enter the directory path : " directory
    du -sh $directory
}

# Function to determine the number of files in the given directory
function number_of_files {
    read -p "Enter the directory path : " directory
    files=$(find $directory -type f | wc -l)
    echo "The number of files in $directory is $files"
}

# Function to determine the number of directories in the given directory
function number_of_directories {
    read -p "Enter the directory path : " directory
    directories=$(find $directory -type d | wc -l)
    echo "The number of directories in $directory is $directories"
}

# Function to determine the number of files and directories in the given directory
function number_of_files_and_directories {
    read -p "Enter the directory path : " directory
    files=$(find $directory -type f | wc -l)
    directories=$(find $directory -type d | wc -l)
    echo "The number of files in $directory is $files"
    echo "The number of directories in $directory is $directories"
}

# Function to determine the number of files with a specific extension in the given directory
function number_of_files_with_extension {
    read -p "Enter the directory path : " directory
    read -p "Enter the file extension : " extension
    files=$(find $directory -type f -name "*.$extension" | wc -l)
    echo "The number of files with .$extension extension in $directory is $files"
}

# Function to determine the number of files with a specific pattern in the given directory
function number_of_files_with_pattern {
    read -p "Enter the directory path : " directory
    read -p "Enter the pattern : " pattern
    files=$(grep -r $pattern $directory | wc -l)
    echo "The number of files with $pattern pattern in $directory is $files"
}

# Function to determine the memory utilization of the system is high or not
function memory_utilization {
    WebHook='https://hooks.slack.com/services/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'

    # Get the hostname of the system
    HostName=$(curl -sL http://169.254.169.254/latest/meta-data/local-hostname)

    # Get the total memory of the system
    Total_Mem=$(free -m | grep Mem | awk '{print $2}')

    # Get the available memory of the system
    Available_Mem=$(free -m | grep Mem | awk '{print $7}')

    # Calculate the used memory of the system
    Used_Mem=$(($Total_Mem - $Available_Mem))

    # Calculate the memory utilization of the system
    Mem_Utilization=$(echo "scale=2; $Used_Mem/$Total_Mem*100" | bc)

    echo "Total Memory of $HostName: $Total_Mem MB"
    echo "Available Memory of $HostName: $Available_Mem MB"
    echo "Used Memory of $HostName: $Used_Mem MB"
    echo "Memory Utilization of $HostName: $Mem_Utilization %"

    # Check if the memory utilization is high
    if [ $(echo "$Mem_Utilization > 90" | bc) -eq 1 ]; then
        echo "Memory utilization is high of $HostName"

        # Send the notification to the slack channel
        curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"Memory utilization of $HostName is high. Memory Utilization of $HostName: $Mem_Utilization %\"}" $WebHook
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Memory utilization of $HostName is high. Memory Utilization of $HostName: $Mem_Utilization %\"}" >>/dev/null
    else
        echo "Memory utilization is normal of $HostName"
    fi
}

# Function to determine the CPU utilization of the system is high or not
function cpu_utilization {
    WebHook='https://hooks.slack.com/services/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'

    # Get the hostname of the system
    HostName=$(curl -sL http://http://169.254.169.254/latest/meta-data/local-hostname)

    # Get the CPU utilization of the system
    CPU_Utilization=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

    echo "CPU Utilization of $HostName: $CPU_Utilization %"

    # Check if the CPU utilization is high
    if [ $(echo "$CPU_Utilization > 90" | bc) -eq 1 ]; then
        echo "CPU utilization is high of $HostName"

        # Send the notification to the slack channel
        curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"CPU utilization of $HostName is high. CPU Utilization of $HostName: $CPU_Utilization %\"}" $WebHook
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"CPU utilization of $HostName is high. CPU Utilization of $HostName: $CPU_Utilization %\"}" >>/dev/null
    else
        echo "CPU utilization is normal of $HostName"
    fi
}

# Function to determine the disk utilization of the system is high or not
function disk_utilization {
    WebHook='https://hooks.slack.com/services/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'

    # Get the hostname of the system
    HostName=$(curl -sL http://http://http://169.254.169.254/latest/meta-data/local-hostname)

    # Get the disk utilization of the system
    Disk_Utilization=$(df -h | grep '/dev/xvda1' | awk '{print $5}' | sed 's/%//')

    echo "Disk Utilization of $HostName: $Disk_Utilization %"

    # Check if the disk utilization is high
    if [ $Disk_Utilization -gt 90 ]; then
        echo "Disk utilization is high"

        # Send the notification to the slack channel
        curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"Disk utilization of $HostName is high. Disk Utilization of $HostName: $Disk_Utilization %\"}" $WebHook
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Disk utilization of $HostName is high. Disk Utilization of $HostName: $Disk_Utilization %\"}" >>/dev/null
    else
        echo "Disk utilization is normal"
    fi
}

# Function to determine the status of the given service and start the service if it is not running
function service_status {
    read -p "Enter the service name : " service
    WebHook='https://hooks.slack.com/services/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'

    # Get the status of the service
    systemctl status $service --no-pager | grep "Active: active (running)" >>/dev/null
    if [ $? -ne 0 ]; then
        systemctl start $service >>/dev/null
        echo "$service is not running. Started $service !!!"

        # Send the notification to the slack channel
        curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$service is not running. Started $service !!!\"}" $WebHook
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"$service is not running. Started $service !!!\"}" >>/dev/null
    else
        echo "$service is alredy running on the server and the status is active !!!"
    fi
}

# Function to determine the status of the given process and kill the process if it is running
function process_status {
    read -p "Enter the process name : " process
    WebHook='https://hooks.slack.com/services/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'

    # Get the status of the process
    ps -ef | grep $process | grep -v grep >>/dev/null
    if [ $? -eq 0 ]; then
        pkill $process >>/dev/null
        echo "$process is running. Killed $process !!!"

        # Send the notification to the slack channel
        curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$process is running. Killed $process !!!\"}" $WebHook
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"$process is running. Killed $process !!!\"}" >>/dev/null
    else
        echo "$process is not running on the server !!!"
    fi
}

# Function to determine the status of the given port and kill the process if it is running
function port_status {
    read -p "Enter the port number : " port
    WebHook='https://hooks.slack.com/services/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'

    # Get the status of the port
    lsof -i :$port >>/dev/null
    if [ $? -eq 0 ]; then
        process=$(lsof -i :$port | awk 'NR==2{print $1}')
        pkill $process >>/dev/null
        echo "Port $port is running. Killed the process $process !!!"

        # Send the notification to the slack channel
        curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"Port $port is running. Killed the process $process !!!\"}" $WebHook
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Port $port is running. Killed the process $process !!!\"}" >>/dev/null
    else
        echo "Port $port is not running on the server !!!"
    fi
}

# Function to determine the status of the given URL
function url_status {
    read -p "Enter the URL : " url
    WebHook='https://hooks.slack.com/services/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'

    # Get the status of the URL
    curl -Is $url | head -n 1 | grep "200 OK" >>/dev/null
    if [ $? -eq 0 ]; then
        echo "$url is up and running !!!"
    else
        echo "$url is down !!!"

        # Send the notification to the slack channel
        curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$url is down !!!\"}" $WebHook
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"$url is down !!!\"}" >>/dev/null
    fi
}

# Function to determine the status of the given IP address
function ip_status {
    read -p "Enter the IP address : " ip
    WebHook='https://hooks.slack.com/services/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'

    # Get the status of the IP address
    ping -c 1 $ip >>/dev/null
    if [ $? -eq 0 ]; then
        echo "$ip is up and running !!!"
    else
        echo "$ip is down !!!"

        # Send the notification to the slack channel
        curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$ip is down !!!\"}" $WebHook
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"$ip is down !!!\"}" >>/dev/null
    fi
}

# Function to determine the status of the given domains
function domain_status {
    read -p "Enter the domain : " domain
    WebHook='https://hooks.slack.com/services/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'

    # Get the status of the domain
    curl -Is $domain | head -n 1 | grep "200 OK" >>/dev/null
    if [ $? -eq 0 ]; then
        echo "$domain is up and running !!!"
    else
        echo "$domain is down !!!"

        # Send the notification to the slack channel
        curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$domain is down !!!\"}" $WebHook
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"$domain is down !!!\"}" >>/dev/null
    fi
}

# Function to determine the status of the given email address
function email_status {
    read -p "Enter the email address : " email
    WebHook='https://hooks.slack.com/services/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'

    # Get the status of the email address
    curl -Is $email | head -n 1 | grep "200 OK" >>/dev/null
    if [ $? -eq 0 ]; then
        echo "$email is up and running !!!"
    else
        echo "$email is down !!!"

        # Send the notification to the slack channel
        curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$email is down !!!\"}" $WebHook
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"$email is down !!!\"}" >>/dev/null
    fi
}

# Function to create a list users with a random password and send the password to the user via slack notification
function create_users {
    read -p "Enter the list of users : " -a users
    WebHook='https://hooks.slack.com/services/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'

    for user in ${users[@]}; do
        if [[ $USER =~ ^[a-z][a-z][a-z][a-z][0-9][0-9][0-9][0-9]$ ]]; then
            EXISTING_USER=$(sudo cat /etc/passwd | grep -i -w $user | cut -d ":" -f 1)
            if [ "${EXISTING_USER}" = "${user}" ]; then
                echo "User $user already exists try another username"
            else
                echo "User $user does not exist, creating user"
                sudo useradd -m -s /bin/bash $user -d /home/$user
                sudo usermod -aG sudo $user
                sudo echo "$user ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers
                specialChar=$(echo '!@#$%^&*()_+=' | fold -w1 | shuf | head -c1)
                PASSWORD="India@$(date +%Y)${specialChar}"
                echo "$user:$PASSWORD" | sudo chpasswd
                sudo passwd -e $user
                echo "The password for $user is $PASSWORD"
                curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"User: $user has been created with password: $PASSWORD reset password immediately\"}" >>/dev/null
            fi
        else
            echo "Username $user is invalid, please provide a valid username with 4 alphabets and 4 digits e.g. abcd1234"
        fi
    done
}

# Function to delete the given list of users and send the notification to the user via slack
function delete_users {
    read -p "Enter the list of users : " -a users
    WebHook='https://hooks.slack.com/services/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'

    for user in ${users[@]}; do
        EXISTING_USER=$(sudo cat /etc/passwd | grep -i -w $user | cut -d ":" -f 1)
        if [ "${EXISTING_USER}" = "${user}" ]; then
            echo "User $user exists, deleting user"
            sudo userdel -r $user
            echo "User $user has been deleted"
            curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"User: $user has been deleted\"}" >>/dev/null
        else
            echo "User $user does not exist"
        fi
    done
}

# Function to determine the status of the given user
function user_status {
    read -p "Enter the username : " user
    EXISTING_USER=$(sudo cat /etc/passwd | grep -i -w $user | cut -d ":" -f 1)
    if [ "${EXISTING_USER}" = "${user}" ]; then
        echo "User $user exists"
    else
        echo "User $user does not exist"
    fi
}

# Function to determine the status of the given group
function group_status {
    read -p "Enter the group name : " group
    EXISTING_GROUP=$(sudo cat /etc/group | grep -i -w $group | cut -d ":" -f 1)
    if [ "${EXISTING_GROUP}" = "${group}" ]; then
        echo "Group $group exists"
    else
        echo "Group $group does not exist"
    fi
}

# Function to create a list of groups and send the notification to the user via slack
function create_groups {
    read -p "Enter the list of groups : " -a groups
    WebHook='https://hooks.slack.com/services/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'

    for group in ${groups[@]}; do
        EXISTING_GROUP=$(sudo cat /etc/group | grep -i -w $group | cut -d ":" -f 1)
        if [ "${EXISTING_GROUP}" = "${group}" ]; then
            echo "Group $group already exists"
        else
            echo "Group $group does not exist, creating group"
            sudo groupadd $group
            echo "Group $group has been created"
            curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Group: $group has been created\"}" >>/dev/null
        fi
    done
}

# Function to delete the given list of groups and send the notification to the user via slack
function delete_groups {
    read -p "Enter the list of groups : " -a groups
    WebHook='https://hooks.slack.com/services/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'

    for group in ${groups[@]}; do
        EXISTING_GROUP=$(sudo cat /etc/group | grep -i -w $group | cut -d ":" -f 1)
        if [ "${EXISTING_GROUP}" = "${group}" ]; then
            echo "Group $group exists, deleting group"
            sudo groupdel $group
            echo "Group $group has been deleted"
            curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Group: $group has been deleted\"}" >>/dev/null
        else
            echo "Group $group does not exist"
        fi
    done
}

# Function to determine the status of the given file
function file_status {
    read -p "Enter the file path : " file
    if [ -f $file ]; then
        echo "File $file exists"
    else
        echo "File $file does not exist"
    fi
}

# Function to determine the status of the given directory
function directory_status {
    read -p "Enter the directory path : " directory
    if [ -d $directory ]; then
        echo "Directory $directory exists"
    else
        echo "Directory $directory does not exist"
    fi
}

# Function to determine the status of the given file and send the notification to the user via slack
function file_status_slack {
    read -p "Enter the file path : " file
    WebHook='https://hooks.slack.com/services/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'

    if [ -f $file ]; then
        echo "File $file exists"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"File: $file exists\"}" >>/dev/null
    else
        echo "File $file does not exist"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"File: $file does not exist\"}" >>/dev/null
    fi
}

# Function to determine the status of the given directory and send the notification to the user via slack
function directory_status_slack {
    read -p "Enter the directory path : " directory
    WebHook='https://hooks.slack.com/services/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'

    if [ -d $directory ]; then
        echo "Directory $directory exists"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Directory: $directory exists\"}" >>/dev/null
    else
        echo "Directory $directory does not exist"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Directory: $directory does not exist\"}" >>/dev/null
    fi
}

# Function to list VPCs in the given list of regions and send the notification to the user via slack
function list_vpcs {
    read -p "Enter the list of regions : " -a regions
    WebHook='https://hooks.slack.com/services/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'

    for region in ${regions[@]}; do
        vpc_id=$(aws ec2 describe-vpcs --region $region --query 'Vpcs[].VpcId' --output text)
        echo "VPC ID in $region is $vpc_id"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"VPC ID in $region is $vpc_id\"}" >>/dev/null
    done
}

# Function to list instances in the given list of regions and send the notification to the user via slack
function list_instances {
    read -p "Enter the list of regions : " -a regions
    WebHook='https://hooks.slack.com/services/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'

    for region in ${regions[@]}; do
        instance_id=$(aws ec2 describe-instances --region $region --query 'Reservations[].Instances[].InstanceId' --output text)
        echo "Instance ID in $region is $instance_id"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Instance ID in $region is $instance_id\"}" >>/dev/null
    done
}

# Function to list the subnets in the given list of regions and send the notification to the user via slack
function list_subnets {
    read -p "Enter the list of regions : " -a regions
    WebHook='https://hooks.slack.com/services/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'

    for region in ${regions[@]}; do
        subnet_id=$(aws ec2 describe-subnets --region $region --query 'Subnets[].SubnetId' --output text)
        echo "Subnet ID in $region is $subnet_id"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Subnet ID in $region is $subnet_id\"}" >>/dev/null
    done
}

# Function to list the security groups in the given list of regions and send the notification to the user via slack
function list_security_groups {
    read -p "Enter the list of regions : " -a regions
    WebHook='https://hooks.slack.com/services/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'

    for region in ${regions[@]}; do
        security_group_id=$(aws ec2 describe-security-groups --region $region --query 'SecurityGroups[].GroupId' --output text)
        echo "Security Group ID in $region is $security_group_id"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Security Group ID in $region is $security_group_id\"}" >>/dev/null
    done
}

# Function to list the key pairs in the given list of regions and send the notification to the user via slack
function list_key_pairs {
    read -p "Enter the list of regions : " -a regions
    WebHook='https://hooks.slack.com/services/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'

    for region in ${regions[@]}; do
        key_pair_name=$(aws ec2 describe-key-pairs --region $region --query 'KeyPairs[].KeyName' --output text)
        echo "Key Pair Name in $region is $key_pair_name"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Key Pair Name in $region is $key_pair_name\"}" >>/dev/null
    done
}

# Function to list the volumes in the given list of regions and send the notification to the user via slack
function list_volumes {
    read -p "Enter the list of regions : " -a regions
    WebHook='https://hooks.slack.com/services/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'

    for region in ${regions[@]}; do
        volume_id=$(aws ec2 describe-volumes --region $region --query 'Volumes[].VolumeId' --output text)
        echo "Volume ID in $region is $volume_id"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Volume ID in $region is $volume_id\"}" >>/dev/null
    done
}

# Function to list s3 buckets in the given list of regions and send the notification to the user via slack
function list_s3_buckets {
    read -p "Enter the list of regions : " -a regions
    WebHook='https://hooks.slack.com/services/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'
    for region in ${regions[@]}; do
        bucket_name=$(aws s3api list-buckets --region $region --query 'Buckets[].Name' --output text)
        echo "Bucket Name in $region is $bucket_name"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Bucket Name in $region is $bucket_name\"}" >>/dev/null
    done
}

# Function to list subnets, security groups, key pairs, volumes, s3 buckets in the given list of vpcids and send the notification to the user via slack
function list_vpc_resources {
    read -p "Enter the list of vpcids : " -a vpcids
    WebHook='https://hooks.slack.com/services/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'
    for vpcid in ${vpcids[@]}; do
        subnet_id=$(aws ec2 describe-subnets --filters Name=vpc-id,Values=$vpcid --query 'Subnets[].SubnetId' --output text)
        security_group_id=$(aws ec2 describe-security-groups --filters Name=vpc-id,Values=$vpcid --query 'SecurityGroups[].GroupId' --output text)
        key_pair_name=$(aws ec2 describe-key-pairs --query 'KeyPairs[].KeyName' --output text)
        volume_id=$(aws ec2 describe-volumes --filters Name=attachment.instance-id,Values=$vpcid --query 'Volumes[].VolumeId' --output text)
        bucket_name=$(aws s3api list-buckets --query 'Buckets[].Name' --output text)
        echo "Subnet ID in $vpcid is $subnet_id"
        echo "Security Group ID in $vpcid is $security_group_id"
        echo "Key Pair Name in $vpcid is $key_pair_name"
        echo "Volume ID in $vpcid is $volume_id"
        echo "Bucket Name in $vpcid is $bucket_name"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Subnet ID in $vpcid is $subnet_id\"}" >>/dev/null
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Security Group ID in $vpcid is $security_group_id\"}" >>/dev/null
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Key Pair Name in $vpcid is $key_pair_name\"}" >>/dev/null
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Volume ID in $vpcid is $volume_id\"}" >>/dev/null
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Bucket Name in $vpcid is $bucket_name\"}" >>/dev/null
    done
}

# Function to list the volumes in the given list of regions and delete the volumes if the volume is not attached to any instance and send the notification to the user via slack
function delete_volumes {
    read -p "Enter the list of regions : " -a regions
    read -p "Enter the volume ID : " volume_id
    WebHook='https://hooks.slack.com/services/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'

    for region in ${regions[@]}; do
        attachment=$(aws ec2 describe-volumes --region $region --volume-ids $volume_id --query 'Volumes[].Attachments[].InstanceId' --output text)
        if [ -z $attachment ]; then
            echo "Volume ID $volume_id is not attached to any instance in $region, deleting volume"
            aws ec2 delete-volume --region $region --volume-id $volume_id
            echo "Volume ID $volume_id has been deleted"
            curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Volume ID $volume_id has been deleted\"}" >>/dev/null
        else
            echo "Volume ID $volume_id is attached to an instance in $region"
        fi
    done
}

# Function to delete the volumes in the given list of regions if the volume state is available and send the notification to the user via slack
function delete_volumes_state {
    read -p "Enter the list of regions : " -a regions
    WebHook='https://hooks.slack.com/services/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'
    for region in ${regions[@]}; do
        volume_id=$(aws ec2 describe-volumes --region $region --query 'Volumes[?State==`available`].VolumeId' --output text)
        for id in ${volume_id[@]}; do
            echo "Volume ID $id is in available state in $region, deleting volume"
            aws ec2 delete-volume --region $region --volume-id $id
            echo "Volume ID $id has been deleted"
            curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Volume ID $id has been deleted\"}" >>/dev/null
        done
    done
}

# Function to list vpc, subnet, security group, key pair, volume, s3 bucket in the given list of regions and send the notification to the user via slack
function list_all_resources {
    read -p "Enter the list of regions : " -a regions
    WebHook='https://hooks.slack.com/services/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'

    for region in ${regions[@]}; do
        vpc_id=$(aws ec2 describe-vpcs --region $region --query 'Vpcs[].VpcId' --output text)
        subnet_id=$(aws ec2 describe-subnets --region $region --query 'Subnets[].SubnetId' --output text)
        security_group_id=$(aws ec2 describe-security-groups --region $region --query 'SecurityGroups[].GroupId' --output text)
        key_pair_name=$(aws ec2 describe-key-pairs --region $region --query 'KeyPairs[].KeyName' --output text)
        volume_id=$(aws ec2 describe-volumes --region $region --query 'Volumes[].VolumeId' --output text)
        bucket_name=$(aws s3api list-buckets --region $region --query 'Buckets[].Name' --output text)
        echo "VPC ID in $region is $vpc_id"
        echo "Subnet ID in $region is $subnet_id"
        echo "Security Group ID in $region is $security_group_id"
        echo "Key Pair Name in $region is $key_pair_name"
        echo "Volume ID in $region is $volume_id"
        echo "Bucket Name in $region is $bucket_name"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"VPC ID in $region is $vpc_id\"}" >>/dev/null
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Subnet ID in $region is $subnet_id\"}" >>/dev/null
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Security Group ID in $region is $security_group_id\"}" >>/dev/null
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Key Pair Name in $region is $key_pair_name\"}" >>/dev/null
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Volume ID in $region is $volume_id\"}" >>/dev/null
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Bucket Name in $region is $bucket_name\"}" >>/dev/null
    done
}

# Function to delete instances in the given list of regions if the instance state is stopped and send the notification to the user via slack
function delete_instances_state {
    read -p "Enter the list of regions : " -a regions
    WebHook='https://hooks.slack.com/services/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'
    for region in ${regions[@]}; do
        instance_id=$(aws ec2 describe-instances --region $region --query 'Reservations[].Instances[?State.Name==`stopped`].InstanceId' --output text)
        for id in ${instance_id[@]}; do
            echo "Instance ID $id is in stopped state in $region, deleting instance"
            aws ec2 terminate-instances --region $region --instance-ids $id
            echo "Instance ID $id has been deleted"
            curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Instance ID $id has been deleted\"}" >>/dev/null
        done
    done
}

# Function to delete the instances in the given list of regions if the instance state is stopped and send the notification to the user via slack
function delete_instances {
    read -p "Enter the list of regions : " -a regions
    read -p "Enter the instance ID : " instance_id
    WebHook='https://hooks.slack.com/services/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'

    for region in ${regions[@]}; do
        state=$(aws ec2 describe-instances --region $region --instance-ids $instance_id --query 'Reservations[].Instances[].State.Name' --output text)
        if [ $state == "stopped" ]; then
            echo "Instance ID $instance_id is in stopped state in $region, deleting instance"
            aws ec2 terminate-instances --region $region --instance-ids $instance_id
            echo "Instance ID $instance_id has been deleted"
            curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Instance ID $instance_id has been deleted\"}" >>/dev/null
        else
            echo "Instance ID $instance_id is not in stopped state in $region"
        fi
    done
}

# Function to create a vpc in the given list of regions and send the notification to the user via slack
function create_vpc {
    read -p "Enter the list of regions : " -a regions
    read -p "Enter the CIDR block : " cidr_block
    read -p "Enter the VPC name : " vpc_name

    for region in ${regions[@]}; do
        vpc_id=$(aws ec2 create-vpc --region $region --cidr-block $cidr_block --query 'Vpc.VpcId' --output text)
        aws ec2 create-tags --region $region --resources $vpc_id --tags Key=Name,Value=$vpc_name
        echo "VPC ID in $region is $vpc_id"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"VPC ID in $region is $vpc_id\"}" >>/dev/null
    done
}

# Function to create a subnet in the given list of regions and send the notification to the user via slack
function create_subnet {
    read -p "Enter the list of regions : " -a regions
    read -p "Enter the VPC ID : " vpc_id
    read -p "Enter the CIDR block : " cidr_block
    read -p "Enter the Subnet name : " subnet_name

    for region in ${regions[@]}; do
        subnet_id=$(aws ec2 create-subnet --region $region --vpc-id $vpc_id --cidr-block $cidr_block --query 'Subnet.SubnetId' --output text)
        aws ec2 create-tags --region $region --resources $subnet_id --tags Key=Name,Value=$subnet_name
        echo "Subnet ID in $region is $subnet_id"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Subnet ID in $region is $subnet_id\"}" >>/dev/null
    done
}

# Function to create a security group in the given list of regions and send the notification to the user via slack
function create_security_group {
    read -p "Enter the list of regions : " -a regions
    read -p "Enter the VPC ID : " vpc_id
    read -p "Enter the security group name : " security_group_name
    read -p "Enter the security group description : " security_group_description

    for region in ${regions[@]}; do
        security_group_id=$(aws ec2 create-security-group --region $region --group-name $security_group_name --description $security_group_description --vpc-id $vpc_id --query 'GroupId' --output text)
        echo "Security Group ID in $region is $security_group_id"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Security Group ID in $region is $security_group_id\"}" >>/dev/null
    done
}

# Function to create a key pair in the given list of regions and send the notification to the user via slack
function create_key_pair {
    read -p "Enter the list of regions : " -a regions
    read -p "Enter the key pair name : " key_pair_name

    for region in ${regions[@]}; do
        aws ec2 create-key-pair --region $region --key-name $key_pair_name --query 'KeyMaterial' --output text >$key_pair_name.pem
        echo "Key Pair Name in $region is $key_pair_name"
        curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Key Pair Name in $region is $key_pair_name\"}" >>/dev/null
    done
}

# Function to list Functions in this code and execute the Function based on the user input
function all_in_one {
    echo "1.even_odd_number"
    echo "2.largest_number"
    echo "3.smallest_number"
    echo "4.sum_of_numbers"
    echo "5.average_of_numbers"
    echo "6.factorial_of_number"
    echo "7.fibonacci_series"
    echo "8.prime_numbers"
    echo "9.is_prime"
    echo "10.is_palindrome"
    echo "11.disk_usage"
    echo "12.number_of_files"
    echo "13.number_of_directories"
    echo "14.number_of_files_and_directories"
    echo "15.number_of_files_with_extension"
    echo "16.number_of_files_with_pattern"
    echo "17.memory_utilization"
    echo "18.cpu_utilization"
    echo "19.disk_utilization"
    echo "20.service_status"
    echo "21.process_status"
    echo "22.port_status"
    echo "23.url_status"
    echo "24.ip_status"
    echo "25.domain_status"
    echo "26.email_status"
    echo "27.create_users"
    echo "28.delete_users"
    echo "29.user_status"
    echo "30.group_status"
    echo "31.create_groups"
    echo "32.delete_groups"
    echo "33.file_status"
    echo "34.directory_status"
    echo "35.file_status_slack"
    echo "36.directory_status_slack"
    echo "37.list_vpcs"
    echo "38.list_instances"
    echo "39.list_subnets"
    echo "40.list_security_groups"
    echo "41.list_key_pairs"
    echo "42.list_volumes"
    echo "43.list_s3_buckets"
    echo "44.list_vpc_resources"
    echo "45.delete_volumes"
    echo "46.delete_volumes_state"
    echo "47.list_all_resources"
    echo "48.delete_instances_state"
    echo "49.delete_instances"
    echo "50.create_vpc"
    echo "51.create_subnet"
    echo "52.create_security_group"
    echo "53.create_key_pair"
    echo "54.all_in_one"
    read -p "Enter the Function number : " function_number

    case $function_number in
    1) even_odd_number ;;
    2) largest_number ;;
    3) smallest_number ;;
    4) sum_of_numbers ;;
    5) average_of_numbers ;;
    6) factorial_of_number ;;
    7) fibonacci_series ;;
    8) prime_numbers ;;
    9) is_prime ;;
    10) is_palindrome ;;
    11) disk_usage ;;
    12) number_of_files ;;
    13) number_of_directories ;;
    14) number_of_files_and_directories ;;
    15) number_of_files_with_extension ;;
    16) number_of_files_with_pattern ;;
    17) memory_utilization ;;
    18) cpu_utilization ;;
    19) disk_utilization ;;
    20) service_status ;;
    21) process_status ;;
    22) port_status ;;
    23) url_status ;;
    24) ip_status ;;
    25) domain_status ;;
    26) email_status ;;
    27) create_users ;;
    28) delete_users ;;
    29) user_status ;;
    30) group_status ;;
    31) create_groups ;;
    32) delete_groups ;;
    33) file_status ;;
    34) directory_status ;;
    35) file_status_slack ;;
    36) directory_status_slack ;;
    37) list_vpcs ;;
    38) list_instances ;;
    39) list_subnets ;;
    40) list_security_groups ;;
    41) list_key_pairs ;;
    42) list_volumes ;;
    43) list_s3_buckets ;;
    44) list_vpc_resources ;;
    45) delete_volumes ;;
    46) delete_volumes_state ;;
    47) list_all_resources ;;
    48) delete_instances_state ;;
    49) delete_instances ;;
    50) create_vpc ;;
    51) create_subnet ;;
    52) create_security_group ;;
    53) create_key_pair ;;
    54) all_in_one ;;
    *) echo "Invalid Function number" ;;
    esac
}

# calling the Function
all_in_one
