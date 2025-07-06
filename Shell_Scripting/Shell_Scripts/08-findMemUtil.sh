#!/bin/bash
# Script to find the memory utilization of the system
# <<'##COMMENT'
# The script in 08-findMemUtil.sh calculates the memory utilization by subtracting the
# available memory from the total memory and then dividing the result by the total memory.
# The script in 08-findMemUtil.sh provides a more accurate representation of memory
# utilization as it takes into account the memory that is available for use by the system.
# ##COMMENT

Total_Mem=$(free -m | grep Mem | awk '{print $2}')
Total_Available_Mem=$(free -m | grep Mem | awk '{print $7}')
Used_Mem=$(($Total_Mem - $Total_Available_Mem))
Mem_Utilization=$(echo "scale=2; $Used_Mem/$Total_Mem*100" | bc)
echo "Total Memory: $Total_Mem MB"
echo "Available Memory: $Total_Available_Mem MB"
echo "Used Memory: $Used_Mem MB"
echo "Memory Utilization: $Mem_Utilization %"
if [ $(echo "$Mem_Utilization > 90" | bc) -eq 1 ]; then
    echo "Memory utilization is high"
else
    echo "Memory utilization is normal"
fi
