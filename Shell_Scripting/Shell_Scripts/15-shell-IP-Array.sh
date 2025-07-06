#!/bin/bash
# Shell array to telnet the ip address of the given IP addresses
ipaddress=('142.251.16.102' '142.251.16.138' '142.251.16.100' '142.251.16.101' '20.21.22.21')
for ip in ${ipaddress[@]}; do
    echo "Testing ping connectivity for: $ip"
    timeout 1 ping -c 1 $ip 2>&1 | grep "64 bytes"
    echo "Testing telnet connectivity for: $ip"
    timeout 2 telnet $ip 80 2>&1 | grep "Connected to"
done
