#!/bin/bash
# Shell array to netcat the ip address of the given IP addresses
ipaddress=('142.251.16.102' '142.251.16.138' '142.251.16.100' '142.251.16.101' '20.21.22.21')
for ip in ${ipaddress[@]}; do
    echo "Testing ping connectivity for: $ip"
    timeout 2 netcat -z -n -v $ip 80 2>&1 | grep succeeded >>/tmp/netcat_success.log || echo "Failed to connect to $ip" >>/tmp/netcat_failed.log
done
echo "-------success--------"
cat /tmp/netcat_success.log | cut -d " " -f 3
echo "-------failed--------"
cat /tmp/netcat_failed.log | cut -d " " -f 5
sleep 10
rm -f /tmp/netcat_success.log /tmp/netcat_failed.log
