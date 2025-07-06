# listing all availability zones in all regions and if region is not valid then skipping the region and moving to next region by using continue statement.
# if availability zone is us-east-1* then breaking the loop and moving to next region by using break statement.
# #!/bin/bash
aws_regions=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
# Function to list availability zones in all regions

function list_azs {

    # Getting the availability zones in the region
    azs=$(aws ec2 describe-availability-zones --region $region | jq ".AvailabilityZones[].ZoneName" -r)

    # Checking if availability zones are present in the region or not
    if [ ${#azs[@]} -eq 0 ]; then
        echo "No Availability Zones found in $region region continue to next region"

    else

        # Looping through the availability zones to list them
        for az in $azs; do
            echo AvailabilityZone in Region: $region is $az

            # Breaking the loop if availability zone is us-east-1*
            if [[ $az == us-east-1a ]]; then
                echo "Breaking the loop as availability zone is $az"
                break
            fi
        done

    fi
}

function list_regions {
    # Looping through the regions
    for region in ${aws_regions[@]}; do

        echo Checking Availability Zones in Region: $region

        # Calling the function to list availability zones
        list_azs
    done
}

# Calling the function
list_regions
