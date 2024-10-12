# AWS Infrastructure As A Code:

- AWS Cloud Fromation Templates - JSON & YAML
- Terraform.

### Stack-01.json

  ```
  {
  	"AWSTemplateFormatVersion": "2010-09-09",
  	"Description": "Devops By Mak CloudFormation Template",
  	"Metadata": {
  		"AWS::CloudFormation::Interface": {
  			"ParameterGroups": [{
  				"Label": {
  					"default": "VPC configuration parameters"
  				},
  				"Parameters": [
  				"VPCNAME",
  				"VPCCIDR",
  				"PublicSubnetCIDR",
  				"SSHLocation"]
  			}],
  			"ParameterLabels": {
  				"VPCNAME": {
  					"default": "Enter VPCNAME of new VPC"
  				},				
  				"VPCCIDR": {
  					"default": "Enter CIDR of new VPC"
  				},
  				"PublicSubnetCIDR": {
  					"default": "Enter CIDR of the public subnet"
  				},
  				"SSHLocation": {
  					"default": "Subnet allowed to ssh on TCP to public subnet"
  				}
  			}
  		}
  	},
  	"Parameters": {
  		"VPCNAME": {
  			"Default": "devopsbymak-vpc",
  			"Description": "Name of the VPC",
  			"Type": "String"
  		},
  		"VPCCIDR": {
  			"AllowedPattern": "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\\/(1[6-9]|2[0-8]))$",
  			"ConstraintDescription": "CIDR block parameter must be in the form x.x.x.x/16-28",
  			"Default": "10.10.0.0/16",
  			"Description": "CIDR block for entire VPC.",
  			"Type": "String"
  		},
  		"PublicSubnetCIDR": {
  			"AllowedPattern": "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\\/(1[6-9]|2[0-8]))$",
  			"ConstraintDescription": "CIDR block parameter must be in the form x.x.x.x/16-28",
  			"Default": "10.10.10.0/24",
  			"Description": "CIDR block for the public subnet",
  			"Type": "String"
  		},
  		"SSHLocation": {
  			"AllowedPattern": "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$",
  			"ConstraintDescription": "CIDR block parameter must be in the form x.x.x.x/0-28",
  			"Default": "0.0.0.0/0",
  			"Description": "Network allowed to ssh to instances in public subnet.",
  			"Type": "String"
  		}
  	},
  	"Mappings": {
  		
  	},
  	"Resources": {
  		"VPC": {
  			"Type": "AWS::EC2::VPC",
  			"Properties": {
  				"EnableDnsSupport": "true",
  				"EnableDnsHostnames": "true",
  				"CidrBlock": {
  					"Ref": "VPCCIDR"
  				},
  				"Tags": [{
  					"Key": "Name",
  					"Value": {
  						"Ref": "VPCNAME"
  					}
  				},
  				{
  					"Key": "CloudFormationStack",
  					"Value": {
  						"Ref": "AWS::StackId"
  					}
  				}]
  			}
  		},
  		"InternetGateway": {
  			"Type": "AWS::EC2::InternetGateway",
  			"Properties": {
  				"Tags": [{
  					"Key": "Name",
  					"Value": {
  						"Fn::Join": ["-",
  						[{
  							"Ref": "VPCNAME"
  						}, "igw"]]
  					}
  				},
  				{
  					"Key": "CloudFormationStack",
  					"Value": {
  						"Ref": "AWS::StackId"
  					}
  				}]
  			}
  		},
  		"PublicSubnet": {
  			"Type": "AWS::EC2::Subnet",
  			"Properties": {
  				"VpcId": {
  					"Ref": "VPC"
  				},
  				"CidrBlock": {
  					"Ref": "PublicSubnetCIDR"
  				},
  				"Tags": [{
  					"Key": "Name",
  					"Value": {
  						"Fn::Join": ["-",
  						[{
  							"Ref": "VPCNAME"
  						}, "PublicSubnet-01"]]
  					}
  				},
  				{
  					"Key": "CloudFormationStack",
  					"Value": {
  						"Ref": "AWS::StackId"
  					}
  				}]
  			}
  		},
  		"AttachGateway": {
  			"Type": "AWS::EC2::VPCGatewayAttachment",
  			"Properties": {
  				"VpcId": {
  					"Ref": "VPC"
  				},
  				"InternetGatewayId": {
  					"Ref": "InternetGateway"
  				}
  			}
  		},
  		"PublicSubnetRouteTable": {
  			"Type": "AWS::EC2::RouteTable",
  			"Properties": {
  				"VpcId": {
  					"Ref": "VPC"
  				},
  				"Tags": [{
  					"Key": "Name",
  					"Value": {
  						"Fn::Join": ["-",
  						[{
  							"Ref": "VPCNAME"
  						}, "PublicRouteTable-01"]]
  					}
  				},
  				{
  					"Key": "CloudFormationStack",
  					"Value": {
  						"Ref": "AWS::StackId"
  					}
  				}]
  			}
  		},
  		"PublicRoute": {
  			"Type": "AWS::EC2::Route",
  			"DependsOn": "AttachGateway",
  			"Properties": {
  				"RouteTableId": {
  					"Ref": "PublicSubnetRouteTable"
  				},
  				"DestinationCidrBlock": "0.0.0.0/0",
  				"GatewayId": {
  					"Ref": "InternetGateway"
  				}
  			}
  		},
  		"PublicSubnetRouteTableAssociation": {
  			"Type": "AWS::EC2::SubnetRouteTableAssociation",
  			"Properties": {
  				"SubnetId": {
  					"Ref": "PublicSubnet"
  				},
  				"RouteTableId": {
  					"Ref": "PublicSubnetRouteTable"
  				}
  			}
  		},
  		"PublicInstanceSG": {
  			"Type": "AWS::EC2::SecurityGroup",
  			"Properties": {
  				"VpcId": {
  					"Ref": "VPC"
  				},
  				"GroupDescription": "Enable SSH access via port 22",
  				"SecurityGroupIngress": [{
  					"IpProtocol": "tcp",
  					"FromPort": "22",
  					"ToPort": "22",
  					"CidrIp": {
  						"Ref": "SSHLocation"
  					}
  				},
  				{
  					"IpProtocol": "tcp",
  					"FromPort": "80",
  					"ToPort": "80",
  					"CidrIp": "0.0.0.0/0"
  				}],
  				"Tags": [{
  					"Key": "Name",
  					"Value": {
  						"Fn::Join": ["-",
  						[{
  							"Ref": "VPCNAME"
  						}, "PublicSG "]]
  					}
  				},
  				{
  					"Key": "CloudFormationStack",
  					"Value": {
  						"Ref": "AWS::StackId"
  					}
  				}]
  			}
  		}
  	},
  	"Outputs": {
  		"VPCId": {
  			"Description": "VPCId of the newly created VPC",
  			"Value": {
  				"Ref": "VPC"
  			}
  		},
  		"PublicSubnet": {
  			"Description": "SubnetId of the public subnet",
  			"Value": {
  				"Ref": "PublicSubnet"
  			}
  		},
  		"PublicSubnetRouteTable": {
  			"Description": "Public route table",
  			"Value": {
  				"Ref": "PublicSubnetRouteTable"
  			}
  		},
  		"PublicInstanceSG": {
  			"Description": "SG for instances in public subnet",
  			"Value": {
  				"Ref": "PublicInstanceSG"
  			}
  		}
  		
  	}
  }
  ```

![1257](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1257.png)
![1258](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1258.png)
![1259](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1259.png)
![1260](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1260.png)
![1261](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1261.png)
![1262](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1262.png)
![1263](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1263.png)
![1264](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1264.png)
![1265](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1265.png)
![1266](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1266.png)
![1267](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1267.png)
![1268](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1268.png)
![1269](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1269.png)
![1270](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1270.png)

- Now we have added one subnet additionally
  ### Updated-Stack-o1.json
  ```
  {
  	"AWSTemplateFormatVersion": "2010-09-09",
  	"Description": "Devops By Mak CloudFormation Template",
  	"Metadata": {
  		"AWS::CloudFormation::Interface": {
  			"ParameterGroups": [{
  				"Label": {
  					"default": "VPC configuration parameters"
  				},
  				"Parameters": [
  				"VPCNAME",
  				"VPCCIDR",
  				"PublicSubnetCIDR",
  				"SSHLocation"]
  			}],
  			"ParameterLabels": {
  				"VPCNAME": {
  					"default": "Enter VPCNAME of new VPC"
  				},				
  				"VPCCIDR": {
  					"default": "Enter CIDR of new VPC"
  				},
  				"PublicSubnetCIDR": {
  					"default": "Enter CIDR of the public subnet"
  				},
  				"SSHLocation": {
  					"default": "Subnet allowed to ssh on TCP to public subnet"
  				}
  			}
  		}
  	},
  	"Parameters": {
  		"VPCNAME": {
  			"Default": "devopsbymak-vpc",
  			"Description": "Name of the VPC",
  			"Type": "String"
  		},
  		"VPCCIDR": {
  			"AllowedPattern": "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\\/(1[6-9]|2[0-8]))$",
  			"ConstraintDescription": "CIDR block parameter must be in the form x.x.x.x/16-28",
  			"Default": "10.10.0.0/16",
  			"Description": "CIDR block for entire VPC.",
  			"Type": "String"
  		},
  		"PublicSubnetCIDR": {
  			"AllowedPattern": "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\\/(1[6-9]|2[0-8]))$",
  			"ConstraintDescription": "CIDR block parameter must be in the form x.x.x.x/16-28",
  			"Default": "10.10.10.0/24",
  			"Description": "CIDR block for the public subnet",
  			"Type": "String"
  		},
  		"PublicSubnetCIDR2": {
  			"AllowedPattern": "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\\/(1[6-9]|2[0-8]))$",
  			"ConstraintDescription": "CIDR block parameter must be in the form x.x.x.x/16-28",
  			"Default": "10.10.20.0/24",
  			"Description": "CIDR block for the public subnet",
  			"Type": "String"
  		},        
  		"SSHLocation": {
  			"AllowedPattern": "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$",
  			"ConstraintDescription": "CIDR block parameter must be in the form x.x.x.x/0-28",
  			"Default": "0.0.0.0/0",
  			"Description": "Network allowed to ssh to instances in public subnet.",
  			"Type": "String"
  		}
  	},
  	"Mappings": {
  		
  	},
  	"Resources": {
  		"VPC": {
  			"Type": "AWS::EC2::VPC",
  			"Properties": {
  				"EnableDnsSupport": "true",
  				"EnableDnsHostnames": "true",
  				"CidrBlock": {
  					"Ref": "VPCCIDR"
  				},
  				"Tags": [{
  					"Key": "Name",
  					"Value": {
  						"Ref": "VPCNAME"
  					}
  				},
  				{
  					"Key": "CloudFormationStack",
  					"Value": {
  						"Ref": "AWS::StackId"
  					}
  				}]
  			}
  		},
  		"InternetGateway": {
  			"Type": "AWS::EC2::InternetGateway",
  			"Properties": {
  				"Tags": [{
  					"Key": "Name",
  					"Value": {
  						"Fn::Join": ["-",
  						[{
  							"Ref": "VPCNAME"
  						}, "igw"]]
  					}
  				},
  				{
  					"Key": "CloudFormationStack",
  					"Value": {
  						"Ref": "AWS::StackId"
  					}
  				}]
  			}
  		},
  		"PublicSubnet": {
  			"Type": "AWS::EC2::Subnet",
  			"Properties": {
  				"VpcId": {
  					"Ref": "VPC"
  				},
  				"CidrBlock": {
  					"Ref": "PublicSubnetCIDR"
  				},
  				"Tags": [{
  					"Key": "Name",
  					"Value": {
  						"Fn::Join": ["-",
  						[{
  							"Ref": "VPCNAME"
  						}, "PublicSubnet-01"]]
  					}
  				},
  				{
  					"Key": "CloudFormationStack",
  					"Value": {
  						"Ref": "AWS::StackId"
  					}
  				}]
  			}
  		},
  		"PublicSubnet2": {
  			"Type": "AWS::EC2::Subnet",
  			"Properties": {
  				"VpcId": {
  					"Ref": "VPC"
  				},
  				"CidrBlock": {
  					"Ref": "PublicSubnetCIDR2"
  				},
  				"Tags": [{
  					"Key": "Name",
  					"Value": {
  						"Fn::Join": ["-",
  						[{
  							"Ref": "VPCNAME"
  						}, "PublicSubnet-02"]]
  					}
  				},
  				{
  					"Key": "CloudFormationStack",
  					"Value": {
  						"Ref": "AWS::StackId"
  					}
  				}]
  			}
  		},        
  		"AttachGateway": {
  			"Type": "AWS::EC2::VPCGatewayAttachment",
  			"Properties": {
  				"VpcId": {
  					"Ref": "VPC"
  				},
  				"InternetGatewayId": {
  					"Ref": "InternetGateway"
  				}
  			}
  		},
  		"PublicSubnetRouteTable": {
  			"Type": "AWS::EC2::RouteTable",
  			"Properties": {
  				"VpcId": {
  					"Ref": "VPC"
  				},
  				"Tags": [{
  					"Key": "Name",
  					"Value": {
  						"Fn::Join": ["-",
  						[{
  							"Ref": "VPCNAME"
  						}, "PublicRouteTable-01"]]
  					}
  				},
  				{
  					"Key": "CloudFormationStack",
  					"Value": {
  						"Ref": "AWS::StackId"
  					}
  				}]
  			}
  		},
  		"PublicRoute": {
  			"Type": "AWS::EC2::Route",
  			"DependsOn": "AttachGateway",
  			"Properties": {
  				"RouteTableId": {
  					"Ref": "PublicSubnetRouteTable"
  				},
  				"DestinationCidrBlock": "0.0.0.0/0",
  				"GatewayId": {
  					"Ref": "InternetGateway"
  				}
  			}
  		},
  		"PublicSubnetRouteTableAssociation": {
  			"Type": "AWS::EC2::SubnetRouteTableAssociation",
  			"Properties": {
  				"SubnetId": {
  					"Ref": "PublicSubnet"
  				},
  				"RouteTableId": {
  					"Ref": "PublicSubnetRouteTable"
  				}
  			}
  		},
  		"PublicInstanceSG": {
  			"Type": "AWS::EC2::SecurityGroup",
  			"Properties": {
  				"VpcId": {
  					"Ref": "VPC"
  				},
  				"GroupDescription": "Enable SSH access via port 22",
  				"SecurityGroupIngress": [{
  					"IpProtocol": "tcp",
  					"FromPort": "22",
  					"ToPort": "22",
  					"CidrIp": {
  						"Ref": "SSHLocation"
  					}
  				},
  				{
  					"IpProtocol": "tcp",
  					"FromPort": "80",
  					"ToPort": "80",
  					"CidrIp": "0.0.0.0/0"
  				}],
  				"Tags": [{
  					"Key": "Name",
  					"Value": {
  						"Fn::Join": ["-",
  						[{
  							"Ref": "VPCNAME"
  						}, "PublicSG "]]
  					}
  				},
  				{
  					"Key": "CloudFormationStack",
  					"Value": {
  						"Ref": "AWS::StackId"
  					}
  				}]
  			}
  		}
  	},
  	"Outputs": {
  		"VPCId": {
  			"Description": "VPCId of the newly created VPC",
  			"Value": {
  				"Ref": "VPC"
  			}
  		},
  		"PublicSubnet": {
  			"Description": "SubnetId of the public subnet",
  			"Value": {
  				"Ref": "PublicSubnet"
  			}
  		},
  		"PublicSubnetRouteTable": {
  			"Description": "Public route table",
  			"Value": {
  				"Ref": "PublicSubnetRouteTable"
  			}
  		},
  		"PublicInstanceSG": {
  			"Description": "SG for instances in public subnet",
  			"Value": {
  				"Ref": "PublicInstanceSG"
  			}
  		}
  		
  	}
  }
  ```

  ![1271](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1271.png)
  ![1272](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1272.png)
  ![1273](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1273.png)
  ![1274](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1274.png)
  ![1275](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1275.png)
  ![1276](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1276.png)
  ![1277](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1277.png)

# StackSets in CloudFormation:

- Cloud Formation Template deploying among the accounts.
- For this we need to create the role or you can use the below link for role.
  ### AWSCloudFormationStackSetAdministrationRole.yml
  ```
  https://s3.amazonaws.com/cloudformation-stackset-sample-templates-us-east-1/AWSCloudFormationStackSetAdministrationRole.yml
  ```
- We need to do this in Master account.
  ![1278](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1278.png)
  ![1279](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1279.png)
  ![1280](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1280.png)
  ![1281](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1281.png)
  ![1282](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1282.png)
  ![1283](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1283.png)
  ![1284](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1284.png)

- Now Do it in Slave2 Account
  ### AWSCloudFormationStackSetExecutionRole.yml
  ```
  https://s3.amazonaws.com/cloudformation-stackset-sample-templates-us-east-1/AWSCloudFormationStackSetExecutionRole.yml
  ```
  ![1286](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1286.png)
  ![1285](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1285.png)
  ![1284](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1284.png)

- Similarly Now Do it in Slave1 Account
  ### AWSCloudFormationStackSetExecutionRole.yml
  ```
  https://s3.amazonaws.com/cloudformation-stackset-sample-templates-us-east-1/AWSCloudFormationStackSetExecutionRole.yml
  ```
  ![1286](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1286.png)
  ![1287](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1287.png)
  ![1284](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1284.png)

- EXTRA
  ![1288](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1288.png)
  ![1289](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1289.png)
  ![1290](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1290.png)
  ![1291](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1291.png)
  ![1292](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1292.png)
  ![1293](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1293.png)
  ![1294](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1294.png)
  ![1295](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1295.png)
  ![1296](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1296.png)
  ![1297](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1297.png)

## Creating Stack Set In Root Account.

![1298](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1298.png)

### AWS-Sample-Infra.json

  ```
  {
  	"AWSTemplateFormatVersion": "2010-09-09",
  	"Description": "Devops By Mak CloudFormation Template",
  	"Metadata": {
  		"AWS::CloudFormation::Interface": {
  			"ParameterGroups": [{
  				"Label": {
  					"default": "VPC configuration parameters"
  				},
  				"Parameters": [
  					"VPCNAME",
  					"VPCCIDR",
  					"PublicSubnetCIDR",
  					"SSHLocation"
  				]
  			}],
  			"ParameterLabels": {
  				"VPCNAME": {
  					"default": "Enter VPCNAME of new VPC"
  				},				
  				"VPCCIDR": {
  					"default": "Enter CIDR of new VPC"
  				},
  				"PublicSubnetCIDR": {
  					"default": "Enter CIDR of the public subnet"
  				},
  				"SSHLocation": {
  					"default": "Subnet allowed to ssh on TCP to public subnet"
  				}
  			}
  		}
  	},
  	"Parameters": {
  		"VPCNAME": {
  			"Default": "devopsbymak-vpc",
  			"Description": "Name of the VPC",
  			"Type": "String"
  		},
  		"VPCCIDR": {
  			"AllowedPattern": "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\\/(1[6-9]|2[0-8]))$",
  			"ConstraintDescription": "CIDR block parameter must be in the form x.x.x.x/16-28",
  			"Default": "10.10.0.0/16",
  			"Description": "CIDR block for entire VPC.",
  			"Type": "String"
  		},
  		"PublicSubnetCIDR": {
  			"AllowedPattern": "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\\/(1[6-9]|2[0-8]))$",
  			"ConstraintDescription": "CIDR block parameter must be in the form x.x.x.x/16-28",
  			"Default": "10.10.10.0/24",
  			"Description": "CIDR block for the public subnet",
  			"Type": "String"
  		},
  		"SSHLocation": {
  			"AllowedPattern": "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$",
  			"ConstraintDescription": "CIDR block parameter must be in the form x.x.x.x/0-28",
  			"Default": "0.0.0.0/0",
  			"Description": "Network allowed to ssh to instances in public subnet.",
  			"Type": "String"
  		}
  	},
  	"Mappings": {
  		"RegionMap": {
  			"us-east-1": {
  				"HVM64": "ami-066784287e358dad1"
  			}
  		}
  	},
  	"Resources": {
  		"VPC": {
  			"Type": "AWS::EC2::VPC",
  			"Properties": {
  				"EnableDnsSupport": "true",
  				"EnableDnsHostnames": "true",
  				"CidrBlock": {
  					"Ref": "VPCCIDR"
  				},
  				"Tags": [{
  					"Key": "Name",
  					"Value": {
  						"Ref": "VPCNAME"
  					}
  				},
  				{
  					"Key": "CloudFormationStack",
  					"Value": {
  						"Ref": "AWS::StackId"
  					}
  				}]
  			}
  		},
  		"InternetGateway": {
  			"Type": "AWS::EC2::InternetGateway",
  			"Properties": {
  				"Tags": [{
  					"Key": "Name",
  					"Value": {
  						"Fn::Join": ["-",
  						[{
  							"Ref": "VPCNAME"
  						}, "igw"]]
  					}
  				},
  				{
  					"Key": "CloudFormationStack",
  					"Value": {
  						"Ref": "AWS::StackId"
  					}
  				}]
  			}
  		},
  		"PublicSubnet": {
  			"Type": "AWS::EC2::Subnet",
  			"Properties": {
  				"VpcId": {
  					"Ref": "VPC"
  				},
  				"CidrBlock": {
  					"Ref": "PublicSubnetCIDR"
  				},
  				"Tags": [{
  					"Key": "Name",
  					"Value": {
  						"Fn::Join": ["-",
  						[{
  							"Ref": "VPCNAME"
  						}, "PublicSubnet-01"]]
  					}
  				},
  				{
  					"Key": "CloudFormationStack",
  					"Value": {
  						"Ref": "AWS::StackId"
  					}
  				}]
  			}
  		},
  		"AttachGateway": {
  			"Type": "AWS::EC2::VPCGatewayAttachment",
  			"Properties": {
  				"VpcId": {
  					"Ref": "VPC"
  				},
  				"InternetGatewayId": {
  					"Ref": "InternetGateway"
  				}
  			}
  		},
  		"PublicSubnetRouteTable": {
  			"Type": "AWS::EC2::RouteTable",
  			"Properties": {
  				"VpcId": {
  					"Ref": "VPC"
  				},
  				"Tags": [{
  					"Key": "Name",
  					"Value": {
  						"Fn::Join": ["-",
  						[{
  							"Ref": "VPCNAME"
  						}, "PublicRouteTable-01"]]
  					}
  				},
  				{
  					"Key": "CloudFormationStack",
  					"Value": {
  						"Ref": "AWS::StackId"
  					}
  				}]
  			}
  		},
  		"PublicRoute": {
  			"Type": "AWS::EC2::Route",
  			"DependsOn": "AttachGateway",
  			"Properties": {
  				"RouteTableId": {
  					"Ref": "PublicSubnetRouteTable"
  				},
  				"DestinationCidrBlock": "0.0.0.0/0",
  				"GatewayId": {
  					"Ref": "InternetGateway"
  				}
  			}
  		},
  		"PublicSubnetRouteTableAssociation": {
  			"Type": "AWS::EC2::SubnetRouteTableAssociation",
  			"Properties": {
  				"SubnetId": {
  					"Ref": "PublicSubnet"
  				},
  				"RouteTableId": {
  					"Ref": "PublicSubnetRouteTable"
  				}
  			}
  		},
  		"PublicInstanceSG": {
  			"Type": "AWS::EC2::SecurityGroup",
  			"Properties": {
  				"VpcId": {
  					"Ref": "VPC"
  				},
  				"GroupDescription": "Enable SSH access via port 22",
  				"SecurityGroupIngress": [{
  					"IpProtocol": "tcp",
  					"FromPort": "22",
  					"ToPort": "22",
  					"CidrIp": {
  						"Ref": "SSHLocation"
  					}
  				},
  				{
  					"IpProtocol": "tcp",
  					"FromPort": "80",
  					"ToPort": "80",
  					"CidrIp": "0.0.0.0/0"
  				}],
  				"Tags": [{
  					"Key": "Name",
  					"Value": {
  						"Fn::Join": ["-",
  						[{
  							"Ref": "VPCNAME"
  						}, "PublicSG "]]
  					}
  				},
  				{
  					"Key": "CloudFormationStack",
  					"Value": {
  						"Ref": "AWS::StackId"
  					}
  				}]
  			}
  		},
  		"Webserver1": {
  			"Type" : "AWS::EC2::Instance",
  			"Properties" : {
  				"ImageId" : { 
  					"Fn::FindInMap" : [ 
  						"RegionMap", { 
  							"Ref" : "AWS::Region" 
  						},
  						"HVM64" 
  					] 
  				},
  				"InstanceType" : "t2.micro",
  				"KeyName" : "July2024",
  				"Tags" : [
  					{ "Key": "Name",
  					"Value": "Webserver-1"
  					}
  				],
  				"Tenancy" : "default",
  				"NetworkInterfaces" : [
  					{
  						"AssociatePublicIpAddress" : "true",
  						"DeviceIndex" : "0",
  						"DeleteOnTermination" : "true",
  						"SubnetId" : { "Ref" : "PublicSubnet" },
  						"GroupSet" : [ { "Ref" : "PublicInstanceSG" } ]
  					}
  				],
  				"UserData" : {
  					"Fn::Base64" : {
  						"Fn::Join" : [
  							"",
  							[
  								"#!/bin/bash -xe \n",
  								"yum update -y \n",
  								"yum install -y nginx \n",
  								"echo '<h1>Webserver-1<h1>' >> /usr/share/nginx/html/index.html \n",
  								"service nginx start \n",
  								"systemctl enable nginx "
  							]
  						]
  					}
  				}
  			}	
  		}
      },
  	"Outputs": {
          "VpcId": {
              "Description": "VPCId of the newly created VPC",
              "Value": {
                  "Ref": "VPC"
              }
          },
          "PublicSubnet": {
              "Description": "SubnetId of the public subnet",
              "Value": {
                  "Ref": "PublicSubnet"
              }
          },
          "PublicSubnetRouteTable": {
              "Description": "Public route table",
              "Value": {
                  "Ref": "PublicSubnetRouteTable"
              }
          },
          "PublicInstanceSG": {
              "Description": "SG for instances in public subnet",
              "Value": {
                  "Ref": "PublicInstanceSG"
              }
          }		
  	}
  }
  ```

![1299](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1299.png)
![1300](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1300.png)
![1301](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1301.png)
![1302](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1302.png)
![1303](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1303.png)
![1304](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1304.png)

- Now your VPC and Instace will get created in 2 account please check.

## NESTED STACKS:

- These are useful in code grater than 1MB coz Stackset will handle code size upto 1MB
- Copy the two nested files in the s3
  ### vpc-childstack.json
  ```
  {
      "AWSTemplateFormatVersion": "2010-09-09",
      "Description": "CF for VPC only creation",
      "Metadata": {
          "AWS::CloudFormation::Interface": {
              "ParameterGroups": [
                  {
                      "Label": {
                          "default": "VPC configuration parameters"
                      },
                      "Parameters": [
                          "VPCNAME",
                          "VPCCIDR",
                          "PublicSubnetCIDR1",
                          "PublicSubnetCIDR2",
                          "SSHLocation"
                      ]
                  }
              ],
              "ParameterLabels": {
                  "VPCCIDR": {
                      "default": "Enter CIDR of new VPC"
                  },
                  "PublicSubnetCIDR": {
                      "default": "Enter CIDR of the public subnet"
                  },
                  "SSHLocation": {
                      "default": "Subnet allowed to ssh on TCP to public subnet"
                  }
              }
          }
      },
      "Parameters": {
          "VPCNAME": {
              "Default": "devopsbymak-vpc",
              "Description": "Name Of The VPC In Parameters",
              "Type": "String"
          },
          "VPCCIDR": {
              "AllowedPattern": "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\\/(1[6-9]|2[0-8]))$",
              "ConstraintDescription": "CIDR block parameter must be in the form x.x.x.x/16-28",
              "Default": "10.10.0.0/16",
              "Description": "CIDR block for entire VPC.",
              "Type": "String"
          },
          "PublicSubnetCIDR1": {
              "AllowedPattern": "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\\/(1[6-9]|2[0-8]))$",
              "ConstraintDescription": "CIDR block parameter must be in the form x.x.x.x/16-28",
              "Default": "10.10.10.0/24",
              "Description": "CIDR block for the public subnet",
              "Type": "String"
          },
          "PublicSubnetCIDR2": {
              "AllowedPattern": "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\\/(1[6-9]|2[0-8]))$",
              "ConstraintDescription": "CIDR block parameter must be in the form x.x.x.x/16-28",
              "Default": "10.10.20.0/24",
              "Description": "CIDR block for the public subnet",
              "Type": "String"
          },
          "SSHLocation": {
              "AllowedPattern": "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$",
              "ConstraintDescription": "CIDR block parameter must be in the form x.x.x.x/0-28",
              "Default": "0.0.0.0/0",
              "Description": "Network allowed to ssh to instances in public subnet.",
              "Type": "String"
          }
      },
      "Mappings": {},
      "Resources": {
          "VPC": {
              "Type": "AWS::EC2::VPC",
              "Properties": {
                  "EnableDnsSupport": "true",
                  "EnableDnsHostnames": "true",
                  "CidrBlock": {
                      "Ref": "VPCCIDR"
                  },
                  "Tags": [
                      {
                          "Key": "Name",
                          "Value": {
                              "Ref": "VPCNAME"
                          }
                      },
                      {
                          "Key": "CloudFormationStack",
                          "Value": {
                              "Ref": "AWS::StackId"
                          }
                      }
                  ]
              }
          },
          "InternetGateway": {
              "Type": "AWS::EC2::InternetGateway",
              "Properties": {
                  "Tags": [
                      {
                          "Key": "Name",
                          "Value": {
                              "Fn::Join": [
                                  "-",
                                  [
                                      {
                                          "Ref": "VPCNAME"
                                      },
                                      "IGW"
                                  ]
                              ]
                          }
                      },
                      {
                          "Key": "CloudFormationStack",
                          "Value": {
                              "Ref": "AWS::StackId"
                          }
                      }
                  ]
              }
          },
          "PublicSubnet1": {
              "Type": "AWS::EC2::Subnet",
              "Properties": {
                  "VpcId": {
                      "Ref": "VPC"
                  },
                  "CidrBlock": {
                      "Ref": "PublicSubnetCIDR1"
                  },
                  "Tags": [
                      {
                          "Key": "Name",
                          "Value": {
                              "Fn::Join": [
                                  "-",
                                  [
                                      {
                                          "Ref": "VPCNAME"
                                      },
                                      "Public-Subnet-1"
                                  ]
                              ]
                          }
                      },
                      {
                          "Key": "CloudFormationStack",
                          "Value": {
                              "Ref": "AWS::StackId"
                          }
                      }
                  ]
              }
          },
          "PublicSubnet2": {
              "Type": "AWS::EC2::Subnet",
              "Properties": {
                  "VpcId": {
                      "Ref": "VPC"
                  },
                  "CidrBlock": {
                      "Ref": "PublicSubnetCIDR2"
                  },
                  "Tags": [
                      {
                          "Key": "Name",
                          "Value": {
                              "Fn::Join": [
                                  "-",
                                  [
                                      {
                                          "Ref": "VPCNAME"
                                      },
                                      "Public-Subnet-2"
                                  ]
                              ]
                          }
                      },
                      {
                          "Key": "CloudFormationStack",
                          "Value": {
                              "Ref": "AWS::StackId"
                          }
                      }
                  ]
              }
          },
          "AttachGateway": {
              "Type": "AWS::EC2::VPCGatewayAttachment",
              "Properties": {
                  "VpcId": {
                      "Ref": "VPC"
                  },
                  "InternetGatewayId": {
                      "Ref": "InternetGateway"
                  }
              }
          },
          "PublicSubnetRouteTable": {
              "Type": "AWS::EC2::RouteTable",
              "Properties": {
                  "VpcId": {
                      "Ref": "VPC"
                  },
                  "Tags": [ 
                      {
                          "Key": "Name",
                          "Value": {
                              "Fn::Join": [
                                  "-",
                                  [
                                      {
                                          "Ref": "VPCNAME"
                                      },
                                      "RT"
                                  ]
                              ]
                          }
                      },
                      {
                          "Key": "CloudFormationStack",
                          "Value": {
                              "Ref": "AWS::StackId"
                          }
                      }
                  ]
              }
          },
          "PublicRoute": {
              "Type": "AWS::EC2::Route",
              "DependsOn": "AttachGateway",
              "Properties": {
                  "RouteTableId": {
                      "Ref": "PublicSubnetRouteTable"
                  },
                  "DestinationCidrBlock": "0.0.0.0/0",
                  "GatewayId": {
                      "Ref": "InternetGateway"
                  }
              }
          },
          "PublicSubnetRouteTableAssociation1": {
              "Type": "AWS::EC2::SubnetRouteTableAssociation",
              "Properties": {
                  "SubnetId": {
                      "Ref": "PublicSubnet1"
                  },
                  "RouteTableId": {
                      "Ref": "PublicSubnetRouteTable"
                  }
              }
          },
          "PublicSubnetRouteTableAssociation2": {
              "Type": "AWS::EC2::SubnetRouteTableAssociation",
              "Properties": {
                  "SubnetId": {
                      "Ref": "PublicSubnet2"
                  },
                  "RouteTableId": {
                      "Ref": "PublicSubnetRouteTable"
                  }
              }
          },
          "PublicInstanceSG": {
              "Type": "AWS::EC2::SecurityGroup",
              "Properties": {
                  "VpcId": {
                      "Ref": "VPC"
                  },
                  "GroupDescription": "Enable SSH access via port 22",
                  "SecurityGroupIngress": [
                      {
                          "IpProtocol": "tcp",
                          "FromPort": "22",
                          "ToPort": "22",
                          "CidrIp": {
                              "Ref": "SSHLocation"
                          }
                      },
                      {
                          "IpProtocol": "tcp",
                          "FromPort": "80",
                          "ToPort": "80",
                          "CidrIp": "0.0.0.0/0"
                      }
                  ],
                  "Tags": [
                      {
                          "Key": "Name",
                          "Value": {
                              "Fn::Join": [
                                  "",
                                  [
                                      "PublicSG ",
                                      {
                                          "Ref": "VPCCIDR"
                                      }
                                  ]
                              ]
                          }
                      },
                      {
                          "Key": "CloudFormationStack",
                          "Value": {
                              "Ref": "AWS::StackId"
                          }
                      }
                  ]
              }
          }
      },
      "Outputs": {
          "VPCId": {
              "Description": "VPCId of the newly created VPC",
              "Value": {
                  "Ref": "VPC"
              }
          },
          "VPCNAME": {
              "Description": "VPCId of the newly created VPC",
              "Value": {
                  "Ref": "VPCNAME"
              }
          },
          "PublicSubnet1": {
              "Description": "SubnetId of the public subnet 1",
              "Value": {
                  "Ref": "PublicSubnet1"
              }
          },
          "PublicSubnet2": {
              "Description": "SubnetId of the public subnet 2",
              "Value": {
                  "Ref": "PublicSubnet2"
              }
          },
          "PublicSubnetRouteTable": {
              "Description": "Public route table",
              "Value": {
                  "Ref": "PublicSubnetRouteTable"
              }
          },
          "PublicInstanceSG": {
              "Description": "SG for instances in public subnet",
              "Value": {
                  "Ref": "PublicInstanceSG"
              }
          }
      }
  }
  ```

  ### ec2-childstack.json
  ```
  {
      "AWSTemplateFormatVersion": "2010-09-09",
      "Description": "CF for EC2 Instanceses only created in Public Subnets",
      "Parameters": {
          "VPCNAME": {
              "Type": "String",
              "Description": "VPCNAME"
          },
          "PublicSubnet1": {
              "Type": "String",
              "Description": "Subnet-1 Value"
          },
          "PublicSubnet2": {
              "Type": "String",
              "Description": "Subnet-1 Value"
          },
          "PublicInstanceSG": {
              "Type": "String",
              "Description": "Security Group ID"
          }
      },
      "Mappings": {},
      "Resources": {
          "WebServer1": {
              "Type": "AWS::EC2::Instance",
              "Properties": {
                  "ImageId": "ami-066784287e358dad1",
                  "InstanceType": "t2.micro",
                  "KeyName": "July2024",
                  "NetworkInterfaces": [
                      {
                          "AssociatePublicIpAddress": "true",
                          "DeviceIndex": "0",
                          "DeleteOnTermination": "true",
                          "SubnetId": {
                              "Ref": "PublicSubnet1"
                          },
                          "GroupSet": [
                              {
                                  "Ref": "PublicInstanceSG"
                              }
                          ]
                      }
                  ],
                  "Tags": [
                      {
                          "Key": "Name",
                          "Value": {
                              "Fn::Join": [
                                  "-",
                                  [
                                      {
                                          "Ref": "VPCNAME"
                                      },
                                      "WebServer-01"
                                  ]
                              ]
                          }
                      }
                  ],
                  "UserData": {
                      "Fn::Base64": {
                          "Fn::Join": [
                              "",
                              [
                                  "#!/bin/bash -xe \n",
                                  "yum update -y \n",
                                  "yum install -y nginx \n",
                                  "echo '<h1>Webserver-1<h1>' >> /usr/share/nginx/html/index.html \n",
                                  "service nginx start \n",
                                  "systemctl enable nginx "
                              ]
                          ]
                      }
                  }
              }
          },
          "WebServer2": {
              "Type": "AWS::EC2::Instance",
              "Properties": {
                  "ImageId": "ami-066784287e358dad1",
                  "InstanceType": "t2.micro",
                  "KeyName": "July2024",
                  "NetworkInterfaces": [
                      {
                          "AssociatePublicIpAddress": "true",
                          "DeviceIndex": "0",
                          "DeleteOnTermination": "true",
                          "SubnetId": {
                              "Ref": "PublicSubnet2"
                          },
                          "GroupSet": [
                              {
                                  "Ref": "PublicInstanceSG"
                              }
                          ]
                      }
                  ],
                  "Tags": [
                      {
                          "Key": "Name",
                          "Value": {
                              "Fn::Join": [
                                  "-",
                                  [
                                      {
                                          "Ref": "VPCNAME"
                                      },
                                      "WebServer-02"
                                  ]
                              ]
                          }
                      }
                  ],
                  "UserData": {
                      "Fn::Base64": {
                          "Fn::Join": [
                              "",
                              [
                                  "#!/bin/bash -xe \n",
                                  "yum update -y \n",
                                  "yum install -y nginx \n",
                                  "echo '<h1>Webserver-1<h1>' >> /usr/share/nginx/html/index.html \n",
                                  "service nginx start \n",
                                  "systemctl enable nginx "
                              ]
                          ]
                      }
                  }
              }
          }
      }
  }
  ```
  ![1304-01](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1304-01.png)

- Now create Stack
  ![1305](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1305.png)
  ![1306](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1306.png)

  ### vpc-ec2-parent-nested.json
  ```
  {
      "AWSTemplateFormatVersion": "2010-09-09",
      "Resources": {
          "ChildStack01": {
              "Type": "AWS::CloudFormation::Stack",
              "Properties": {
                  "TemplateURL": "https://s3.amazonaws.com/madireddyanil.in/vpc-childstack.json",
                  "Parameters": {
                      "VPCNAME": "NESTED-VPC-TESTING",
                      "VPCCIDR": "172.25.0.0/16",
                      "PublicSubnetCIDR1": "172.25.1.0/24",
                      "PublicSubnetCIDR2": "172.25.2.0/24",
                      "SSHLocation": "0.0.0.0/0"
                  },
                  "TimeoutInMinutes": "60"
              }
          },
          "ChildStack02": {
              "Type": "AWS::CloudFormation::Stack",
              "Properties": {
                  "TemplateURL": "https://s3.amazonaws.com/madireddyanil.in/ec2-childstack.json",
                  "Parameters": {
                      "PublicSubnet1": {
                          "Fn::GetAtt": [
                              "ChildStack01",
                              "Outputs.PublicSubnet1"
                          ]
                      },
                      "PublicSubnet2": {
                          "Fn::GetAtt": [
                              "ChildStack01",
                              "Outputs.PublicSubnet2"
                          ]
                      },
                      "VPCNAME": {
                          "Fn::GetAtt": [
                              "ChildStack01",
                              "Outputs.VPCNAME"
                          ]
                      },
                      "PublicInstanceSG": {
                          "Fn::GetAtt": [
                              "ChildStack01",
                              "Outputs.PublicInstanceSG"
                          ]
                      }
                  },
                  "TimeoutInMinutes": "60"
              }
          }
      }
  }
  ```
  ![1307](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1307.png)
  ![1308](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1308.png)
  ![1309](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1309.png)
  ![1310](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1310.png)
  ![1311](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1311.png)
  ![1312](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1312.png)
  ![1313](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1313.png)
  ![1314](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1314.png)
  ![1315](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1315.png)
  ![1316](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1316.png)

### DISADVANTAGES:

Limitations with Cloudformation:

1. Keeping all the code base in singefile and manging is cumbersome.
2. Only works with AWS.
3. Dry run is not that effective.
4. Steep learning curve.
5. No module concept.
6. Iterations or running is not straight. 
