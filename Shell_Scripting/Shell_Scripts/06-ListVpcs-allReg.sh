#!/bin/bash
# Listing the VPCs in all the regions.
Regions=$@
for Region in $Regions; do
    echo "Listing VPCs in region $Region"
    # aws ec2 describe-vpcs --region $Region --query "Vpcs[].VpcId" --output text
    aws ec2 describe-vpcs --region $Region | jq ".Vpcs[].VpcId" -r
done
# End of the script
