import boto3
import json

def region_list():
    ec2 = boto3.client('ec2' , region_name='us-east-1')
    response = ec2.describe_regions()
    region_list = []
    for region in response['Regions']:
        region_list.append(region['RegionName'])
    return region_list

def vpc_list(region):
    ec2 = boto3.client('ec2' , region_name=region)
    response = ec2.describe_vpcs()
    vpc_list = []
    for vpc in response['Vpcs']:
        vpc_list.append(vpc['VpcId'])
    return vpc_list

def check_cidr_block(region):
    cidr = str(input("Enter the CIDR block: "))
    ec2 = boto3.client('ec2' , region_name=region)
    response = ec2.describe_vpcs()
    cidr_block = [vpc['CidrBlock'] for vpc in response['Vpcs']]
    if cidr in cidr_block:
        return f"VPC with CIDR {cidr} exists in region {region} -----> you can't use this CIDR"
    else:
        return f"VPC with CIDR {cidr} does not exist in region {region} -----> you can create a VPC with this CIDR"
    
def main():
    print(region_list())
    region = str(input("Enter the region: "))
    if region not in region_list():
        print("Invalid region")
    else:
        print(vpc_list(region))
        print(check_cidr_block(region))

if __name__ == '__main__':
    main()