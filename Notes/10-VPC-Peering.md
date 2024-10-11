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
   ![62](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/62.jpg)
   ![63](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/63.jpg)

2. Click on ```Create VPC``` button.
   ![64](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/64.jpg)

3. Following details are Created in VPC.
   ![65](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/65.jpg)
   ![66](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/66.jpg)

5. VPC with Subnets, Route tables amd Gateways created successfully.
6. Subnets:
   ![67](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/67.jpg)

7. Route Tables:
   ![68](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/68.jpg)

   ![69](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/69.jpg)

   ![70](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/70.jpg)

   ![71](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/71.jpg)

8. Security Group:
   ![72](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/72.jpg)

9. Adding Routes in Security Group.
   ![73](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/73.jpg)

10. Now we can peer the VPC-01 and sample-Vpc. Now come to VPC-01 Account, click on Peering connections.
    ![74](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/74.jpg)

11. Click on ```create Peering Connection```.
    ![75](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/75.jpg)

12. Fill in the details like Name, VPC ID (Requester), Account, Account ID(Accepter), Region (Accepter), VPC ID (
    Accepter) and click on Create peering connection button.
    ![76](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/76.jpg)

    ![77](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/77.jpg)

13. VPC Peering created successfully.
    ![78](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/78.jpg)
    ![79](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/79.jpg)

14. Now in the acceptors account you need to accept the request.
    ![80](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/80.jpg)

    ![81](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/81.jpg)

15. Pop up after clicking accept button.
    ![82](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/82.jpg)

16. After accepting request, Your VPC peering connection has been established. To send and receive traffic across this
    VPC peering connection, you must add a route to the peered VPCs in one or more of your VPC's route tables.
    ![83](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/83.jpg)

17. Now in the both the Public Route tables, add the CIDR range, In Acceptors Public Route tables, click on Edit routes
    and Add route, add the Requester CIDR.
    ![84](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/84.jpg)

18. Click on Save changes.
    ![85](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/85.jpg)

19. After adding the routes it looks like below.
    ![86](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/86.jpg)

20. Now In Requesters Public Route tables, click on Edit routes and Add route, add the Acceptors CIDR, click on Save
    changes.
    ![87](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/87.jpg)

    ![88](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/88.jpg)

    ![89](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/89.jpg)

21. After adding routes it looks like below.
    ![90](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/90.jpg)

22. If requires you need to add the routes in the security group also as below. Sample-vpc security group
    ![91](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/91.jpg)

23. VPC-01 Security group.
    ![92](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/92.jpg)

24. Now Launch Some Public Instances in Acceptors VPC.
    ![93](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/93.jpg)

25. Now Launch Some Public Instances in Requesters VPC.
    ![94](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/94.jpg)

26. Now ping both instances with both instances and check if the connection exist or not.
    ![95](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/95.jpg)

    ![96](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/96.jpg)

27. Similarly, we can establish VPC Peering between:
    - Same account and same region.
    - Same account and different region.
    - Different account and same region.

28. VPC Peering diagram.
    ![97](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/97.jpg)
