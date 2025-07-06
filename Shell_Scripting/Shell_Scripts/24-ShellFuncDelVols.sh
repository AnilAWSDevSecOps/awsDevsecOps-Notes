# Shell Function to delete volumes size lessthan than 10GB and unattached volumes
##!/bin/bash
regions=$(aws ec2 describe-regions --query 'Regions[].RegionName' --output text)
function delete_volumes {
    for region in $regions; do
        volume_ids=$(aws ec2 describe-volumes --region $region --query 'Volumes[?Size<`10` && Attachments[0].State==`null`].VolumeId' --output text)
        for volume_id in $volume_ids; do
            aws ec2 delete-volume --region $region --volume-id $volume_id
            echo "Volume $volume_id deleted in $region"
        done
    done
}

# Calling a function
delete_volumes
