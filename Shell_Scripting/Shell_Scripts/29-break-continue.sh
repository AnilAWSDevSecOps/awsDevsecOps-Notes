# Listing VPCs in given regions and if region is not valid then skipping the region and moving to next region by using continue statement.
#!/bin/bash

# Function to list VPCs in all regions
aws_regions=(us-east-1 us-east-2 hyd-india-1 eu-north-1 ap-south-1 eu-west-3 eu-west-2 eu-west-1 ap-northeast-2)
#aws_regions=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
# Function to list VPCs in all regions
function list_vpcs {

    # Getting the VPCs in the region
    vpcs=$(aws ec2 describe-vpcs --region $region | jq ".Vpcs[].VpcId" -r)

    # Checking if VPCs are present in the region or not
    if [ ${#vpcs[@]} -eq 0 ]; then
        echo "No VPCs found in $region region continue to next region"

        # Skipping the region if no VPCs are present
        # continue

        # Breaking the loop if no VPCs are present
        # break
    else

        # Looping through the VPCs to list them
        for vpc in $vpcs; do
            echo VpcId: $vpc in Region: $region
        done

    fi
}

# Function to list VPCs in all regions
function list_regions {
    #aws_regions=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
    # Looping through the regions
    for region in ${aws_regions[@]}; do

        echo Checking vpcs in Region: $region

        # Calling the function to list VPCs
        list_vpcs
    done
}

# Calling the function
list_regions
