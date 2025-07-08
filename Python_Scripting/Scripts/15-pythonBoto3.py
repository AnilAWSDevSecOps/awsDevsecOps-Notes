import boto3

ec2 = boto3.client('ec2', region_name="us-east-1")
Regions = ec2.describe_regions().get('Regions')

# Print the Region names
for Region in Regions:
    print(Region['RegionName'])

# Output
'''
ap-south-1
eu-north-1
eu-west-3
eu-west-2
eu-west-1
ap-northeast-3
ap-northeast-2
ap-northeast-1
ca-central-1
sa-east-1
ap-southeast-1
ap-southeast-2
eu-central-1
us-east-1
us-east-2
us-west-1
us-west-2
'''
# Append the Region names to a list without a list comprehension
Region_List = []
for Region in Regions:
    Region_List.append(Region['RegionName'])

print(Region_List)
    
# Output
'''
['ap-south-1', 'eu-north-1', 'eu-west-3', 'eu-west-2', 'eu-west-1', 'ap-northeast-3', 'ap-northeast-2', 'ap-northeast-1', 'ca-central-1', 'sa-east-1', 'ap-southeast-1', 'ap-southeast-2', 'eu-central-1', 'us-east-1', 'us-east-2', 'us-west-1', 'us-west-2']
'''

# appending the Region names to list with a list comprehension
Region_List1 = [Region['RegionName'] for Region in Regions]
print(Region_List1)

# Output
'''
['ap-south-1', 'eu-north-1', 'eu-west-3', 'eu-west-2', 'eu-west-1', 'ap-northeast-3', 'ap-northeast-2', 'ap-northeast-1', 'ca-central-1', 'sa-east-1', 'ap-southeast-1', 'ap-southeast-2', 'eu-central-1', 'us-east-1', 'us-east-2', 'us-west-1', 'us-west-2']
'''