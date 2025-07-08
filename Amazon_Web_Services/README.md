# AWS Quiries:
```bash

aws ec2 describe-regions --query "Regions[*].RegionName" --output text | tr '\t' '\n'

aws ec2 describe-regions --query "Regions[*].RegionName" --output text | tr '\t' '\n'|awk '{print NR,$0}'

aws ec2 describe-vpcs --region us-west-1 | jq ".Vpcs[].VpcId" -r

aws ec2 describe-vpcs --region us-west-1 --query "Vpcs[].VpcId" --output text
```
