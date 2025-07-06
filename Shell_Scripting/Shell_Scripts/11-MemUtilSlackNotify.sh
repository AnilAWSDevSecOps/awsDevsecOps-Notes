#!/bin/bash
# Script to find the memory utilization of the system
WebHook='https://hooks.slack.com/services/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'
HostName=$(curl -sL http://169.254.169.254/latest/meta-data/local-hostname)
Total_Mem=$(free -m | grep Mem | awk '{print $2}')
Available_Mem=$(free -m | grep Mem | awk '{print $7}')
Used_Mem=$(($Total_Mem - $Available_Mem))
Mem_Utilization=$(echo "scale=2; $Used_Mem/$Total_Mem*100" | bc)
echo "Total Memory of $HostName: $Total_Mem MB"
echo "Available Memory of $HostName: $Available_Mem MB"
echo "Used Memory of $HostName: $Used_Mem MB"
echo "Memory Utilization of $HostName: $Mem_Utilization %"
if [ $(echo "$Mem_Utilization > 90" | bc) -eq 1 ]; then
    echo "Memory utilization is high of $HostName"
    curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"Memory utilization of $HostName is high. Memory Utilization of $HostName: $Mem_Utilization %\"}" $WebHook
    curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Memory utilization of $HostName is high. Memory Utilization of $HostName: $Mem_Utilization %\"}" >>/dev/null
else
    echo "Memory utilization is normal of $HostName"
fi
