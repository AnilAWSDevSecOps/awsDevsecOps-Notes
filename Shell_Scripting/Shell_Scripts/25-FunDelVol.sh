# Function to delete the volumes in given region which are unattached.
# #!/bin/bash
function delete_unattached_volumes {
    volume_ids=$(aws ec2 describe-volumes --region us-east-1 | jq ".Volumes[].VolumeId" -r)
    for volume_id in $volume_ids; do
        volume_state=$(aws ec2 describe-volumes --region us-east-1 --volume-ids $volume_id | jq ".Volumes[].State" -r)
        volume_size=$(aws ec2 describe-volumes --region us-east-1 --volume-ids $volume_id | jq ".Volumes[].Size" -r)
        if [ $volume_state == "available" ] && [ $volume_size -gt 10 ]; then
            aws ec2 delete-volume --region us-east-1 --volume-id $volume_id
            echo "Volume $volume_id deleted in us-east-1"
        else
            echo "Volume $volume_id is attached or size is less than 10GB"
        fi
    done
}

# Calling a function
delete_unattached_volumes
