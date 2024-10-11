# Terraform:

## 1. AWS CLI Configuration in Windows Power Shell:
- Download the below link and install in Windows.
  ```
  https://awscli.amazonaws.com/AWSCLIV2.msi
  ```
- Now use below commands to congigure the CLI in PS
  ```
  aws configure
  ```
- Now enter the Access key: and Secret access key: of your user.

## 1.1. AWS CLI Configuration in Linux.
  ```
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  ```
- Now Configure the CLI
  ```
  aws configure
  ```
- Now enter the Access key: and Secret access key: of your user.


## 2. Terraform installation Windows.
- download the terraform for windows and keep it in Terraform location and use.

## 2.1. Terraform installation in Linux.
  ```
  wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  sudo apt update && sudo apt install terraform
  ```

## Using Terraform to build Env.

  ### 1-Providers.tf
  ```
  provider "aws" {
    region = "us-east-1"
  }
  
  terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~> 3.0"
      }
      azurerm = {
        source  = "hashicorp/azurerm"
        version = "~> 2.0"
      }
      google = {
        source  = "hashicorp/google"
        version = "~> 3.0"
      }
    }
    backend "s3" {
      bucket = "madireddyanil-terraform-security"
      key    = "terraformtest.tfstate"
      region = "us-east-1"
    }
  }
  ```
  ### 2-vpc.tf
  ```
  resource "aws_vpc" "default" {
    cidr_block           = var.vpc_cidr
    enable_dns_hostnames = true
    tags = {
      Name        = var.vpc_name
      Owner       = var.owner
      environment = var.environment
    }
  }
  
  resource "aws_internet_gateway" "default" {
    # Implicit dependency on aws_vpc.default for internet gateway.
    vpc_id = aws_vpc.default.id
    tags = {
      Name = "${var.vpc_name}-igw"
    }
  }
  ```
  ### 3-subnets.tf
  ```
  resource "aws_subnet" "subnet1-public" {
    vpc_id            = aws_vpc.default.id
    cidr_block        = var.public_subnet1_cidr
    availability_zone = "us-east-1a"
    tags = {
      Name = "${var.vpc_name}-public-subnet1"
    }
  }
  
  resource "aws_subnet" "subnet2-public" {
    vpc_id            = aws_vpc.default.id
    cidr_block        = var.public_subnet2_cidr
    availability_zone = "us-east-1b"
    tags = {
      Name = "${var.vpc_name}-public-subnet2"
    }
  }
  
  resource "aws_subnet" "subnet3-public" {
    vpc_id            = aws_vpc.default.id
    cidr_block        = var.public_subnet3_cidr
    availability_zone = "us-east-1c"
    tags = {
      Name = "${var.vpc_name}-public-subnet3"
    }
  }
  ```
  ### 4-routing.tf
  ```
  resource "aws_route_table" "terraform-public" {
    vpc_id = aws_vpc.default.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.default.id
    }
    tags = {
      Name = "${var.vpc_name}-public-route-table"
    }
  }
  
  resource "aws_route_table_association" "terraform-public1" {
    subnet_id      = aws_subnet.subnet1-public.id
    route_table_id = aws_route_table.terraform-public.id
  }
  
  resource "aws_route_table_association" "terraform-public2" {
    subnet_id      = aws_subnet.subnet2-public.id
    route_table_id = aws_route_table.terraform-public.id
  }
  
  resource "aws_route_table_association" "terraform-public3" {
    subnet_id      = aws_subnet.subnet3-public.id
    route_table_id = aws_route_table.terraform-public.id
  }
  ```
  ### 5-securitygroups.tf
  ```
  resource "aws_security_group" "allow_all" {
    name        = "${var.vpc_name}-security-group"
    description = "Allow all inbound traffic"
    vpc_id      = aws_vpc.default.id
  
    ingress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  ```
  ### 6-instances.tf
  ```
  resource "aws_instance" "instances" {
    count                       = 3
    ami                         = var.imagename
    instance_type               = var.instance_type
    key_name                    = var.key_name
    subnet_id                   = element(aws_subnet.public-subnets[*].id, count.index)
    vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true
    tags = {
      Name        = "Server-${count.index + 1}"
      environment = var.environment
      Owner       = var.owner
    }
    user_data = <<-EOF
                  #!/bin/bash
                  yum update -y
                  yum install nginx -y
                  systemctl start nginx
                  systemctl enable nginx
                  echo "<h1>Deployed PublicServer-${count.index + 1} via Terraform</h1>" >> /usr/share/nginx/html/index.html
                  EOF
  }
  ```
  ### 7-s3buckets.tf
  ```
  resource "aws_s3_bucket" "example" {
    bucket        = "www.madireddyanil.in"
    force_destroy = true
    tags = {
      Name        = "www.madireddyanil.in"
      Environment = "Dev"
    }
  }
  ```
  ### 8-elements-count.tf
  ```
  resource "aws_subnet" "public-subnets" {
    count             = 3
    vpc_id            = aws_vpc.default.id
    cidr_block        = element(var.public-subnets-cidr, count.index)
    availability_zone = element(var.availability-zones, count.index)
    tags = {
      Name = "${var.vpc_name}-public-subnet-${count.index}"
    }
  }
  
  resource "aws_subnet" "private-subnets" {
    count             = 3
    vpc_id            = aws_vpc.default.id
    cidr_block        = element(var.private-subnets-cidr, count.index)
    availability_zone = element(var.availability-zones, count.index)
    tags = {
      Name = "${var.vpc_name}-private-subnet-${count.index}"
    }
  }
  
  resource "aws_route_table_association" "terraform-public-rt-assoc" {
    count          = 3
    subnet_id      = element(aws_subnet.public-subnets[*].id, count.index)
    route_table_id = aws_route_table.terraform-public.id
  }
  ```

- Now use below commands to use the above code
### For Powershell
```
.\terraform.exe init
.\terraform.exe fmt
.\terraform.exe validate
.\terraform.exe plan
.\terraform.exe apply --auto-approve
.\terraform.exe state list
.\terraform.exe destroy --auto-approve
```
