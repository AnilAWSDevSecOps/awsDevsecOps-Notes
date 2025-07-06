# Deleting the volumes in all regions which are unattached.
#!/bin/bash
function delete_unattached_volumes {
    regions=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
    for region in $regions; do
        volume_ids=$(aws ec2 describe-volumes --region $region | jq ".Volumes[].VolumeId" -r)
        if [ -z "$volume_ids" ]; then
            echo "No volumes found in $region"
        else
            for volume_id in $volume_ids; do
                volume_state=$(aws ec2 describe-volumes --region $region --volume-ids $volume_id | jq ".Volumes[].State" -r)
                volume_size=$(aws ec2 describe-volumes --region $region --volume-ids $volume_id | jq ".Volumes[].Size" -r)
                if [ $volume_state == "available" ]; then
                    aws ec2 delete-volume --region $region --volume-id $volume_id
                    echo "Volume $volume_id deleted in $region"
                else
                    echo "Volume $volume_id is attached"
                fi
            done
        fi
    done
}

# Calling a function
delete_unattached_volumes
