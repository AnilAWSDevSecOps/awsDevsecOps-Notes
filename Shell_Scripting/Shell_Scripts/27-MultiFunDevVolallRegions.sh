# Deleting the volumes in all regions which are unattached.
#!/bin/bash
function delete_unattached_volumes {
    # Getting the regions

    volume_ids=$(aws ec2 describe-volumes --region $region | jq ".Volumes[].VolumeId" -r)
    # Checking if volumes are present in the region or not

    if [ -z "$volume_ids" ]; then
        echo "No volumes found in $region"
    else

        # Looping through the volumes to check if they are unattached
        for volume_id in $volume_ids; do

            # Getting the state and size of the volume to check if it is unattached
            volume_state=$(aws ec2 describe-volumes --region $region --volume-ids $volume_id | jq ".Volumes[].State" -r)
            volume_size=$(aws ec2 describe-volumes --region $region --volume-ids $volume_id | jq ".Volumes[].Size" -r)

            # Checking if the volume is unattached
            if [ $volume_state == "available" ]; then

                # Deleting the volume if it is unattached
                aws ec2 delete-volume --region $region --volume-id $volume_id
                echo "Volume $volume_id deleted in $region"
            else
                echo "Volume $volume_id is attached"
            fi
        done
    fi
}

# Getting the regions and looping through them to delete the unattached volumes
regions=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
for region in $regions; do

    # Calling a function
    delete_unattached_volumes
done
