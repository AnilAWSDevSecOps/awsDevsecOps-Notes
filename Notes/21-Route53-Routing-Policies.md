# 21. Global Load Balancers:
  1. AWS Route53 routing policies
  2. Global Accelerators

## 21.1 AWS Route53 routing policies:
- Failover (One fails another)
- Latency (Nearest Location)
- Weighted (0 to 255)
- Geo-Location
- Multi-Value

### Infrastructure Setup:
- For this we use the terraform code to build 3 VPCs in India, Ireland and US to do the Global Load Balancing, Below is the code

### 1. providers.tf
```
#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
  alias  = "eastus"
  region = "us-east-1"
}

provider "aws" {
  alias  = "india"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "ireland"
  region = "eu-west-1"
}

terraform {
  required_version = "<= 2.3.14" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 6.0.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
}
```

### 2. variables.tf
```
variable "aws_region" {}
variable "amis" {
  description = "AMIs by region"
  default = {
    us-east-1 = "ami-97785bed" # ubuntu 14.04 LTS
    us-east-2 = "ami-f63b1193" # ubuntu 14.04 LTS
    us-west-1 = "ami-824c4ee2" # ubuntu 14.04 LTS
    us-west-2 = "ami-f2d3638a" # ubuntu 14.04 LTS
  }
}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "IGW_name" {}
variable "key_name" {}
variable "public_subnet1_cidr" {}
variable "public_subnet2_cidr" {}
variable "public_subnet3_cidr" {}
variable "private_subnet_cidr" {}
variable "public_subnet1_name" {}
variable "public_subnet2_name" {}
variable "public_subnet3_name" {}
variable "private_subnet_name" {}
variable "Main_Routing_Table" {}
variable "azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "environment" { default = "dev" }
variable "instance_type" {
  default = {
    dev  = "t2.nano"
    test = "t2.micro"
    prod = "t2.medium"
  }
}
```

### 3. terraform.tfvars
```
aws_region          = "us-east-1"
vpc_cidr            = "10.1.0.0/16"
public_subnet1_cidr = "10.1.1.0/24"
public_subnet2_cidr = "10.1.2.0/24"
public_subnet3_cidr = "10.1.3.0/24"
private_subnet_cidr = "10.1.4.0/24"
vpc_name            = "terraform-aws-testing"
IGW_name            = "terraform-aws-igw"
public_subnet1_name = "Terraform_Public_Subnet1-testing"
public_subnet2_name = "Terraform_Public_Subnet2-testing"
public_subnet3_name = "Terraform_Public_Subnet3-testing"
private_subnet_name = "Terraform_Private_Subnet-testing"
Main_Routing_Table  = "Terraform_Main_table-testing"
key_name            = "July2024"
environment         = "dev"
```

### 4. india.tf
```
resource "aws_vpc" "default-india" {
  provider             = aws.india
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.vpc_name}"
    Owner       = "Anil Kumar Reddy"
    environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "default-india" {
  provider = aws.india
  vpc_id   = aws_vpc.default-india.id
  tags = {
    Name = "${var.IGW_name}"
  }
}

resource "aws_subnet" "subnet1-public-india" {
  provider          = aws.india
  vpc_id            = aws_vpc.default-india.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = "ap-south-1a"

  tags = {
    Name = "${var.public_subnet1_name}"
  }
}

resource "aws_subnet" "subnet2-public-india" {
  provider          = aws.india
  vpc_id            = aws_vpc.default-india.id
  cidr_block        = var.public_subnet2_cidr
  availability_zone = "ap-south-1b"

  tags = {
    Name = "${var.public_subnet2_name}"
  }
}

resource "aws_subnet" "subnet3-public-india" {
  provider          = aws.india
  vpc_id            = aws_vpc.default-india.id
  cidr_block        = var.public_subnet3_cidr
  availability_zone = "ap-south-1c"

  tags = {
    Name = "${var.public_subnet3_name}"
  }

}


resource "aws_route_table" "terraform-public-india" {
  provider = aws.india
  vpc_id   = aws_vpc.default-india.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default-india.id
  }
  tags = {
    Name = "${var.Main_Routing_Table}"
  }
}

resource "aws_route_table_association" "terraform-public1-india" {
  provider       = aws.india
  subnet_id      = aws_subnet.subnet1-public-india.id
  route_table_id = aws_route_table.terraform-public-india.id
}

resource "aws_route_table_association" "terraform-public2-india" {
  provider       = aws.india
  subnet_id      = aws_subnet.subnet2-public-india.id
  route_table_id = aws_route_table.terraform-public-india.id
}

resource "aws_route_table_association" "terraform-public3-india" {
  provider       = aws.india
  subnet_id      = aws_subnet.subnet3-public-india.id
  route_table_id = aws_route_table.terraform-public-india.id
}

resource "aws_security_group" "allow_all-india" {
  provider    = aws.india
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.default-india.id
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

resource "aws_instance" "web-1-india" {
  provider                    = aws.india
  ami                         = "ami-02eb7a4783e7e9317"
  availability_zone           = "ap-south-1a"
  instance_type               = "t2.micro"
  key_name                    = "July2024"
  subnet_id                   = aws_subnet.subnet1-public-india.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all-india.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "India-Server-1"
    Env        = "Prod"
    Owner      = "Sree"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
	#!/bin/bash
  sudo apt-get update
	sudo apt-get install -y nginx
	sudo systemctl start nginx
	sudo systemctl enable nginx
	echo "<h1>India-Server-1</h1>" | sudo tee -a /var/www/html/index.nginx-debian.html
	EOF
}
```

### ireland.tf
```
resource "aws_vpc" "default-ireland" {
  provider             = aws.ireland
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.vpc_name}"
    Owner       = "Anil Kumar Reddy "
    environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "default-ireland" {
  provider = aws.ireland
  vpc_id   = aws_vpc.default-ireland.id
  tags = {
    Name = "${var.IGW_name}"
  }
}

resource "aws_subnet" "subnet1-public-ireland" {
  provider          = aws.ireland
  vpc_id            = aws_vpc.default-ireland.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = "eu-west-1a"

  tags = {
    Name = "${var.public_subnet1_name}"
  }
}

resource "aws_subnet" "subnet2-public-ireland" {
  provider          = aws.ireland
  vpc_id            = aws_vpc.default-ireland.id
  cidr_block        = var.public_subnet2_cidr
  availability_zone = "eu-west-1b"

  tags = {
    Name = "${var.public_subnet2_name}"
  }
}

resource "aws_subnet" "subnet3-public-ireland" {
  provider          = aws.ireland
  vpc_id            = aws_vpc.default-ireland.id
  cidr_block        = var.public_subnet3_cidr
  availability_zone = "eu-west-1c"

  tags = {
    Name = "${var.public_subnet3_name}"
  }

}


resource "aws_route_table" "terraform-public-ireland" {
  provider = aws.ireland
  vpc_id   = aws_vpc.default-ireland.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default-ireland.id
  }
  tags = {
    Name = "${var.Main_Routing_Table}"
  }
}

resource "aws_route_table_association" "terraform-public1-ireland" {
  provider       = aws.ireland
  subnet_id      = aws_subnet.subnet1-public-ireland.id
  route_table_id = aws_route_table.terraform-public-ireland.id
}

resource "aws_route_table_association" "terraform-public2-ireland" {
  provider       = aws.ireland
  subnet_id      = aws_subnet.subnet2-public-ireland.id
  route_table_id = aws_route_table.terraform-public-ireland.id
}

resource "aws_route_table_association" "terraform-public3-ireland" {
  provider       = aws.ireland
  subnet_id      = aws_subnet.subnet3-public-ireland.id
  route_table_id = aws_route_table.terraform-public-ireland.id
}

resource "aws_security_group" "allow_all-ireland" {
  provider    = aws.ireland
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.default-ireland.id
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

resource "aws_instance" "web-1-ireland" {
  provider                    = aws.ireland
  ami                         = "ami-00aa9d3df94c6c354"
  availability_zone           = "eu-west-1a"
  instance_type               = "t2.micro"
  key_name                    = "July2024"
  subnet_id                   = aws_subnet.subnet1-public-ireland.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all-ireland.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Ireland-Server-1"
    Env        = "Prod"
    Owner      = "Sree"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
	#!/bin/bash
  sudo apt-get update
	sudo apt-get install -y nginx
	sudo systemctl start nginx
	sudo systemctl enable nginx
	echo "<h1>Ireland-Server-1</h1>" | sudo tee -a /var/www/html/index.nginx-debian.html
	EOF
}
```

### 5. us.tf
```
resource "aws_vpc" "default" {
  provider             = aws.eastus
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.vpc_name}"
    Owner       = "Anil Kumar Reddy"
    environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "default" {
  provider = aws.eastus
  vpc_id   = aws_vpc.default.id
  tags = {
    Name = "${var.IGW_name}"
  }
}

resource "aws_subnet" "subnet1-public" {
  provider          = aws.eastus
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.public_subnet1_name}"
  }
}

resource "aws_subnet" "subnet2-public" {
  provider          = aws.eastus
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet2_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.public_subnet2_name}"
  }
}

resource "aws_subnet" "subnet3-public" {
  provider          = aws.eastus
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet3_cidr
  availability_zone = "us-east-1c"

  tags = {
    Name = "${var.public_subnet3_name}"
  }

}


resource "aws_route_table" "terraform-public" {
  provider = aws.eastus
  vpc_id   = aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }
  tags = {
    Name = "${var.Main_Routing_Table}"
  }
}

resource "aws_route_table_association" "terraform-public1" {
  provider       = aws.eastus
  subnet_id      = aws_subnet.subnet1-public.id
  route_table_id = aws_route_table.terraform-public.id
}

resource "aws_route_table_association" "terraform-public2" {
  provider       = aws.eastus
  subnet_id      = aws_subnet.subnet2-public.id
  route_table_id = aws_route_table.terraform-public.id
}

resource "aws_route_table_association" "terraform-public3" {
  provider       = aws.eastus
  subnet_id      = aws_subnet.subnet3-public.id
  route_table_id = aws_route_table.terraform-public.id
}

resource "aws_security_group" "allow_all" {
  provider    = aws.eastus
  name        = "allow_all"
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

resource "aws_instance" "web-1" {
  provider                    = aws.eastus
  ami                         = "ami-0aa2b7722dc1b5612"
  availability_zone           = "us-east-1a"
  instance_type               = "t2.micro"
  key_name                    = "July2024"
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "US-Server-1"
    Env        = "Prod"
    Owner      = "Sree"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
	#!/bin/bash
  sudo apt-get update
	sudo apt-get install -y nginx
	sudo systemctl start nginx
	sudo systemctl enable nginx
	echo "<h1>US-Server-1</h1>" | sudo tee -a /var/www/html/index.nginx-debian.html
	EOF
}

# resource "aws_instance" "web-2" {
#   provider                    = aws.eastus
#   ami                         = "ami-0aa2b7722dc1b5612"
#   availability_zone           = "us-east-1a"
#   instance_type               = "t2.micro"
#   key_name                    = "LaptopKey"
#   subnet_id                   = aws_subnet.subnet1-public.id
#   vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
#   associate_public_ip_address = true
#   tags = {
#     Name       = "US-Server-2"
#     Env        = "Prod"
#     Owner      = "Sree"
#     CostCenter = "ABCD"
#   }
#   user_data = <<-EOF
# 	#!/bin/bash
#   sudo apt-get update
# 	sudo apt-get install -y nginx
# 	sudo systemctl start nginx
# 	sudo systemctl enable nginx
# 	echo "<h1>US-Server-2</h1>" | sudo tee -a /var/www/html/index.nginx-debian.html
# 	EOF
# }

# resource "aws_instance" "web-3" {
#   provider                    = aws.eastus
#   ami                         = "ami-0aa2b7722dc1b5612"
#   availability_zone           = "us-east-1a"
#   instance_type               = "t2.micro"
#   key_name                    = "LaptopKey"
#   subnet_id                   = aws_subnet.subnet1-public.id
#   vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
#   associate_public_ip_address = true
#   tags = {
#     Name       = "US-Server-3"
#     Env        = "Prod"
#     Owner      = "Sree"
#     CostCenter = "ABCD"
#   }
#   user_data = <<-EOF
# 	#!/bin/bash
#   sudo apt-get update
# 	sudo apt-get install -y nginx
# 	sudo systemctl start nginx
# 	sudo systemctl enable nginx
# 	echo "<h1>US-Server-3</h1>" | sudo tee -a /var/www/html/index.nginx-debian.html
#   echo "<h1>NEW APP VERSION</h1>" | sudo tee -a /var/www/html/index.nginx-debian.html
# 	EOF
# }
```

### 6. July2024 Public Key:
```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCqYZ8N68h3MrIxGm+ajIacWxPr885BQReNDep5/JJqVoed32qe5sWxtE24MScqz21arXGFUCwSx43g+gOxdSStDc1thuJrdFXmBbDzNmIVHSWHiQgmaR9N04zjmiHhXk/hoswjSQimGzUwZvegHQXQjXK+4rDbEFwi+FNTbZN6IA3X2fz2iedoHPWXoWsjdz6RaEUTyYKs0PnSN5jQDf7WEeE1jfE6boPEC7OPmesugQ0iM8nt/FIZ1vLcf7IG4EgrGfKYpG64k/NcUy25gfbdkG5PtIsH8gVN2ZenmwXFccq2dCxOSqw0jLStBCX9540dT1UKBFBYPTub9Aj4wARZ
```

### 7. July2024 Private Key:
```
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAqmGfDevIdzKyMRpvmoyGnFsT6/POQUEXjQ3qefySalaHnd9q
nubFsbRNuDEnKs9tWq1xhVAsEseN4PoDsXUkrQ3NbYbia3RV5gWw8zZiFR0lh4kI
JmkfTdOM45oh4V5P4aLMI0kIphs1MGb3oB0F0I1yvuKw2xBcIvhTU22TeiAN19n8
9onnaBz1l6FrI3c+kWhFE8mCrND50jeY0A3+1hHhNY3xOm6DxAuzj5nrLoENIjPJ
7fxSGdby3H+yBuBIKxnymKRuuJPzXFMtuYH23ZBuT7SLB/IFTdmXp5sFxXHKtnQs
TkqsNIy0rQQl/eeNHU9VCgRQWD07m/QI+MAEWQIDAQABAoIBAH5aqzQNubr8M73K
lx2MPX/S43FGe51VAnwu58bTklmeFjD0MQPqrI3e4wxIF33eGoD2w4tUK3s51nQT
tY1zDGHyLHifYWbC/bj6W4HiwNZbqStcaljh+L8ktgVMlvelk6QHsVAxp2JYJxfg
JJ/vJhLF82SwhOvQtCOS+WiTiJ011hY2Ljd4CjSO3cIx/3jXKTc6i0wEtQvNXxl/
4nplMoVA7JTZx6aOOA8PoLCTlXvyWxQeY3qeYe/KDQXRosovi/EANnHcUmePflSq
epwKZj/n1a+81YEmaczdiMDn+j8MxuFnU8IVL9q4nu1hvKA1w0g9r00aesOCV7ho
W+sLYUkCgYEA3HDdpsVs0qP6i9EDyVENp8rb96SHVaa8Z8rbFuiXzEFjlzjH6wMv
HftNAANuiu47ZkqS0wk9ySz++/I13pKzTOgTg5vRDDeFwFIYlr+Z2aJ1SfAB+7dQ
A9r4Hq+u5OmhU0IhC8KVJRKs+RA4BzVdFf1dkaPIAKKs3Yx0nNhu7OcCgYEAxd2K
QX5J0AEHbAkBeEI7u1bEas//SVPQBHNNvPWXGkkmqwsZPpr//Kc3EgUwWRRaudgY
WBHFCCEADgHyDIfqabwWWqqD6ShFVnd/27NqLBKMLg6sbsYanwc+BUEyY0CilBjM
qymTJ2p5vT7N/B1MvwCBE+EPG7taI790skzMHL8CgYEAmR1oR9tfkBvH/m+q0p2S
/5Y/HY7RVePff7R+YzYhogVVOId/DTUD+C5COJ0pniSFa7KmsyD7Io43eiat1jBN
jECytTp4hKTYKVKcs7DYGzvlffrQVdfpIxRoPWBH+cZxgNQxAeshD0Qek0z5rcAa
LRj0ciGx3QchTS2vHfaTbccCgYEAslHJQuMEtJ/ox3WKTI4sdNZqp/SSFsyhARHF
MpGGvxrD7YxQEPrxzwoH+IaSnwVYCnr03ZIOJxhOi1E3ihGHsgjfgJCB10QC0T1b
Dm4wNk305aE1x5Nj9IQ7YdLzDT34B04eTfdm9jPgSSxryVXCj7Rtn7PJwO1k/CiU
jAfoP9MCgYBvvAgo7RHs4UC4LAhmMsu9kzEWL4aIjnyDkskj+bVYNTENdTfLZdXU
YwQDI1gDQzuRZqv527ryFWYbEnHmGcqMt3SnyfOAvVreFc/jc5P0gKYSTpjgKkql
CnezK1FBoN3k7b0Xbkyg1+lfOh2kWs4oye7E7ptHa1PHqR6JI8Eekg==
-----END RSA PRIVATE KEY-----
```
## 21.2. Testing the Nginx in all 3 servers
- India Server
  
  ![602](https://github.com/user-attachments/assets/aa7ab8dd-fc7a-48c2-814a-9618e6a1d2a8)
  
- US server
  
  ![603](https://github.com/user-attachments/assets/467eaa64-9b63-4c3e-b91e-cefca2c6c809)

- Ireland Server
  
  ![604](https://github.com/user-attachments/assets/550814f8-7192-4ccf-9d55-9ac0d9dba872)
  
## 21.3. Health Check Creation:
- Create Health Checks under Route 53 > Health Checks.
- Click on Create Health Checks button to create it for US Server, India Server and Ireland Server
  ![605](https://github.com/user-attachments/assets/11496949-a78f-4955-be34-38dfec3e3ecb)

- Fill in the details like Name, What to monitor as Endpoint, Protocol, IP address ```US Server Public IP```, Port, Request interval and Failure threshold
- Click on Next Button to proceed.
  ![606](https://github.com/user-attachments/assets/7d315f60-0de2-47d3-8713-867f8e44ace2)

- If require you can configure the alarm as we did it in Auto Scaling in AWS. and selected the Notification Which is created in Auto scaling Groups
- Click on Create health check button.
  ![607](https://github.com/user-attachments/assets/478c6a44-6b5f-4a67-8647-fe1ca00901e7)

- Fill in the details like Name, What to monitor as Endpoint, Protocol, IP address ```Ireland Server Public IP```, Port, Request interval and Failure threshold
- Click on Next Button to proceed.
  ![608](https://github.com/user-attachments/assets/7111b9db-9bf8-4db2-a6b6-cdf3f474e600)

- If require you can configure the alarm as we did it in Auto Scaling in AWS. and selected the Notification Which is created in Auto scaling Groups
- Click on Create health check button.
  ![607](https://github.com/user-attachments/assets/478c6a44-6b5f-4a67-8647-fe1ca00901e7)

- Fill in the details like Name, What to monitor as Endpoint, Protocol, IP address ```India Server Public IP```, Port, Request interval and Failure threshold
- Click on Next Button to proceed.
  ![609](https://github.com/user-attachments/assets/dce72a38-d021-48b9-99b4-236adfc9c4e9)

- If require you can configure the alarm as we did it in Auto Scaling in AWS. and selected the Notification Which is created in Auto scaling Groups
- Click on Create health check button.
  ![607](https://github.com/user-attachments/assets/478c6a44-6b5f-4a67-8647-fe1ca00901e7)

- 3 health Checks created successfully and Initially Status will be unknown and after some time it will change to healthy if servrs are healthy.
  ![610](https://github.com/user-attachments/assets/95784335-1873-4308-abcf-6636812dd4e0)

- Healthy status.
  ![611](https://github.com/user-attachments/assets/9f380d91-573e-418d-9d9d-6f586f6c811c)
  
## 21.4 Failover:
### 21.4.1 Failover Records Creation in Hosted Zones
- Now we will create the failover record in our Route53 > Hosted Zones, A Record. for US server as primary.
  ![612](https://github.com/user-attachments/assets/1b115542-4b23-425e-9680-86cc663ff77e)

- Now we will create the failover record in our Route53 > Hosted Zones, A Record. for Ireland server as seccondary.
  ![613](https://github.com/user-attachments/assets/4f48a81e-0ea7-40ba-ad1e-b05764d872c3)

- After adding records.
  ![614](https://github.com/user-attachments/assets/19d19c12-f0bb-4d28-a51c-0416785be250)

- Now when we browse ```failover.madireddyanil.in``` in browser it go to the primary i.e US Server record.
  ![615](https://github.com/user-attachments/assets/d4d9d400-ae27-4aae-9a22-b67ba2fa3ec9)

- If failover occour for US server then the it will route to the Ireland server
- If require login to the US Server try stopping the nginx with ```service nginx stop``` command.
- Now failover works and routes to Ireland server which is secondary
  ![616](https://github.com/user-attachments/assets/4e19f1d2-0467-4821-a77c-97ae9f6939e9)

- Suddenly it will not route to failover if health check fails only it will route to secondary.
  ![617](https://github.com/user-attachments/assets/5061e526-f5f1-478a-be8b-b7862d9e8b1c)

- After health failure it routed to secondary when we browse the  ```failover.madireddyanil.in``` in browser
  ![618](https://github.com/user-attachments/assets/8dcfbffa-e544-4538-a58e-8567c3514b00)

- Now again we will start the service in US Server.
  ![619](https://github.com/user-attachments/assets/8a78a05a-31d2-4f56-b851-793baffda73d)

- Now traffic again routed to primary i.e US server
  ![615](https://github.com/user-attachments/assets/d4d9d400-ae27-4aae-9a22-b67ba2fa3ec9)

- Health Check recovery after starting the service in US server.
  ![620](https://github.com/user-attachments/assets/4d17d614-1477-40e8-8aa2-7a1cb90467a7)

## 21.5 Latency:
### 21.5.1. Latency Records Creation in Hosted Zones
- Now we will create the Latency record in our Route53 > Hosted Zones, A Record. for US server as primary.
  ![621](https://github.com/user-attachments/assets/ae3eff6e-ed67-418b-b6ec-6b70e2a62e95)

- Now we will create the Latency record in our Route53 > Hosted Zones, A Record. for India server as primary.
  ![622](https://github.com/user-attachments/assets/771267aa-77e0-4b3f-b11b-b9f2e02a159f)

- After creating latency records.
  ![623](https://github.com/user-attachments/assets/9a468cf3-5542-44d8-85aa-472b0991245c)

- Now when we browse ```latency.madireddyanil.in``` in browser it go to the nearest Server
- here i browsed from india so i will get india server.
  ![624](https://github.com/user-attachments/assets/66b64e34-9800-423e-aaa6-1e266a2fba49)

- Now when we browse ```latency.madireddyanil.in``` in browser it go to the nearest Server
- here i browsed from America by using VPN so i will get US server.
  ![625](https://github.com/user-attachments/assets/ff6fa498-20e2-4939-97cf-3b313398fab6)

## 21.6. Weighted:
### 21.6.1 Weighted Records Creation in Hosted Zones
- Now we will create the Weighted record in our Route53 > Hosted Zones, A Record. for US, India and Ireland, by clicking on add another record button.
- Weight 1(it will distribute among all 3 servrs).
- Record-1
  ![626](https://github.com/user-attachments/assets/f8a62e2e-4f82-4f34-8537-2c1bbea54ec5)
- Record-2
  ![627](https://github.com/user-attachments/assets/90ef17ff-97be-4588-9059-c4efe2e82a24)
- Record-3, and click on create record button.
  ![628](https://github.com/user-attachments/assets/8af6357c-dced-4582-b8b3-e119728caf5f)

- After creating Weighted records.
  ![629](https://github.com/user-attachments/assets/dadb5d39-f0b8-4f46-86b5-abd7a258463a)

- Now by below Command you can ping the url.
  ```
  while true;
  > do curl -sL http://weighted.madireddyanil.in/ | grep Server;
  > sleep 1;
  > done
  ```
- or you can browse with ```weighted.madireddyanil.in``` so that weight will get distributed.

## 21.7. Geo-Location
### 21.7.1 Geo-Location Records Creation in Hosted Zones
- Now we will create the Geolocation records in our Route53 > Hosted Zones, A Record. for US, India and Ireland, by clicking on add another record button.
- Geolocatio (Request of that country will route to that Servers).
- Record-1
  ![630](https://github.com/user-attachments/assets/7c6e08fd-6c41-462e-bfa6-3994d7509d28)
- Record-2
  ![631](https://github.com/user-attachments/assets/b39ee186-e6d2-4f7c-b95a-ce54d8aab59b)
- Record-3, and click on create record button.
  ![632](https://github.com/user-attachments/assets/2216da43-20f9-4c0f-95b3-9866d32c2f35)

- After creating Weighted records.
  ![633](https://github.com/user-attachments/assets/faffe5a3-7c29-46a8-a68d-9debc1b36331)

- Now you can browse with ```geo.madireddyanil.in``` so that weight will get distributed.
- As i am in India it give India Server
  ![634](https://github.com/user-attachments/assets/c7c6f4aa-38e0-425f-8a46-5747bfb94aa9)

- As when you do lookup for all Global Load balancers
	### Command:
	```
	madireddydevops@MadireddyOmen:~$ nslookup failover.madireddyanil.in
	```
	### Output:
	```
	Server:         10.255.255.254
	Address:        10.255.255.254#53
	
	Non-authoritative answer:
	Name:   failover.madireddyanil.in
	Address: 44.205.16.101
	Name:   failover.madireddyanil.in
	Address: 64:ff9b::2ccd:1065
	```
	### Command:
	```
	madireddydevops@MadireddyOmen:~$ nslookup latency.madireddyanil.in
	```
	### Output:
	```
	Server:         10.255.255.254
	Address:        10.255.255.254#53
	
	Non-authoritative answer:
	Name:   latency.madireddyanil.in
	Address: 13.201.62.237
	Name:   latency.madireddyanil.in
	Address: 64:ff9b::dc9:3eed
	```
	### Command:
	```
	madireddydevops@MadireddyOmen:~$ nslookup geo.madireddyanil.in
	```
	### Output:
	```
	Server:         10.255.255.254
	Address:        10.255.255.254#53
	
	Non-authoritative answer:
	Name:   geo.madireddyanil.in
	Address: 13.201.62.237
	Name:   geo.madireddyanil.in
	Address: 64:ff9b::dc9:3eed
	```
	### Command:
	```
	madireddydevops@MadireddyOmen:~$ nslookup weighted.madireddyanil.in
	```
	### Output:
	```
	Server:         10.255.255.254
	Address:        10.255.255.254#53
	
	Non-authoritative answer:
	Name:   weighted.madireddyanil.in
	Address: 13.201.62.237
	Name:   weighted.madireddyanil.in
	Address: 64:ff9b::34d6:fdbe
	```
 - Same way you can create Routes for multi value records.
 - But for MultiValue Routes it will display all server when you do look up.

   ### Things not possible in Route53 Routing Policies.
   - We cannot Select the Port pr Protocol
   - No SSL Termination
   - Firewall Whitelisting is not possible for DNS.
