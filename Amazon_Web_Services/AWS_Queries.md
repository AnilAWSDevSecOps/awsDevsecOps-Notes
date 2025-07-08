# AWS Queries:

## 1. Listing
```bash

# Regions
aws ec2 describe-regions --query "Regions[*].RegionName" --output text | tr '\t' '\n'
aws ec2 describe-regions --query "Regions[*].RegionName" --output text | tr '\t' '\n'|awk '{print NR,$0}'
aws ec2 describe-regions | jq ".Regions[].RegionName" -r|awk '{print NR,$0}'

# VPCs IDs
aws ec2 describe-vpcs --region us-west-1 | jq ".Vpcs[].VpcId" -r
aws ec2 describe-vpcs --region us-west-1 --query "Vpcs[].VpcId" --output text

# Subnet IDs
aws ec2 describe-subnets --query "Subnets[].SubnetId" --output text|tr '\t' '\n'|awk '{print NR,$0}'
aws ec2 describe-subnets | jq -r '.Subnets[].SubnetId'|awk '{print NR,$0}'
aws ec2 describe-subnets --region us-east-1| jq -r '.Subnets[].SubnetId'|awk '{print NR,$0}'

# Availability Zones
aws ec2 describe-availability-zones --region us-east-1 --query 'AvailabilityZones[].ZoneName' --output text|tr '\t' '\n'|awk '{print NR,$0}'
aws ec2 describe-availability-zones --region us-east-1| jq -r '.AvailabilityZones[].ZoneName'

```
