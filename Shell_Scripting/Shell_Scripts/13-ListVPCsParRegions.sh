#!/bin/bash
# Script to list VPCs in all given parameters regions
# For Debugging uncomment the below line
# set -x
if [ $# -eq 0 ]; then
    # If no arguments are provided to the script
    echo "you have provided $# regions"
    echo "Please provide the region names as arguments to the script"
    exit 1
else
    echo "you have provided $# regions"
    # you use $* instead of $@ both will give the same output
    for region in $@; do
        echo "=============================="
        echo "VPCs in region $region"
        aws ec2 describe-vpcs --region $region --query "Vpcs[*].VpcId" --output text
        echo "=============================="
    done
fi
