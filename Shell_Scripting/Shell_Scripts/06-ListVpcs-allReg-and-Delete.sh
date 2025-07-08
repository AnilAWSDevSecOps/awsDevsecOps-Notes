#!/bin/bash

# Fetch all AWS regions
regions=$(aws ec2 describe-regions --query "Regions[*].RegionName" --output text)

for region in $regions; do
    echo "Processing region: $region"

    # Fetch all non-default VPCs in the region
    vpc_ids=$(aws ec2 describe-vpcs \
        --region "$region" \
        --query "Vpcs[].VpcId" \
        --output text)

    for vpc_id in $vpc_ids; do
        echo "Deleting VPC: $vpc_id in region: $region"

        # Attempt to delete the VPC
        aws ec2 delete-vpc --vpc-id "$vpc_id" --region "$region"

        if [ $? -eq 0 ]; then
            echo "Successfully deleted VPC: $vpc_id"
        else
            echo "Failed to delete VPC: $vpc_id"
        fi
    done
done
