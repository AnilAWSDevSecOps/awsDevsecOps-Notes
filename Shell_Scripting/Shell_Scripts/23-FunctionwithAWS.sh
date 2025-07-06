# Using functions in AWS CLI
#!/bin/bash
regions=$(aws ec2 describe-regions --query 'Regions[].RegionName' --output text)
function get_instance_id {
    for region in $regions; do
        instance_id=$(aws ec2 describe-instances --region $region --query 'Reservations[].Instances[].InstanceId' --output text)
        echo "Instance ID in $region is $instance_id"
    done
}
function get_vpc_id {
    for region in $regions; do
        vpc_id=$(aws ec2 describe-vpcs --region $region --query 'Vpcs[].VpcId' --output text)
        echo "VPC ID in $region is $vpc_id"
    done
}
# Calling a function
get_vpc_id
get_instance_id
