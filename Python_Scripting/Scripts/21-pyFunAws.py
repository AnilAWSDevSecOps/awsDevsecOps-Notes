import boto3
import json

def region_list(region):
    ec2 = boto3.client('ec2' , region_name=region)
    for vpc in ec2.describe_vpcs().get('Vpcs'):
        print(f"VpcId: {vpc.get('VpcId')} with CidrBlock: {vpc.get('CidrBlock')}")

# Without List Comprehension
def check_cidr(region, cidr):
    print('without list comprehension')
    cidr_block = []
    ec2 = boto3.client('ec2' , region_name=region)
    for vpc in ec2.describe_vpcs().get('Vpcs'):
        cidr_block.append(vpc.get('CidrBlock'))
    if cidr in cidr_block:
        print(f"VPC with CIDR {cidr} exists in region {region} -----> you can't use this CIDR")
    else:
        print(f"VPC with CIDR {cidr} does not exist in region {region} -----> you can create a VPC with this CIDR")

# With List Comprehension
def check_cidr1(region, cidr):
    print('with list comprehension')
    ec2 = boto3.client('ec2' , region_name=region)

    cidr_block = [vpc.get('CidrBlock') for vpc in ec2.describe_vpcs().get('Vpcs')]
    if cidr in cidr_block:
        print(f"VPC with CIDR {cidr} exists in region {region} -----> you can't use this CIDR")
    else:
        print(f"VPC with CIDR {cidr} does not exist in region {region} -----> you can create a VPC with this CIDR")

# def main():
#     region = 'us-east-1'
#     region_list(region)
#     check_cidr(region, '10.88.0.0/16')
#     check_cidr1(region, '10.30.0.0/16')
# or
def main():
    for region in ['us-east-1', 'us-west-1']:
        print('-'*20 + 'Region:'+ region + '-'*20)
        region_list(region)
        check_cidr(region, '10.30.0.0/16')
        check_cidr1(region, '10.88.0.0/16')


if __name__ == '__main__':
    main()
        
