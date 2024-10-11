# 6. Subnet Associations:
- Subnet assocoiations are two types public and private

## 6.1. Public Subnet Association in Rout tables:

  1. Assigning the Subnet into the Route table which has Internet Gateway in it makes public subnet, instances under this subnet can access the internet. Open the Internet Gateway route table.
     ![30](https://github.com/user-attachments/assets/a7800f1a-5ee3-4ff2-8bc9-032f6664953e)

  2. Click on ```Subnet association``` then ```Edit subnet associations``` under ```Explicit subnet associations```.
     ![31](https://github.com/user-attachments/assets/c8f1cc57-2b01-4aa6-b31d-a3beb00bfae3)

  3. Select the Subnet that you want to make Public and click on Save associations.
     ![32](https://github.com/user-attachments/assets/5b7ea5f4-a0f0-46b6-8ab5-0bd0e241d4aa)

  4. After subnet association in the route table which has internet gateway in it, it looks like below. and that subnet becoms the Public Subnet.
     ![33](https://github.com/user-attachments/assets/d1ad8a63-bc13-4dde-b392-1aa0ac7d76c8)


## 6.2. Private Subnet Association in Rout tables:

  1. Assigning the Subnet into the Route table which has NAT Gateway in it makes private subnet, instances under this subnet can behave as private instances. Open the NAT Gateway route table.
     ![34](https://github.com/user-attachments/assets/df481e4a-3cc0-4dc7-9e61-4d651c22ad1f)

  2. Click on ```Subnet association``` then ```Edit subnet associations``` under ```Explicit subnet associations```.
     ![35](https://github.com/user-attachments/assets/6d179820-9412-451b-9ea2-72a9d17c2213)

  3. Select the Subnet that you want to make Public and click on Save associations
     ![36](https://github.com/user-attachments/assets/befc1c54-4f62-4c02-8f64-9d74f2d6ebc4)

  4. After subnet association in the route table which has NAT gateway in it, it looks like below. and that subnet becoms the Private Subnet.
     ![37](https://github.com/user-attachments/assets/977db490-166c-44b4-b80a-300d81f617c1)
