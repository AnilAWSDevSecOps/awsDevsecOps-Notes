# 10. VPC Peering Connection Connection Creation:

### We can establish VPC Peering:
- Between VPC in same account and same region.
- Between VPC in same account and diff region.
- Between VPC in diff account and same region.
- Between VPC in diff account and diff region.
   
### Rules for VPC Peering:
- VPC's which are part of peering must not have same IP Ranges.
- VPC Peering do not support transit
    
## 10.1. Peering between VPC in different account and different region:

1. Create New VPC with VPC and more
   ![62](https://github.com/user-attachments/assets/f49f09af-3faf-4a1d-8eac-c4c091f34f90)
   ![63](https://github.com/user-attachments/assets/652d8e56-d10a-425a-871f-2206c943498c)

2. Click on ```Create VPC``` button.
   ![64](https://github.com/user-attachments/assets/9ca6a848-2794-43bc-b953-02b374a67ea4)

3. Following details are Created in VPC.
   ![65](https://github.com/user-attachments/assets/577a203d-60e9-4760-ad49-aa8d9bd0e5e7)
   ![66](https://github.com/user-attachments/assets/7986c742-3e86-4305-b1ea-6f5756ef2899)

5. VPC with Subnets, Route tables amd Gateways created successfully.
6. Subnets:
   ![67](https://github.com/user-attachments/assets/53f2f734-49af-475e-84bc-ad0c2a73cadb)

7. Route Tables:
   ![68](https://github.com/user-attachments/assets/a3badcbc-9737-49aa-b3cc-80c66c735f70)

   ![69](https://github.com/user-attachments/assets/16847159-58ca-401a-86aa-78aa43555f69)

   ![70](https://github.com/user-attachments/assets/1f4da23b-45db-4633-84df-7d4dac009888)

   ![71](https://github.com/user-attachments/assets/484f63ea-8eb9-404d-a1cf-0c88e0f7248f)
   
8. Security Group:
   ![72](https://github.com/user-attachments/assets/7e30f511-3d30-4732-86b2-a8a546d6279f)

9. Adding Routes in Security Group.
   ![73](https://github.com/user-attachments/assets/9c5e86e1-1f21-4b66-97fa-80210bc970a0)

10. Now we can peer the VPC-01 and sample-Vpc. Now come to VPC-01 Account, click on Peering connections.
   ![74](https://github.com/user-attachments/assets/c96f3ba6-3e55-4c91-860b-4d36324616c8)

11. Click on ```create Peering Connection```.
    ![75](https://github.com/user-attachments/assets/6a5df2b0-6dd5-4366-8516-888c72de3000)

12. Fill in the details like Name, VPC ID (Requester), Account, Account ID(Accepter), Region (Accepter), VPC ID (Accepter) and click on Create peering connection button.
    ![76](https://github.com/user-attachments/assets/5dcbead2-2968-4826-b0db-d7a90f16847a)

    ![77](https://github.com/user-attachments/assets/822ea011-a465-4403-bada-e6facfab0bef)

13. VPC Peering created successfully.
    ![78](https://github.com/user-attachments/assets/e66afebc-d60d-46c8-b852-2937e6f3bbed)
    ![79](https://github.com/user-attachments/assets/c940c68b-4209-4bef-aa5a-3b7966a7e77c)

14. Now in the acceptors account you need to accept the request.
    ![80](https://github.com/user-attachments/assets/2d651b04-5272-46f2-bda5-0dad40d5e57d)

    ![81](https://github.com/user-attachments/assets/b89c1620-ef31-4534-96e5-ef084d22de1d)

15. Pop up after clicking accept button.
    ![82](https://github.com/user-attachments/assets/2cf47aae-aeaa-41c8-9039-bca857079677)

16. After accepting request, Your VPC peering connection has been established. To send and receive traffic across this VPC peering connection, you must add a route to the peered VPCs in one or more of your VPC's route tables.
    ![83](https://github.com/user-attachments/assets/da36da0b-6a22-48b4-b0f0-842f2a53de48)

17. Now in the both the Public Route tables, add the CIDR range, In Acceptors Public Route tables, click on Edit routes and Add route, add the Requester CIDR.
    ![84](https://github.com/user-attachments/assets/f3d1814f-9e2d-416c-b0c4-b1dcbdeb39a5)

18. Click on Save changes.
    ![85](https://github.com/user-attachments/assets/d8e21286-96a2-4da6-b85f-958a7d7c8ce0)

19. After adding the routes it looks like below.
    ![86](https://github.com/user-attachments/assets/ce43e6fc-7314-420a-ba1e-4afcd64b1eed)

20. Now In Requesters Public Route tables, click on Edit routes and Add route, add the Acceptors CIDR, click on Save changes.
    ![87](https://github.com/user-attachments/assets/17678e61-24de-4ea7-84c2-8b527bf729ce)

    ![88](https://github.com/user-attachments/assets/8fa6a180-f2db-47e1-a1eb-f7fa1ef63493)

    ![89](https://github.com/user-attachments/assets/1e1dfa1d-65df-4b0f-89eb-c7fefb766cd1)

21. After adding routes it looks like below.
    ![90](https://github.com/user-attachments/assets/4bb1e47f-c4ee-4954-9954-92af52952815)

22. If requires you need to add the routes in the security group also as below. Sample-vpc security group
    ![91](https://github.com/user-attachments/assets/d6fb2bce-8a10-44cb-8a32-535af3d726a6)

23. VPC-01 Security group.
    ![92](https://github.com/user-attachments/assets/b8457220-6644-475a-865c-4e16af30c092)

24. Now Launch Some Public Instances in Acceptors VPC.
    ![93](https://github.com/user-attachments/assets/8e03309d-c43c-4a45-8784-e3ddd750b86e)

25. Now Launch Some Public Instances in Requesters VPC.
    ![94](https://github.com/user-attachments/assets/4064e5c1-f5e2-46e8-b7aa-d576ca6a5bc7)

26. Now ping both instances with both instances and check if the connection exist or not.
    ![95](https://github.com/user-attachments/assets/57fffcc5-c795-4475-97ec-e26b7e3914a7)

    ![96](https://github.com/user-attachments/assets/cdc76006-5bbe-41db-aba5-8bced3c97efd)

27. Similarly, we can establish VPC Peering between:
    - Same account and same region.
    - Same account and different region.
    - Different account and same region.
   
28. VPC Peering diagram.
    ![97](https://github.com/user-attachments/assets/7e2617c5-742d-490d-95de-1a51ef2ad306)
