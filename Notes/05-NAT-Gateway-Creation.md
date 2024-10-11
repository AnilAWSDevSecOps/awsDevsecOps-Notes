# 5. NAT Gateway Creation:
- To create a NAT first we need to create the Elastic IP, then we need to create the NAT with the created ElasticIP, there after we need to assign the NAT to routetable.
  
  ## 5.1. Steps to create Elastic Ips:
    
   1. Click on Allocate Elastic IP address button.
      ![19](https://github.com/user-attachments/assets/7555f746-1c79-400a-8e61-74d2605a0060)
          
   2. Select the Network border group and Click on Allocate button, by doing this we have created the Elastic IP in the us-east-1 region which must be used in the same region.
      ![20](https://github.com/user-attachments/assets/46f53a8b-c05e-4e98-9452-d229a5f61d7b)

      ![21](https://github.com/user-attachments/assets/7d88363f-d693-48a2-b883-6ff156c5bef0)

  ## 5.2. Steps to create NAT Gateway:
  
   1. Click on Create NAT gateway button.
      ![22](https://github.com/user-attachments/assets/5951f658-4cde-4152-956a-330b9886e35f)

   2. Fill in the details like Name, Subnet (Public Subnet: Which has Internet Gateway attached), Connectivity type and Elastic IP allocation ID. Here we allocate the above created Elastic IP for this NAT gateway.
      ![23](https://github.com/user-attachments/assets/c4a0feb0-6108-45ef-9808-18ce46938bbc)

   3. Click on Create NAT gateway button.
      ![24](https://github.com/user-attachments/assets/edb0b987-a4d2-4991-b1d2-0b3379420006)

   4. After NAT Gateway Creation it looks like below.
      ![25](https://github.com/user-attachments/assets/c17fb659-0eb5-455b-94ee-3add58d2770a)

  ## 5.3. Attaching NAT Gateway to Route table:

   1. Adding NAT Gateway in Route table’s Routes, click on Edit routes button
      ![26](https://github.com/user-attachments/assets/0c39382e-25e5-45ac-ba78-af3aab28c7ee)
   
   2. Click on Add route button.
      ![27](https://github.com/user-attachments/assets/0a003ce9-abec-4804-b3e5-edaf892a3dbb)

   3. Fill the details like Destination & Target, click on Save Changes button.
      ![28](https://github.com/user-attachments/assets/e4a730ac-dfb5-4ea9-8738-77bb76e3bbd1)

   4. After adding NAT gateway to the Route table it looks like below.
      ![29](https://github.com/user-attachments/assets/2e72f8a7-6e46-4337-a8d7-b115d8058985)
