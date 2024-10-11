# 5. NAT Gateway Creation:

- To create a NAT first we need to create the Elastic IP, then we need to create the NAT with the created ElasticIP,
  there after we need to assign the NAT to routetable.

  ## 5.1. Steps to create Elastic Ips:

    1. Click on Allocate Elastic IP address button.
       ![19](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/19.jpg)

    2. Select the Network border group and Click on Allocate button, by doing this we have created the Elastic IP in the
       us-east-1 region which must be used in the same region.
       ![20](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/20.jpg)

       ![21](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/21.jpg)

  ## 5.2. Steps to create NAT Gateway:

    1. Click on Create NAT gateway button.
       ![22](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/22.jpg)

    2. Fill in the details like Name, Subnet (Public Subnet: Which has Internet Gateway attached), Connectivity type and
       Elastic IP allocation ID. Here we allocate the above created Elastic IP for this NAT gateway.
       ![23](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/23.jpg)

    3. Click on Create NAT gateway button.
       ![24](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/24.jpg)

    4. After NAT Gateway Creation it looks like below.
       ![25](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/25.jpg)

  ## 5.3. Attaching NAT Gateway to Route table:

    1. Adding NAT Gateway in Route table’s Routes, click on Edit routes button
       ![26](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/26.jpg)

    2. Click on Add route button.
       ![27](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/27.jpg)

    3. Fill the details like Destination & Target, click on Save Changes button.
       ![28](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/28.jpg)

    4. After adding NAT gateway to the Route table it looks like below.
       ![29](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/29.jpg)
