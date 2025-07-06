#!/bin/bash
# Shell array to check the ip address of the given domain names
ipaddress=()
for domain in $@; do
    ipaddress+=($(dig +short $domain))
done
echo "The IP address of the given domain names are: ${ipaddress[@]}"

for ip in ${ipaddress[@]}; do
    echo "The IP address is: $ip"
done

for ((i = 0; i < ${#ipaddress[@]}; i++)); do
    echo "The IP address of $i: ${ipaddress[$i]}"
done

for ip in ${ipaddress[@]}; do
    echo "Testing connectivity for: $ip"
    timeout 1 ping -c 1 $ip >>/dev/null
    timeout 2 telnet $ip 80 >>/dev/null
done
# Run the script with the below command
# ./14-Shellarray.sh google.com yahoo.com facebook.com github.com twitter.com linkedin.com
