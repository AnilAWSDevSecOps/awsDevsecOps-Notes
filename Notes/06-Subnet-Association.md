# 6. Subnet Associations:

- Subnet assocoiations are two types public and private

## 6.1. Public Subnet Association in Rout tables:

1. Assigning the Subnet into the Route table which has Internet Gateway in it makes public subnet, instances under this
   subnet can access the internet. Open the Internet Gateway route table.
   ![30](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/30.jpg)

2. Click on ```Subnet association``` then ```Edit subnet associations``` under ```Explicit subnet associations```.
   ![31](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/31.jpg)

3. Select the Subnet that you want to make Public and click on Save associations.
   ![32](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/32.jpg)

4. After subnet association in the route table which has internet gateway in it, it looks like below. and that subnet
   becoms the Public Subnet.
   ![33](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/33.jpg)

## 6.2. Private Subnet Association in Rout tables:

1. Assigning the Subnet into the Route table which has NAT Gateway in it makes private subnet, instances under this
   subnet can behave as private instances. Open the NAT Gateway route table.
   ![34](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/34.jpg)

2. Click on ```Subnet association``` then ```Edit subnet associations``` under ```Explicit subnet associations```.
   ![35](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/35.jpg)

3. Select the Subnet that you want to make Public and click on Save associations
   ![36](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/36.jpg)

4. After subnet association in the route table which has NAT gateway in it, it looks like below. and that subnet becoms
   the Private Subnet.
   ![37](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/37.jpg)
