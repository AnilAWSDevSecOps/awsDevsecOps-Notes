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
  ![1257](https://github.com/user-attachments/assets/93c883da-c925-4b7f-aa12-7077ffd7e85e)
  ![1258](https://github.com/user-attachments/assets/87b65cad-2877-478d-ae6f-1b0580456fc1)
  ![1259](https://github.com/user-attachments/assets/a1d28d1a-b6fd-4b60-9a44-9bde936d81d2)
  ![1260](https://github.com/user-attachments/assets/11ac41d4-8312-434c-aba6-5b140d99dfad)
  ![1261](https://github.com/user-attachments/assets/14038df8-efef-4710-ae58-e241a199353f)
  ![1262](https://github.com/user-attachments/assets/865490e6-7cc7-45b4-b074-a57ee56e696c)
  ![1263](https://github.com/user-attachments/assets/6325510b-0395-4337-9366-d0f346ae3cf3)
  ![1264](https://github.com/user-attachments/assets/7323b245-7e0a-4c43-b4d1-a748a8646dc9)
  ![1265](https://github.com/user-attachments/assets/12bf4d1e-faf6-4212-93ed-4bb16acdd606)
  ![1266](https://github.com/user-attachments/assets/85f57122-083a-4e1e-9f1c-b908a68cfc99)
  ![1267](https://github.com/user-attachments/assets/4f57b11c-c566-4e2c-ad30-cc8a34a5a08e)
  ![1268](https://github.com/user-attachments/assets/1e9cae45-b071-4e3f-8167-06179b9e619e)
  ![1269](https://github.com/user-attachments/assets/7cd6e232-4588-4608-8d88-7853c70b4971)
  ![1270](https://github.com/user-attachments/assets/394b7b9b-4ff2-44b4-a7e2-a0a37e2c4896)


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

  ![1271](https://github.com/user-attachments/assets/d51ebbfe-ad99-445d-94fd-2b12c372b1a4)
  ![1272](https://github.com/user-attachments/assets/26a15685-4fa5-48ed-a90e-becd61d90cb4)
  ![1273](https://github.com/user-attachments/assets/f00cf404-1e7e-49d9-9521-5637a7fed30a)
  ![1274](https://github.com/user-attachments/assets/abfdad4a-274d-46c9-a35f-61e5c119b405)
  ![1275](https://github.com/user-attachments/assets/51796b06-8bf8-43f7-968b-cba9ebac0874)
  ![1276](https://github.com/user-attachments/assets/a1bb8b5a-350f-4dd1-856e-9a45528ae8aa)
  ![1277](https://github.com/user-attachments/assets/341689b4-50e8-4b84-a179-927d41492187)

# StackSets in CloudFormation:
- Cloud Formation Template deploying among the accounts.
- For this we need to create the role or you can use the below link for role.
  ### AWSCloudFormationStackSetAdministrationRole.yml
  ```
  https://s3.amazonaws.com/cloudformation-stackset-sample-templates-us-east-1/AWSCloudFormationStackSetAdministrationRole.yml
  ```
- We need to do this in Master account.
  ![1278](https://github.com/user-attachments/assets/5a250247-cd55-413b-ae63-cf6dba9a5626)
  ![1279](https://github.com/user-attachments/assets/b209ac73-fdde-43af-92d2-25a548a229b7)
  ![1280](https://github.com/user-attachments/assets/299d9591-e56d-4f6b-aa9e-fda86befdb95)
  ![1281](https://github.com/user-attachments/assets/59df9fa1-4222-4ff2-93c1-e7d6b1fa325f)
  ![1282](https://github.com/user-attachments/assets/7b3f57e0-ea7d-49f8-ae9a-1e85d7e7cee7)
  ![1283](https://github.com/user-attachments/assets/6c9573fa-a3f8-457b-b590-3a167ce5621e)
  ![1284](https://github.com/user-attachments/assets/81eadf4e-050b-4abe-babb-9242b567ae27)

- Now Do it in Slave2 Account
  ### AWSCloudFormationStackSetExecutionRole.yml
  ```
  https://s3.amazonaws.com/cloudformation-stackset-sample-templates-us-east-1/AWSCloudFormationStackSetExecutionRole.yml
  ```
  ![1286](https://github.com/user-attachments/assets/5fdf59fa-3b8c-4f94-bbd2-1163468f992c)
  ![1285](https://github.com/user-attachments/assets/50e5497f-bf4e-4f0a-80b3-21e13befa6ee)
  ![1284](https://github.com/user-attachments/assets/81eadf4e-050b-4abe-babb-9242b567ae27)

- Similarly Now Do it in Slave1 Account
  ### AWSCloudFormationStackSetExecutionRole.yml
  ```
  https://s3.amazonaws.com/cloudformation-stackset-sample-templates-us-east-1/AWSCloudFormationStackSetExecutionRole.yml
  ```
  ![1286](https://github.com/user-attachments/assets/5fdf59fa-3b8c-4f94-bbd2-1163468f992c)
  ![1287](https://github.com/user-attachments/assets/e7df6506-6d4f-4091-ba6a-7f771ec13b90)
  ![1284](https://github.com/user-attachments/assets/81eadf4e-050b-4abe-babb-9242b567ae27)
  
- EXTRA
  ![1288](https://github.com/user-attachments/assets/e45fb1e3-af5e-4ac2-89d3-db64a67334a9)
  ![1289](https://github.com/user-attachments/assets/673b40ce-62e4-431d-b976-65a54319f11d)
  ![1290](https://github.com/user-attachments/assets/d0d37bed-658f-4b42-90a2-1ab9ecf58dcd)
  ![1291](https://github.com/user-attachments/assets/697133e0-999f-4cb7-97b6-45ecf519bb48)
  ![1292](https://github.com/user-attachments/assets/493fa348-8403-4a08-b8f2-43db80118012)
  ![1293](https://github.com/user-attachments/assets/1f5333c7-5ad5-4fb1-ad37-9c77c1da9048)
  ![1294](https://github.com/user-attachments/assets/1e78db2b-8712-427a-9f04-1d74c2198e41)
  ![1295](https://github.com/user-attachments/assets/8c4fd8a5-f8ba-4eea-8c0d-4db2eee688fe)
  ![1296](https://github.com/user-attachments/assets/562a5da3-4959-44ae-83fd-4453242b54eb)
  ![1297](https://github.com/user-attachments/assets/b94b4233-9fda-4da2-bc18-f1f163ec875e)

## Creating Stack Set In Root Account.
  ![1298](https://github.com/user-attachments/assets/d5292dd0-ae84-4226-957a-66959428608b)

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
  ![1299](https://github.com/user-attachments/assets/6123d7da-d0ba-4db8-a65e-2a416b4d48f6)
  ![1300](https://github.com/user-attachments/assets/3d487a59-cb96-4995-b0ad-510a3177d386)
  ![1301](https://github.com/user-attachments/assets/d17edf82-fa5d-464a-9a23-d6fd4134cb76)
  ![1302](https://github.com/user-attachments/assets/e188aade-9409-4ba6-92a2-92644a5c13c2)
  ![1303](https://github.com/user-attachments/assets/efa20cd4-7c94-42f7-8193-d6dea07740b6)
  ![1304](https://github.com/user-attachments/assets/293be4ef-996a-4115-858f-74fbb298b664)

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
  ![1304-01](https://github.com/user-attachments/assets/15bbd716-79dc-4a10-af05-a22533dbf47d)

- Now create Stack
  ![1305](https://github.com/user-attachments/assets/75cb52bc-7987-4e20-ba24-4be01555273a)
  ![1306](https://github.com/user-attachments/assets/b9dd10c0-24c5-487f-a7c6-5f388023fbd0)

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
  ![1307](https://github.com/user-attachments/assets/b0098996-8326-4c5e-ad3a-bce40ace7c46)
  ![1308](https://github.com/user-attachments/assets/9e59202b-5e33-4e87-9466-dfe367c8ee21)
  ![1309](https://github.com/user-attachments/assets/7413c887-692d-4e3d-83e6-8b3ff95e8f50)
  ![1310](https://github.com/user-attachments/assets/391f43ee-0191-4aea-99b0-1ae9c322b6a5)
  ![1311](https://github.com/user-attachments/assets/363c1d1a-9c3d-4362-b56a-2cbf4f5eaa5d)
  ![1312](https://github.com/user-attachments/assets/b5667ae2-ed5d-4651-bb40-236303c41c08)
  ![1313](https://github.com/user-attachments/assets/d736be55-4482-47c9-92f2-ce1eb7756e56)
  ![1314](https://github.com/user-attachments/assets/ae0962f3-327f-4e98-a631-81c30ca6e6b4)
  ![1315](https://github.com/user-attachments/assets/a3db6bca-a1bd-496f-a246-73b53b7d66ce)
  ![1316](https://github.com/user-attachments/assets/942aeaf1-3b94-47ba-92ef-32f333f5b238)

### DISADVANTAGES:
Limitations with Cloudformation: 
1. Keeping all the code base in singefile and manging is cumbersome.
2. Only works with AWS.
3. Dry run is not that effective.
4. Steep learning curve.
5. No module concept.
6. Iterations or running is not straight. 
