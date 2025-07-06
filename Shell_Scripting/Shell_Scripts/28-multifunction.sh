# Shell multi-function library
#!/bin/bash
# Function to list subnets , security groups and route tables in a VPC in all regions.
function list_subnets {
    subnets=$(aws ec2 describe-subnets --region $region --filters "Name=vpc-id,Values=$vpc" | jq ".Subnets[].SubnetId" -r)
    for subnet in $subnets; do
        echo SubnetId: $subnet in VpcId: $vpc
    done
}

function list_route_tables {
    route_tables=$(aws ec2 describe-route-tables --region $region --filters "Name=vpc-id,Values=$vpc" | jq ".RouteTables[].RouteTableId" -r)
    for route_table in $route_tables; do
        echo RouteTableId: $route_table in VpcId: $vpc
    done
}

function list_security_groups {
    security_groups=$(aws ec2 describe-security-groups --region $region --filters "Name=vpc-id,Values=$vpc" | jq ".SecurityGroups[].GroupId" -r)
    for security_group in $security_groups; do
        echo SecurityGroupId: $security_group in VpcId: $vpc
    done
}

function list_vpcs {
    vpcs=$(aws ec2 describe-vpcs --region $region | jq ".Vpcs[].VpcId" -r)
    for vpc in $vpcs; do
        echo VpcId: $vpc in Region: $region
        list_subnets
        list_route_tables
        list_security_groups
    done
}

function list_regions {
    regions=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
    for region in $regions; do
        list_vpcs
    done
}

# Calling the function
list_regions
