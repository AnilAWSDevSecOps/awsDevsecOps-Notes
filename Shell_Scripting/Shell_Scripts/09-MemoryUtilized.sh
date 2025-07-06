#!/bin/bash
# Script to find the memory utilization of the system

Total_Mem=$(free -m | grep Mem | awk '{print $2}')
Available_Mem=$(free -m | grep Mem | awk '{print $7}')
Used_Mem=$(($Total_Mem - $Available_Mem))
Mem_Utilization=$(echo "scale=2; $Used_Mem/$Total_Mem*100" | bc)
echo "Total Memory: $Total_Mem MB"
echo "Available Memory: $Available_Mem MB"
echo "Used Memory: $Used_Mem MB"
echo "Memory Utilization: $Mem_Utilization %"
if [ $(echo "$Mem_Utilization > 90" | bc) -eq 1 ]; then
    echo "Memory utilization is high"
else
    echo "Memory utilization is normal"
fi
