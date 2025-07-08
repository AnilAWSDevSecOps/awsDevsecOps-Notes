# Python Code to fetch the details of the VPCs in the region

import boto3
import json
def region_list():
    ec2 = boto3.client('ec2' , region_name='us-east-1')
    response = ec2.describe_regions()
    region_list = []
    for region in response['Regions']:
        region_list.append(region['RegionName'])
    return region_list

def main():
    for region in region_list():
        ec2 = boto3.client('ec2', region_name=region)
        response = ec2.describe_vpcs().get('Vpcs')
        if len(response) == 0:
            print('-'*20 + 'Region:'+ region + '-'*20)
            print(f"No VPCs in region {region}")
        else:
            print('-'*20 + 'Region:'+ region + '-'*20)
            for vpc in response:
                # print(f"VPC ID: {vpc.get('VpcId')} with CIDR: {vpc.get('CidrBlock')} in region: {region}")
                print(f"VpcId: {vpc.get('VpcId')} with CidrBlock: {vpc.get('CidrBlock')}")
            

if __name__ == '__main__':
    main()