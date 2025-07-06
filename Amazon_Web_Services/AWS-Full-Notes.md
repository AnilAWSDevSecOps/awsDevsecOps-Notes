# 1. VPC Creation:

1. Click on Create VPC button.
   ![01](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/01.jpg)

3. Fill the required details like Name tag, IPv4 CIDR block, IPv4 CIDR and Tenancy etc., and click on Create VPC button.
   ![02](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/02.jpg)

4. After VPC creation by default Route Table, Network ACLs & Security groups will be created.
   ![03](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/03.jpg)


# 2. Subnet Creation:

1. Click on Create subnet button.
   ![04](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/04.jpg)

2. Fill the details like VPC ID, Subnet name, Availability Zone, IPv4 VPC CIDR block & IPv4 subnet CIDR block. Click on
   Create subnet button. Similarly create any number of subnets.
   ![05](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/05.jpg)
   

# 3. Route Table Creation:

1. By default, one route table will be created while VPC Creation, click on Create route table button.
   ![06](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/06.jpg)

2. Fill the details like Name and VPC, click on Create route table button.
   ![07](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/07.jpg)

3. Details after creating Route table successfully. By default, local routes will be given in the route table with which
   connections will be established between servers within given IP Destination range
   ![08](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/08.jpg)


# 4. Internet Gateway Creation:

1. Click on Create internet gateway button.
   ![09](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/09.jpg)

2. Fill in the details like Name tag and click on Create internet gateway button.
   ![10](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/10.jpg)

3. IGW created successfully, by default after internet gateway creation it will be in Detached state, click on Attach to
   a VPC if you want to attach it to VPC now.
   ![11](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/11.jpg)

4. Select VPC that you want to attach in the dropdown and click on Attach internet gateway button, by this internet
   gateway is attached to the VPC so we can use this internet gateway with in VPC.
   ![12](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/12.jpg)

5. Alternatively, you can attach Internet gateway to VPC as below.
   ![13](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/13.jpg)

6. After VPC attachment it looks like below.
   ![14](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/14.jpg)

## 4.1. Attaching the Internet Gateway to Route table:

1. Adding Internet Gateway in Route table’s Routes, click on Edit routes button.
   ![15](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/15.jpg)

2. Click on Add route button.
   ![16](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/16.jpg)

3. Fill the details like Destination & Target, click on Save Changes button.
   ![17](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/17.jpg)

4. By doing this we can access the instances under this route can be accessed over the internet and instances can access
   the internet from inside.
   ![18](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/18.jpg)



# 5. NAT Gateway Creation:

- To create a NAT first we need to create the Elastic IP, then we need to create the NAT with the created ElasticIP,
  there after we need to assign the NAT to routetable.

  ## 5.1. Steps to create Elastic Ips:

    1. Click on Allocate Elastic IP address button.
       ![19](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/19.jpg)

    2. Select the Network border group and Click on Allocate button, by doing this we have created the Elastic IP in the
       us-east-1 region which must be used in the same region.
       ![20](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/20.jpg)

       ![21](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/21.jpg)

  ## 5.2. Steps to create NAT Gateway:

    1. Click on Create NAT gateway button.
       ![22](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/22.jpg)

    2. Fill in the details like Name, Subnet (Public Subnet: Which has Internet Gateway attached), Connectivity type and
       Elastic IP allocation ID. Here we allocate the above created Elastic IP for this NAT gateway.
       ![23](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/23.jpg)

    3. Click on Create NAT gateway button.
       ![24](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/24.jpg)

    4. After NAT Gateway Creation it looks like below.
       ![25](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/25.jpg)

  ## 5.3. Attaching NAT Gateway to Route table:

    1. Adding NAT Gateway in Route table’s Routes, click on Edit routes button
       ![26](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/26.jpg)

    2. Click on Add route button.
       ![27](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/27.jpg)

    3. Fill the details like Destination & Target, click on Save Changes button.
       ![28](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/28.jpg)

    4. After adding NAT gateway to the Route table it looks like below.
       ![29](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/29.jpg)



# 6. Subnet Associations:

- Subnet assocoiations are two types public and private

## 6.1. Public Subnet Association in Rout tables:

1. Assigning the Subnet into the Route table which has Internet Gateway in it makes public subnet, instances under this
   subnet can access the internet. Open the Internet Gateway route table.
   ![30](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/30.jpg)

2. Click on ```Subnet association``` then ```Edit subnet associations``` under ```Explicit subnet associations```.
   ![31](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/31.jpg)

3. Select the Subnet that you want to make Public and click on Save associations.
   ![32](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/32.jpg)

4. After subnet association in the route table which has internet gateway in it, it looks like below. and that subnet
   becoms the Public Subnet.
   ![33](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/33.jpg)

## 6.2. Private Subnet Association in Rout tables:

1. Assigning the Subnet into the Route table which has NAT Gateway in it makes private subnet, instances under this
   subnet can behave as private instances. Open the NAT Gateway route table.
   ![34](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/34.jpg)

2. Click on ```Subnet association``` then ```Edit subnet associations``` under ```Explicit subnet associations```.
   ![35](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/35.jpg)

3. Select the Subnet that you want to make Public and click on Save associations
   ![36](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/36.jpg)

4. After subnet association in the route table which has NAT gateway in it, it looks like below. and that subnet becoms
   the Private Subnet.
   ![37](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/37.jpg)



# 7. Launching Instances:

1. Click on Launch Instances button.
   ![38](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/38.jpg)

2. Fill in the details like Name, Amazon Machine     <IMAGE>, Instance type, Key pair name, VPC, Subnet (Public),
   Auto-assign public IP, security groups & Configure storage.
   ![39](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/39.jpg)

   ![40](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/40.jpg)

   ![41](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/41.jpg)

4. Click on ```Launch Instance```button.
   ![42](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/42.jpg)

   ![43](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/43.jpg)

6. Similarly Launch Instance in Private subnet which makes instances private.
   ![44](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/44.jpg)



# 8. Security Group Changes:

1. Open the Security Group tab and click on our ```security group```.
   ![45](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/45.jpg)

2. Click on ```Edit inbound rules```.
   ![46](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/46.jpg)

3. Click on ```Add rule```. By default, all traffic will be enabled within security group range, as per our requirement
   we can add rules and restrict the incoming traffic by editing inbound rules of security group.
   ![47](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/47.jpg)

4. Allowing all traffic to my IP but you should assign traffic according to the requirement and click on
   ```Save rules``` button.
   ![48](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/48.jpg)



# 9. Connecting to Instances:

1. Download putty & Install Putty, click on next.
   ![49](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/49.jpg)

   ![50](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/50.jpg)

3. Open Puttygen and click on load button, before this you need to convert the pem file into ppk file so that you can
   access it here.
   ![51](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/51.jpg)

4. Select Our Pem Key File in the load options.
   ![52](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/52.jpg)

5. After loading click on save as private key button and save it in some name.ppk, Open Putty and load the .ppk file in
   the credentials section.
   ![53](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/53.jpg)

6. Save the settings in putty.
   ![54](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/54.jpg)

7. Collect the Public IP of the instance and connect now.
   ![55](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/55.jpg)

   ![56](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/56.jpg)

   ![57](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/57.jpg)

   ![58](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/58.jpg)

9. Now connect to the Private server using private IP through the Public server which we connected above. Bring pem data
   into the public server and save it as .pem file
   ![59](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/59.jpg)

   ![60](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/60.jpg)
   ### ***Commands***
    ```
    vi july2024.pem
    chmod 400 july2024.pem
    ssh -i july2024.pem ubuntu@10.20.0.115
    ```
   ### July2024.pem
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
   ![61](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/61.jpg)



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
   ![62](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/62.jpg)
   ![63](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/63.jpg)

2. Click on ```Create VPC``` button.
   ![64](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/64.jpg)

3. Following details are Created in VPC.
   ![65](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/65.jpg)
   ![66](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/66.jpg)

5. VPC with Subnets, Route tables amd Gateways created successfully.
6. Subnets:
   ![67](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/67.jpg)

7. Route Tables:
   ![68](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/68.jpg)

   ![69](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/69.jpg)

   ![70](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/70.jpg)

   ![71](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/71.jpg)

8. Security Group:
   ![72](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/72.jpg)

9. Adding Routes in Security Group.
   ![73](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/73.jpg)

10. Now we can peer the VPC-01 and sample-Vpc. Now come to VPC-01 Account, click on Peering connections.
    ![74](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/74.jpg)

11. Click on ```create Peering Connection```.
    ![75](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/75.jpg)

12. Fill in the details like Name, VPC ID (Requester), Account, Account ID(Accepter), Region (Accepter), VPC ID (
    Accepter) and click on Create peering connection button.
    ![76](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/76.jpg)

    ![77](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/77.jpg)

13. VPC Peering created successfully.
    ![78](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/78.jpg)
    ![79](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/79.jpg)

14. Now in the acceptors account you need to accept the request.
    ![80](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/80.jpg)

    ![81](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/81.jpg)

15. Pop up after clicking accept button.
    ![82](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/82.jpg)

16. After accepting request, Your VPC peering connection has been established. To send and receive traffic across this
    VPC peering connection, you must add a route to the peered VPCs in one or more of your VPC's route tables.
    ![83](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/83.jpg)

17. Now in the both the Public Route tables, add the CIDR range, In Acceptors Public Route tables, click on Edit routes
    and Add route, add the Requester CIDR.
    ![84](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/84.jpg)

18. Click on Save changes.
    ![85](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/85.jpg)

19. After adding the routes it looks like below.
    ![86](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/86.jpg)

20. Now In Requesters Public Route tables, click on Edit routes and Add route, add the Acceptors CIDR, click on Save
    changes.
    ![87](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/87.jpg)

    ![88](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/88.jpg)

    ![89](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/89.jpg)

21. After adding routes it looks like below.
    ![90](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/90.jpg)

22. If requires you need to add the routes in the security group also as below. Sample-vpc security group
    ![91](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/91.jpg)

23. VPC-01 Security group.
    ![92](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/92.jpg)

24. Now Launch Some Public Instances in Acceptors VPC.
    ![93](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/93.jpg)

25. Now Launch Some Public Instances in Requesters VPC.
    ![94](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/94.jpg)

26. Now ping both instances with both instances and check if the connection exist or not.
    ![95](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/95.jpg)

    ![96](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/96.jpg)

27. Similarly, we can establish VPC Peering between:
    - Same account and same region.
    - Same account and different region.
    - Different account and same region.

28. VPC Peering diagram.
    ![97](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/97.jpg)



# 11. VPC Endpoints:

- Launch two instances public and private and assign roles to them and transfer packets in s3 using the public and
  private subnets via internet, which will cost in AWS so we use end Points to transfer packets via AWS intranet.
- VPC Endpoints are used to access other AWS services from VPC internally
  ![98](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/98.jpg)

## 11.1. Gateway Endpoints:

- Gateway endpoints are used for s3 & DynamoDB, Gateway endpoints adds internal route to the route table

### 11.1.1. Creating Gateway Endpoint:

- Click Create endpoint button.
  ![99](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/99.jpg)

- Specify the name and service category
  ![100](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/100.jpg)

- Specify the service and the service name and VPC name in the below.
  ![101](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/101.jpg)

- Select the Private Route table and policy
  ![102](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/102.jpg)

- Click on create button.
  ![103](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/103.jpg)

### 11.1.2. Creating S3 Bucket:

- Now to test the S3 Gateway endpoint we need to create the s3 bucket. Click on Create bucket button.
  ![104](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/104.jpg)

- Fill in the details like Bucket type & Bucket name and rest are defaults as photo.
  ![105](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/105.jpg)
  ![106](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/106.jpg)

- Click on Create bucket for creating the s3 bucket.
  ![107](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/107.jpg)

- S3 bucket created successfully.
  ![108](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/108.jpg)

### 11.1.3. Launching Connecting to Private Instance:

- Connect to the Public Instance using putty
  ![109](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/109.jpg)

- Then Connect to the private instance through public instance
  ![110](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/110.jpg)

- Connected to Private instance 10.20.0.115 using putty
  ![111](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/111.jpg)

- Unable to locate credentials. You can configure credentials by runnin ```aws configure ``` Command.
  ![112](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/112.jpg)

### 11.1.4. User Access key Creation:

- Before configuring aws cli we need to create the access key by going in security credentials under account name. Click
  on Security credentials button.
  ![113](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/113.png)

- Click on Create access key button
  ![114](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/114.png)

- For Root user access keys are not recommended but create now no issue. Click on Create access key button.
  ![115](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/115.png)

- Download the .csv file and save it for future AWS CLI configuring. Click on Done button once creds are saved..
  ![116](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/116.png)

### 11.1.5. Configuring the CLI Using the Access key and testing the S3 file transfer:

- Now configure the aws cli by updating the access key creds.
  ![117](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/117.png)

- Uploaded one dummy file for testing into s3 bucket by clicking on Upload button.
  ![118](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/118.png)

- By this way we have downloaded by configuring the root access key but this happened due to internet but our goal using
  end point without internet only locally this should happen.
  ![119](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/119.png)

- To use of Gateway endpoint data transfer we need to launch the new private server in the private subnet and assign the
  role to the server
- Creating the new subnet and associating to the new route table which doesn’t have any gateways in it like internet
  gateway and NAT gateway
- Fill the details like VPC ID, Subnet name, Availability Zone, IPv4 VPC CIDR block & IPv4 subnet CIDR block.

## 11.2. Full Private Network Creation:

### 11.2.1 Private Subnet Creation:

- Click on Create subnet button.
  ![120](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/120.png)

- Creating the new route table fully private, and will associate the new subnet.
- Fill the details like Name and VPC, click on Create route table button
  ![121](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/121.png)

### 11.2.2 Private Subnet Explicit Association:

- Explicit subnet association of new subnet VPC-01-Subnet-03 was done successfully into the VPC-01-Rtb-01-FullPrivate
  route table.
  ![122](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/122.png)

- Launching the new instance under VPC-01-Subnet-03, Click on the Launch button and create the instance
  ![123](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/123.png)
  ![124](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/124.png)
  ![125](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/125.png)

### 11.2.3 IAM Role Creation:

- Creating New role to assign to the Private instance ubuntu-03. Click on Create role button
  ![126](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/126.png)

- Select the AWS service and EC2 and click on next button
  ![127](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/127.png)
  ![128](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/128.png)

- For now, I have given the admin access rights for this role but generally we should give the below given roles and
  click on Next button

  ![129](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/129.png)

- These are the roles in general for EC2 should be given but not admin rights.
  ![130](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/130.png)

- Fil in the details like Role name
  ![131](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/131.png)

- By leaving the remaining to defaults click on Create role button.
  ![132](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/132.png)

- Role EC2-AdminAccess created
  ![133](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/133.png)

- Assign this role to the Private server

### Testing the Endpoint Gateway:

- Initially when I tried the download from s3 it did not happen as no NAT in it thereafter. When I changed the
  routable (VPC-01-Rtb-01-FullPrivate) details in the Gateway endpoint which I have created earlier then the download
  completed without any NAT of IGW
  ![134](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/134.png)

- By clicking on Manage route table button I have changed the route table so that subnet details also changed
  automatically as that subnet is Explicitly associated to the same route table. Thereafter packets are getting
  downloaded using the Gateway endpoint.
  ![135](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/135.png)

- This way upload and download are happening using Gateway endpoints.
  ![136](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/136.png)

- Sample Diagram describing Gateway Endpoints, the red line indicates gateway endpoint to s3 bucket.
  ![137](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/137.png)

## 11.3. Process to upload a new key into AWS Public instances when old key lost:

- Click on Session Manager under AWS Systems Manager.
  ![138](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/138.png)

- Click on Start Session button
  ![139](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/139.png)

- By default, you will not see any instances here as default permissions for the instance will not grand access here.
- So, we need to assign the IAM role which we have created above so that the public instances will be appeared here.
  ![140](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/140.png)

- Right Click on Instance and under security > Modify IAM role
- Assign the Role to the instance so that you can see the instance under AWS System Manager > Session Manager
  ![141](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/141.png)

- Again, I have attached few policy Names to the IAM role so that instances can appear under Session manager.
- Note: This Role Should be assigned to the Private servers also if not they won’t be seen in the session manager
  section for system Management.

  ![142](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/.142png)

- Select the Server and click on the Start Session button
  ![143](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/143.png)

- Now generate the Public and private keys in Puttygen and public key should be added into the server under highlighted
  path in the screenshot below.
  ![144](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/144.png)

- So, you need to add the public key generated in the Puttygen can be added along with the existing public key so that
  you can login to the instance which you lost the access key.
  ![145](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/145.png)

## 11.4. Process to upload a new key into AWS Private instances when old key lost:

- Now we must create 3 interface endpoints to make private server available in the AWS Systems Manager.
  ![146](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/146.png)

### 11.4.1. 1st Interface Endpoint Creation.

- Click on Create endpoint button
  ![147](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/147.png)

- Fill in the details like Name Tag, Service category (AWS Services)
  ![148](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/148.png)

- Fill in the Details like Service name = com.amazonaws.us-east-1.ssm, VPC, Subnets, Security Groups.
  ![149](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/149.png)

- Select the Full access Policy.
  ![150](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/150.png)

- Click on Create endpoint button
  ![151](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/151.png)

### 11.4.2. 2nd Interface Endpoint Creation:

- Click on Create endpoint button
  ![152](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/152.png)

- Fill in the Details like Name, Service name = com.amazonaws.us-east-1.ssmmessages, VPC, Subnets, Security Groups.
  ![153](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/153.png)

- Select Full access Policy.
  ![154](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/154.png)

- Click on Create endpoint button.
  ![155](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/155.png)

### 11.4.3. 3rd Interface Endpoint Creation:

- Click on Create endpoint button
  ![156](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/156.png)

- Fill in the Details like Name, Service name = com.amazonaws.us-east-1.ec2messages, VPC, Subnets, Security Groups.
  Select Full access Policy, Click on Create endpoint button.
  ![157](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/157.png)
  ![158](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/158.png)
  ![159](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/159.png)
  ![160](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/160.png)

- Once all the Interface Endpoints are in available status, we must reboot the servers.
  ![161](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/161.png)

- Now Under AWS Systems Manager  Session Manager  Start a session, you can find the all-Private server’s session
  Manager is available, you can select once and can login and can make changes as required..
  ![162](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/162.png)

- Diagram Elaborating the Endpoints.
  ![163](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/163.png)

  

# 12. Process of Creating Connection Between AWS and AZURE:

## 12.1. Creating Virtual Network in AZURE:

- Go to Home > Virtual Networks > Create virtual network
  ![164](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/164.png)

- Fill in the details like Resource group, Virtual network name. Click on Next button.
  ![165](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/165.png)
  ![166](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/166.png)

- Click on Next button.

  ![167](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/167.png)

- Fill in the details like IP Range, and click on Add a subnet to add subnets here.
  ![168](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/168.png)

- Fill in the details like Name, IPv4 address range, size and click on add Subnet button. Rest of details leave it with
  defaults
  ![169](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/169.png)

- One subnet added successfully and click on Add a subnet and add another subnet
  ![170](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/170.png)

- Fill in the details like Subnet purpose, IPv4, Size. Click on Add button, rest of details leave it with defaults.
  ![171](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/171.png)

- Gateway subnet created successfully, click on Next button, skip the tags menu, click on next, click on create button.
  ![172](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/172.png)

- Review the content and click on create button to create the Virtual network.
  ![173](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/173.png)

- After creating the VNET we will deploy the virtual network gateway in it and it will take 15 min to get deployed.
  Click on got to resource button.
  ![174](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/174.png)

## 12.2. DNS Servers creation in AZURE:

- Under Settings go to DNS Servers.

  ![175](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/175.png)

- Fill in the details like DNS servers, IP Address (10.56.1.100 and 8.8.8.8 (google DNS)) and save it, usually it might
  take 30 min to create it. Meanwhile we will create the rest.

  ![176](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/176.png)

- Created Virtual Network.
  ![177](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/177.png)

- You can view the created subnets under Virtual network > Subnets.
  ![178](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/178.png)

## 12.3. Virtual Machine creation in AZURE:

- Go to virtual machines Column and create one windows Virtual Machine by clicking on Create button
  ![179](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/179.png)

- Fill in the details like Resource group, Virtual machine name, Security type, Image.
  ![180](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/180.png)

- Fill in the details like Size, Username, Password, confirm password and click on Next: Disk button.
  ![181](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/181.png)

- Fill in the details like OS disk type and click on Next: Networking button.
  ![182](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/182.png)

- Fill in the details like Virtual Network, Subnet, Public IP, NIC network security group and Configure network security
  group and click on Next: Management, button and click on Next: Monitoring button.
  ![183](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/183.png)

- Fill in the details like Boot diagnostics and click on Next: Advanced button. And click on Review and create. And
  click on create button finally to create Virtual Machine.
  ![184](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/184.png)

- Now meanwhile we will try to deploy Virtual Network Gateway.
  ![185](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/185.png)

## 12.4. Virtual Network gateway creation in AZURE:

- Fill the Details as marked and click on Review + create button.
  ![186](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/186.png)

- This will take 18 to 30 min to get deployed.
  ![187](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/187.png)

- Now login to the Azure virtual machine which we created
- Home > Virtual Machines > Windows-01 > Public IP, here copy the public IP and login using Creds.
  ![188](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/188.png)

## 12.5. Launching the Instances in AWS:

- New Instance

  ![189](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/189.png)
  ![190](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/190.png)

- Assigning the Primary IP to the Server, so that we can add it in AZURE DNS
  ![191](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/191.png)
  ![192](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/192.png)

- Now we will login to the Windows instance. Click on Connect by selecting the Server.
  ![193](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/193.png)

- After clicking on connect button, go to RDP Client and click on Get password button.
  ![194](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/194.png)

- Click on Upload and upload a private key and click on Decrypt Password Button.
  ![195](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/195.png)

- After clicking the get password you will get the password then copy the password. Connect using the Remote Desktop
  Connection. After Connecting we need to create the active directory in the server.
  ![196](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/196.png)

## 12.6. Active Directory Creation in AWS Instance:

- Now follow the screenshot and right click on Ethernet 2 > Properties select properties button and enter the below
  details.
  ![197](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/197.png)

- By typing command ipconfig /all you will get the details enter the DNS details in the above screenshot properties.
  ![198](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/198.png)

- Fill preferred DNS and alternate DNS Server and click on ok.

  ![199](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/199.png)

- Click on Server Manager button. And configure the Active Directory.
  ![200](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/200.png)

- Click on manage > Add Roles and Feature.
  ![201](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/201.png)

- Click on Next.
  ![202](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/202.png)

- Select the Role-based on feature and click on Next.
  ![203](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/203.png)

- Select our Server and click on next.

  ![204](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/204.png)

- Click on Active Directory Role shown in Picture.
  ![205](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/205.png)

- Click on Add Feature.

  ![206](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/206.png)

- Click on Next.

  ![207](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/207.png)

- Select the Telnet client and click on Next.
  ![208](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/208.png)

- Click on Next.

  ![209](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/209.png)

- Click on Install.

  ![210](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/210.png)

- Click on Promote this server.
  ![211](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/211.png)

- Click on Add a new Forest, fill in Root Domain name and Click Next.
  ![212](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/212.png)

- Fill the Password and click on Next.
  ![213](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/213.png)

- Click on Next.

  ![214](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/214.png)

- Click on Next. Then Next, Then Next and Then Install.
  ![215](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/215.png)

- Click on Install. After installation server will automatically reboots
  ![216](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/216.png)

- After creating the active directory, we need to login to the AWS windows server with Admnistrator @ madireddy.xyz id
  as we configured root domain name while configuring the active directory in the AWS windows server.
  ![217](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/217.png)

- We need to disable the local firewall in the servers.
  ![218](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/218.png)

- This way we can disable the firewalls. Follow the same process in the azure server also. To disable the firewalls.
  ![219](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/219.png)

- After Active directory creation Domain will change. Like in screenshot. That which we added while creating the active
  directory. ```sysdm.cpl``` Command.

  ![220](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/220.png)

- Now we will go to the path shown in the screenshot.
  ![221](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/221.png)

- We will create new users in here by clicking on users > New Users.
  ![222](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/222.png)

- We will enter the names and click on next to create users.
  ![223](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/223.png)

- After password entered click on next. And click on finish button.
  ![224](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/224.png)

- The created user is arrowed here.
  ![225](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/225.png)

- Click on Created user go to member of and click on add, Enter the Object name and click on ok.
- Same way by right click and copy the anilkumar user and create new user reddy and its password Anil@1201
  ![226](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/226.png)

## 12.7. Virtual private gateway creation in AWS:

- Now we need to create the VPG in the AWS VPC  
  ![227](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/227.png)

- Click on the Create virtual private gateway button and create it.
  ![228](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/228.png)

- Fill in the Name and click on Create virtual private gateway button
  ![229](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/229.png)

- You should attach the VPG to the VPC by this way.
  ![230](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/230.png)

- Attach out VPG to our VPC.
  ![231](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/231.png)

- Successfully attached.
  ![232](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/232.png)

## 12.8. Customer gateways creation in AWS:

- Now we need to establish the VPN connection by providing the azure IP address in Customer gateway under VPN.
  ![233](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/233.png)

- Now Click on Create Customer gateway button.
  ![234](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/234.png)

- Now you should copy the VNG01-PIP IP and should enter in the below Customer gateway creation.
  ![235](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/235.png)

- Now copy the IP address.
  ![236](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/236.png)

- Now fill in the details and click on Click on Create Customer gateway button.
  ![237](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/237.png)
  ![238](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/238.png)

- Now we need to establish the Site-to-site VPN Connection in AWS
  ![239](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/239.png)

## 12.9. Site-to-Site VPN connections creation in AWS:

- Now click on Create VPN Connection Button and Fill in the details as marked and leave rest to defaults.
- Here Static IP prefixes range should be azures IP range.
- Now click on Create VPN Connection Button to create.
  ![240](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/240.png)

- Once this VPN is Available, we need to edit the Route table to shoe the way to Azure.
  ![241](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/241.png)

- Go to the Private route table of AWS windows server and click on Edit routes and add the Azure IP Range.
  ![242](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/242.png)

- Now here we have added the Azure IP range in the AWS route table. Now Click on Save Changes button.
  ![243](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/243.png)

- After adding the Routes in AWS route table.
  ![244](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/244.png)

- Now after long time Virtual Network Gateway has deployed in AZURE, Click on Goto resource button.
  ![245](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/245.png)

- Now in AWS go to Site-to-Site VPN and Click on Download configuration by selecting the VPN.
  ![246](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/246.png)

- Fill details as shown and click on download button you will get one file downloaded now open the file in notepad.
  ![247](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/247.png)

- Now in the file Line 55 pre-shared-key address and line 200 pre-shared-key address should be placed in the azure to
  establish the connection between from azure to AWS.
  ![248](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/248.png)

## 12.10. Local Network Gateway creation iin AZURE:

- Now go to Local Network Gateway in AZURE and start creating the New Local Network Gateway by clicking.
  ![249](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/249.png)

- Fill in the details Resource group, Name, IP address (First IP From Downloaded file in the above) and Address Space(
  s).
- Click on Review and Create. And then click on create.
  ![250](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/250.png)

- Now we should create the one more Local network gateways.    
  ![251](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/251.png)

- Fill in the details Resource group, Name, IP address (Second IP From Downloaded file in the above) and Address Space(
  s)
- Click on Review and Create. And then click on create
  ![252](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/252.png)

- Created Successfully
- Still there won’t be any ping between AZURE and AWS Servers in command prompt.
  ![253](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/253.png)

- Now if you see in aws VPN two tunnels will be in down.
- We need to bring them up, for that
  ![254](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/254.png)

- Come to Virtual Network Gateway (VNG01) which we created and under settings go to Connections
  ![255](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/255.png)

- Click on Add button to add connections.
  ![256](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/256.png)

- Fill in the details like Resource group, Connection type and Name. and click on Next: Setting.
  ![257](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/257.png)

- Fill in the details like Virtual network gateway (Which created earlier and select in drop down), Local network
  gateway (Which created earlier and select in drop down), Shared Key (PSK) {which is from aws downloaded file from line
  55 key} and click on Next: tag and Click Review and Create and then Click Create buttons.
  ![258](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/258.png)

- Now Create one more by clicking Our VNG > Connections button
  ![259](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/259.png)

- Fill in the details like Resource group, Connection type and Name. and click on Next: Setting.
  ![260](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/260.png)

- Fill in the details like Virtual network gateway (Which created earlier and select in drop down), Local network
  gateway (Which created earlier and select in drop down), Shared Key (PSK) {which is from aws downloaded file from line
  200 key} and click on Next: tag and Click Review and Create and then Click Create buttons.
  ![261](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/261.png)

- Now test the connection between Azure windows and AWS Windows servers.
- Test From Azure to AWS Servers.

  ![262](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/262.png)

- Now test the connection between Azure windows and AWS Windows servers.
- Test From AWS to Azure Servers.

  ![263](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/263.png)

- Note: Check Security Group inbound rules if possible.
- Now our goal is to connect to Azure Server from Laptop and from that we need to connect to AWS server.
- Now first login to Azure Server.

  ![264](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/264.png)

- Now sysdm.cpl > change > domain (madireddy.xyz), Click on Ok button
  ![265](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/265.png)

- Now Enter the AWS Username @ Domain Name and fill the password
  ![266](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/266.png)

- You should get the Welcome message and click on OK button.
- Changes will affect only after restarting the server.
- Now you will use the reddy id (Which is created in AWS Domain users) to login to the Azure server
  ![267](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/267.png)

- Now we have connected to the Azure Server using the Aws Server userid and Password
- NOTE: Check in Azure server after changing domain name, we need to turn off the domain firewall to communicate from
  aws server to azure server.
- Delete All the services in AWS and Azure in the Reverse order
  ![268](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/268.png)

- Overview AZURE
  ![269](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/269.png)

- Overview AWS.
  ![270](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/270.png)

## 12.11. Process to connect Multiple VPCs to the Azure

- Create 3 Extra VPCs
  ![271](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/271.png)

- Create 3 Extra instances in each VPC
  ![272](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/272.png)

## 12.12. Transit Gateway creation:

- This is used to connect Multiple VPCs in AWS and then connect to VNG in Azure so that VPN Connection is established.
  ![273](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/273.png)

- Fill the details like Name and Description.
  ![274](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/274.png)

- Click on Create transit gateway.
  ![275](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/275.png)
  ![276](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/276.png)

- Fill in the details like name, Transit gateway ID, Attachment type and Subnet id.
  ![277](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/277.png)

- Click on create button.
  ![278](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/278.png)

- Similarly, you create for VPC 3 and 4
- Listing all 3 Transit Gateways.
  ![279](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/279.png)

- Attachment for Azure VPN, fill in the details like Transit Gateway ID and Attachment Type and IP address (Azure
  Virtual Network Gateway PIP).

  ![280](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/280.png)

- Click on Create button.  
  ![281](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/281.png)

- Now showing all 4 attachments. Including azure Virtual Network Gateway attachment.  
  ![282](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/282.png)

- Now login to all 4 servers using the putty, before this you need to create one Linux VM in azure.
- Now when we see here no ping connection for one another
  ![283](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/283.png)
  ![284](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/284.png)
-
- Here in the all 3 VPC’s route tables we will add the other three VPCs IP ranges so that routes will get establish and
  ping happens each other for all VPCs except the Azure Server.
  ![285](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/285.png)

- Now after adding routes in route table ping happens successfully in all 3 Servers.
- But in azure server no ping.
  ![286](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/286.png)
  ![287](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/287.png)

- Under site-to-site VPN Connections you will get one VPN Automatically go to that and download the Configuration file
  and add the data into the azure gateways.
  ![288](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/288.png)

- Download the file and go to azure Gateways and add the IP and Keys as we did earlier in Local Network gateway and
  Virtual Network gateway.

  ![289](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/289.png)

- Add the configuration in the Azure Local Network Gateway
- Fill in the details like Name, IP address and Address Spaces (All 3 VPC’s range added in here)
- Click on Create button
  ![290](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/290.png)

- Fill in the details like Name, IP address and Address Spaces (All 3 VPC’s range added n here), Click on Create Button
  ![291](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/291.png)

- Fill in the details like Resource group, Connection type and Name. and click on Next: Setting.
  ![292](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/292.png)

- Fill in the details like Virtual network gateway (Which created earlier and select in drop down), Local network
  gateway (Which created earlier and select in drop down), Shared Key (PSK) {which is from aws downloaded file from line
  200 key} and click on Next: tag and Click Review and Create and then Click Create buttons.
  ![293](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/293.png)

- Fill in the details like Resource group, Connection type and Name. and click on Next: Setting
  ![294](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/294.png)

- Fill in the details like Virtual network gateway (Which created earlier and select in drop down), Local network
  gateway (Which created earlier and select in drop down), Shared Key (PSK) {which is from aws downloaded file from line
  200 key} and click on Next: tag and Click Review and Create and then Click Create buttons.
  ![295](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/295.png)

- You need to add the Azure IP range in the Transit gateway route tables
  ![296](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/296.png)

- Now you will be able to ping the Azure server from AWS Servers.
- This way you can get the communication between multiple VPC and one Azure VPN
  ![297](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/297.png)



# 13. AWS Network Firewalls:

- Firewalls are of two types
    - Stateful Firewall: Stateful firewall will Allow Request’s Response either in or out. Stateful firewall are
      Security Groups.
    - Stateless Firewall: Stateless Firewall will not allow Request’s Response either in or out. Stateless Firewall are
      AWS Network Access Control List (NACL)
      ![299](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/299.png)

- AWS Security Groups:
  Most of the services in AWS like EC2, Load balancers, Data Base, Lambda...Etc., uses the Security Groups except the
  Subnets. Security Group is VPC scoped.
- AWS Network Access Control List (NACL):
  This is used only in Subnets and Not used much in other services. NACL is VPC scoped

### 13.1. Network Creation For Firewall Setup:

- Security Groups are VPC scoped i.e. they work only within the VPCs but Firewalls can be Implemented for multiple VPCs
  i.e. network level we can implement security using firewalls.
- For implementing this firewall, we will Create One VPC with Two Subnets Private and Public
  ![300](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/300.png)

- VPC Created successfully.
  ![301](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/301.png)

- We will rename subnets Public Subnet as Firewall-subnet and private subnet as Protected-subnet.
  ![302](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/302.png)

- Now we will launch one windows server in Protected Subnet to block the websites but Sg and NACL will never block the
  websites.
  ![303](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/303.png)

- Fill in the details in screenshot
  ![304](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/304.png)

- Fill the details in screenshot and we are creating new Security group and then launch the instance.
  ![305](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/305.png)

## 13.1.1 Rule Groups Creation:

### 13.1.1.1 Doamin List Rule Group Format:

- Goto Network Firewall: Rule groups and create one.
  ![306](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/306.png)

- AWS Network Firewall will disable all traffic by default. Create Firewall Rule Group and select Domain list and
  provide the domain names which need to be Allowed.
    - facebook.com
    - amazon.com
    - flipkart.com
- Fill in the details as shown in screenshot.
  ![307](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/307.png)

- Fill in the details as shown
  ![308](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/308.png)

- Fill in the details as shown. And Next
  ![309](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/309.png)

- Click Next.

  ![310](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/310.png)

- Click Next. And then click on Create Rule Group button.
  ![311](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/311.png)

- This is what which we created and create new one by clicking the Create button.
  ![312](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/312.png)

### 13.1.1.2 Standard Stateful Rule Group Format:

- Fill in the details. Click on Next.
  ![313](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/313.png)

- Fill in the details and Next.
- Note: Capacity value is 100 not 1.
  ![314](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/314.png)

- Fill in the details as shown. And add rule.
  ![315](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/315.png)

- Add another rule by filling the details shown.
  ![316](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/316.png)

- After adding rules check and click Next.

  ![317](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/317.png)

- Click Next.

  ![318](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/318.png)

- Click Next.

  ![319](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/319.png)

- Click on create button.
  ![320](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/320.png)

- Created two rule Groups.
  ![321](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/321.png)

## 13.2 Firewall Policy Creation:

- Now come to Firewall Policies create one.
  ![322](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/322.png)

- Fill in the details shown. Click Next.
  ![323](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/323.png)

- Scroll down to Stateful rule group and click on Add Stateful rule group button.
  ![324](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/324.png)

- Add both rules which we created earlier, click on Add rule groups.
  ![325](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/325.png)

- Click on Next, Next, Next, Create Firewall Policy buttons.
  ![326](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/326.png)

- Firewall policy that we created.
  ![327](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/327.png)

## 13.3 Firewall Creation:

- Now we will create the firewall
  ![328](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/328.png)

- Fill in the details.

  ![329](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/329.png)

- Fill in the details.

  ![330](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/330.png)

- Fill in the details.

  ![331](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/331.png)

- Attaching the firewall policy which created earlier. Next and Create Firewall.
- It Will take few min to get firewall deployed.
  ![332](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/332.png)

- Sample Firewall Demo Diagram
  ![333](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/333.png)

- It is still in provisioning will take time to create firewall.
  ![334](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/334.png)

- This will create end point.
  ![335](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/335.png)
  ![336](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/336.png)

- Firewall is ready now go to route tables.
  ![337](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/337.png)

## 13.4 Route table Creation for IGW Ingress:

- We will just rename route tables and create new one for IGW ingress for allowing traffic from outside to inside.
  ![338](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/338.png)

- Fill the Name, VPC and click on Create button.
  ![339](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/339.png)

- Now we need to add routes in all route tables for our vpc.
- First, we will open the Protected-rtb and add the routes.
- Here in this route table, we will add the network interface route
  ![340](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/340.png)

- Collect the Network Interface ID and add it in the above route table. Protected-rtb.
  ![341](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/341.png)

- Here we are adding the Network Interface ID which is created automatically while mail firewall creation and, in that
  firewall, it is attached and we collect that ID and associate here.
  ![342](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/342.png)

- After adding Network Interface ID in Routetables.
  ![343](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/343.png)

- For Firewall-rtb no need to change anything it already in good shape.
  ![344](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/344.png)

- Now for IGW-Ingress-rtb we need to edit routes and add the same network interface ID here also and also need to edit
  edge associations.
  ![345](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/345.png)

- Here we are adding the Network Interface ID which is created automatically while mail firewall creation and, in that
  firewall, it is attached and we collect that ID and associate here
  ![346](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/346.png)

- After adding Network Interface ID in Routetables
- Now we will edit edge associations in the IGW-Ingress-rtb.
  ![347](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/347.png)

- Click on Edit Edge associations button
  ![348](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/348.png)

- Select the IGW and save changes.
  ![349](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/349.png)

- Now connect to the Protected windows server and check the
- Here in windows browser, you will be able to access only website which you give in the rule group only.
- Here amazon is not given in rule group.
  ![350](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/350.png)

- Now we will add amazon in the Firewall rule group
  ![351](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/351.png)

- Click on edit and add ```.amazon.com ```
  ![352](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/352.png)
  ![353](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/353.png)

- Added amazon website.
  ![354](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/354.png)

- Now amazon is loading.
  ![355](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/355.png)

- Parallelly we will launch one Linux server in the VPC
  ![356](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/356.png)

- Launched the Linux server
  ![357](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/357.png)

- We have connected but not able to access the internet, as it is in protected subnet.
  ![358](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/358.png)

- So, if you want to enable the traffic out bound you can do that in firewall rule group.
- Click on save rule group after adding the rule.
  ![359](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/359.png)

- For multiple AZ we will see sample diagram
  ![360](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/360.png)
  ![361](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/361.png)



## Amazon EC2:

- Ec2 Machines
- EBS Volumes
- Amazon Machine Image (AMI)
- Snapshots
- Load Balancers (NLB and ALB)
- Autoscaling Groups

## EC2 Instances:

1. EC2 instances are of 4 types
2. OnDemand Instance
3. Spot Instance
4. Reserved Instance
5. Dedicated Instance or Host.

# 14. EBS Volumes:

- EBS is provided during the instance creation and can be assigned extra to the instance after instance creation also.
- Windows OS 30GB for C:/ drive, Linux OS 8GB for /root drive.
  ![362](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/362.png)

## 14.1. Instance Store (IS):

1. It’s a temporary storage, means the data is deleted when the server stops.2. It’s a fixed size.
2. It’s a fixed size.
3. It cannot be snapshotted.
4. Its disk type if fixed mostly SSD.
5. Using as SWAP or Virtual Memory for Linux and Windows Servers.
6. Can be used as TempDB for Databases

- For demonstrating Instance Store, we will launch on C5xlarge instance which has 75GB of IS
- Command: ```lsblk``` > to list the disks in the server
  ![363](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/363.png)

- Here we will use command: ```fdisk /dev/nvme1n1``` > to format the disk and partition the disk
  ![364](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/364.png)

- Image after partition the IS i.e. 75GB (nvme1n1p1)
  ![365](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/365.png)

- Creating Filesystem by command: ```mkfs.ext4 /dev/nvme1m1p1```
  ![366](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/366.png)

- Creating new volume, mounting the new volume to nvme1n1p1 so that 75GB is assigned to new volume ```/isvol1```.
  ![367](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/367.png)

- As this is an instance store whatever the data exist in it will get deleted once server is stopped.
  ![368](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/368.png)

- After stopping and starting the server all IS store data deleted and partition also deleted.
  ![369](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/369.png)

# 14.2. AWS EBS Volumes:

- Attached new EBS volume to server
- Follow the same partition process to make the 5 GB partition available.
  ![370](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/370.png)

- Same Commands to make FS
  ![371](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/371.png)

- After partition collecting ```blkid```
  ![372](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/372.png)

- Mounting the 5gb EBS to /appdata in fstab
  ![373](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/373.png)

- in fstab assigning the volume.
  ![374](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/374.png)

- Use ```mount -a``` to mount
- maybe this 5gb won’t be sufficient if we want to extend the volume there are two ways.
  ![375](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/375.png)

- right click on volume and modify.
  ![376](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/376.png)

- Extending 5 as 8
  ![377](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/377.png)

- Extended the volume and not partitioned yet.
  ![378](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/378.png)

- We use growpart command to extend.
  ![379](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/379.png)

- and we need to extend the filesystem too.
  ![380](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/380.png)

- After extending.
  ![381](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/381.png)



# 15. Amazon Machine Images (AMI):

- Scanning EC2 Server with AWS Inspector
- Fix the Security Issues which can after scanning.
- Rescan the system and create Custom AMI with the machine.
- Connect to the Linux Machine, install nginx in it.
  ![382](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/382.png)

- Download the AWS Inspector using
  ```
  curl -O https://inspector-agent.amazonaws.com/linux/latest/install
  ```
- Install using the ```sudo bash install``` command.
  ![383](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/383.png)

- Create tag.

  ![384](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/384.png)

- Click on Create button
  ![385](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/385.png)

- Fill name and Tag which you have created for the server above and click on save button.
  ![386](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/386.png)

- Created.
  ![387](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/387png)

- Goto Assessment templates and create one.
  ![388](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/388.png)

- Fill in the name, target name, duration, rules Packages. And click on create and run
  ![389](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/389.png)

- Now go to Assessment runs and check your run.
  ![390](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/390.png)

  ## 15.1. Steps involved in Creating Custom AMI:
    1. Create a EC2 Machine.
    2. Install all necessary packages or applications.
    3. Shutdown the server.
    4. Create AMI from the server.
    5. Delete the server once AMI Creation is successful.

  To automate the proves of AMI we use HashiCorp Packer which is 3rd party tool
    1. Creating a Custom AMI automatically
    2. How to provide the access for the 3rd party tools(Packer) in AWS



# 16. SSL/TLS Certificates:

- Generating SSL/TLS Certificates
    - Using AWS Certificate Manager(ACM)
    - Using 3rd Party Tools Certbot and importing in to ACM.
- Understanding OSI Layers.
- Types of Load Balancers.
- Diff between Layer 4 vs Layer 7 Load Balancers

- To establish the connection, we use asymmetric encryption and during data transfer we use symmetric encryption.
  ![391](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/391.png)

## 16.1 Route53 Domain Creation:

- Provide the Domain name as the GoDaddy domain name and type and click on create button
  ![392](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/392.png)
  ![393](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/393.png)

- After Hosted Zone creation we need to add the nameservers in the Domain Website.
  ![394](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/394.png)

## 16.2 AWS Cetificate Creation:

- Click on Request button to create new cert.
  ![395](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/395.png)

- Select Public and Next

  ![396](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/396.png)

- Fill in Fully qualified domain name with, validation method DNS, Key algorithm RSA and click on Request.
  ![397](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/397.png)

- After Cert Creation Status will be pending until you validate it in your Domain by adding simple route with CNAME Name
  and CNAME Value.

  ![398](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/398.png)

- After Cert Creation Status will be pending until you validate it in your Domain by adding simple route with CNAME Name
  and CNAME Value

  ![399](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/399.png)

- Fill Record name with CNAME Name and Value with CNAME Value with Simple routing in Routing and click on Create button.
  ![400](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/400.png)

- Once the validation complete it shows the Issued Status.
- These certificates we can only use with in AWS but to use out we need to get 3rd party certificates imported.
  ![401](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/401.png)

## 16.3. Third Party Cert Creation:

- We need to launch one new Ubuntu for that.
  ![402](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/402.png)

- Install the Certbot.
  ```
  sudo snap install --classic certbot
  ```
  ![403](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/403.png)

- Cert creation command for wildcard domain, type yes to continue.
  ```
  certbot certonly --manual --preferred-challenges=dns --key-type rsa --email anilreddy.m8@gmail.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d *.devopsbymak.xyz
  ```
  ![404](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/404.png)

- Here before creating cert, it will ask to validate domain by creating the text record in hosted zones by given name
  and value. And press enter to continue.
  ![405](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/405.png)

- Cert created successfully.
- Public and private keys are saved at location given in screenshot.
- We will save the ```fullchain.pem``` as ```wc_any_file.crt``` and ```privkey.pem``` as ```wc_any_file.key```
  ![406](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/406.png)

- Cert creation command for Naked domain, type yes to continue
  ```
  certbot certonly --manual --preferred-challenges=dns --key-type rsa --email anilreddy.m8@gmail.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d devopsbymak.xyz
  ```
- Here before creating cert, it will ask to validate domain by creating the text record in hosted zones by given name
  and value. And press enter to continue
  ![407](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/407.png)

- Cert created successfully.
- Public and private keys are saved at location given in screenshot.
- We will save the fullchain.pem as any_file.crt and privkey.pem as any_file.key
  ![408](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/408.png)

### 16.3.1 Third Party Certs import into AWS:

- Now we need to import the certs in the AWS
- Click on Import button. To import naked certificates
  ![409](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/409.png)


- Fill in the details with Certificate body(fullchain.pem first key), Certificate private key(privkey.pem) and
  Certificate chain(fullchain.pem second key) and click on Import certificate button.
  ![410](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/410.png)


- Cert imported successfully and status should be in issued state.
  ![411](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/411.png)

- Now we need to import the certs in the AWS
- Click on Import button. To import wild card certificates
  ![412](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/412.png)

- Fill in the details with Certificate body(fullchain.pem first key), Certificate private key(privkey.pem) and
  Certificate chain(fullchain.pem second key) and click on Import certificate button.
  ![413](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/413.png)

- Certificates imported two certificates successfully
  ![414](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/414.png)

### 16.3.2 Nginx Installation in Server:

- Installing Nginx in the server.
  ![415](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/415.png)

- Finding the public IP

  ![416](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/416.png)

- If you want to do the simple routing for one server you can do it without any Load Balancer, by adding the simple
  route A record in the Hosted zone.
  ![417](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/417.png)

- Routed the nginx in our server to ```nginx.devopsbymak.xyz``` to make this secure we will run the cert bot command.
  ![418](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/418.png)

- After running the ```certbot --nginx``` command we should give the domain name (nginx.devopsbymak.xyz) then enter you
  nginx will be secure now.
  ![419](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/419.png)

- Now nginx is secured.
- This way you can create, import and use the certificates in AWS or outside AWS.
  ![420](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/420.png)

- Command to check the website details.
  ![421](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/421.png)



# 17. Load Balancers:

- Process of Data transfer is shown in OSI layers.
- Load balancers are in Application layer and in the Transport layer, in transport layer we have Network Loan Balancer(
  NLB) and in Application layer we have Application Load Balancer(ALB).
- If require please study here
  ![422](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/422.png)

0. OSI Layers
1. Types of Load Balancers
    - VPC Based or Region based Load Balancer
        1. Network Load Balancer - TCP/UDP - Layer 4 LB. used for non http and https
        2. Application Load Balancer - Layer 7 LB
        3. Classic Load Balancer
        4. Gateway Load Balancer
    - Global Load Balancer
        - Route53 Routing Policies
        - Global Accelerator
2. Deploying Network Load Balancer(NLB)
3. Configuring http & https.
   ![423](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/423.png)

### Amazon Linux Nginx Installation:

  ```
    #!/bin/bash
    yum update -y
    yum install nginx -y
    service nginx start
    systemctl enable nginx
    echo "<div><h1>$(cat /etc/hostname)</h1></div>" >> /usr/share/nginx/html/index.html
  ```

  ```
    #!/bin/bash
    yum update -y
    yum install nginx -y
    service nginx start
    systemctl enable nginx
    echo "<div><h1>Test01-TestServer04</h1></div>" >> /usr/share/nginx/html/index.html
  ```

## 17.1. Configuring NLB:

### 17.1.1 Launching Instances:

- Now launch the 3 instances with below optional data
  ![424](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/424.png)

- Now before creating load balancer, we need to create target group.

### 17.1.2 Target Group Creation:

- Click on Create target Group.
  ![425](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/425.png)

- Select Instances
  ![426](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/426.png)

- Fill in the details like name, Protocol : Port, IP address type, VPC and Health check protocol. And click on Next.
  ![427](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/427.png)

- Select the target group set of instances and click on Include as pending below.
  ![428](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/428.png)

- Click on Create target group
  ![429](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/429.png)
  ![430](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/430.png)

### 17.1.3 NLB Creation:

- Now we will create NLB Network Load Balancer, by clicking on Create load balancer button.
  ![431](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/431.png)

- Click on NLB create button.
  ![432](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/432.png)

- Fill in the details like Name, Scheme, IP,
  ![433](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/433.png)

- Select VPC and Public Subnets for NLB, no private Subnets for NLB selected.
  ![434](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/434.png)

- Select the Sg, TLS, Target group, Security Policy
- Now click on Create Load Balancer button
  ![435](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/435.png)
  ![436](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/436.png)

- NLB created successfully still it is in provisioning after some time it will be in available state.
  ![437](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/437.png)

- Now it’s Active. Once the Load balancer is active the target group servers should be healthy.
  ![438](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/438.png)

- Take the DNS name and if you browse in browser the load balancer will work.
  ![439](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/439.png)

- This way all target group servers will be in healthy state
  ![440](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/440.png)

### 17.1.4 Domain Creation in Route53

- Now we will create route53 domain in AWS. Click on Create hosted zone.
  ![441](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/441.png)

- Under Route53 Hosted Zones > Create hosted zone
- Name should be GoDaddy domain name, Type should be Public
  ![442](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/442.png)

- Once Hosted Zone is created, we need to add the Nameservers in GoDaddy site
  ![443](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/443.png)

- This way we can add the name servers in GoDaddy.
  ![444](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/444.png)

- Now in madireddyanil.in Hosted Zone we need to create the record, Click on Create record button.
  ![445](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/445.png)

- Fill in the Record name, Record type and Value (LB DNS Name) and click on Create record button.
  ![446](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/446.png)

### 17.1.5 Testing the Application in NLB:

- Now once the record is added we can fetch the nginx through ```nginx.madireddyanil.in```
- Now you will get response from any of 3 servers which are grouped in target group.
  ![447](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/447.png)

- Here application is not secure to make secure we need to do TLS
  ![448](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/448.png)

### 17.1.6 Redirecting Application to HTTPS:

- Click on Add Listener button.
  ![449](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/449.png)

- Select TLS and Target Group.
  ![450](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/450.png)

- Select From ACM and Select the created certificate.
- Here certificate we selected is created below.
  ![451](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/451.png)

- Once the Listener is added now after some time, we are able to login with ```https://nginx.madireddyanil.in```
  ![452](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/452.png)

## 17.2. Process Of Certificate Creation:

- Click on Request a certificate button.
  ![453](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/453.png)

- Select request a public certificate and click on next button.
  ![454](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/454.png)

- Fill the domain name which is in GoDaddy Domain name
  ![455](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/455.png)

- Select the details shown and click Request button.
  ![456](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/456.png)

- Once the certificate is created it is pending for validation. Open it Certificate.
  ![457](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/457.png)

- Use CNAME Name and CNAME Value to validate the certificate.
  ![458](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/458.png)

- Click on Create Record button
  ![459](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/459.png)

- Record Name as Cert's CNAME Name, and Value is Cert's CNAME Value.
  ![460](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/460.png)

- Once the record is created and it is in SYNC now certificate status will turn into Issued.
  ![461](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/461.png)

## 17.3. Enabling the logs in the Load balancer:

- Enabling the logs in the NLB to check for errors.
  ![462](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/462.png)

- Created one new s3 bucket and go to permissions.
  ![463](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/463.png)

- Click edit button.
  ![464](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/464.png)

- Uncheck Block all public access and save changes.
  ![465](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/465.png)

- Click on edit button under bucket policy.
  ![466](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/466.png)

### We will paste the below code in the Policy:

  ```
  {
      "Version": "2012-10-17",
      "Id": "AWSLogDeliveryWrite20150319",
      "Statement": [
          {
              "Sid": "AWSLogDeliveryWrite",
              "Effect": "Allow",
              "Principal": {
                  "Service": "delivery.logs.amazonaws.com"
              },
              "Action": "s3:PutObject",
              "Resource": "arn:aws:s3:::test01-nlb01-logs/flowlogs/AWSLogs/905418264970/*",
              "Condition": {
                  "StringEquals": {
                      "aws:SourceAccount": "905418264970",
                      "s3:x-amz-acl": "bucket-owner-full-control"
                  },
                  "ArnLike": {
                      "aws:SourceArn": "arn:aws:logs:us-east-1:905418264970:*"
                  }
              }
          },
          {
              "Sid": "AWSLogDeliveryWriteNLB",
              "Effect": "Allow",
              "Principal": {
                  "Service": "delivery.logs.amazonaws.com"
              },
              "Action": "s3:PutObject",
              "Resource": "arn:aws:s3:::test01-nlb01-logs/AWSLogs/*",
              "Condition": {
                  "StringEquals": {
                      "s3:x-amz-acl": "bucket-owner-full-control",
                      "aws:SourceAccount": [
                          "905418264970"
                      ]
                  },
                  "ArnLike": {
                      "aws:SourceArn": [
                          "arn:aws:logs:us-east-1:905418264970:*"
                      ]
                  }
              }
          },
          {
              "Sid": "AWSLogDeliveryAclCheck",
              "Effect": "Allow",
              "Principal": {
                  "Service": "delivery.logs.amazonaws.com"
              },
              "Action": "s3:GetBucketAcl",
              "Resource": "arn:aws:s3:::test01-nlb01-logs",
              "Condition": {
                  "StringEquals": {
                      "aws:SourceAccount": "905418264970"
                  },
                  "ArnLike": {
                      "aws:SourceArn": "arn:aws:logs:us-east-1:905418264970:*"
                  }
              }
          }
      ]
  }
  ```

- In the above code change the bucket name and the account id and click on save changes
  ![467](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/467.png)

- Under attributes in load balancer, we will enable logs this way
- Enable Access logs button, S3 URL and save changes.
  ![468](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/468.png)

- Now start using the NLB logs will get generated, as shown in image.
  ![469](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/469.png)

### Things not possible in NLB:

1. http to https redirection.
2. URL/Path Based Routing
3. Blue/Green or Canary Based Deployment.
4. Integration with Web Application Firewall(WAF)

## 17.4. Configuring the ALB:

### 17.4.1 Target Group Creation:

- Create the new target group for ALB
  ![470](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/470.png)

- Select Instances.

  ![471](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/471.png)

- Fill the Name, Protocol, IP and VPC details.
  ![472](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/472.png)

- Fill in the details and select Next.
  ![473](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/473.png)

- Select the target server and click on include as pending below.
  ![474](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/474.png)

- Now select Create target group button
  ![475](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/475.png)

- Target group created successfully but still it is None associated that means we need to add to a load balancer so that
  we can use this target group.
  ![476](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/476.png)

### 17.4.2 ALB Creation:

- Now Click on Create button
  ![477](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/477.png)

- Now select the ALB

  ![478](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/478.png)

- Fill Name, Scheme, IP and VPC and their subnets.
  ![479](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/479.png)
  ![480](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/480.png)

- Select HTTPS and Certificate for that.
  ![481](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/481.png)

- Click on create button.
  ![482](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/482.png)

### 17.4.3 Http to Https Redirection in ALB:

- Now open the ALB and add listener 80 and redirect it to 443
- Click on Add button
  ![483](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/483.png)

- Now select 80 port and redirect to URL, full URL and click on Add button
  ![484](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/484.png)

- Added the Listener
  ![485](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/485.png)

- Now we will create a record in the hosted zones and add the ALB DNS Name
  ![486](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/486.png)

- Adding record name(appnginx), record type(CNAME ), Value (ALB DNS Name) and click on create button
  ![487](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/487.png)

- Now we will test the application in the browser.
- Even though we give http now it will automatically redirect to the https.
  ![488](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/488.png)

## 17.5. Configuring Path Based/URL based routing in Hosted Zones:

Launch two more instances with below user data

### Hotstar Instance:

  ```
  #!/bin/bash
  yum update -y
  yum install nginx -y
  service nginx start
  systemctl enable nginx
  echo "<div><h1>Hotstar</h1></div>" >> /usr/share/nginx/html/index.html
  sleep 10
  mkdir /usr/share/nginx/html/hotstar
  sleep 10
  mv /usr/share/nginx/html/index.html /usr/share/nginx/html/hotstar
  ```

### Netflix Instance:

  ```
  #!/bin/bash
  yum update -y
  yum install nginx -y
  service nginx start
  systemctl enable nginx
  echo "<div><h1>Netflix</h1></div>" >> /usr/share/nginx/html/index.html
  sleep 10
  mkdir /usr/share/nginx/html/netflix
  sleep 10
  mv /usr/share/nginx/html/index.html /usr/share/nginx/html/netflix
  ```

- Thes are the two servers which we created for path-based testing
  ![489](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/489.png)

- we browse these with Public IPv4 DNS/netflix, Public IPv4 DNS/hotstar
  ![490](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/490.png)

- Now we will create two target groups with two servers for Netflix and Hotstar. Same as we created previously but only
  change is in Health check path. for Netflix Server.

  ![491](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/491.png)

- For Hotstar server

  ![492](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/492.png)

- The two created Target groups.
- Target group created successfully but still it is None associated that means we need to add to a load balancer so that
  we can use this target group.
  ![493](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/493.png)

- So, we need to add this in our ALB which we have created earlier. Click on rule for HTTPS
  ![494](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/494.png)

- Click on Add rule.
  ![495](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/495.png)

- Fill Name and Click Next button.
  ![496](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/496.png)

- Click on Add Condition button.
  ![497](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/497.png)

- Select Path under Rule condition type, Path ```/netflix/*``` and click on Confirm.
  ![498](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/498.png)

- Click on Next

  ![499](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/01-499/499.png)

- Select Forward to target group, Target group(Netflix-TargetGroup) and click Next.
  ![500](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/500.png)

- Set Priority to 1

  ![501](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/501.png)

- Click on create Button.

  ![502](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/502.png)

- Similarly add another rule for Hotstar Target Group by path = ```/hotstar/*```
  ![503](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/503.png)

- Two rules added in the ALB Listeners Rules.
  ![504](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/504.png)

- Now if you browse the apps ```/hotstar/```  will get the app with path-based Routing.
  ![505](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/505.png)

- Now if you browse the apps ```/netflix/``` will get the app with path-based Routing.
  ![506](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/506.png)

## 17.6. Blue Green or Canary Based Deployment:

- If we do any changes to the current Target group servers we remove one server, update, attach it to the new Target
  Group and Add that in the ALB’s HTTPS Listener’s default rule
  ![507](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/507.png)

- Add the new target group by clicking on add target group button and add the weight 0 to old target group and 1 to new
  group if you wish to stop traffic to the old target group and start new updated traffic to the new target group or
  according to your requirement you can change the weightage so that traffic moves between old and new target groups.
  ![508](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/508.png)



# 18. Web Application Firewall(WAF):

## 18.1. Creating IP Set:

- Click on the Create IP set button.
  ![509](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/509.png)

- Fill in the details like IP set name and IP addresses.
- Here we are adding some Public IPs to block or to allow in Web Application Firewall(WAF).
  ![510](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/510.png)

- IP Set created successfully.
  ![511](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/511.png)

## 18.2. Creating Rule Groups:

- Click on the Create rule group button to create rule group.
  ![512](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/512.png)

- Fill in the details like Name, CloudWatch metric name and Region, click on Next.
  ![513](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/513.png)

- Click on add rule button to add some rules.
  ![514](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/514.png)

- Fill in the details like Name, Type, Inspect and Country codes.
  ![515](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/515.png)

- Select Block if you want to block India, click on add rule.
  ![516](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/516.png)

- Block India Rule added successfully.
- Now Click on Add rule again to add the rate-based rule, as we have added one Regular rule before.
  ![517](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/517.png)

- Fill in the details like Name and type.
  ![518](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/518.png)

- Fill in Rate limit, and etc. and click on add rule button.
  ![519](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/519.png)

- Rate based rule added successfully.
  ![520](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/520.png)

- Fill in the Capacity, Click On Next.
  ![521](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/521.png)

- Click On Next.

  ![522](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/522.png)

- Click on Create button.

  ![523](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/523.png)

- Rule group created successfully.
  ![524](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/524.png)

- Now we will create the Web ACL

## 18.3. Creating the Web ACL:

- Click on Create button.
  ![525](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/525.png)

- Fill in the Details.

  ![526](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/526.png)

- Click on Add AWS resources and add the ALB
- ```Note:``` Post 20 min of ALB creation only you can add the ALB here.
  ![527](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/527.png)

- Select Application Load Balancer and Name. and click on add button.
  ![528](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/528.png)

- Click on Next Now.

  ![529](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/529.png)

- Click on Add my own rules and rule group
  ![530](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/530.png)

- Fill in the details, Select our IP List which we created earlier, Click on add rule

  ![531](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/531.png)

- Again, Click on Add my own rules and rule group
  ![532](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/532.png)

- Select Rule group. Fill the Name.
- Select Rule Group which we created earlier.
- Under rule group Enable the Override rulegroup action.
- Click on Add rule button.

  ![533](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/533.png)

- Added my own rules and Allow Default action, Click on Next.
  ![534](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/534.png)

- Click Next

  ![535](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/535.png)

- Click Next. And click on Create Web ACL button next.
  ![536](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/536.png)

- Web ACL created successfully
  ![537](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/537.png)

- Now when you browse from India it will come as forbidden. As we blocked India, try from outside India.
  ![538](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/538.png)

- Some may use proxies for browsing to bold those IPs we do this.
- Click on WebACL’s Add managed rule groups
  ![539](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/539.png)

- Expand AWS managed rule groups
  ![540](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/540.png)

- Enable Anonymous IP list, and click on Add rule button
  ![541](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/541.png)

- After adding the AWS rule click on save button.
  ![542](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/542.png)
  ![543](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/543.png)

- After adding AWS proxy rule now by VPN, we cannot browse it.
  ![544](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/544.png)



# 19. Scaling in AWS:

- Two types of scaling
  ### 1. Vertical Scaling :
    - Changing instance type to (low to high) or (high to low) is called Vertical scaling. To do this instance stop and
      start is required. Good for database servers or file servers.
      ![545](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/545.png)

  ### 2. Horizontal scaling:
    - Increasing the instance number is called Horizontal scaling. To do this instance stop and start is not required.
      Good for web servers and app servers

  ### 3. Autoscaling:
    - Adding and removing the instances according to the load is called autoscaling. Adding machines(Scale Out),
      Removing Machines(Scale In).
      ![546](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/546.png)

## 19.1. Steps to Vertical Scaling:

- Right click on Instance > Instance’s Settings > Change Instance Type.
- Under New instance type change it to any.
  ![547](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/547.png)

## 19.2. Steps to Horizontal Scaling:

### 19.2.1 Instance Launching:

- For testing the Horizontal Scaling, we need to launch one t2.medium instance and create one AMI for t2.medium instance
  with below user data.
  ![548](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/548.png)

### Ubuntu User Data:

```
#!/bin/bash
apt update
apt install software-properties-common -y
apt-add-repository --yes --update ppa:ansible/ansible
apt update
apt install ansible -y
apt install nginx -y
apt install python-apt -y
apt install git -y
apt install stress -y
git clone https://github.com/anilmadireddy/AnsibleTemplateTesting.git /myrepo
mkdir /tmp/ansibletemplatetesting
cp /myrepo/* /tmp/ansibletemplatetesting/
sleep 5
ansible-playbook /myrepo/playbook.yaml
```

### Amazon Linux User Data:

```
#!/bin/bash
yum update
yum install ansible -y
yum install nginx -y
yum install python3 -y
yum install git -y
yum install stress -y
git clone https://github.com/anilmadireddy/AnsibleTemplateTesting.git /myrepo
mkdir /tmp/ansibletemplatetesting
cp /myrepo/* /tmp/ansibletemplatetesting/
sleep 5
ansible-playbook /myrepo/playbook-amazonLinux.yaml
```

- Fill in details for Image creation. And click on Create button.
  ![549](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/549.png)

- Once the machine image is in available status, we will deploy a machine using this AMI
  ![550](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/550.png)

- Now run ```ansible-playbook /myrepo/playbook.yaml``` command to make nginx colourful.
- Now delete the old server and launch the new server with New Updated image and test and see if nginx is working as
  here.
  ![551](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/551.png)

### 19.2.2 AMI Creation:

- ASG comes under the Horizontal Scaling
- We create one Image from One Instance.
- Fill in the details and click on create image.
  ![552](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/552.png)

- Created the Image successfully. In this Image we have Amazon Linux, t2.micro and Nginx with colour game
  ![553](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/553.png)

### 19.2.3 Launch Template Creation:

- Creating One Launch Template with the above Amazon-Linux-Nginx-Image
- Under Launch Templates click on Launch Template button.
- Fill in the details like Name, Description, under My AMIs select the Amazon-Linux-Nginx-Image
  ![554](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/554.png)

- Select Instance type

  ![555](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/555.png)

- Fill in the details as shown.
- ```Note``` : Don’t include Subnet now coz we need to add subnets in ASG
  ![556](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/556.png)

- Add user data as shown in below.
- Here in the image already we have used other user data related gitRepo.
- Now click on Create a launch template button.

  ![557](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/557.png)

- Enable the Detailed CloudWatch Monitoring
  ![558](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/558.png)

- Created launch template successfully.
  ![559](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/559.png)

### 19.2.4 Auto Scaling Group Creation:

- Now Come to Auto scaling groups under Auto Scaling
- Click on Create Auto Scaling group button.
  ![560](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/560.png)

- Fill in the Name, Select the Launch Template which we created with Amazon-Linux-Nginx-Image.
  ![561](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/561.png)

- Click on next button.

  ![562](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/562.png)

- Select the VPC and Subnets which you want to do Auto Scaling, Click on Next.
  ![563](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/563.png)

- Fill in details as shown

  ![564](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/564.png)

- Fill in details as shown

  ![565](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/565.png)

- Health grace period 30 sec

  ![566](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/566.png)

- Click on Next Button

  ![567](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/567.png)

- Fill in details as shown, click on Next.
  ![568](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/568.png)

- Click on Next, verify all and click on create button.
  ![569](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/569.png)

- Auto Scaling Group created successfully
- Now in instances one Machine will get deployed.
  ![570](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/570.png)

- Auto Scaling Server Deployed successfully
  ![571](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/571.png)

- On what basis the scaling should happen can be mentioned under ASG’s Automatic Scaling, before adding the Scaling we
  need to add the Notification under Application Integration’s Simple Notification Service. Under Amazon SNS’s Topics.
  ![572](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/572.png)

### 19.2.5 Notification Creation For Autoscaling:

- Click on Create topic button.
  ![573](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/573.png)

- Fill in details as shown, click on Create Topic button.
  ![574](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/574.png)

- In Topics Create Subscription.
  ![575](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/575.png)

- Select email and fill our email id, and click on create subscription.
  ![576](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/576.png)

- Confirm Subscription.
  ![577](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/577.png)
  ![578](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/578.png)

### 19.2.6 Alarm Creation for AutoScaling:

- Create a cloud watch alarm, click on Select metric button.
  ![579](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/579.png)

- Select metric > EC2 > By Auto scaling group > ASG’s CPU Utilization. And click on select metrics button.
  ![580](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/580.png)

- Fill in details as shown.
  ![581](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/581.png)

- Fill in as shown, click Next.
  ![582](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/582.png)

- Fill in as shown, click on next.
  ![583](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/583.png)

- Fill name, click on Next.
- Review and click on create Alarm Button.
  ![584](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/584.png)

- Alarm Created Successfully.
- You can see insufficient data once you add in scaling policy then data will come.
  ![585](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/585.png)

### 19.2.7 Dynamic scaling policy Creation in ASG:

- Now come to ASG’s Automatic Scaling, click on Create Dynamic Scaling Policy
  ![586](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/586.png)

- Fill in the details as shown, click on create button.
  ![587](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/587.png)

- Now we will create another policy, before creating the policy we create new alarm for that.
- Click on Create Alarm button.
- Create a cloud watch alarm, click on Select metric button.
  ![588](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/588.png)

- Select metric > EC2 > By Auto scaling group > ASG’s CPU Utilization. And click on select metrics button
  ![589](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/589.png)

- Fill in details as shown.
  ![590](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/590.png)

- Fill as shown, click Next.
  ![591](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/591.png)

- Fill as shown.

  ![592](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/592.png)

- Click on next after name fill and review and create alarm button.
  ![593](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/593.png)

- Created alarm for deletion.
  ![594](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/594.png)

- Now come to ASG’s Automatic Scaling, click on Create Dynamic Scaling Policy
  ![595](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/595.png)

- Fill in the details as shown, click on create button
- Now you can add the HTTPs and Route53 entry, then you can check the app access with ```asg.madireddyanil.in.```
  ![596](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/596.png)

- please check if enabled or not. Right Click on Instance > Monitoring and troubleshooting > Manage Detailed monitoring.
  ![597](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/597.png)

### 19.2.8 Testing the AutoScaling:

- Run stress to keep load on server
  ```
  stress --cpu 8 --io 4 --vm 2 --vm-bytes 128M --timeout 15m
  ```
  ![599](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/599.png)

- After sometime desired capacity will increase to 2 as we ran stress command.
  ![598](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/598.png)

- Extra server launched.
- Parallelly connect to new server and run stress and go on till 4 or 5 servers and then stop stress one by one so that
  instances will get deleted automatically.
  ![600](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/600.png)

- Alarm triggered; AWS Autoscaling Groups(ASG) must be used with Stateless Applications Only. Like Frontend/Webservers
  and Backend/AppServer. ASG must not be used with Database server as the servers can be deleted any time.
  ![601](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/601.png)




# 20. Global Load Balancers:

1. AWS Route53 routing policies
2. Global Accelerators

## 20.1 AWS Route53 routing policies:

- Failover (One fails another)
- Latency (Nearest Location)
- Weighted (0 to 255)
- Geo-Location
- Multi-Value

### Infrastructure Setup:

- For this we use the terraform code to build 3 VPCs in India, Ireland and US to do the Global Load Balancing, Below is
  the code

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

## 20.2. Testing the Nginx in all 3 servers

- India Server

  ![602](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/602.png)

- US server

  ![603](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/603.png)

- Ireland Server

  ![604](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/304.png)

## 20.3. Health Check Creation:

- Create Health Checks under Route 53 > Health Checks.
- Click on Create Health Checks button to create it for US Server, India Server and Ireland Server
  ![605](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/605.png)

- Fill in the details like Name, What to monitor as Endpoint, Protocol, IP address ```US Server Public IP```, Port,
  Request interval and Failure threshold
- Click on Next Button to proceed.
  ![606](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/606.png)

- If require you can configure the alarm as we did it in Auto Scaling in AWS. and selected the Notification Which is
  created in Auto scaling Groups
- Click on Create health check button.
  ![607](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/607.png)

- Fill in the details like Name, What to monitor as Endpoint, Protocol, IP address ```Ireland Server Public IP```, Port,
  Request interval and Failure threshold
- Click on Next Button to proceed.
  ![608](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/608.png)

- If require you can configure the alarm as we did it in Auto Scaling in AWS. and selected the Notification Which is
  created in Auto scaling Groups
- Click on Create health check button.
  ![607](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/607.png)

- Fill in the details like Name, What to monitor as Endpoint, Protocol, IP address ```India Server Public IP```, Port,
  Request interval and Failure threshold
- Click on Next Button to proceed.
  ![609](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/609.png)

- If require you can configure the alarm as we did it in Auto Scaling in AWS. and selected the Notification Which is
  created in Auto scaling Groups
- Click on Create health check button.
  ![607](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/607.png)

- 3 health Checks created successfully and Initially Status will be unknown and after some time it will change to
  healthy if servrs are healthy.
  ![610](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/610.png)

- Healthy status.
  ![611](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/611.png)

## 20.4 Failover:

### 20.4.1 Failover Records Creation in Hosted Zones

- Now we will create the failover record in our Route53 > Hosted Zones, A Record. for US server as primary.
  ![612](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/612.png)

- Now we will create the failover record in our Route53 > Hosted Zones, A Record. for Ireland server as seccondary.
  ![613](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/613.png)

- After adding records.
  ![614](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/614.png)

- Now when we browse ```failover.madireddyanil.in``` in browser it go to the primary i.e US Server record.
  ![615](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/615.png)

- If failover occour for US server then the it will route to the Ireland server
- If require login to the US Server try stopping the nginx with ```service nginx stop``` command.
- Now failover works and routes to Ireland server which is secondary
  ![616](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/616.png)

- Suddenly it will not route to failover if health check fails only it will route to secondary.
  ![617](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/617.png)

- After health failure it routed to secondary when we browse the  ```failover.madireddyanil.in``` in browser
  ![618](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/618.png)

- Now again we will start the service in US Server.
  ![619](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/619.png)

- Now traffic again routed to primary i.e US server
  ![615](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/615.png)

- Health Check recovery after starting the service in US server.
  ![620](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/620.png)

## 20.5 Latency:

### 20.5.1. Latency Records Creation in Hosted Zones

- Now we will create the Latency record in our Route53 > Hosted Zones, A Record. for US server as primary.
  ![621](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/621.png)

- Now we will create the Latency record in our Route53 > Hosted Zones, A Record. for India server as primary.
  ![622](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/622.png)

- After creating latency records.
  ![623](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/623.png)

- Now when we browse ```latency.madireddyanil.in``` in browser it go to the nearest Server
- here i browsed from india so i will get india server.
  ![624](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/624.png)

- Now when we browse ```latency.madireddyanil.in``` in browser it go to the nearest Server
- here i browsed from America by using VPN so i will get US server.
  ![625](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/625.png)

## 20.6. Weighted:

### 20.6.1 Weighted Records Creation in Hosted Zones

- Now we will create the Weighted record in our Route53 > Hosted Zones, A Record. for US, India and Ireland, by clicking
  on add another record button.
- Weight 1(it will distribute among all 3 servrs).
- Record-1
  ![626](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/626.png)
- Record-2
  ![627](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/627.png)
- Record-3, and click on create record button.
  ![628](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/628.png)

- After creating Weighted records.
  ![629](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/629.png)

- Now by below Command you can ping the url.
  ```
  while true;
  > do curl -sL http://weighted.madireddyanil.in/ | grep Server;
  > sleep 1;
  > done
  ```
- or you can browse with ```weighted.madireddyanil.in``` so that weight will get distributed.

## 20.7. Geo-Location

### 20.7.1 Geo-Location Records Creation in Hosted Zones

- Now we will create the Geolocation records in our Route53 > Hosted Zones, A Record. for US, India and Ireland, by
  clicking on add another record button.
- Geolocatio (Request of that country will route to that Servers).
- Record-1
  ![630](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/630.png)
- Record-2
  ![631](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/631.png)
- Record-3, and click on create record button.
  ![632](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/632.png)

- After creating Weighted records.
  ![633](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/633.png)

- Now you can browse with ```geo.madireddyanil.in``` so that weight will get distributed.
- As i am in India it give India Server
  ![634](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/634.png)

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



# 21. Global Accelerator:

- Its like Global Load Balancer
- It provides two static IP Address
- You can select the Ports TCP/UDP

## 21.1. Configuring Global Accelerator:

- Click on Create accelerator button
  ![635](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/635.png)

- Fill in the details as shown below. Click on Next Button.
  ![636](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/636.png)

- Under Listener 1 ports you can give multiple ports seperated by comma, select protocol TCP, Client Affinity as
  None/Sorce IP. Click on Next button.

  ![637](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/637.png)

- Here we select the Regions Which we need to do Load Balancing. and click on Next button.
  ![638](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/638.png)

- Here we need to select the Endpoint Type as EC2 as we are using EC2.
- Under Endpoint we need to select the Endpoint which we created earlier for US, India and Ireland
- Weight is same as we have only one server in it. Click on Create accelerator button
  ![639](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/639.png)
  ![640](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/640.png)

- After creating Global Accelerator. you will get two static Public IPv4 address that you can share with your clients.
- They will whitelist those IPv4 address in their firewall and use them.
  ![641](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/641.png)

- We will take the Global Accelerator's DNS Name and create a ```CNAME record``` with ```Simple Routing``` Routing
  Policy in the Rootr53 > Hosted zones
  ![642](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/642.png)

- Now we create a ```CNAME record``` with ```Simple Routing``` Routing Policy in the Rootr53 > Hosted zones
- Click on Create record button.
  ![643](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/643.png)

- After adding record.
  ![644](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/644.png)

- Now if you do simple nslookup for ```global.madireddyanil.in``` you can see the two Public IPv4 of Global Accelerator.
  after accelerator status is in Deployed.
  ![646](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/646.png)
  ***Command:***
  ```
  madireddydevops@MadireddyOmen:~$ nslookup global.madireddyanil.in
  ```
  ***Output:***
  ```
  Server:         10.255.255.254
  Address:        10.255.255.254#53
  
  Non-authoritative answer:
  global.madireddyanil.in canonical name = a5183848ae7ffde43.awsglobalaccelerator.com.
  Name:   a5183848ae7ffde43.awsglobalaccelerator.com
  Address: 76.223.73.247
  Name:   a5183848ae7ffde43.awsglobalaccelerator.com
  Address: 75.2.49.238
  Name:   a5183848ae7ffde43.awsglobalaccelerator.com
  Address: 64:ff9b::4cdf:49f7
  Name:   a5183848ae7ffde43.awsglobalaccelerator.com
  Address: 64:ff9b::4b02:31ee
  ```
- Now when you browse ```global.madireddyanil.in``` you will get with nearest server
- Here i am browsing from India
  ![645](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/645.png)




# 22. AWS IAM(Identity and Access Management):

#### 1. User & User Groups

#### 2. Roles

#### 3. IAM Policies

#### 4. Permission Boundries

#### 5. AWS Organizations

#### 6. Service Control Policies

#### 7. IAM SSO (Identity Center)

### How can I access the AWS:

- From console using id and pasword
- From AWS CLI using AWS Access and Secret Key
- Using tools like packer or terraform same AWS Access and Secret Key

### Users & Groups:

- For admin and devolopers who want to manage and use the AWS services
- It can also be used by applications outside AWS using AWS Access and Secret Key

### Roles:

- Used to Access AWS services by one another Ex: AWS Lambda Accessing AWS RDS DB.
- Roles can be assumed by users for account management.

### Policies:

- Policies are nothing but Permissions in Json format which can be applied to Users, Groups and Roles
- AWS Managed
- Customer Managed
    - Inline Policies

Now we will discuss about the users & Groups.

## 22.1. Users & Groups:

- Now we will create 2 ```test-user-01``` and ```test-user-02``` in IAM
  ### 22.1.1 User creation:
    - Click on Create user button under IAM > Users to create ```test-user-01``` user
      ![647](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/647.png)

    - Fill in the details like User name, tik in Provide user access to the AWS Management Console and provide the
      password.
    - Click on Next button to proceed.      
      ![648](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/648.png)

    - Lets skip Permissions for now. and Click on Next Button.
      ![649](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/649.png)

    - Verify and click on Create user button.
      ![650](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/650.png)

    - User ```test-user-01``` Created Successfully. If require download the cvs file or return to user list.
      ![651](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/651.png)

    - Similarly we create another user ```test-user-02```
      ![652](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/652.png)

    - Now we will launch the two servers
      ![653](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/653.png)

    - We create ```owner tags``` to the both istances
      ![654](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/654.png)
      ![655](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/655.png)

  ### 22.2. IAM Policies.
    - our goal is to make ```test-user-0l``` must be able to ```stop, start, reboot``` only ```Test-vm-0l```
    - ```test-user-02``` must be able to ```stop, start, reboot``` only ```Test-vm-02```.
    - For this we need to create policies in IAM , ``` IAM > Policies```
    - Click on create Policy for test-user-01
      ![656](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/656.png)

    - Select ```Json``` Code tab paste the below policy Json code in the Policy Editor.
      ***test-user-01.json***
      ```
      {
          "Version": "2012-10-17",
          "Statement": [
            {
              "Effect": "Allow",
              "Action": "ec2:Describe*",
              "Resource": "*"
            },
            {
              "Effect": "Allow",
              "Action": [
                "ec2:StartInstances",
                "ec2:StopInstances",
                "ec2:RebootInstances"
              ],
              "Resource": [
                "arn:aws:ec2:us-east-1:905418264970:instance/*"
              ],
              "Condition": {
                "StringEquals": {
                  "ec2:ResourceTag/Owner": "test-user-01"
                }
              }
            }
          ]
        }       
      ```
      ![657](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/657.png)

    - Fill the Policy Name and Click on Create Policy button.
      ![658](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/658.png)

    - Click on create Policy for test-user-02
      ![656](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/656.png)

    - Select ```Json``` Code tab paste the below policy Json code in the Policy Editor.
      ***test-user-02.json***
      ```
      {
          "Version": "2012-10-17",
          "Statement": [
            {
              "Effect": "Allow",
              "Action": "ec2:Describe*",
              "Resource": "*"
            },
            {
              "Effect": "Allow",
              "Action": [
                "ec2:StartInstances",
                "ec2:StopInstances",
                "ec2:RebootInstances"
              ],
              "Resource": [
                "arn:aws:ec2:us-east-1:905418264970:instance/*"
              ],
              "Condition": {
                "StringEquals": {
                  "ec2:ResourceTag/Owner": "test-user-02"
                }
              }
            }
          ]
        }       
      ```
      ![659](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/659.png)

    - Fill the Policy Name and Click on Create Policy button.
      ![660](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/660.png)

    - Policies Created Successfully.
      ![661](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/661.png)

    - Now we need to add these policies to the users ```test-user-0l``` & ```test-user-02```
    - Under IAM > Users, Click on test-user-01
      ![662](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/662.png)

    - Click on Add Permissions button
      ![663](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/663.png)

    - Select Attach Policies directly, select test-user-01 policy and click on next button.
      ![664](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/664.png)

    - Review and Click on Add Permissions button
      ![665 1](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/665.png)

    - After adding permission looks like below. for ```test-user-0l```
      ![665 2](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/665.png)

    - Under IAM > Users, Click on test-user-02
      ![666](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/666.png)

    - Click on Add Permissions button
      ![667](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/667.png)

    - Select Attach Policies directly, select test-user-02 policy and click on next button.
      ![668](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/668.png)

    - Review and Click on Add Permissions button
      ![669](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/669.png)

    - After adding permission looks like below. for ```test-user-02```
      ![670](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/670.png)

    - Now we will try to login with ```test-user-01``` & ```test-user-02```
    - To Login try using the URL which is under IAM > Dashboard
      ![671](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/671.png)
      ```
      https://905418264970.signin.aws.amazon.com/console
      ```
    - After login.
      ![672](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/672.png)

    - User will only be having the EC2 access as we defined in the Policy.
    - Policies will work as shown in below.
      ![673](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/673.png)

    - You can use the below url for policy generation
      ```
      https://awspolicygen.s3.amazonaws.com/policygen.html
      ```
    - If you want to give the user1 S3 Bucket list access you can do the below code.

      ***test-user-01-1.json***
      ```
      {
        "Version": "2012-10-17",
        "Statement": [
          {
            "Effect": "Allow",
            "Action": "ec2:Describe*",
            "Resource": "*"
          },
          {
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets",
                "s3:ListBucket"
            ],
            "Resource": "*"
          },
          {
            "Effect": "Allow",
            "Action": [
              "ec2:StartInstances",
              "ec2:StopInstances",
              "ec2:RebootInstances"
            ],
            "Resource": [
              "arn:aws:ec2:us-east-1:905418264970:instance/*"
            ],
            "Condition": {
              "StringEquals": {
                "ec2:ResourceTag/Owner": "test-user-01"
              }
            }
          }
        ]
      }
      ```
    - By the above policy attachment to the any user gets ```s3 bucket listing``` access.
    - For Now test-user-01 can access only EC2(Start, Stop and Reboot) which has tag ```Owner``` as ```test-user-01```
    - For Now test-user-02 can access only EC2(Start, Stop and Reboot) which has tag ```Owner``` as ```test-user-02```

    - There is something called as inline policy which is only for the user-level
    - Which means if you delete the user the inline policy will also get deleted along with user.
    - For example we will try with the test-user-02
    - For test-user-02 we will assign the inline policy(EC2 full access) under IAM > Users > test-user-02, as shown in
      below image.
    - Click on Create inline policy button
      ![674](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/674.png)

    - Under Policy editor paste the below code. and click on Next button.
      ```
      {
          "Version": "2012-10-17",
          "Statement": [
              {
                  "Effect": "Allow",
                  "Action": "ec2:*",
                  "Resource": "*"
              }
          ]
      }
      ```
    - Here in below diagram we should have been given ```ec2:*```
      ![675](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/675.png)

    - Fill in the name and click on Create Policy button.
      ![676](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/676.png)

    - After adding inline Policy it looks like below image.
      ![677](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/677.png)

    - Now when test-user-01 tries to stop Test-vm-02 it shows below error.
      ![678](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/678.png)

    - Now when test-user-01 tries to stop Test-vm-01 it Stops.
      ![679](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/679.png)

    - Now login with test-user-02 and Stop Test-vm-02 and Start Both Test-vm-02 and Test-vm-01 as we gave Ec2 full
      access to test-user-02.
      ![680](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/680.png)
      ![681](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/681.png)

  ## 22.3. Permission Boundaries:
    - Given ```admin access``` to test-user-02 Under IAM > Users > test-user-02 > Add Permissions > add
      ```admin Policy``` save it.
    - Some times by mistake you can give privilaged or admin rights to the users, then in such case we can do IAM
      Permission boundaries.
    - Permission Boundary is nothing but the IAM Policy.
    - Now we will create the permission boundary with below code Under IAM > Policies
      ```
      {
          "Version": "2012-10-17",
          "Statement": [
              {
                  "Sid": "Stmt1683776960231",
                  "Action": [
                      "*"
                  ],
                  "Effect": "Allow",
                  "Resource": "*"
              },
              {
                  "Effect": "Deny",
                  "Action": [
                      "iam:*",
                      "s3:*"
                  ],
                  "Resource": [
                      "*"
                  ]
              }
          ]
      }
      ```
    - Above code says Actions is * that menas user may have any other policies but denying the S3 and IAM.
    - In the above code if you observer we denied only IAM and S3.
    - This user may consists of any other Admin or etc rights but IAM and S3 denied explicitly.
    - Click on Create Policy button under IAM > Policies
      ![682](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/682.png)

    - Fill the above code. Click on Next
      ![683](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/683.png)

    - Fill Names and click on Create Policy Button
      ![684](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/684.png)

    - Permission Boudary Created Successfully.
      ![685](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/685.png)

    - Now we should add that Permission Boundary into test-user-02.
    - Click on Set Permission Bounday Under IAM > Users > test-user-02 > Permission boundary
      ![688](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/688.png)

    - Now Select our Permission Boundary which we created earlier.
      ![689](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/689.png)

    - After adding.
      ![690](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/690.png)

    - Now when you login with test-user-02 you should be able to access everything except IAM and S3.
      ![686](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/686.png)
      ![687](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/687.png)

    - Make sure you have assigned admin policy before for user test-user-02.
    - Now we are able to access the All except IAM and S3 even though test-user-02 has ```admin rights``` enabled.
    - Because of Permission Boundry. S3 and IAM Not able to access.
      ![691](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/691.png)



## 22.4. Multiaccount Management Using Role Switching:

### 1. Master account Users Creation:

- Here we are going to link three accounts(```MadireddyMaster, MadireddySlave1 and MadireddySlave2```) for Single
  Management Purpose, Using IAM.
- Now we take 3 accounts(```MadireddyMaster, MadireddySlave1 and MadireddySlave2```)
- MadireddyMaster Account
  ![692](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/692.png)

- MadireddySlave1 Account
  ![693](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/693.png)

- MadireddySlave1 Account
  ![694](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/694.png)

- here we create two users(```madireddy-01``` & ```madireddy-02```) in the Master account.
- Under IAM > Users, Click on Create user button
  ![699](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/699.png)

- Fill in the username, Provide console access and Password and click on Next.
  ![695](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/695.png)

- No Permissions for now click on Next
  ![696](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/696.png)

- Click on Create User button.
  ![697](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/697.png)

- Check Password if possible.
  ![698](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/698.png)

- Similarly Create another user.
- After two users created looke like below.
  ![700](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/700.png)

### 2. Slave Accounts Role Creation:

- Role Creation in ```MadireddySlave1``` account
- Click on Create Role under IAM > Roles
  ![701](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/701.png)

- Select AWS account, and Select another AWS account (Give master account details here), Click on Next button
  ![702](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/702.png)

- Add Permissions , here we have added EC2 full Access and click on next button.
  ![703](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/703.png)

- Fill Role name, Description and review & Create role.
  ![704](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/704.png)
  ![705](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/705.png)

- After creating the role.
  ![706](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/706.png)
  ![707](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/707.png)

- Role Creation in ```MadireddySlave2``` account
- Click on Create Role under IAM > Roles
  ![701](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/701.png)

- Select AWS account, and Select another AWS account (Give master account details here), Click on Next button
  ![702](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/702.png)

- Add Permissions , here we have added ```EC2 full Access``` & ``` S3 Full Access``` and click on next button.
  ![703](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/703.png)

- Fill Role name, Description and review & Create role.
  ![704](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/704.png)
  ![705](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/705.png)

- After creating the role.
  ![706](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/706.png)
  ![708](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/708.png)

- Now Collect the Two Slave accounts ARN numbers
- MadireddySlave1
  ![709](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/709.png)

- MadireddySlave2
  ![710](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/710.png)

## 3. Master Account AssumeRole Policy Creation

- Now we will add this ARNs in the Assume role policy. Under ```MadireddyMaster``` account by creating the ploicy
  ```
  {
      "Version": "2012-10-17",
      "Statement": {
        "Effect": "Allow",
        "Action": "sts:AssumeRole",
        "Resource": [
          "arn:aws:iam::905418264970:role/CrossAccountRole",
          "arn:aws:iam::232789740929:role/CrossAccountRole"
        ]
      }
    }
  ```
- Click on Create Policy under IAM > Policies in ```MadireddyMaster``` account
  ![711](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/711.png)

- Pasting the above code in the Policy editor and click on Next button.
  ![712](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/712.png)

- Fill Name and Description and Click on Create Policy Button.
  ![713](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/713.png)

- After policy creation.
  ![714](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/714.png)
  ![715](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/715.png)

- Now we will create the New group and add users anad Crossaccount policy in MasterMadireddy account.

## 4. User Group Creation in MadireddyMaster account:

- Under IAM > UserGroups click on Create group button.
  ![716](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/716.png)

- Fill in Name and Select Users and Assume Policy
  ![717](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/717.png)

- After Group Creation.
  ![718](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/718.png)
  ![719](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/719.png)
- Now aw should test the login to the Slave Accounts by two users in Master account by using the below master url

## 5. Testing login to Slave1 account with madireddy-01 user:

- Under IAM > Dashboard copy the Aws Account URl which is below
  ```
  https://559050220397.signin.aws.amazon.com/console
  ```
- Sign in to ```Master account```
  ![720](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/720.png)

- Initially We signed in to ```master``` account and ```no access``` at all.
- As we did not give permission in MAster account to ```madireddy-01```
  ![721](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/721.png)

- Now from here we will switch to ```Slave 1``` account
- Click on Switch role button.
  ![722](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/722.png)

- Fill in the Slave 1's (account ID and IAM Role and display name)
  ![723](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/723.png)

- After login.
  ![724](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/724.png)

- Here only ```EC2``` as we did same to user madireddy-01
  ![725](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/725.png)

- No s3 access to user madireddy-01 as we not gave.
  ![726](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/726.png)

- Check as below in whcih account you are in
  ![727](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/727.png)

## 6. Testing login to Slave2 account with madireddy-01 user:

- Under IAM > Dashboard copy the Aws Account URl which is below
  ```
  https://559050220397.signin.aws.amazon.com/console
  ```
- Sign in to ```Master account```
  ![720](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/720.png)

- Initially We signed in to ```master``` account and ```no access``` at all.
- As we did not give permission in MAster account to ```madireddy-01```
  ![721](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/721.png)

- Now from here we will switch to ```Slave 2``` account
- Click on Switch role button.
  ![722](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/722.png)

- Fill in the Slave 2's (account ID and IAM Role and display name)
  ![728](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/728.png)

- After login.
  ![729](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/729.png)

- Here only ```EC2``` and ```s3``` access as we did same to user madireddy-01
  ![729](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/729.png)
  ![730](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/730.png)

- No Route53 access to user madireddy-01 as we not gave.
  ![731](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/731.png)

- Check as below in whcih account you are in
  ![732](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/732.png)

- Similarly do with the ```madireddy-02``` user in ```Slave1``` and ```Slave2``` accounts.
- Only cahnge after switching to madireddy-02 is switching will show before only.
- As we assigned same policy to madireddy-01 and madireddy-02 users
  ![733](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/733.png)

### Note:

- This process is little complicate
- Switching roles with users. Account info will be little messy.
- for less number of users it is ok but what if many users thing.
    - so now a days they are using ```AWS Organisations```

## 22.5. AWS Organizations:

- Click on Create an Organization.
  ![734](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/734.png)

- Click on add AWS account button to add slaves 1 and 2.
  ![735](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/735.png)

- Fill in the Account(Sub account1 and Sub account2) and Message and send invite
  ![736](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/736.png)

- Accept the invitation in two aaccounts
  ![737](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/737.png)
  ![738](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/738.png)

- After accepting in ```Master account```.
  ![739](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/739.png)

  ### Advantages of AWS Organisations:
    - centralised billing
    - By This AWS Organizations we can create the restrictions to the Sub accounts
    - Security policies
    - Service restrictions

## 22.6. Service Control Policies Under AWS Organisations.

- Clcik on Policies Under AWS Organisations > Policies > Service control policies.
  ![740](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/740.png)

- Fill in the Policy name and description, and paste the below code in the code section.
- Click on Creste Policy button.
  ```
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "AllowAll",
              "Effect": "Allow",
              "Action": [
                  "*"
              ],
              "Resource": "*"
          },
          {
              "Sid": "DenyIAMandR53",
              "Effect": "Deny",
              "Action": [
                  "iam:*",
                  "route53:*"
              ],
              "Resource": "*"
          },
          {
              "Sid": "RequireMicroInstanceType",
              "Effect": "Deny",
              "Action": [
                  "ec2:RunInstances",
                  "ec2:StartInstances"
              ],
              "Resource": [
                  "arn:aws:ec2:*:*:instance/*"
              ],
              "Condition": {
                  "StringNotEquals": {
                      "ec2:InstanceType": "t2.micro"
                  }
              }
          },
          {
              "Sid": "BlockRegions",
              "Effect": "Deny",
              "Action": [
                  "*"
              ],
              "Resource": "*",
              "Condition": {
                  "StringNotEquals": {
                      "aws:RequestedRegion": [
                          "us-east-1",
                          "us-east-2"
                      ]
                  }
              }
          },
          {
              "Sid": "RestrictIO1IO2SC1ST1STD",
              "Effect": "Deny",
              "Action": [
                  "ec2:CreateVolume",
                  "ec2:ModifyVolume"
              ],
              "Resource": "*",
              "Condition": {
                  "StringNotEquals": {
                      "ec2:VolumeType": [
                          "gp2",
                          "gp3"
                      ]
                  }
              }
          }
      ]
  }
  ```
  ![741](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/741.png)
  ![742](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/742.png)

- After Policy creation
  ![743](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/743.png)

- Now you should assign the policy to the both slave Accounts
- Click on Slave1 account
  ![744](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/744.png)

- Click on attach button under Slave1 > Policies > Attach
  ![745](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/745.png)

- Select the Service control Policy which we created earlier resctricting the few features in the code.
- Click on attach policy button.
  ![746](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/746.png)

- Similarly do to the Slave2 account
- Click on Slave2
  ![747](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/747.png)

- Click on attach button under Slave2 > Policies > Attach
  ![748](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/748.png)

- Select the Service control Policy which we created earlier resctricting the few features in the code.
- Click on attach policy button.
  ![749](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/749.png)

- Now test in Slave 1 nad 2 for access
- IAM, Route53 should be denied and etc, specified in the above code.
  ![750](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/750.png)
  ![751](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/751.png)
- Similarly there should be restrictions in many as above per code.
- Testing might be long so ```skipping``` few tests.
- NOw you can remove the policies if required for slave 1 and 2 accounts.
- Next we will Create Active Directory in AWS and shows how organizations users are maintained at singlr point.


## AWS Identity Center

## 22.7. Active Directory Creation in Master Account:

- For single ```sign-on``` we use Active directory
- Click on Set up directory under ```Directory Services > Active Directory.```
  ![752](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/752.png)

- Select ```AWS Managed Microsoft AD``` click on next button.
  ![753](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/753.png)

- Select Edition(```Standard edition```), DNS Name(```madireddy.com```) and BIOS name(```MADIREDDY```)
- Create password and click on Next button.
  ![754](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/754.png)
  ![755](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/755.png)

- Select the ```VPC``` and ```Subnets(Public Subnets)``` and click on Next button
  ![756](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/756.png)

- Review and create directory.
  ![757](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/757.png)

- It will take ```20 to 45``` min to create the Active directory.
  ![758](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/758.png)

- Now its active after 45 min
  ![759](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/759.png)

- Now Launch the Windows Server in Same VPC and Subnet. with t2.large as Instance Type.
  ![766](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/766.png)

- Connect to the windows server above created and modify the Active Directory as shown
- Create two users anilkumar and reddy
    - open command prompt and put below command in the command prompt.
  ```
  ncpa.cpl
  ```
- Goto IPV4 > Properties > DNS
  ![767](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/767.png)

- Copy the Active directory DNS address
  ![768](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/768.png)

- Enter the DNS servers IPs which are in Active directory
  ![769](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/769.png)

- Go to Server Manager in Windows.
  ![770](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/770.png)

- Click on Manage > Add Roles and Features
  ![771](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/771.png)

- click on Next.
  ![772](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/772.png)

- Select Role and Next.

  ![773](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/773.png)

- click on Next.

  ![774](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/774.png)

- click on Next.

  ![775](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/775.png)

- Select AD DS and AD LDS Tools under Remote Server Administration Tools > Role Administration Tools
  ![776](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/776.png)

- Click install

  ![777](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/777.png)

- Now in Cmd again enter the below command.
  ```
  sysdm.cpl
  ```
- Click on Change button
  ![778](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/778.png)

- Give domain name as madireddy.com and click on ok
  ![779](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/779.png)

- Now User name is admin and the password id Domain Creation Password.
  ![780](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/780.png)

- After successful authentication welcome message wil come
  ![781](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/781.png)

- click ok to restart

  ![782](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/782.png)

- Login to Ad aserver now using admin@domain name and pwd is Domain Pwd
  ![783](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/783.png)

- Now enter below command in cmd
  ```
  dsa.msc
  ```
  ![784](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/784.png)

- under madireddy.com domain create the two users ```anilkumar``` and ```reddy```
  ![785](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/785.png)

  ![786](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/786.png)

  ![787](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/787.png)

- Add Email also

  ![788](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/788.png)

  ![789](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/789.png)

  ![790](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/790.png)

- Users added successfully.

  ![791](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/791.png)

## Permission Sets Creation

- Now under IAM Identity Center > Permission Sets
- Click on Create permission set button
  ![806](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/806.png)

- Select Custom Permission Set, Click on Next Button.
  ![807](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/807.png)

- Under AWS Managed Policies, Provide EC2 Full, S3 Read only and Route53 Read only.
- Click on Next button

  ![808](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/808.png)

- Fill in Name and Description.
- Click on Next button.
  ![809](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/809.png)

- Review and Click on Create button.
  ![810](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/810.png)
  ![811](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/811.png)

- After permission set creation it looks.
  ![812](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/812.png)

- Now we will test the Active directory by logging in to the console
- under IAM Identity Center > Dashboard
- Copy the AWS access portal URL which is given below
  ```
  https://madireddy.awsapps.com/start
  ```
  ![812-1](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/812-1.png)

- Now in the Browser paste the ```AWS access portal URL``` and use the ```reddy@madireddy.com``` to login and password
  ![812-2](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/812-2.png)
  ![812-3](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/812-3.png)

- After logging in you will not ne having any permissions to work on any services.
- We need to assign permission Set to the Accounts. under IAM Identity Center > AWS Accounts
- Now under IAM Identity Center > AWS Organizations: AWS accounts add users and Permission set
- Click on Slave1 and open
  ![813](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/813.png)

- Under Users and Groups > Assign Users or Groups >
  ![814](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/814.png)

- Under Users add the two users click on Next.
  ![815](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/815.png)

- Now add the created Permission set here and click on next button.
  ![816](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/816.png)

- Review and submit.

  ![817](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/817.png)

- After submitting it looks this way.
  ![817-1](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/817-1.png)

- Now when you refresh the browser which we logged in with ```reddy@madireddy.com```
- You can see one acount added to the AWS access portal i.e ```Slave1``` account
  ![818](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/818.png)

- Similarly we need to do it for Slave 2 account.
- Now under IAM Identity Center > AWS Organizations: AWS accounts add users and Permission set
- Click on Slave2 and open
  ![819](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/819.png)

- Under Users and Groups > Assign Users or Groups >
  ![820](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/820.png)

- Under Users add the two users click on Next.
  ![821](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/821.png)

- Now add the created Permission set here and click on next button.
  ![822](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/822.png)

- Review and submit.

  ![823](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/823.png)

- After submitting it looks this way.
  ![824](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/824.png)

- Now when you refresh the browser which we logged in with ```reddy@madireddy.com```
- You can see one more acount added to the AWS access portal i.e ```Slave2``` account
  ![825](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/825.png)

- Now click on Slave1 > Permission set to go to slave 1 Console
  ![826](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/826.png)

- After in it looks.
  ![827](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/827.png)

- As we gave EC2 Full , S3 Read only and Route53 Readonly we can access them only
  ![828](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/828.png)

  ![829](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/829.png)

  ![830](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/830.png)

- Others we dont have access give so it will give denied.
  ![831](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/831.png)

- Similarly goto Slave2 > Permission set
  ![832](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/832.png)

- As we gave EC2 Full , S3 Read only and Route53 Readonly we can access them only
  ![833](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/833.png)

  ![834](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/834.png)

  ![835](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/835.png)

- Others we dont have access give so it will give denied.
  ![836](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/836.png)

- This way by using active directory users we can manage the Single sign on in the AWS Accounts.
- Now by using same active Directories we can use FSx also in AWS

## 22.8. AWS FSX CReation:

- Click on Crterate file system under Amazon FSX > Filesystems
  ![760](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/760.png)

- Select Amazon FSx for Windows File Server and click on Next.
  ![761](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/761.png)

- Select Quick Create, Name, Singlr AZ, SSD(32), VPC, Subnet.
- Finally selsct our Active directory Whcich created earlier
  ![762](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/762.png)

- Review and select create.
  ![763](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/763.png)
  ![764](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/764.png)

- After creation it will take some time to create.
  ![765](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765.png)

- Once the FSX is in Available, open the FSx
  ![765-1](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-1.png)

- Copy the FSx DNS Name.
  ![765-2](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-2.png)

- paste in run you will get shared location
  ```
  \\fs-08cd78bfa94551000.madireddy.com
  ```
  ![765-3](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-3.png)

- Open the share Folder
  ![765-4](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-4.png)

- Create 3 folders ```Commondata, anikumar and reddy```
  ![765-5](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-5.png)

- Disable inheritance for common Data coz we can delete other users in decurity
  ![765-6](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-6.png)

- Now click on Add button

  ![765-7](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-7.png)

- Now Click on Select a principal link
  ![765-8](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-8.png)

- Add ```anilkumar``` user and click on ok
  ![765-9](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-9.png)

- Next Give full control to anilkumar for common data
  ![765-10](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-10.png)

- again click on Add button

  ![765-11](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-11.png)

- Now Click on Select a principal link
  ![765-12](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-12.png)

- Add ```reddy``` user and click on ok
  ![765-13](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-13.png)

- Next Give full control to reddy for common data
  ![765-14](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-14.png)

- Now remove all except ```anilkumar``` and ```reddy```
  ![765-15](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-15.png)

- Now click on Apply and ok and ok
  ![765-16](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-16.png)

- Now For anilkumar folder
  ![765-17](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-17.png)

- Add anilkumar user id

  ![765-18](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-18.png)

- Added anilkumar by checking names button
  ![765-19](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-19.png)

- Provided full control to ```anilkumar folder``` for ```anilkumar``` user
  ![765-20](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-20.png)

- Disable inheritance for anilkumar dir
  ![765-21](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-21.png)
  ![765-22](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-22.png)

- Remove all except anilkumar as it is personal folder for anilkumar
- click on ok. and apply

  ![765-23](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-23.png)

- Now For reddy folder

  ![765-24](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-24.png)

- Disable inheritance

  ![765-25](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-25.png)
  ![765-26](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-26.png)

- click on add button

  ![765-27](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-27.png)

- Click on select principal button
  ![765-28](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-28.png)

- Add reddy user id by checking names
  ![765-29](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-29.png)

- Provide the full access for reddy
  ![765-30](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-30.png)

- Remoe all except reddy as it is personal folder for reddy user
  ![765-31](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-31.png)

- click on ok. and apply

  ![765-32](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-32.png)

- Now in power shell run below command
  ```
  lusrmgr.msc
  ```
- open remote desktop users
  ![765-33](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-33.png)

- Click on add button

  ![765-34](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-34.png)

- Add users ```anilkumar``` and ```reddy``` as they should login to the Windows AD instance
  ![765-35](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-35.png)

- Click on ok and apply
  ![765-36](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-36.png)

- NOw login to AD instance with ```anilkumar@madireddy.com``` as username
  ![765-37](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-37.png)

- Logged in as anilkumar.
  ![765-38](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-38.png)

- to check the shared location you can run ```set``` command in cmd prompt
  ![765-39](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-39.png)

- NOw do nslookup LOCALAPPDATAPATH in the above image
- out put shoes the IP address of Active dir
  ![765-40](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-40.png)

- Copy FSx DNS Name
  ![765-41](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-41.png)

- Pate in run
  ```
  \\fs-08cd78bfa94551000.madireddy.com
  ```
  ![765-42](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-42.png)

- Share folder opens , open share
  ![765-43](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-43.png)

- As you logged in with anilkumar id you wont be able to open reddy folder
  ![765-44](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-44.png)

- anikumar have access to common data
  ![765-45](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-45.png)

- anilkumar have access to anilkumar dir and copied few files
  ![765-46](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-46.png)

- NOw login to AD instance with ```reddy@madireddy.com``` as username

  ![765-47](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-47.png)

- As admin and anilkumar already loggedin it ask for disconnect one to login reddy user
  ![765-48](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-48.png)

- disconnecting anilkumar Remote desktop.
  ![765-49](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-49.png)

- Copy FSx DNS Name and Pate in run
  ```
  \\fs-08cd78bfa94551000.madireddy.com
  ```
  ![765-50](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-50.png)

- Share folder opens , open share.
- As you logged in with ```reddy``` id you wont be able to open ```anilkumar``` folder
  ![765-51](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-51.png)

- reddy have access to common data
  ![765-52](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-52.png)

- reddy have access to reddy dir and copied few files
  ![765-53](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-53.png)

- Now you can delete FSX. as our test finished and we dont want that any more.
  ![765-54](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-54.png)

- it will take minutes to delete.
  ![765-55](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/765-55.png)




# Service Control Ploicies (SCP):

- SCP mainly focus on the lmiting access of AWS services and regions
- Like restricting on only specific regions.
- Like restricting to only few services in AWS it may be any service.
- Now come to AWS Organizations > AWS accounts > Policies
  ![837](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/837.png)

- Click on Service control Policies and enable it.
  ![838](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/838.png)

- Click on Create policy.
  ![839](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/839.png)

- Fill Policy Name and Description.
  ![840](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/840.png)

  ```
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "AllowAll",
              "Effect": "Allow",
              "Action": [
                  "*"
              ],
              "Resource": "*"
          },
          {
              "Sid": "DenyIAMandR53",
              "Effect": "Deny",
              "Action": [
                  "iam:*",
                  "route53:*"
              ],
              "Resource": "*"
          },
          {
              "Sid": "RequireMicroInstanceType",
              "Effect": "Deny",
              "Action": [
                  "ec2:RunInstances",
                  "ec2:StartInstances"
              ],
              "Resource": [
                  "arn:aws:ec2:*:*:instance/*"
              ],
              "Condition": {
                  "StringNotEquals": {
                      "ec2:InstanceType": "t2.nano"
                  }
              }
          },
          {
              "Sid": "BlockRegions",
              "Effect": "Deny",
              "Action": [
                  "*"
              ],
              "Resource": "*",
              "Condition": {
                  "StringNotEquals": {
                      "aws:RequestedRegion": [
                          "us-east-1",
                          "us-east-2"
                      ]
                  }
              }
          },
          {
              "Sid": "RestrictIO1IO2SC1ST1STD",
              "Effect": "Deny",
              "Action": [
                  "ec2:CreateVolume",
                  "ec2:ModifyVolume"
              ],
              "Resource": "*",
              "Condition": {
                  "StringNotEquals": {
                      "ec2:VolumeType": [
                          "gp2",
                          "gp3"
                      ]
                  }
              }
          }
      ]
  }
  ```
- Fill the above code in and click on Create Policy button.
  ![841](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/841.png)

- After creating the policy.
  ![842](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/842.png)

- Now go to AWS accounts and attach this policy to one Account.
- Open the slave1 account and add it
  ![843](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/843.png)

- Under Ploicies > attach
  ![844](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/844.png)

- Select our Policy and click on attach policy.
  ![845](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/845.png)

- After attaching policy.
  ![846](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/846.png)

- Remove the FullAWSAccess policy.
  ![847](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/847.png)

- After removing it looks.
  ![848](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/848.png)

- Now login to slave account and check for service access as per policy
  ![849](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/849.png)

  ![850](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/850.png)

- Now again if you want to restore remove our SCP and add Fullaccess policy.
  ![851](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/851.png)

- This way you can restrict the services in Accounts

# Reverting the IAM Changes:

- first from AD we need to disconnect the Identity center
- Now you can delete the AD
  ![852](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/852.png)
  ![853](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/853.png)
  ![854](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/854.png)
  ![855](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/855.png)
  ![856](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/856.png)
  ![857](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/857.png)


# 23. AWS Elastic File Systems (EFS):

- Also Called as Network File Systems.
- for this we will launch two t2.medium in public subnets with below user data
  ### Userdata
  ```
  #!/bin/bash

  # Updating the OS
  apt update

  # Installing mounting app
  apt install -y nfs-common

  # Installing the default jdk
  apt install default-jdk -y
  
  ```
  ![858](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/858.png)

- EBS is limited to Availability Zone but EFS has no Availability Zone Limitations.
- Come to EFS > Create file system
  ![859](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/859.png)

- Fill in the details like Name and VPC

  ![860](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/860.png)

- Select Regional, disable backup and click on Next.
  ![861](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/861.png)
  ![862](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/862.png)

- Select VPC and Subnets, clcik on Next.
  ![863](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/863.png)

- Now skip and click on Next.
  ![864](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/864.png)

- Review all and click on crceate EFS button.
  ![865](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/865.png)

- After creating file system.
  ![866](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/866.png)

- Now Connect to the two instances
  ![867](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/867.png)

- Now run These commands in both instances
  ```
  mkdir -p /var/lib/jenkins
  ```
  ![869](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/869.png)

- Now copy the DNS Name in EFS which we created.
  ![868](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/868.png)

- Now add the DNS of EFS in ```/etc/fstab```, then even the server reboots it will not unmount.
  ```
  fs-04d0d5a49bda2f948.efs.us-east-1.amazonaws.com:/   	/var/lib/jenkins/   	nfs
  ```
  ![870](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/870.png)

- If you do ``` df -h ``` in both servers still file system is not created.
  ![871](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/871.png)

- do ``` mount -a ``` if will apply the fstab changes.
  ![872](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/872.png)

- If you do ``` df -h ``` in both servers you can see file system is created.
- it looks in the below format.
  ```
  fs-04d0d5a49bda2f948.efs.us-east-1.amazonaws.com:/  8.0E     0  8.0E   0% /var/lib/jenkins
  ```
  ![873](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/873.png)

- Now you type ``` watch ls ``` command under ```/var/lib/jenkins```
- to see the changes that we make in another server
- if you create or delete the files in one location automatically in another location also it will get effect
- as it is the shared location in linux servers.
  ![874](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/874.png)

- I have created few files in 2nd server under ```/var/lib/jenkins```
- But automatically in 1st server also files created.
  ![875](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/875.png)

## Jenkins Installation

- Now we will install the Jenkins in the 1st or second server.
  ```
  sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
  echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
  sudo apt-get update
  sudo apt-get install jenkins -y
  ```
  ![876](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/876.png)

## JenkinsConfiguration

- Now open Jenkins and Configure.
  ```
  http://98.82.19.60:8080
  ```
- Fill in the password and login
  ![877](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/877.png)
  ![878](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/878.png)
  ![879](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/879.png)
  ![880](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/880.png)
  ![881](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/881.png)
  ![882](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/882.png)

## Jenkins Job Creation

- Now Create one job and run it.
  ![883](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/883.png)
  ![884](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/884.png)
  ```
  #!/bin/bash
  for i in {1..10}
  do
  echo $(date)
  done  
  ```
  ![885](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/885.png)
  ![886](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/886.png)
  ![887](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/887.png)

- Now install the jenkins in second server also by same steps
- and login to the jenkins and if you see the test job will be there.
- which means files sharing between two servers happenning
  ![888](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/888.png)

- If you run job for few more times to see changes in second jenkins console you need to restart the jenkins
  ```
  http://98.81.75.40:8080/restart
  ```
  ![889](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/889.png)
  ![890](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/890.png)

- Genarally we use EFS for centralised logs, Database dumps, etc.,

# AWS Backup:

- Now Goto AWS Backup
  ![891](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/891.png)

- AWS Backup > Vault > Create new Vault
  ![892](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/892.png)

- Fill In the Details as shown and click on Create button.
  ![893](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/893.png)

- After vault creation it shows like below.
  ![894](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/894.png)

- Now for the Jenkins-01 and Jenkins-02 instances create tags as shown.
  ![895](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/895.png)
  ![896](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/896.png)

- NOw got to AWS Backup > Protected Resources.
- Click on Create on demand backup button.
  ![897](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/897.png)

- Fill in the deatils as shown below.
- Click on create on demand button backup button.
  ![898](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/898.png)

- After on emand Backup it looks like below.
  ![899](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/899.png)

- Backup job Completed under AWS BAckup > jobs > BAckup jobs
  ![900](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/900.png)
  ![901](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/901.png)

- NOw create backu plan
  ![902](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/902.png)
  ![903](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/903.png)
  ![904](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/904.png)
  ![905](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/905.png)
  ![906](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/906.png)

- Now if you want you restore under AWS BAckup > Protected Resources as shown.
  ![907](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/907.png)
  ![908](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/908.png)
  ![909](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/909.png)
  ![910](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/910.png)
  ![911](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/911.png)


# 24. AWS Simple Storage Service (S3):

- Object storage.
- Bucket name should be unique.
- High availability and high Durability(99.999999)

## S3 Bucket Creation:

- Clcik on create bucket
  ![912](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/912.png)

- Fill in the details and click on Create bucket button.
  ![913](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/913.png)
  ![914](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/914.png)
  ![915](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/915.png)

- After bucket creation.
  ![916](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/916.png)

## S3 Data Upload:

- Click on Upload button
  ![917](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/917.png)

- Fill in the details and click on upload button.
  ![918](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/918.png)

- Select Standard storage class as it is best one in performance.
  ![919](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/919.png)
  ![920](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/920.png)

- Afte the upload it looks.
  ![921](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/921.png)

- For S3 objects or files will have unique url so bucket name is unique.
  ![922](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/922.png)

### index.html

  ```
  <!-- Sample Html code for displaying S3 bucket images -->
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>madireddyanil.in</title>
  </head>
  <body>
      <h1>Madireddyanil.in Images</h1>
      <img src="https://s3.amazonaws.com/madireddyanil.in/910.png" alt="910"><br>
      <img src="https://s3.amazonaws.com/madireddyanil.in/911.png" alt="911"><br>
      <img src="https://s3.amazonaws.com/madireddyanil.in/912.png" alt="912"><br>
  </body>
  </html>
  ```

- Using the above code create one html file.
- If you open it in browser images will not be accessed.
  ![923](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/923.png)

- Through Direct URL also cant be accessed
  ```
  https://s3.amazonaws.com/madireddyanil.in/912.png
  ```
  ![924](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/924.png)

- You need to grant public access to the objects in S3 bucket.
- Goto BUcket > Permissions > Bucket policy > Paste the code below.
  ### S3 BUcket policy for Public access.
  ```
  {
      "Version": "2012-10-17",
      "Id": "Policy1684293895713",
      "Statement": [
          {
              "Sid": "Stmt1684293894915",
              "Effect": "Allow",
              "Principal": "*",
              "Action": "s3:GetObject",
              "Resource": "arn:aws:s3:::madireddyanil.in/*"
          }
      ]
  }
  ```
  ![925](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/925.png)

- Copy the BUcket ARN Name.
  ![926](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/926.png)

- Include that in S3 BUcket policy for Public access code and paste the code and save changes
  ![927](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/927.png)
  ![928](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/928.png)

- Now you will be able to access the images in public in browser.
  ![929](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/929.png)

### Monuting s3 in Instance:

- Now if you want to connect s3 to the instance
- Launch Amazon Linux instance
- Configure AWS CLI in it and access the S3
  ![930](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/930.png)

- Now we will try to mount the s3 into this Instance by 3rd party tools.
- Use below link for dcoumentation
  ```
  https://docs.aws.amazon.com/AmazonS3/latest/userguide/mountpoint-installation.html
  ```
- Now code is to install monut for s3
  ```
  wget https://s3.amazonaws.com/mountpoint-s3-release/latest/x86_64/mount-s3.rpm
  sudo yum install ./mount-s3.rpm
  mount-s3 --version
  ```
  ![931](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/931.png)
  ![932](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/932.png)

- Now make dir for s3 and mount it using below command
  ```
  mkdir /madireddyanil.in
  mount-s3 madireddyanil.in /maddireddyanil.in
  ```
  ![933](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/933.png)

- Listing s3 in server
  ![934](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/934.png)

- Created some file in server location.
  ![935](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/935.png)
  ```
  touch /madireddyanil.in/s3-dummy{1..10}
  ```

- Now it will reflect in S3 in browser.
  ![936](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/936.png)

- If you want to sync two buckets use bucket command
  ```
  aws s3 sync s3://SOURCE-BUCKETNAME s3://DESTINATION-BUCKETNAME
  ```

## Bucket Properties

- Bucket versioning enabling
  ![937](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/937.png)

- Enabling Static Website hosting.
  ![938](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/938.png)

- Uploading the website into the S3
  ![939](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/500-939/939.png)
  ![940](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/940.png)

- Copy the static url.
  ```
  http://madireddyanil.in.s3-website-us-east-1.amazonaws.com
  ```
  ![941](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/941.png)
  ![942](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/942.png)

- Browse it to get the app.
  ![943](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/943.png)

- Before doing it you need to create the another bucket with name ```www.madireddyanil.in```
- now upload the app in ```www.madireddyanil.in``` s3 bucket and start the Distribution process.
- But i used the ```madireddyanil.in``` bucket instaed of it we should use the ```www.madireddyanil.in``` bucket
- Here infront of S3 bucket you cannot keep load balancer so we user cloud front.
- Click on Create a CloudFront distribution button
  ![944](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/944.png)

- Select Domain, Name, Origin access is origin access control settings and click on Create new OAC button.
  ![945](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/945.png)
  ![946](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/946.png)

- Select Https under viewer protocol policy.
  ![947](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/947.png)

- Disable WAF, Select the certificate if no cert create one and validate.
- and also write the alternate domains as ```www.madireddyanil.in``` and ```cdn.madireddyanil.in```
  ![948](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/948.png)

- Default root to index.html and clcik on Create Distribution button.
  ![949](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/949.png)

- Now copy the policy
  ![950](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/950.png)

- Delete old policy
  ![951](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/951.png)

- Update the copied policy in S3 and save changes
  ![952](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/952.png)

- Now copy the Domain Name of Distribution.
  ![953](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/953.png)

- Browse it in browser to test the application from Content delivery network
  ![954](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/954.png)

- Create a record in the Route53 with ```www.madireddyanil.in``` and ```cdn.madireddyanil.in```
  ![955](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/955.png)
  ![956](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/956.png)

- Now browse with ```www.madireddyanil.in``` and test the app
  ![957](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/957.png)

- Now Browse with ```cdn.madireddyanil.in``` and test the app
  ![958](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/958.png)

- Now we will redirect the madireddyanil.in bucket to the ```www.madireddyanil.in bucket.```
- Click on madireddyanil.in bucket no need to put any data in this bucket you can delete it anyway.
  ![959](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/959.png)

- Give the redirection to ```www.madireddyanil.in``` bucket.
  ![960](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/960.png)

- Now create the record for naked domain.
  ![961](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/961.png)

- Now browse with ```madireddyanil.in``` it should be redirected to the ```www.madireddyanil.in``` bucket and cdn
  distribution.
  ![962](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/962.png)

- To get the error page
  ![963](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/963.png)
  ![964](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/964.png)
  ![965](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/965.png)
  ![966](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/966.png)

- Once you get error you will this page.
  ![967](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/967.png)


# Replication

## Configuring the Replication:

- create a madireddyanil-replication bucket and use this for replication
  ![968](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/968.png)
  ![969](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/969.png)
  ![970](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/970.png)

- create a madireddyanil bucket and use this for Source
  ![971](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/971.png)
  ![972](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/972.png)
  ![973](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/973.png)

- After creating two buckets
  ![974](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/974.png)

- Now in madireddyanil bucket under management
  ![975](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/975.png)

- Clcik on Replication rule button to create replication rule
  ![976](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/976.png)

- Fill in the details.

  ![977](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/977.png)
  ![978](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/978.png)
  ![979](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/979.png)
  ![980](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/980.png)
  ![981](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/981.png)
  ![982](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/982.png)
  ![983](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/983.png)
- Make sure the IAM roles which you select for replications should have below given in Roles > Trusted relationships
- make sure you add under services s3 and ec2 one correctly.
  ```
  {
  	"Version": "2012-10-17",
  	"Statement": [
  		{
  			"Effect": "Allow",
  			"Principal": {
  				"Service": [
  				    "s3.amazonaws.com",
  				    "ec2.amazonaws.com",
  				    "backup.amazonaws.com"
  				]
  			},
  			"Action": "sts:AssumeRole"
  		}
  	]
  }
  ```
- Now once you copy files into madireddyanil bucket
  ![984](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/984.png)

- Replication will happen after some time as below.
  ![985](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/985.png)

# Bucket POlicies

- Now our goal is to access the files over the internet but except knoe users others should not access it.
- so for that modify bucket policy to below code.
  ```
  {
      "Version": "2012-10-17",
      "Id": "S3PolicyId1",
      "Statement": [
          {
              "Sid": "IPAllow",
              "Effect": "Allow",
              "Principal": "*",
              "Action": "s3:*",
              "Resource": [
                  "arn:aws:s3:::arn:aws:s3:::madireddyanil",
                  "arn:aws:s3:::arn:aws:s3:::madireddyanil/*"
              ],
              "Condition": {
                  "IpAddress": {
                      "aws:SourceIp": "152.58.194.185/32"
                  }
              }
          }
      ]
  }
  ```
  ![986](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/986.png)
  ![987](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/987.png)

- Now when you on your VPN it will not access it as IP Changed
  ![988](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/988.png)

- After VPN off Our IP will restore so it give access for our IP.
  ![989](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/989.png)

- To copy the files from another account instance to the another account s3
- assign a role to the instance, add that role in the s3 bucket policy like below.
  ```
  {
      "Version": "2012-10-17",
      "Id": "S3PolicyId1",
      "Statement": [
          {
              "Sid": "IPAllow",
              "Effect": "Allow",
              "Principal": "*",
              "Action": "s3:*",
              "Resource": [
                  "arn:aws:s3:::madireddyanil",
                  "arn:aws:s3:::madireddyanil/*"
              ],
              "Condition": {
                  "IpAddress": {
                      "aws:SourceIp": [
                          "152.58.194.185/32",
                          "34.200.252.49/32"
                      ]
                  }
              }
          },
          {
              "Effect": "Allow",
              "Principal": {
                  "AWS": "arn:aws:iam::232789740929:role/testrole"
              },
              "Action": "s3:*",
              "Resource": "arn:aws:s3:::madireddyanil/*"
          }
      ]
  }
  ```

- Update bucket policy with the above code and try copying the files to s3 bucket.
  ![990](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/990.png)
  ![991](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/991.png)
  ![992](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/992.png)

  ### Command to display only file names
  ```
  ls -lrt | grep -v drwx | awk -F " " '{print $9}'
  ```
  ### Command to copy files into bucket.
  ```
  for file in $(ls -lrt | grep -v drwx | awk -F " " '{print $9}'); do
  > aws s3 cp $file s3://bucketname
  > done
  ```

  ### Process of deleting the s3 files
  ```
  mkdir hello
  cd hello
  aws s3 sync . s3://madireddyanil/ --delete
  ```

## Lifecycle Rules:



# 25. Databases:

## Structured Data:

- AWS RDS - MySQL, MSSQL, Oracle, Postgres, MariaDB, Arora

## Unstructured Data:

- AWS Dynamo DB, DocumentDB, Cassandra

## In-Memory Databases:

- ElastiCache

# 25.1 AWS RDS:

- Before Creating Database we need to create the ```Subnetgroup```
- Come to Amazon RDS > Subnetgroup > Create DB Subnet group
  ![994](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/994.png)

- Fill in the details.

  ![995](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/995.png)
  ![996](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/996.png)
  ![997](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/997.png)

- RDS > Database > Create database
  ![998](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/998.png)
  ![999](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/999.png)
  ![1000](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1000.png)
  ![1001](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1001.png)
  ![1002](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1002.png)
  ![1003](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1003.png)
  ![1004](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1004.png)
  ![1005](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1005.png)
  ![1006](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1006.png)
  ![1007](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1007.png)
  ![1008](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1008.png)
  ![1008-01](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1008-1.png)

- Diagram Demonstrating the Database Architecture
  ![1009](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1009.png)

- Now we need to connect to the database.
- There are two ways in connecting.
    -
        1. Admin Connecting to DB (Needs MySQL WorkBench)
    -
        2. App Connecting to DB.
- So we need to download the workbench app and should install it.
    - Install Latest Microsoft Visual C++ Redistributable Version with below link.
      ```
      https://aka.ms/vs/17/release/vc_redist.x64.exe
      ```
    - Install Workbench app with below link.
      ```
      https://dev.mysql.com/downloads/workbench/
      ```

- After installing it looks like this when you open the workbench app.
  ![1010](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1010.png)

## Connecting RDS in WorkBench

- Copy the Database Endpoint.    
  ![1012](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1012.png)
  ```
  demoapp-database-1.cxia00csqptb.us-east-1.rds.amazonaws.com
  ```
- Click on Plus button
  ![1013](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1013.png)

- Fill in the details, Name, Hostname(RDS Endpoint) and click on test connection.
  ![1014](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1014.png)

- Enter the password and clcik on ok.
  ![1015](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1015.png)

- You will get the successful message.
  ![1016](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1016.png)

- Click ok to finish and add the RDS in the work bench.
  ![1017](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1017.png)

- RDS Added successfully. oprn it.
  ![1018](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1018.png)
  ![1019](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1019.png)

- It looks this way.
  ![1020](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1020.png)

- Under schemas in home page click on Add button.
  ![1021](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1021.png)

  ### Data From line 1 to 247
  ```
  CREATE DATABASE  IF NOT EXISTS `myflixdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
  USE `myflixdb`;
  -- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
  --
  -- Host: localhost    Database: myflixdb
  -- ------------------------------------------------------
  -- Server version	5.5.25a
  
  /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
  /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
  /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
  /*!40101 SET NAMES utf8 */;
  /*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
  /*!40103 SET TIME_ZONE='+00:00' */;
  /*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
  /*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
  /*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
  /*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
  
  --
  -- Table structure for table `movies`
  --
  
  DROP TABLE IF EXISTS `movies`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `movies` (
    `movie_id` int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(300) DEFAULT NULL,
    `director` varchar(150) DEFAULT NULL,
    `year_released` year(4) DEFAULT NULL,
    `category_id` int(11) DEFAULT NULL,
    PRIMARY KEY (`movie_id`),
    KEY `fk_Movies_Categories1` (`category_id`),
    KEY `title_index` (`title`),
    KEY `qw` (`title`),
    CONSTRAINT `fk_Movies_Categories1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
  /*!40101 SET character_set_client = @saved_cs_client */;
  
  --
  -- Dumping data for table `movies`
  --
  
  LOCK TABLES `movies` WRITE;
  /*!40000 ALTER TABLE `movies` DISABLE KEYS */;
  INSERT INTO `movies` VALUES (1,'Pirates of the Caribean 4',' Rob Marshall',2011,1),(2,'Forgetting Sarah Marshal','Nicholas Stoller',2008,2),(3,'X-Men',NULL,2008,NULL),(4,'Code Name Black','Edgar Jimz',2010,NULL),(5,'Daddy\'s Little Girls',NULL,2007,8),(6,'Angels and Demons',NULL,2007,6),(7,'Davinci Code',NULL,2007,6),(9,'Honey mooners','John Schultz',2005,8),(16,'67% Guilty',NULL,2012,NULL);
  /*!40000 ALTER TABLE `movies` ENABLE KEYS */;
  UNLOCK TABLES;
  
  --
  -- Table structure for table `payments`
  --
  
  DROP TABLE IF EXISTS `payments`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `payments` (
    `payment_id` int(11) NOT NULL AUTO_INCREMENT,
    `membership_number` int(11) DEFAULT NULL,
    `payment_date` date DEFAULT NULL,
    `description` varchar(75) DEFAULT NULL,
    `amount_paid` float DEFAULT NULL,
    `external_reference_number` int(11) DEFAULT NULL,
    PRIMARY KEY (`payment_id`),
    KEY `fk_Payments_Members1` (`membership_number`),
    CONSTRAINT `fk_Payments_Members1` FOREIGN KEY (`membership_number`) REFERENCES `members` (`membership_number`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
  /*!40101 SET character_set_client = @saved_cs_client */;
  
  --
  -- Dumping data for table `payments`
  --
  
  LOCK TABLES `payments` WRITE;
  /*!40000 ALTER TABLE `payments` DISABLE KEYS */;
  INSERT INTO `payments` VALUES (1,1,'2012-07-23','Movie rental payment',2500,11),(2,1,'2012-07-25','Movie rental payment',2000,12),(3,3,'2012-07-30','Movie rental payment',6000,NULL);
  /*!40000 ALTER TABLE `payments` ENABLE KEYS */;
  UNLOCK TABLES;
  
  --
  -- Table structure for table `members`
  --
  
  DROP TABLE IF EXISTS `members`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `members` (
    `membership_number` int(11) NOT NULL AUTO_INCREMENT,
    `full_names` varchar(350) NOT NULL,
    `gender` varchar(6) DEFAULT NULL,
    `date_of_birth` date DEFAULT NULL,
    `physical_address` varchar(255) DEFAULT NULL,
    `postal_address` varchar(255) DEFAULT NULL,
    `contact_number` varchar(75) DEFAULT NULL,
    `email` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`membership_number`)
  ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
  /*!40101 SET character_set_client = @saved_cs_client */;
  
  --
  -- Dumping data for table `members`
  --
  
  LOCK TABLES `members` WRITE;
  /*!40000 ALTER TABLE `members` DISABLE KEYS */;
  INSERT INTO `members` VALUES (1,'Janet Jones','Female','1980-07-21','First Street Plot No 4','Private Bag','0759 253 542','janetjones@yagoo.cm'),(2,'Janet Smith Jones','Female','1980-06-23','Melrose 123',NULL,NULL,'jj@fstreet.com'),(3,'Robert Phil','Male','1989-07-12','3rd Street 34',NULL,'12345','rm@tstreet.com'),(4,'Gloria Williams','Female','1984-02-14','2nd Street 23',NULL,NULL,NULL);
  /*!40000 ALTER TABLE `members` ENABLE KEYS */;
  UNLOCK TABLES;
  
  --
  -- Temporary table structure for view `accounts_v_members`
  --
  
  DROP TABLE IF EXISTS `accounts_v_members`;
  /*!50001 DROP VIEW IF EXISTS `accounts_v_members`*/;
  SET @saved_cs_client     = @@character_set_client;
  SET character_set_client = utf8;
  /*!50001 CREATE TABLE `accounts_v_members` (
    `membership_number` int(11),
    `full_names` varchar(350),
    `gender` varchar(6)
  ) ENGINE=MyISAM */;
  SET character_set_client = @saved_cs_client;
  
  --
  -- Temporary table structure for view `general_v_movie_rentals`
  --
  
  DROP TABLE IF EXISTS `general_v_movie_rentals`;
  /*!50001 DROP VIEW IF EXISTS `general_v_movie_rentals`*/;
  SET @saved_cs_client     = @@character_set_client;
  SET character_set_client = utf8;
  /*!50001 CREATE TABLE `general_v_movie_rentals` (
    `membership_number` int(11),
    `full_names` varchar(350),
    `title` varchar(300),
    `transaction_date` date,
    `return_date` date
  ) ENGINE=MyISAM */;
  SET character_set_client = @saved_cs_client;
  
  --
  -- Table structure for table `categories`
  --
  
  DROP TABLE IF EXISTS `categories`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `categories` (
    `category_id` int(11) NOT NULL AUTO_INCREMENT,
    `category_name` varchar(150) DEFAULT NULL,
    `remarks` varchar(500) DEFAULT NULL,
    PRIMARY KEY (`category_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
  /*!40101 SET character_set_client = @saved_cs_client */;
  
  --
  -- Dumping data for table `categories`
  --
  
  LOCK TABLES `categories` WRITE;
  /*!40000 ALTER TABLE `categories` DISABLE KEYS */;
  INSERT INTO `categories` VALUES (1,'Comedy','Movies with humour'),(2,'Romantic','Love stories'),(3,'Epic','Story acient movies'),(4,'Horror',NULL),(5,'Science Fiction',NULL),(6,'Thriller',NULL),(7,'Action',NULL),(8,'Romantic Comedy',NULL);
  /*!40000 ALTER TABLE `categories` ENABLE KEYS */;
  UNLOCK TABLES;
  
  --
  -- Table structure for table `movierentals`
  --
  
  DROP TABLE IF EXISTS `movierentals`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `movierentals` (
    `reference_number` int(11) NOT NULL AUTO_INCREMENT,
    `transaction_date` date DEFAULT NULL,
    `return_date` date DEFAULT NULL,
    `membership_number` int(11) DEFAULT NULL,
    `movie_id` int(11) DEFAULT NULL,
    `movie_returned` bit(1) DEFAULT b'0',
    PRIMARY KEY (`reference_number`),
    KEY `fk_MovieRentals_Members1` (`membership_number`),
    KEY `fk_MovieRentals_Movies1` (`movie_id`),
    CONSTRAINT `fk_MovieRentals_Members1` FOREIGN KEY (`membership_number`) REFERENCES `members` (`membership_number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_MovieRentals_Movies1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
  /*!40101 SET character_set_client = @saved_cs_client */;
  
  --
  -- Dumping data for table `movierentals`
  --
  
  LOCK TABLES `movierentals` WRITE;
  /*!40000 ALTER TABLE `movierentals` DISABLE KEYS */;
  INSERT INTO `movierentals` VALUES (11,'2012-06-20',NULL,1,1,'\0'),(12,'2012-06-22','2012-06-25',1,2,'\0'),(13,'2012-06-22','2012-06-25',3,2,'\0'),(14,'2012-06-21','2012-06-24',2,2,'\0'),(15,'2012-06-23',NULL,3,3,'\0');
  /*!40000 ALTER TABLE `movierentals` ENABLE KEYS */;
  UNLOCK TABLES;
  
  --
  -- Final view structure for view `accounts_v_members`
  --
  
  /*!50001 DROP TABLE IF EXISTS `accounts_v_members`*/;
  /*!50001 DROP VIEW IF EXISTS `accounts_v_members`*/;
  /*!50001 SET @saved_cs_client          = @@character_set_client */;
  /*!50001 SET @saved_cs_results         = @@character_set_results */;
  /*!50001 SET @saved_col_connection     = @@collation_connection */;
  /*!50001 SET character_set_client      = utf8 */;
  /*!50001 SET character_set_results     = utf8 */;
  /*!50001 SET collation_connection      = utf8_general_ci */;
  /*!50001 CREATE ALGORITHM=UNDEFINED */
  /*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
  /*!50001 VIEW `accounts_v_members` AS select `members`.`membership_number` AS `membership_number`,`members`.`full_names` AS `full_names`,`members`.`gender` AS `gender` from `members` */;
  /*!50001 SET character_set_client      = @saved_cs_client */;
  /*!50001 SET character_set_results     = @saved_cs_results */;
  /*!50001 SET collation_connection      = @saved_col_connection */;
  
  --
  -- Final view structure for view `general_v_movie_rentals`
  --
  
  /*!50001 DROP TABLE IF EXISTS `general_v_movie_rentals`*/;
  /*!50001 DROP VIEW IF EXISTS `general_v_movie_rentals`*/;
  /*!50001 SET @saved_cs_client          = @@character_set_client */;
  /*!50001 SET @saved_cs_results         = @@character_set_results */;
  /*!50001 SET @saved_col_connection     = @@collation_connection */;
  /*!50001 SET character_set_client      = utf8 */;
  /*!50001 SET character_set_results     = utf8 */;
  /*!50001 SET collation_connection      = utf8_general_ci */;
  /*!50001 CREATE ALGORITHM=UNDEFINED */
  /*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
  /*!50001 VIEW `general_v_movie_rentals` AS select `mb`.`membership_number` AS `membership_number`,`mb`.`full_names` AS `full_names`,`mo`.`title` AS `title`,`mr`.`transaction_date` AS `transaction_date`,`mr`.`return_date` AS `return_date` from ((`movierentals` `mr` join `members` `mb` on((`mr`.`membership_number` = `mb`.`membership_number`))) join `movies` `mo` on((`mr`.`movie_id` = `mo`.`movie_id`))) */;
  /*!50001 SET character_set_client      = @saved_cs_client */;
  /*!50001 SET character_set_results     = @saved_cs_results */;
  /*!50001 SET collation_connection      = @saved_col_connection */;
  /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
  
  /*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
  /*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
  /*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
  /*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
  
  -- Dump completed on 2012-08-07 18:37:36
  ```
- Now clcik on Execute button.
  ![1022](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1022.png)


- Now we can connect through Linux Servers, for that we will launch the Ubuntu server
  ![1011](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1011.png)

  ```
  apt install python3 -y
  apt install python3-pip -y
  ```
- After installing the ```python``` and ```python3-pip``` check the versions.
  ```
  python3 -V
  pip --version
  ```
  ```
  root@ip-10-1-1-91:~# python3 -V
  Python 3.12.3
  root@ip-10-1-1-91:~# pip --version
  pip 24.0 from /usr/lib/python3/dist-packages/pip (python 3.12)
  ```

- Now INstall the following.
  ```
  apt install python3-fastapi -y
  apt install python3-uvicorn -y
  apt install python3-pymysql -y
  apt install python3-sqlalchemy -y
  ```
- Now we write a code in python.
  ### demo.py
  ```
  import sqlalchemy as sal
  import pymysql
  from fastapi import FastAPI
  import uvicorn
  
  app = FastAPI()
  
  @app.get("/")
  def home():
      return "WELCOME MESSAGE"
  ```

  ### Running demo.py
  ```
  uvicorn demo:app --port 8080 --host 0.0.0.0 --reload
  ```

  ### OutPut:
  ```
  root@ip-10-1-1-91:~# uvicorn demo:app --port 8080 --host 0.0.0.0 --reload
  INFO:     Will watch for changes in these directories: ['/root']
  INFO:     Uvicorn running on http://0.0.0.0:8080 (Press CTRL+C to quit)
  INFO:     Started reloader process [18308] using StatReload
  INFO:     Started server process [18310]
  INFO:     Waiting for application startup.
  INFO:     Application startup complete.
  ```
  ![1023](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1023.png)

- Now browse with below url
  ```
  http://34.207.96.253:8080
  ```
  ![1024](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1024.png)

- After ping once in browser
  ![1025](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1025.png)

- Now
  ### demo.py
  ```
  import sqlalchemy as sal
  import pymysql
  from fastapi import FastAPI
  import uvicorn
  
  app = FastAPI()
  
  @app.get("/")
  def home():
      return "WELCOME MESSAGE"
  
  @app.get("/movies")
  def movies():
      db = pymysql.connect(host="demoapp-database-1.cxia00csqptb.us-east-1.rds.amazonaws.com", user = "admin", passwor                                                                                               d="MyAWSPwd1201")
      cursor = db.cursor()
      cursor.execute("select version()")
      data = cursor.fetchone()
      sql = '''use myflixdb'''
      cursor.execute(sql)
      sql = '''select * from movies'''
      cursor.execute(sql)
      data = cursor.fetchall()
      all_movies = [item for item in data]
      return all_movies
  ```
- here in the above code change the RDS endpoint name and ID, Password.
  ### Running demo.py
  ```
  uvicorn demo:app --port 8080 --host 0.0.0.0 --reload
  ```
- Now browse in Browser
  ```
  http://34.207.96.253:8080
  http://34.207.96.253:8080/docs
  ```
  ![1026](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1026.png)

- Now we will do failover of RDS.
  ![1027](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1027.png)
  ![1028](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1028.png)
  ### app.py
  ```
  import sqlalchemy as sal
  import pymysql
  db = pymysql.connect(host="awsb45-database-instance.c7khegicx1do.us-east-1.rds.amazonaws.com", user = "admin", password="India123456")
  cursor = db.cursor()
  cursor.execute("select version()")
  data = cursor.fetchone()
  sql = '''use myflixdb'''
  cursor.execute(sql)
  sql = '''select * from movies'''
  cursor.execute(sql)
  data = cursor.fetchall()
  for item in data:
    print(item)
  ```
  ```
  watch python3 app.py
  ```
  ![1029](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1029.png)

  ```
  nslookup demoapp-database-1.cxia00csqptb.us-east-1.rds.amazonaws.com
  ```
  ![1030](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1030.png)
  ![1031](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1031.png)



# 25.2 AWS DynamoDB:

- DynamoDB Home
  ![1032](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1032.png)

- DynamoDB > Tables > Create table
  ![1033](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1033.png)

- Fill in the details as below.
  ![1034](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1034.png)
  ![1035](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1035.png)

- After table creation.
  ![1036](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1036.png)

- AWS Lambda creation.
  ![1037](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1037.png)

- Lambda > Functions > Create function
  ![1038](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1038.png)
  ![1039](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1039.png)
  ![1040](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1040.png)

- Now We have created one table and one lambda function so to make access between services we have to create one role.
- Now under Lambda function > configuration > Permissions
  ![1041](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1041.png)

- There will be one role created, for that role we give Dynamo DB permissions as lambda-function access the DynamoDB
- So click on the role and open it.
  ![1042](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1042.png)

- Goto attach policies and add the DynamoDB full access.
  ![1043](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1043.png)
  ![1044](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1044.png)
  ![1045](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1045.png)

- Now we will test the role. Lambda functio > Test
- create new event and save then test.
  ![1046](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1046.png)

- Use the below to test the access.
  ### Test Code:
  ```
  {
    "operation": "create",
    "payload":{
    	"TableName":"bookstore",
    	"Item":{
        	"Id":10,
        	"author":"Robert K",
        	"bookname":"Rich Dad & Poor Dad",
        	"Location":"USA",
        	"State":"Hawaii",
     	   "Hobbies": {
     	 	"Act1": "Swimming",
     		 "Act2": "Cycling",
     		 "Act3": "Writing"
     	   }
     	   
    	}
    }
  }
  ```
  ![1047](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1047.png)

- After saving click on test button, if it returns code 200, its success.
  ![1048](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1048.png)

- Now in the above same code change the id to 20 and then save it and test it again.
  ### Test Code:
  ```
  {
    "operation": "create",
    "payload":{
    	"TableName":"bookstore",
    	"Item":{
        	"Id":20,
        	"author":"Robert K",
        	"bookname":"Rich Dad & Poor Dad",
        	"Location":"USA",
        	"State":"Hawaii",
     	   "Hobbies": {
     	 	"Act1": "Swimming",
     		 "Act2": "Cycling",
     		 "Act3": "Writing"
     	   }
     	   
    	}
    }
  }
  ```
  ![1049](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1049.png)

- Now in the above same code change the id to 30 and then save it and test it again.
  ### Test Code:
  ```
  {
    "operation": "create",
    "payload":{
    	"TableName":"bookstore",
    	"Item":{
        	"Id":30,
        	"author":"Robert K",
        	"bookname":"Rich Dad & Poor Dad",
        	"Location":"USA",
        	"State":"Hawaii",
     	   "Hobbies": {
     	 	"Act1": "Swimming",
     		 "Act2": "Cycling",
     		 "Act3": "Writing"
     	   }
     	   
    	}
    }
  }
  ```
  ![1050](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1050.png)

- Now if you see in the Dynamodb (```Bookstore```) > Explore items you can see some entries which we pushed from lambda.
  ![1051](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1051.png)
  ![1052](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1052.png)

- So as Testing completed we will delete the all entries in bookstore.
  ![1053](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1053.png)
  ![1054](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1054.png)

- Now we need to Expose the above setup to the outside world we setup the API Gateway. as shown in the below diagram.
  ![1055](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1055.png)

- Now We will create the API Gateway.
  ![1056](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1056.png)

- Click on REST API as we are using it for lambda function
  ![1057](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1057.png)

- Fill in the details and create API
  ![1058](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1058.png)
  ![1059](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1059.png)

- Click on create resources and create multiple resources if required as below.
- we create 3 resources ```orders, payments and books```
  ![1060](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1060.png)
  ![1061](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1061.png)
  ![1062](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1062.png)
  ![1063](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1063.png)
  ![1064](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1064.png)
  ![1065](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1065.png)
  ![1066](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1066.png)
  ![1067](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1067.png)
  ![1068](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1068.png)

- Now under the resource we can create the methods.
- Now we will create the methods ```PUT, POST and DELETE``` to ```books``` resource.
  ![1069](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1069.png)
  ![1070](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1070.png)
  ![1071](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1071.png)
  ![1072](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1072.png)
  ![1073](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1073.png)
  ![1074](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1074.png)
  ![1071](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1071.png)
  ![1075](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1075.png)
  ![1076](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1076.png)
  ![1077](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1077.png)
  ![1071](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1071.png)
  ![1078](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1078.png)

- Now we will test all 3 methods(```PUT, POST and DELETE```) in ```books``` resource

### Testing PUT 1:

- Under PUT > Test >Request body , paste the below code and click on Test button.

```
{
  "operation": "create",
  "payload":{
    "TableName":"bookstore",
    "Item":{
        "Id":10,
        "author":"Robert K",
        "bookname":"Rich Dad & Poor Dad",
        "Location":"USA",
        "State":"Hawaii",
       "Hobbies": {
      "Act1": "Swimming",
       "Act2": "Cycling",
       "Act3": "Writing"
       }
       
    }
  }
}
```

![1079](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1079.png)

- Statis code 200 is success.
  ![1080](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1080.png)

### Testing PUT 2:

- Under PUT > Test >Request body , paste the below code and click on Test button.
  ```
  {
    "operation": "create",
    "payload":{
      "TableName":"bookstore",
      "Item":{
          "Id":20,
          "author":"Robert K",
          "bookname":"Rich Dad & Poor Dad",
          "Location":"USA",
          "State":"Hawaii"	   
      }
    }
  }
  ```
  ![1081](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1081.png)

- Statis code 200 is success.
  ![1082](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1082.png)

### Testing PUT 3:

- Under PUT > Test >Request body , paste the below code and click on Test button.
  ```
  {
    "operation": "create",
    "payload":{
      "TableName":"bookstore",
      "Item":{
          "Id":30,
          "author":"Robert K",
          "bookname":"Rich Dad & Poor Dad",
          "Location":"USA"   
      }
    }
  }
  ```
  ![1083](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1083.png)

- Statis code 200 is success.
  ![1084](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1084.png)

### Testing PUT 4:

- Under PUT > Test >Request body , paste the below code and click on Test button.
  ```
  {
    "operation": "create",
    "payload":{
      "TableName":"bookstore",
      "Item":{
          "Id":40,
          "author":"Robert K",
          "bookname":"Rich Dad & Poor Dad"
          "Location":"USA"   
      }
    }
  }
  ```
- Statis code 200 is success.
  ![1085](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1085.png)

### Testing PUT 5:

- Under PUT > Test >Request body , paste the below code and click on Test button.
  ```
  {
    "operation": "create",
    "payload":{
      "TableName":"bookstore",
      "Item":{
          "Id":50,
          "author":"Robert K"   
      }
    }
  }
  ```
- Statis code 200 is success.
  ![1086](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1086.png)

- Now if you check the DynamoDB > Explore items > bookstore, our Test Methos PUT data is written.
  ![1087](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1087.png)

- Now we will test the POST Method.
  ### Testing POST 1:
  ```
  {
    "operation": "read",
    "payload":{
      "TableName":"bookstore",
      "Key":{
          "Id":10
      }
    }
  }
  ```
  ![1088](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1088.png)

  ### Testing POST 2:
  ```
  {
    "operation": "read",
    "payload":{
      "TableName":"bookstore",
      "Key":{
          "Id":20
      }
    }
  }
  ```
  ![1089](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1089.png)

- Now we will test the DELETE Method.
  ### Testing DELETE 1:
  ```
  {
    "operation": "delete",
    "payload":{
      "TableName":"bookstore",
      "Key":{
          "Id":10
      }
    }
  }
  ```
  ![1090](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1090.png)

  ### Testing DELETE 2:
  ```
  {
    "operation": "delete",
    "payload":{
      "TableName":"bookstore",
      "Key":{
          "Id":20
      }
    }
  }
  ```
  ![1091](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1091.png)

- Similarly repeat till id 50

- After deleting ids now it empty
  ![1092](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1092.png)

- Now All methods testing is fully successfull, so we will deploy the API
  ![1093](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1093.png)
  ![1094](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1094.png)

- Now Once the stage Dev is created we will test the url shown below.
  ![1095](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1095.png)

- If any issue you can enable cors in the API
  ![1096](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1096.png)

- For testing API we use the Postman tool, copy the url from API > APIs > OurAPI > Stage
  ![1097](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1097.png)

- Paste in the Postman app.
  ![1098](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1098.png)

  ### Testing PUT method:
  ```
  {
    "operation": "create",
    "payload":{
      "TableName":"bookstore",
      "Item":{
          "Id":10,
          "author":"Robert K",
          "bookname":"Rich Dad & Poor Dad",
          "Location":"USA",
          "State":"Hawaii",
         "Hobbies": {
        "Act1": "Swimming",
         "Act2": "Cycling",
         "Act3": "Writing"
         }
         
      }
    }
  }
  ```
  ![1099](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1099.png)
  ![1100](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1100.png)
  ![1101](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1101.png)

- Now if you check the explore items in DB
  ![1102](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1102.png)

  ### Testing POST method:
  ```
  {
    "operation": "read",
    "payload":{
      "TableName":"bookstore",
      "Key":{
          "Id":30
      }
    }
  }
  ```
  ![1103](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1103.png)
  ![1104](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1104.png)
  ![1105](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1105.png)

  ### Testing DELETE method:
  ```
  {
    "operation": "delete",
    "payload":{
      "TableName":"bookstore",
      "Key":{
          "Id":30
      }
    }
  }
  ```
- delete all entries one by on as we deleted earlier.    
  ![1106](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1106.png)


# 25.3 Amazon DocumentDB or MangoDB

- it is like RDS DB only but few changes. Documetn based NoSQL Solution.

## Amazon DocumentDB Creation:

- Click on Create button
  ![1107](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1107.png)
- Before that you should have created Subnet group for DB
  ![1107-01](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1107.png)

- Fill in the details.
- No of instances should be 3 we have selected onlt 1
  ![1108](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1108.png)
  ![1109](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1109.png)
  ![1110](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1110.png)
  ![1111](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1111.png)
  ![1112](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1112.png)
  ![1113](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1113.png)
  ![1114](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1114.png)

# AWS ElasticCache

- InMemory NoSQL Solution

## Amazon ElasticCache Creation:

- Subnet group creation for Elastic cache.
  ![1115](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1115.png)
  ![1116](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1116.png)
  ![1117](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1117.png)
  ![1118](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1118.png)
  ![1119](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1119.png)
  ![1120](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1120.png)

- Now elasticCache creation, go to create cluster > Create Redis OSS cache.
  ![1121](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1121.png)
  ![1122](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1122.png)
  ![1123](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1123.png)
  ![1124](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1124.png)

- Now as the above we can do or come back and select the Cluster cache instead of Easy Create
  ![1125](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1125.png)
  ![1126](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1126.png)
  ![1127](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1127.png)
  ![1128](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1128.png)
  ![1129](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1129.png)
  ![1130](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1130.png)
  ![1131](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1131.png)
  ![1132](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1132.png)

- So Document DB and ElasticCache will take time to get ready till then.
- We need to connect to the DBs right we do that.
- Now Launch the t2.medium Ubuntu Instance with apt update && apt install unzip -y
  ![1133](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1133.png)

- Now login to the above instance. to install so Mango DB Dependencies.
  ### Installing Mango shell:
    - Use the below link to install it.
  ```
  https://www.mongodb.com/docs/mongodb-shell/install/
  ```

  ```
  wget -qO- https://www.mongodb.org/static/pgp/server-7.0.asc | sudo tee /etc/apt/trusted.gpg.d/server-7.0.asc
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
  sudo apt-get update
  sudo apt-get install -y mongodb-mongosh
  mongosh --version
  ```
    - If any doubts reach above install url.
    - Now after installing Mango Shell we need to connect to the mangoDB.
    - Copy the certificate in the DocumentDB > Cluster > ourCluster > Connectivity & Security
      ![1134](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1134.png)
      ![1135](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1135.png)

    - A pem is created with above command.
      ![1136](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1136.png)

    - Connecting to the DB now.
      ![1137](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1137.png)
      ![1138](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1138.png)

    - Try Checking Replica sets by using below command
      ```
      rs.status()
      ```
      ![1139](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1139.png)
      ### To Check DB in DB
      ```
      show dbs;
      ```
      ### INserting Some data into DB
      ```
      db.helo.insertMany([
                  { "_id" : 1, "name" : "Matt", "status": "active", "level": 12, "score":202},
                  { "_id" : 2, "name" : "Frank", "status": "inactive", "level": 2, "score":9},
                  { "_id" : 3, "name" : "Karen", "status": "active", "level": 7, "score":87},
                  { "_id" : 4, "name" : "Katie", "status": "active", "level": 3, "score":27, "status": "married", "emp": "yes", "kids": 3}
                  ])
      ```
      ![1140](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1140.png)

      ### Command to find the details with name
      ```
      db.helo.find({name: "Katie"})
      ```
      ![1141](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1141.png)

    - Executing some DB commands in Mango Shell.
      ```
      show dbs;
      use test;
      show collections;
      ```
      ![1142](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1142.png)

    - We can use Studio3T to connect to the Document DB via graphically.
    - Download and install the studio3T from below url
      ```
      https://studio3t.com/download/
      ```
      ![1143](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1143.png)
      ![1144](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1144.png)
      ![1145](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1145.png)
      ![1146](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1146.png)
      ![1147](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1147.png)
      ![1148](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1148.png)
      ![1149](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1149.png)
      ![1150](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1150.png)
      ![1151](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1151.png)
      ![1151-01](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1151-01.png)
      ![1151-02](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1151-02.png)
      ![1152](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1152.png)
      ![1153](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1153.png)
      ![1154](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1154.png)
      ![1155](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1155.png)
      ![1156](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1156.png)

- Now Come to redis
- in the same instance install thhe following.
  ```
  apt install redis -y
  apt install python3-pip -y
  ```

  ### Ansible installation:
  ```
  sudo apt update
  sudo apt install software-properties-common
  sudo add-apt-repository --yes --update ppa:ansible/ansible
  sudo apt install ansible -y
  ```

  ```
  apt install python3-redis -y
  ```

  ### use the below command to connect to redis CLI
  ```
  redis-cli -h redis-elstic.nwaor1.ng.0001.use1.cache.amazonaws.com
  ```
  ![1157](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1157.png)
  ![1158](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1158.png)

    

# 26. Systems Manager:

- Sessions Manager
- Run Commands
    - Install Nginx using Run Commands
    - Install and configure the cloudwatch Agent using Run Commands
- Parameter Store

## IAM ROLE:

- We will create one role with below permissions and we assign to the Ec2 instances.
  ![1159](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1159.png)

- Now we will launch 2 instances for this demo
  ![1160](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1160.png)

## INstance Launching

- Now we will create tags for the two instances.
  ![1163](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1163.png)
  ![1164](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1164.png)

## RUN COMMAND

- Now Come to AWS System Manager > Run Command., Click on Run a Command button.
  ![1161](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1161.png)
  ![1162](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1162.png)

- Select AWS-RunShellScript
  ![1165](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1165.png)

- Provide shell commands to execute.
  ```
  #!/bin/bash
  yum update -y
  yum install telnet -y
  yum install tmux -y
  yum install nginx -y
  service nginx start
  systemctl enable nginx
  ```
  ![1166](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1166.png)

- Provide the Tag for which Run command should execute.
  ![1167](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1167.png)

- Disable s3 bucket option and click on Run.
  ![1168](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1168.png)

- Run will start and will be in progess.
  ![1169](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1169.png)

- Command History will look like this.
  ![1170](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1170.png)

- Now when you browse nginx you will get if installed correctly by run command. in both servers.
  ![1171](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1171.png)
  ![1172](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1172.png)

## Installing Cloudwatch Agent by RunCommand:

### COPY CLOUDWATCH AGENT:

- AWS Systems Manager > Run Command > Runcommand Button
  ![1173](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1173.png)

- Select AWS-ConfigureAWSPackage which will copy the cloud watch agent into servers.
  ![1174](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1174.png)
  ![1175](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1175.png)
  ![1176](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1176.png)
  ![1177](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1177.png)
  ![1178](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1178.png)

## CONFIGURING THE COPIED CLOUDWATCH AGENT

- Now login in to the two instances and see if the cloud watch agent is coped or not.
- under /opt/aws/amazon-cloudwatch-agent/bin
- run ```./amazon-cloudwatch-agent-config-wizard``` in both servers and configure as below
- Server 1 configuration
- actually you can do it only in one server but i did in 2 servers
- you can skip the server 2 if needed and follow ```copy to new``` process which explained below
  ![1179](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1179.png)
  ![1180](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1180.png)
  ![1182](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1182.png)
  ![1184](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1184.png)
  ![1186](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1186.png)
  ![1188](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1188.png)

- Server 2 configuration
  ![1181](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1181.png)
  ![1183](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1183.png)
  ![1185](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1185.png)
  ![1187](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1187.png)
  ![1189](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1189.png)

- After the configuration you can see this parameter in parameter store under AWS Systems Manager.
  ![1190](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1190.png)
  ![1191](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1191.png)

- Now you can go to AWS Systems Manager > Runcommand > Command History
- Select command id which has AWS-ConfigureAWSPackage as Document name and clcik on ```copy to new``` button
- and select the targets and copy the same config to as many as targets possible if needed.
  ![1192](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1192.png)
  ![1193](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1193.png)
  ![1194](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1194.png)

## CONFIGURING THE CLOUD WATCH MANAGER AGENT

- Now we will configure the AmazonCloudWatch-ManagerAgent in the two instances.
  ![1195](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1195.png)
  ![1196](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1196.png)
  ![1197](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1197.png)
  ![1198](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1198.png)
  ![1199](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1199.png)
  ![1200](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1200.png)
  ![1201](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1201.png)

- After configure the AmazonCloudWatch-ManagerAgent in the two instances this will be shown in cloudwatch > Metrics
  ![1202](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1202.png)

- This will be shown in shown in Cloudwatch > Log Groups
  ![1203](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1203.png)
  ![1204](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1204.png)
  ![1205](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1205.png)

  ## Log Insights
  ### Checking with 404:
  ```
  fields @timestamp, @message, @logStream, @log
  | sort @timestamp desc
  | filter @message like /404/
  | limit 200
  ```
  ![1206](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1206.png)

  ### Checking with IP:
  ```
  fields @timestamp, @message, @logStream, @log
  | sort @timestamp desc
  | filter @message like "49.47.233.31"
  | limit 200
  ```
  ![1207](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1207.png)

## SSM Hybrid Activation:

- This manages the instances which are out side AWS.
  ![1208](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1208.png)
  ![1209](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1209.png)

- You will get activation code and ID
  ![1210](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1210.png)

- Now launch the Azure VM Ubuntu in azure.
- Use the below commands and install SSM Hybrid
- only thing in code is replace the activation code and ID with your Hybrid Activation Code and ID
  ```
  mkdir /tmp/ssm
  curl https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb -o /tmp/amazon-ssm-agent.deb
  sudo dpkg -i /tmp/amazon-ssm-agent.deb
  sudo service amazon-ssm-agent stop
  sudo amazon-ssm-agent -register -code "jC+mM+7sjLq6e7RB5iys" -id "cf970a3b-6bba-4637-9eb1-bc1b05a0ad5c" -region "us-east-1" 
  sudo service amazon-ssm-agent start
  ```
- Now after installing go to Sessions Manager in AWS and Click on start session button then our Azure server should
  appear.
- Now you can use the Runcommands and manage the Azure server from AWS.
  ```
  #!/bin/bash
  sudo apt update -y
  apt install -y nginx
  git clone https://github.com/mavrick202/dockertest1.git
  cd dockertest1
  rm -f /var/www/html/index.nginx-debian.html
  cp index.html /var/www/html/index.nginx-debian.html
  cp style.css  /var/www/html/style.css
  cp scorekeeper.js /var/www/html/scorekeeper.js
  echo "<h1>$(cat /etc/hostname)</h1>" >> /var/www/html/index.nginx-debian.html
  ```
  ![1211](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1211.png)
  ![1212](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1212.png)
  ![1213](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1213.png)
  ![1214](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1214.png)

- Now you can browse the azure server nginx.

# CloudWatch-Alarams & Notifications:

## Configuring SNS (Simple Notification Service):

![1215](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1215.png)

- We will configure the Memory Monitor and Disk MOnitor for the instances
  ![1216](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1216.png)
  ![1217](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1217.png)
  ![1218](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1218.png)
  ![1219](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1219.png)
  ![1220](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1220.png)

- Topic Creation and subscription creation.
  ![1221](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1221.png)
  ![1222](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1222.png)
  ![1223](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1223.png)
  ![1224](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1224.png)
  ![1225](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1225.png)
  ![1225-01](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1225-01.png)

- In Pager Duty Integrationg the Slack Extension.
  ![1226](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1226.png)

- Now for two instances we will ```System-Manager-01:```i-087690faf88417e6f(Monitor Memory)
- ```System-Manager-02:```i-0b343119cbbd2f780(Disk Monitor)
  ![1226-01](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1226-01.png)
  ![1226-02](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1226-02.png)
- Now we will create alarms for that
  ![1227](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1227.png)
  ![1228](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1228.png)
  ![1229](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1229.png)
  ![1230](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1230.png)
  ![1231](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1231.png)
  ![1232](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1232.png)
  ![1233](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1233.png)
  ![1234](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1234.png)
  ![1235](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1235.png)
  ![1236](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1236.png)
  ![1237](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1237.png)
  ![1238](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1238.png)
  ![1239](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1239.png)
  ![1240](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1240.png)
  ![1241](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1241.png)
  ![1242](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1242.png)
  ![1243](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1243.png)
  ![1244](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1244.png)
  ![1245](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1245.png)
  ![1246](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1246.png)
  ![1247](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1247.png)
  ![1248](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1248.png)
  ![1249](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1249.png)
  ![1250](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1250.png)
  ![1251](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1251.png)
  ![1252](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1252.png)
  ![1253](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1253.png)
  ![1254](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1254.png)
  ![1255](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1255.png)


# 27. AWS Infrastructure As A Code:

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

![1257](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1257.png)
![1258](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1258.png)
![1259](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1259.png)
![1260](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1260.png)
![1261](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1261.png)
![1262](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1262.png)
![1263](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1263.png)
![1264](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1264.png)
![1265](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1265.png)
![1266](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1266.png)
![1267](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1267.png)
![1268](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1268.png)
![1269](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1269.png)
![1270](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1270.png)

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

  ![1271](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1271.png)
  ![1272](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1272.png)
  ![1273](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1273.png)
  ![1274](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1274.png)
  ![1275](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1275.png)
  ![1276](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1276.png)
  ![1277](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1277.png)

# StackSets in CloudFormation:

- Cloud Formation Template deploying among the accounts.
- For this we need to create the role or you can use the below link for role.
  ### AWSCloudFormationStackSetAdministrationRole.yml
  ```
  https://s3.amazonaws.com/cloudformation-stackset-sample-templates-us-east-1/AWSCloudFormationStackSetAdministrationRole.yml
  ```
- We need to do this in Master account.
  ![1278](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1278.png)
  ![1279](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1279.png)
  ![1280](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1280.png)
  ![1281](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1281.png)
  ![1282](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1282.png)
  ![1283](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1283.png)
  ![1284](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1284.png)

- Now Do it in Slave2 Account
  ### AWSCloudFormationStackSetExecutionRole.yml
  ```
  https://s3.amazonaws.com/cloudformation-stackset-sample-templates-us-east-1/AWSCloudFormationStackSetExecutionRole.yml
  ```
  ![1286](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1286.png)
  ![1285](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1285.png)
  ![1284](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1284.png)

- Similarly Now Do it in Slave1 Account
  ### AWSCloudFormationStackSetExecutionRole.yml
  ```
  https://s3.amazonaws.com/cloudformation-stackset-sample-templates-us-east-1/AWSCloudFormationStackSetExecutionRole.yml
  ```
  ![1286](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1286.png)
  ![1287](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1287.png)
  ![1284](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1284.png)

- EXTRA
  ![1288](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1288.png)
  ![1289](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1289.png)
  ![1290](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1290.png)
  ![1291](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1291.png)
  ![1292](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1292.png)
  ![1293](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1293.png)
  ![1294](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1294.png)
  ![1295](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1295.png)
  ![1296](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1296.png)
  ![1297](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1297.png)

## Creating Stack Set In Root Account.

![1298](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1298.png)

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

![1299](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1299.png)
![1300](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1300.png)
![1301](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1301.png)
![1302](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1302.png)
![1303](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1303.png)
![1304](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1304.png)

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
  ![1304-01](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1304-01.png)

- Now create Stack
  ![1305](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1305.png)
  ![1306](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1306.png)

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
  ![1307](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1307.png)
  ![1308](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1308.png)
  ![1309](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1309.png)
  ![1310](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1310.png)
  ![1311](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1311.png)
  ![1312](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1312.png)
  ![1313](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1313.png)
  ![1314](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1314.png)
  ![1315](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1315.png)
  ![1316](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1316.png)

### DISADVANTAGES:

Limitations with Cloudformation:

1. Keeping all the code base in singefile and manging is cumbersome.
2. Only works with AWS.
3. Dry run is not that effective.
4. Steep learning curve.
5. No module concept.
6. Iterations or running is not straight. 



# 28. Terraform:

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



# 29. AWS Elastic Container Services (ECS):

### 1. Virtual machines vs Containers

### 2. Installing Docker and Running containers.

### 3. Creating custom container images using Docker.

### 4. Pushing container images to AWS Elastic Container Registry(ECR)

## Amazon Elastic Container Sservices:

### 1. Fargate

### 2. EC2

## 1. Virtual machines vs Containers:

- Sample diagram demonstrating the Virtual machines vs Containers.
  ![1317](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1317.png)

- Explonation Diagram
  ![1318](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1318.png)

- Launching the ubuntu instance for docker installation
  ```
  apt update -y
  apt install -y unzip
  apt install -y net-tools
  ```
  ```
  ifconfig
  ```
- Intially try ifconfig
  ![1319](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1319.png)

  ```
  curl https://get.docker.com | bash
  docker version
  ```

- Docker installed successfully.
  ![1321](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1321.png)

  ```
  ifconfig
  ```

- After docker installation try ifconfig
  ![1320](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1320.png)

- Sample docker run
  ```
  docker run --rm -d --name app1 -p 80:80 nginx:latest
  ```
    - docker run --> is used to run the docker
    - --rm --> is used to delete the docker container if some reason docker container stops
    - -d --> is used to detach the container without going in ti the container
    - -name --> container name
    - -p --> port number in:Expose
    - nginx:latest --> image

  ![1322](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1322.png)

  ![1323](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1323.png)
  ```
  docker ps
  ```
  ```
  root@ip-10-1-1-226:~# docker ps
  CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                               NAMES
  0309276c319f   nginx:latest   "/docker-entrypoint.…"   13 minutes ago   Up 13 minutes   0.0.0.0:80->80/tcp, :::80->80/tcp   app1
  root@ip-10-1-1-226:~#
  ```
- Now if you browse with Publicip:80 you can get nginx.
  ![1324](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1324.png)

- Now Sample Docker file.
- you can find this in sampleDockerBuild dir in this repo
  ### Dockerfile
  ```
  FROM nginx:latest
  MAINTAINER practice@devopbymak.xyz
  RUN apt install -y curl
  COPY index.html /usr/share/nginx/html/
  COPY scorekeeper.js /usr/share/nginx/html/
  COPY style.css /usr/share/nginx/html/
  COPY error.html /usr/share/nginx/html/
  COPY ngnix_default.config /etc/nginx/sites-enabled/default
  COPY error.html /usr/share/nginx/html/
  CMD ["nginx", "-g", "daemon off;"]
  ```
- these are the files used
  ```
  root@ip-10-1-1-226:~/dockertest1# ll
  total 32
  drwxr-xr-x 3 root root 4096 Aug 31 12:59 ./
  drwx------ 5 root root 4096 Aug 31 12:59 ../
  drwxr-xr-x 8 root root 4096 Aug 31 12:54 .git/
  -rw-r--r-- 1 root root  384 Aug 31 12:59 Dockerfile
  -rw-r--r-- 1 root root 1581 Aug 31 12:54 error.html
  -rw-r--r-- 1 root root  753 Aug 31 12:54 index.html
  -rw-r--r-- 1 root root 1437 Aug 31 12:54 scorekeeper.js
  -rw-r--r-- 1 root root  340 Aug 31 12:54 style.css
  ```
- Docker build to build the image
  ```
  docker build -t madireddydocker/dockertestnginx:v1 .
  ```
- To run the image
  ```
  docker run --rm -d --name app10 -p 5001:80 madireddydocker/dockertestnginx:v1
  ```
- To check the images
  ```
  docker images
  ```
- To check the process
  ```
  docker ps
  ```

- In realtime we use private repositories Amazon Elastic Container Registry

## Amazon Elastic Container Registry (ECR):

![1325](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1325.png)
![1326](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1326.png)
![1327](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1327.png)
![1328](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1328.png)

- Install AWS CLI to push the images to Amazon Elastic Container Registry
  ```
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  ```

- Now configure the aws
  ```
  aws configure
  ```

- Now Open the Registry.
  ![1329](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1329.png)
  ![1330](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1330.png)

- Now we have to rename to tags to match the registry.
  ![1331](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1331.png)
  ![1332](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1332.png)
  ![1333](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1333.png)

## Amazon Elastic Container Services (ECS):

## 1. Fargate:

- Now We create fargate
  ![1334](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1334.png)
  ![1335](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1335.png)
  ![1336](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1336.png)

- Now after creating the fargate we need to do the task definition
  ### Role Creation
  ![1342-01](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1342-01.png)
  ![1342-02](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1342-02.png)
  ![1342-03](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1342-03.png)
  ### ECSFargateAllowExecuteCommand
  ```
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "Statement1",
              "Effect": "Allow",
              "Action": [
                  "ssmmessages:CreateControlChannel",
                  "ssmmessages:CreateDataChannel",
                  "ssmmessages:OpenControlChannel",
                  "ssmmessages:OpenDataChannel"
              ],
              "Resource": [
                  "*"
              ]
          }
      ]
  }
  ```
  ### EnableExecuteCommand
  ```
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "VisualEditor0",
              "Effect": "Allow",
              "Action": "ecs:ExecuteCommand",
              "Resource": "*"
          }
      ]
  }
  ```
  ### nginx_fargate.json
  ```
  {
      "requiresCompatibilities": [
        "FARGATE"
      ],
      "containerDefinitions": [
        {
          "name": "nginxtest",
          "image": "559050220397.dkr.ecr.us-east-1.amazonaws.com/devopsbymak:ngtestv1",
          "memory": 256,
          "cpu": 256,
          "essential": true,
          "portMappings": [
            {
              "containerPort": 80,
              "protocol": "tcp"
            }
          ],
          "logConfiguration":{
                "logDriver":"awslogs",
                "options":{
                   "awslogs-group":"ecs-log-group",
                   "awslogs-region":"us-east-1",
                   "awslogs-stream-prefix":"ecs"
                }
          }
        }
      ],
      "volumes": [],
      "networkMode": "awsvpc",
      "placementConstraints": [],
      "family": "nginxtest",
      "memory": "512",
      "cpu": "256",
      "executionRoleArn": "arn:aws:iam::559050220397:role/AnilECSTaskExecutionRole"
    }
  ```

- Now here we need to change the Image name to our image, and need to create the log-group
- under cloud watch create one log-group.
  ![1337](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1337.png)
  ![1338](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1338.png)
  ![1339](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1339.png)

  ![1340](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1340.png)
  ![1341](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1341.png)
  ![1342](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1342.png)
  ![1343](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1343.png)
  ![1344](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1344.png)
  ![1345](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1345.png)
  ![1346](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1346.png)
  ![1347](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1347.png)
  ![1348](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1348.png)
  ![1349](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1349.png)
  ![1350](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1350.png)
  ![1351](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1351.png)
  ![1352](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1352.png)
  ![1353](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1353.png)
  ![1354](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1354.png)
  ![1355](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1355.png)

- Now if you update the task definition of something , but we do in environment update.
  ### updating nginx_fargate.json
  ```
  {
      "requiresCompatibilities": [
        "FARGATE"
      ],
      "containerDefinitions": [
        {
          "name": "nginxtest",
          "image": "559050220397.dkr.ecr.us-east-1.amazonaws.com/devopsbymak:ngtestv1",
          "memory": 256,
          "cpu": 256,
          "essential": true,
          "environment": [
            {
                "name": "AWS_ACCESS_KEY_ID",
                "value": "value"
            },
            {
                "name": "AWS_SECRET_ACCESS_KEY",
                "value": "value"
            }
        ],        
          "portMappings": [
            {
              "containerPort": 80,
              "protocol": "tcp"
            }
          ],
          "logConfiguration":{
                "logDriver":"awslogs",
                "options":{
                   "awslogs-group":"ecs-log-group",
                   "awslogs-region":"us-east-1",
                   "awslogs-stream-prefix":"ecs"
                }
          }
        }
      ],
      "volumes": [],
      "networkMode": "awsvpc",
      "placementConstraints": [],
      "family": "nginxtest",
      "memory": "512",
      "cpu": "256",
      "executionRoleArn": "arn:aws:iam::559050220397:role/AnilECSTaskExecutionRole"
    }
  ```
- Now we can update the task definition in console.
  ![1356](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1356.png)
  ![1357](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1357.png)
  ![1358](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1358.png)
  ![1359](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1359.png)
  ![1360](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1360.png)

- Click on Update button
- After update old one will get deleted and three more tasks will create here
  ![1361](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1361.png)

- Again try to browse the application from Amazon Elastic Container Service > Clusters > devClusterFargate01 >
  Services >application > Tasks > openanytask > Configuration > Network binding > Externallink

## 2. ECS EC2

### ECS Cluster Creation:

![1362](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1362.png)
![1363](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1363.png)
![1364](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1364.png)
![1365](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1365.png)
![1366](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1366.png)
![1366-01](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1366-01.png)
![1366-02](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1366-02.png)
![1366-03](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1366-03.png)
![1366-04](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1366-04.png)

### Task Definition Creation for ECS EC2:

![1367](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1367.png)
![1368](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1368.png)
![1369](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1369.png)
![1370](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1370.png)

### Dummy user CReation for the ECS EC2:

![1370-01](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1370-01.png)
![1370-02](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1370-02.png)
![1370-03](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1370-03.png)
![1370-04](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1370-04.png)
![1370-05](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1370-05.png)

### CReating Task For ECS EC2 Cluster:

![1371](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1371.png)
![1372](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1372.png)
![1373](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1373.png)
![1374](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1374.png)
![1375](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1375.png)
![1376](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1376.png)
![1376-01](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1376-01.png)
![1377](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1377.png)
![1378](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1378.png)

- if you click on stop all then its all gone app wont be working
  ![1379](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1379.png)

- so we create the services in cluster.
- for this we create the one role.
  ![1380](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1380.png)

### Service CReation in ECS Cluster:

![1381](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1381.png)
![1381-00](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1381-00.png)
![1381-00-01](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1381-00-01.png)
![1381-01](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1381-01.png)
![1381-02](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1381-02.png)
![1381-03](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1381-03.png)
![1381-04](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1381-04.png)
![1381-05](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1381-05.png)
![1381-06](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1381-06.png)
![1381-07](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1381-07.png)
![1381-08](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1381-08.png)
![1381-09](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1381-09.png)
![1382](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1382.png)
![1383](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1383.png)
![1384](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1384.png)
![1385](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1385.png)
![1386](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1386.png)
![1387](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1387.png)
![1388](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1388.png)

- Now if you try to delete the tasks in the Cluster then services will automatically bring up the tasks
  ![1389](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1389.png)
  ![1390](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1390.png)
  ![1391](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1391.png)

- First delete Service then Cluster



# 30. Elastic Kubernetes Services:

### 1. Install The Kubectl

- Launching New instance with ubuntu linux and t2.medium
  ```
  curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
  sudo mv ./kubectl /usr/local/bin/kubectl
  chmod 700 /usr/local/bin/kubectl
  kubectl version -short
  ```

### 2. Install the EKSCtl

- install the eksctl in the server
  ```
  curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
  sudo mv /tmp/eksctl /usr/local/bin
  sudo chmod 700 /usr/local/bin/eksctl
  eksctl version
  ```

### 3. Installing the AWS CLI

- installing the AWS Cli in the server
  ```
  apt install unzip -y
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  ```

### 4. Configure the AWS CLI:

- Create one Admin CLI user and Create access key
  ![1392](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1392.png)
- configure the AWS CLI in server
  ```
  aws configure
  
  ```

### 5. Generating the key

- Now we will generate the one key.
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# ssh-keygen
      
      ```
    - ***Output***
      ```
      Generating public/private ed25519 key pair.
      Enter file in which to save the key (/root/.ssh/id_ed25519):
      Enter passphrase (empty for no passphrase):
      Enter same passphrase again:
      Your identification has been saved in /root/.ssh/id_ed25519
      Your public key has been saved in /root/.ssh/id_ed25519.pub
      The key fingerprint is:
      SHA256:YGDg7eiMDN1NGewQQq4j1dZ7VmDdafrE36qX1apa49A root@ip-10-1-1-246
      The key's randomart image is:
      +--[ED25519 256]--+
      | .+.+o. o. . .   |
      | o =.o.+ .. +    |
      |  + +o*   .+     |
      | + = +.o .. o    |
      |= o o o S  o . ..|
      |+=     o   .. . +|
      |..o       . E  = |
      |           + .=  |
      |          ..++   |
      +----[SHA256]-----+
      ```

### 6. EKS Cluster creation code:

- match the public key path with the key which you created above
    - ***eksctl-ipv4-cluster.yml***
      ```
      ---
      apiVersion: eksctl.io/v1alpha5
      kind: ClusterConfig
      
      metadata:
        name: eks-test-cluster-01
        region: us-east-2
        version: "1.27"
      
      kubernetesNetworkConfig:
        ipFamily: IPv4
      addons:
        - name: vpc-cni
          version: latest
        - name: coredns
          version: latest
        - name: kube-proxy
          version: latest
        - name: aws-ebs-csi-driver
          version: latest
      
      iam:
        withOIDC: true
      
      managedNodeGroups:
        - name: nodegroup1
          instanceType: t3.medium
          minSize: 2
          desiredCapacity: 3
          maxSize: 4
          availabilityZones: ["us-east-2a", "us-east-2b", "us-east-2c"]
          volumeSize: 30
          ssh:
            allow: true
            publicKeyPath: ~/.ssh/id_ed25519.pub
      ```
- Now use the below command to create the nodegroups with eks cluster using the above code.

    - ***Command:***
      ```
      eksctl create cluster -f eksctl-ipv4-cluster.yml &
      ```
    - ***Output:***
      ```
      root@ip-10-1-1-246:~# 2024-09-04 05:12:13 [ℹ]  eksctl version 0.189.0
      2024-09-04 05:12:13 [ℹ]  using region us-east-2
      2024-09-04 05:12:13 [ℹ]  setting availability zones to [us-east-2a us-east-2c us-east-2b]
      2024-09-04 05:12:13 [ℹ]  subnets for us-east-2a - public:192.168.0.0/19 private:192.168.96.0/19
      2024-09-04 05:12:13 [ℹ]  subnets for us-east-2c - public:192.168.32.0/19 private:192.168.128.0/19
      2024-09-04 05:12:13 [ℹ]  subnets for us-east-2b - public:192.168.64.0/19 private:192.168.160.0/19
      2024-09-04 05:12:13 [ℹ]  nodegroup "nodegroup1" will use "" [AmazonLinux2/1.27]
      2024-09-04 05:12:13 [ℹ]  using SSH public key "/root/.ssh/id_ed25519.pub" as "eksctl-eks-test-cluster-01-nodegroup-nodegroup1-YGDg7eiMDN1NGewQQq4j1dZ7VmDdafrE36qX1apa49A"
      2024-09-04 05:12:13 [ℹ]  using Kubernetes version 1.27
      2024-09-04 05:12:13 [ℹ]  creating EKS cluster "eks-test-cluster-01" in "us-east-2" region with managed nodes
      2024-09-04 05:12:13 [ℹ]  1 nodegroup (nodegroup1) was included (based on the include/exclude rules)
      2024-09-04 05:12:13 [ℹ]  will create a CloudFormation stack for cluster itself and 0 nodegroup stack(s)
      2024-09-04 05:12:13 [ℹ]  will create a CloudFormation stack for cluster itself and 1 managed nodegroup stack(s)
      2024-09-04 05:12:13 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-2 --cluster=eks-test-cluster-01'
      2024-09-04 05:12:13 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "eks-test-cluster-01" in "us-east-2"
      2024-09-04 05:12:13 [ℹ]  CloudWatch logging will not be enabled for cluster "eks-test-cluster-01" in "us-east-2"
      2024-09-04 05:12:13 [ℹ]  you can enable it with 'eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=us-east-2 --cluster=eks-test-cluster-01'
      2024-09-04 05:12:13 [ℹ]
      2 sequential tasks: { create cluster control plane "eks-test-cluster-01",
          2 sequential sub-tasks: {
              5 sequential sub-tasks: {
                  1 task: { create addons },
                  wait for control plane to become ready,
                  associate IAM OIDC provider,
                  no tasks,
                  update VPC CNI to use IRSA if required,
              },
              create managed nodegroup "nodegroup1",
          }
      }
      2024-09-04 05:12:13 [ℹ]  building cluster stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:12:13 [ℹ]  deploying stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:12:43 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:13:13 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:14:13 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:15:14 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:16:14 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:17:14 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:18:14 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:19:14 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:20:14 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:21:14 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:21:15 [!]  recommended policies were found for "vpc-cni" addon, but since OIDC is disabled on the cluster, eksctl cannot configure the requested permissions; the recommended way to provide IAM permissions for "vpc-cni" addon is via pod identity associations; after addon creation is completed, add all recommended policies to the config file, under `addon.PodIdentityAssociations`, and run `eksctl update addon`
      2024-09-04 05:21:15 [ℹ]  creating addon
      2024-09-04 05:21:16 [ℹ]  successfully created addon
      2024-09-04 05:21:16 [ℹ]  creating addon
      2024-09-04 05:21:16 [ℹ]  successfully created addon
      2024-09-04 05:21:17 [ℹ]  creating addon
      2024-09-04 05:21:17 [ℹ]  successfully created addon
      2024-09-04 05:23:18 [ℹ]  deploying stack "eksctl-eks-test-cluster-01-addon-vpc-cni"
      2024-09-04 05:23:18 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-addon-vpc-cni"
      2024-09-04 05:23:48 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-addon-vpc-cni"
      2024-09-04 05:23:48 [ℹ]  updating addon
      2024-09-04 05:23:59 [ℹ]  addon "vpc-cni" active
      2024-09-04 05:23:59 [ℹ]  building managed nodegroup stack "eksctl-eks-test-cluster-01-nodegroup-nodegroup1"
      2024-09-04 05:23:59 [ℹ]  deploying stack "eksctl-eks-test-cluster-01-nodegroup-nodegroup1"
      2024-09-04 05:24:00 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-nodegroup-nodegroup1"
      2024-09-04 05:24:30 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-nodegroup-nodegroup1"
      2024-09-04 05:25:15 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-nodegroup-nodegroup1"
      2024-09-04 05:27:05 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-nodegroup-nodegroup1"
      2024-09-04 05:27:05 [ℹ]  waiting for the control plane to become ready
      2024-09-04 05:27:06 [✔]  saved kubeconfig as "/root/.kube/config"
      2024-09-04 05:27:06 [ℹ]  no tasks
      2024-09-04 05:27:06 [✔]  all EKS cluster resources for "eks-test-cluster-01" have been created
      2024-09-04 05:27:06 [✔]  created 0 nodegroup(s) in cluster "eks-test-cluster-01"
      2024-09-04 05:27:06 [ℹ]  nodegroup "nodegroup1" has 3 node(s)
      2024-09-04 05:27:06 [ℹ]  node "ip-192-168-11-102.us-east-2.compute.internal" is ready
      2024-09-04 05:27:06 [ℹ]  node "ip-192-168-50-148.us-east-2.compute.internal" is ready
      2024-09-04 05:27:06 [ℹ]  node "ip-192-168-64-113.us-east-2.compute.internal" is ready
      2024-09-04 05:27:06 [ℹ]  waiting for at least 2 node(s) to become ready in "nodegroup1"
      2024-09-04 05:27:06 [ℹ]  nodegroup "nodegroup1" has 3 node(s)
      2024-09-04 05:27:06 [ℹ]  node "ip-192-168-11-102.us-east-2.compute.internal" is ready
      2024-09-04 05:27:06 [ℹ]  node "ip-192-168-50-148.us-east-2.compute.internal" is ready
      2024-09-04 05:27:06 [ℹ]  node "ip-192-168-64-113.us-east-2.compute.internal" is ready
      2024-09-04 05:27:06 [✔]  created 1 managed nodegroup(s) in cluster "eks-test-cluster-01"
      2024-09-04 05:27:06 [!]  IRSA has been deprecated; the recommended way to provide IAM permissions for "aws-ebs-csi-driver" addon is via pod identity associations; after addon creation is completed, run `eksctl utils migrate-to-pod-identity`
      2024-09-04 05:27:06 [ℹ]  creating role using recommended policies for "aws-ebs-csi-driver" addon
      2024-09-04 05:27:07 [ℹ]  deploying stack "eksctl-eks-test-cluster-01-addon-aws-ebs-csi-driver"
      2024-09-04 05:27:07 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-addon-aws-ebs-csi-driver"
      2024-09-04 05:27:37 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-addon-aws-ebs-csi-driver"
      2024-09-04 05:28:31 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-addon-aws-ebs-csi-driver"
      2024-09-04 05:28:31 [ℹ]  creating addon
      2024-09-04 05:29:26 [ℹ]  addon "aws-ebs-csi-driver" active
      2024-09-04 05:29:27 [ℹ]  kubectl command should work with "/root/.kube/config", try 'kubectl get nodes'
      2024-09-04 05:29:27 [✔]  EKS cluster "eks-test-cluster-01" in "us-east-2" region is ready
      
      [1]+  Done                    eksctl create cluster -f eksctl-ipv4-cluster.yml
      ```
- ***Sample Diagram Explaining the Kubernetes Architecture***
  ![1393](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1393.png)

- Resources created after deploying kubernetes cluster
  ![1394](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1394.png)
  ![1395](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1395.png)

- Checking Nodes in Kubernetes Cluster
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get nodes
    
      ```
    - ***Output:***
      ```
      NAME                                           STATUS   ROLES    AGE   VERSION
      ip-192-168-11-102.us-east-2.compute.internal   Ready    <none>   66m   v1.27.15-eks-1552ad0
      ip-192-168-50-148.us-east-2.compute.internal   Ready    <none>   66m   v1.27.15-eks-1552ad0
      ip-192-168-64-113.us-east-2.compute.internal   Ready    <none>   66m   v1.27.15-eks-1552ad0
      ```
- Checking all pods in the all name spaces
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get pods -A
      
      ```
    - ***Output:***
      ```
      NAMESPACE     NAME                                 READY   STATUS    RESTARTS   AGE
      kube-system   aws-node-f7sfl                       2/2     Running   0          80m
      kube-system   aws-node-hkr7h                       2/2     Running   0          80m
      kube-system   aws-node-s22l7                       2/2     Running   0          80m
      kube-system   coredns-6d6cd5c79b-dw7n6             1/1     Running   0          84m
      kube-system   coredns-6d6cd5c79b-dwz9p             1/1     Running   0          84m
      kube-system   ebs-csi-controller-5f94c4bbf-cxgbs   6/6     Running   0          77m
      kube-system   ebs-csi-controller-5f94c4bbf-lvjdx   6/6     Running   0          77m
      kube-system   ebs-csi-node-hknz7                   3/3     Running   0          77m
      kube-system   ebs-csi-node-krqv5                   3/3     Running   0          77m
      kube-system   ebs-csi-node-rj955                   3/3     Running   0          77m
      kube-system   kube-proxy-ccdmt                     1/1     Running   0          80m
      kube-system   kube-proxy-dbcfv                     1/1     Running   0          80m
      kube-system   kube-proxy-tdrgl                     1/1     Running   0          80m
      ```
- ***Deploying pods using our image which is in ECR***
    - ***deployment.yml***
      ```
      apiVersion: apps/v1
      kind: Deployment
      metadata:
        name: myapp1
      spec:
        replicas: 3
        selector:
          matchLabels:
            app: myapp1
        template:
          metadata:
            labels:
              app: myapp1
          spec:
            containers:
            - name: nginx
              image: 559050220397.dkr.ecr.us-east-1.amazonaws.com/devopsbymak:ngtestv1
              ports:
              - containerPort: 80
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl apply -f deployment.yml
      
      ```
    - ***Output:***
      ```
      deployment.apps/myapp1 created
      
      ```
- Now to check the deployment
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get pods
      
      ```
    - ***Output:***
      ```
      NAME                      READY   STATUS    RESTARTS   AGE
      myapp1-86548bdd76-8xc4z   1/1     Running   0          2m47s
      myapp1-86548bdd76-9sqkt   1/1     Running   0          2m47s
      myapp1-86548bdd76-zrpvs   1/1     Running   0          2m47s
      ```
- Now to expose the application to the outer world we run below command
    - ***Comand:***
      ```
      root@ip-10-1-1-246:~# kubectl expose deployment myapp1 --port 80 --type Nodeport --dry-run -o yaml
      
      ```
    - ***Output:***
      ```
      W0904 07:05:15.132039    2530 helpers.go:703] --dry-run is deprecated and can be replaced with --dry-run=client.
      apiVersion: v1
      kind: Service
      metadata:
        creationTimestamp: null
        name: myapp1
      spec:
        ports:
        - port: 80
          protocol: TCP
          targetPort: 80
        selector:
          app: myapp1
        type: Nodeport
      status:
        loadBalancer: {}
      ```
- Now we use the above code and we do the expose.
    - ***deployment-service.yml***
      ```
      apiVersion: v1
      kind: Service
      metadata:
        name: myapp1
      spec:
        ports:
        - port: 80
          protocol: TCP
          targetPort: 80
          nodePort: 31111
        selector:
          app: myapp1
        type: NodePort
      ```
    - ***COmmand:***
      ```
      kubectl apply -f deployment-service.yml
      
      ```
    - ***Output:***
      ```
      service/myapp1 created
      
      ```
- Now we check the service deployed or not.
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get svc
      
      ```
    - ***OutPut:***
      ```
      NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
      kubernetes   ClusterIP   10.100.0.1       <none>        443/TCP        138m
      myapp1       NodePort    10.100.138.188   <none>        80:31111/TCP   3m5s
      ```
- Checking the service description which ip and etc..
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl describe svc myapp1
      
      ```
    - ***Output:***
      ```
      Name:                     myapp1
      Namespace:                default
      Labels:                   <none>
      Annotations:              <none>
      Selector:                 app=myapp1
      Type:                     NodePort
      IP Family Policy:         SingleStack
      IP Families:              IPv4
      IP:                       10.100.138.188
      IPs:                      10.100.138.188
      Port:                     <unset>  80/TCP
      TargetPort:               80/TCP
      NodePort:                 <unset>  31111/TCP
      Endpoints:                192.168.49.33:80,192.168.9.10:80,192.168.64.131:80
      Session Affinity:         None
      External Traffic Policy:  Cluster
      Internal Traffic Policy:  Cluster
      Events:                   <none>
      ```
- Once Check the Inbound Traffic rules in Security group for the created cluster.
- Browse with the instance ip and exposed port
  ```
  http://ec2-3-19-55-183.us-east-2.compute.amazonaws.com:31111
  
  ```
  ![1396](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1396.png)

- Checking deploy
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get deploy
      
      ```
    - ***Output:***
      ```
      NAME     READY   UP-TO-DATE   AVAILABLE   AGE
      myapp1   3/3     3            3           90m
      ```
- We will watch the change by below commad
    - ***Command:***
      ```
      #watch the deployment edit
      root@ip-10-1-1-246:~# watch -n 1 kubectl get pods
      ```
    - ***Output:***
      ```
      Every 1.0s: kubectl get pods                                     ip-10-1-1-246: Wed Sep  4 08:45:13 2024
      
      NAME                      READY   STATUS    RESTARTS   AGE
      myapp1-7569765bd9-2k845   1/1     Running   0          97s
      myapp1-7569765bd9-b77fx   1/1     Running   0          101s
      myapp1-7569765bd9-mxjc5   1/1     Running   0          99s
      ```
- Now we will edit the deployment by below command and change the image to ```nginx:latest``` and you can see the pods
  getting updated in above watch command.
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# export KUBE_EDITOR=nano
      root@ip-10-1-1-246:~# kubectl edit deploy myapp1
      deployment.apps/myapp1 edited
      ```
  ![1397](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1397.png)

- Just change the grep and ping the url you can see the load balancing.
  ```
  while true; do curl -sL http://ec2-3-19-55-183.us-east-2.compute.amazonaws.com:31111|grep nginx; sleep 1; done
  ```

- Now we will do Scaling-up the deployment
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl scale deploy myapp1 --replicas 6
      
      ```
    - ***Output:***
      ```
      deployment.apps/myapp1 scaled
      
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get deploy
      
      ```
    - ***Output:***
      ```
      NAME     READY   UP-TO-DATE   AVAILABLE   AGE
      myapp1   6/6     6            6           117m
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get pods
      
      ```
    - ***Output:***
      ```
      NAME                      READY   STATUS    RESTARTS   AGE
      myapp1-7569765bd9-2k845   1/1     Running   0          12m
      myapp1-7569765bd9-b2mgw   1/1     Running   0          29s
      myapp1-7569765bd9-b77fx   1/1     Running   0          12m
      myapp1-7569765bd9-b9gnb   1/1     Running   0          29s
      myapp1-7569765bd9-hfzdk   1/1     Running   0          29s
      myapp1-7569765bd9-mxjc5   1/1     Running   0          12m
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get svc
      
      ```
    - ***Output:***
      ```
      NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
      kubernetes   ClusterIP   10.100.0.1       <none>        443/TCP        3h44m
      myapp1       NodePort    10.100.138.188   <none>        80:31111/TCP   88m
      ```
- Now Deleting the Deployment and service
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl delete deploy myapp1
      
      ```
    - ***Output:***
      ```
      deployment.apps "myapp1" deleted
      
      ```
    - ***Command:***
      ```
      
      root@ip-10-1-1-246:~# kubectl get deploy
      ```
    - ***Output:***
      ```
      No resources found in default namespace.
      
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl delete svc myapp1
      
      
      ```
    - ***Output:***
      ```
      service "myapp1" deleted
      
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get svc
      
      ```
    - ***Output:***
      ```
      NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
      kubernetes   ClusterIP   10.100.0.1   <none>        443/TCP   3h54m
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get pods
      
      ```
    - ***Output:***
      ```
      No resources found in default namespace.
      
      ```

- Now We need to delete the Amazon EKS Cluster
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# eksctl get cluster --region=us-east-2
      
      ```
    - ***Output:***
      ```
      NAME                    REGION          EKSCTL CREATED
      eks-test-cluster-01     us-east-2       True
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# eksctl get nodegroups  --cluster=eks-test-cluster-01 --region=us-east-2
      
      ```
    - ***Output:***
      ```
      CLUSTER                 NODEGROUP       STATUS  CREATED                 MIN SIZE        MAX SIZE        DESIRED CAPACITY        INSTANCE TYPE   IMAGE ID        ASG NAME                                          TYPE
      eks-test-cluster-01     nodegroup1      ACTIVE  2024-09-04T05:24:22Z    2               4               3                       t3.medium       AL2_x86_64      eks-nodegroup1-e2c8ddbe-d49a-f95e-c527-31b227eddcafmanaged
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# eksctl delete cluster --region=us-east-2 --name=eks-test-cluster-01 &
      
      ```

  ```NOTE:```FInally check all EKS are deleted and Cloud Formations services should be delete if not it will cost





# 31. Basics of Python 
## Using Boto3 Library
  1. Python 3 Download and Install it.
  2. VS Code.
  3. Install Python Virtual Environment
  4. Install Python Libraries boto3, IPython, requests, fastapi, uvicorn
  5. Understanding Python Data Types like strings, int, lists, dict, sets
  6. Access AWS API with Boto3 Methods.

## Installing Python and VSCode.
- You know how to instal it

## Install Python Virtual Environment
  - ***Command:***
    ```
    madireddydevops@MadireddyOmen:~$ python3 --version
    
    ```
  - ***Output:***
    ```
    Python 3.12.3
    
    ```
  - ***Command:***
    ```
    madireddydevops@MadireddyOmen:~$ pip --version
    
    ```
  - ***Output:***
    ```
    
    pip 24.0 from /usr/lib/python3/dist-packages/pip (python 3.12)
    ```
  - ***Command:***
    ```
    sudo apt install python3-virtualenv
    ```

  - ***Command:***
    ```
    madireddydevops@MadireddyOmen:~$ pip list
  
    ```
  - ***Output:***
    ```
    Package             Version
    ------------------- -------------
    attrs               23.2.0
    Automat             22.10.0
    Babel               2.10.3
    bcrypt              3.2.2
    blinker             1.7.0
    certifi             2023.11.17
    chardet             5.2.0
    click               8.1.6
    cloud-init          24.1.3
    colorama            0.4.6
    command-not-found   0.3
    configobj           5.0.8
    constantly          23.10.4
    cryptography        41.0.7
    dbus-python         1.3.2
    distlib             0.3.8
    distro              1.9.0
    distro-info         1.7+build1
    filelock            3.13.1
    httplib2            0.20.4
    hyperlink           21.0.0
    idna                3.6
    incremental         22.10.0
    Jinja2              3.1.2
    jsonpatch           1.32
    jsonpointer         2.0
    jsonschema          4.10.3
    launchpadlib        1.11.0
    lazr.restfulclient  0.14.6
    lazr.uri            1.0.6
    markdown-it-py      3.0.0
    MarkupSafe          2.1.5
    mdurl               0.1.2
    netifaces           0.11.0
    oauthlib            3.2.2
    pip                 24.0
    platformdirs        4.2.0
    pyasn1              0.4.8
    pyasn1-modules      0.2.8
    pycurl              7.45.3
    Pygments            2.17.2
    PyGObject           3.48.2
    PyHamcrest          2.1.0
    PyJWT               2.7.0
    pyOpenSSL           23.2.0
    pyparsing           3.1.1
    pyrsistent          0.20.0
    pyserial            3.5
    python-apt          2.7.7+ubuntu1
    pytz                2024.1
    PyYAML              6.0.1
    requests            2.31.0
    rich                13.7.1
    service-identity    24.1.0
    setuptools          68.1.2
    six                 1.16.0
    systemd-python      235
    Twisted             24.3.0
    typing_extensions   4.10.0
    ubuntu-pro-client   8001
    unattended-upgrades 0.1
    urllib3             2.0.7
    virtualenv          20.25.0+ds
    wadllib             1.3.6
    wheel               0.42.0
    zope.interface      6.1
    ```
  - ***Command:*** 
    ```
    madireddydevops@MadireddyOmen:~$ mkdir -p pythonVenv/BOTO3
    madireddydevops@MadireddyOmen:~$ python3 -m venv ./pythonVenv/BOTO3/
    ```
  - ***Command:***
    ```
    madireddydevops@MadireddyOmen:~/pythonVenv/BOTO3$ ls -lrth
    
    ```
  - ***Output:***
    ```
    total 16K
    lrwxrwxrwx 1 madireddydevops madireddydevops    3 Sep  4 13:24 lib64 -> lib
    drwxr-xr-x 3 madireddydevops madireddydevops 4.0K Sep  4 13:24 lib
    drwxr-xr-x 3 madireddydevops madireddydevops 4.0K Sep  4 13:24 include
    -rw-r--r-- 1 madireddydevops madireddydevops  177 Sep  4 13:26 pyvenv.cfg
    drwxr-xr-x 2 madireddydevops madireddydevops 4.0K Sep  4 13:26 bin
    ```
- To activate the Virtual Environment in Python
  - ***Command:***
    ```
    madireddydevops@MadireddyOmen:~$ source pythonVenv/BOTO3/bin/activate
    
    ```
- Now list in the BOTO3
  - ***Command:***
    ```
    (BOTO3) madireddydevops@MadireddyOmen:~$ pip list
    ```
  - ***Output:***
    ```
    Package Version
    ------- -------
    pip     24.0
    ```
- Now we will install pip packages using requirements.txt
  - ***Requirements.txt***
    ```
    boto==2.49.0
    ipython==8.27.0
    fastapi==0.112.2
    Faker==28.1.0
    requests==2.32.3
    python-dotenv==1.0.1
    botocore==1.35.11
    jupyter==1.1.1
    ```
  - ***Command:***
    ```
    (BOTO3) madireddydevops@MadireddyOmen:~$ pip install -r pythonVenv/BOTO3/req.txt
    #By this command not only given packages dependencies also will get installed
    ```
  - ***Output:***
    ```
    Successfully installed Faker-28.1.0 annotated-types-0.7.0 anyio-4.4.0 asttokens-2.4.1 boto-2.49.0 botocore-1.35.11 certifi-2024.8.30 charset-normalizer-3.3.2 decorator-5.1.1 executing-2.1.0 fastapi-0.112.2 idna-3.8 ipython-8.27.0 jedi-0.19.1 jmespath-1.0.1 matplotlib-inline-0.1.7 parso-0.8.4 pexpect-4.9.0 prompt-toolkit-3.0.47 ptyprocess-0.7.0 pure-eval-0.2.3 pydantic-2.8.2 pydantic-core-2.20.1 pygments-2.18.0 python-dateutil-2.9.0.post0 python-dotenv-1.0.1 requests-2.32.3 six-1.16.0 sniffio-1.3.1 stack-data-0.6.3 starlette-0.38.4 traitlets-5.14.3 typing-extensions-4.12.2 urllib3-2.2.2 wcwidth-0.2.13
    
    ```
- Now if you list in BOTO3 Venv the pakages will be listed.
  - ***Commadn:***
    ```
    (BOTO3) madireddydevops@MadireddyOmen:~$ pip list
    
    ```
  - ***Output:***
    ```
    Package                   Version
    ------------------------- --------------
    annotated-types           0.7.0
    anyio                     4.4.0
    argon2-cffi               23.1.0
    argon2-cffi-bindings      21.2.0
    arrow                     1.3.0
    asttokens                 2.4.1
    async-lru                 2.0.4
    attrs                     24.2.0
    babel                     2.16.0
    beautifulsoup4            4.12.3
    bleach                    6.1.0
    boto                      2.49.0
    botocore                  1.35.11
    certifi                   2024.8.30
    cffi                      1.17.0
    charset-normalizer        3.3.2
    comm                      0.2.2
    debugpy                   1.8.5
    decorator                 5.1.1
    defusedxml                0.7.1
    executing                 2.1.0
    Faker                     28.1.0
    fastapi                   0.112.2
    fastjsonschema            2.20.0
    fqdn                      1.5.1
    h11                       0.14.0
    httpcore                  1.0.5
    httpx                     0.27.2
    idna                      3.8
    ipykernel                 6.29.5
    ipython                   8.27.0
    ipywidgets                8.1.5
    isoduration               20.11.0
    jedi                      0.19.1
    Jinja2                    3.1.4
    jmespath                  1.0.1
    json5                     0.9.25
    jsonpointer               3.0.0
    jsonschema                4.23.0
    jsonschema-specifications 2023.12.1
    jupyter                   1.1.1
    jupyter_client            8.6.2
    jupyter-console           6.6.3
    jupyter_core              5.7.2
    jupyter-events            0.10.0
    jupyter-lsp               2.2.5
    jupyter_server            2.14.2
    jupyter_server_terminals  0.5.3
    jupyterlab                4.2.5
    jupyterlab_pygments       0.3.0
    jupyterlab_server         2.27.3
    jupyterlab_widgets        3.0.13
    MarkupSafe                2.1.5
    matplotlib-inline         0.1.7
    mistune                   3.0.2
    nbclient                  0.10.0
    nbconvert                 7.16.4
    nbformat                  5.10.4
    nest-asyncio              1.6.0
    notebook                  7.2.2
    notebook_shim             0.2.4
    overrides                 7.7.0
    packaging                 24.1
    pandocfilters             1.5.1
    parso                     0.8.4
    pexpect                   4.9.0
    pip                       24.0
    platformdirs              4.2.2
    prometheus_client         0.20.0
    prompt_toolkit            3.0.47
    psutil                    6.0.0
    ptyprocess                0.7.0
    pure_eval                 0.2.3
    pycparser                 2.22
    pydantic                  2.8.2
    pydantic_core             2.20.1
    Pygments                  2.18.0
    python-dateutil           2.9.0.post0
    python-dotenv             1.0.1
    python-json-logger        2.0.7
    PyYAML                    6.0.2
    pyzmq                     26.2.0
    referencing               0.35.1
    requests                  2.32.3
    rfc3339-validator         0.1.4
    rfc3986-validator         0.1.1
    rpds-py                   0.20.0
    Send2Trash                1.8.3
    setuptools                74.1.1
    six                       1.16.0
    sniffio                   1.3.1
    soupsieve                 2.6
    stack-data                0.6.3
    starlette                 0.38.4
    terminado                 0.18.1
    tinycss2                  1.3.0
    tornado                   6.4.1
    traitlets                 5.14.3
    types-python-dateutil     2.9.0.20240821
    typing_extensions         4.12.2
    uri-template              1.3.0
    urllib3                   2.2.2
    wcwidth                   0.2.13
    webcolors                 24.8.0
    webencodings              0.5.1
    websocket-client          1.8.0
    widgetsnbextension        4.0.13
    ```
- Deactivating the Virtual Environment BOTO3
  - ***Command:***
    ```
    (BOTO3) madireddydevops@MadireddyOmen:~$ deactivate
    
    ```
- Now listing pip see that less modules will be there
  - ***Command:***
    ```
    madireddydevops@MadireddyOmen:~$ pip list
    
    ```
  - ***Output:***
    ```
    Package             Version
    ------------------- -------------
    attrs               23.2.0
    Automat             22.10.0
    Babel               2.10.3
    bcrypt              3.2.2
    blinker             1.7.0
    certifi             2023.11.17
    chardet             5.2.0
    click               8.1.6
    cloud-init          24.1.3
    colorama            0.4.6
    command-not-found   0.3
    configobj           5.0.8
    constantly          23.10.4
    cryptography        41.0.7
    dbus-python         1.3.2
    distlib             0.3.8
    distro              1.9.0
    distro-info         1.7+build1
    filelock            3.13.1
    httplib2            0.20.4
    hyperlink           21.0.0
    idna                3.6
    incremental         22.10.0
    Jinja2              3.1.2
    jsonpatch           1.32
    jsonpointer         2.0
    jsonschema          4.10.3
    launchpadlib        1.11.0
    lazr.restfulclient  0.14.6
    lazr.uri            1.0.6
    markdown-it-py      3.0.0
    MarkupSafe          2.1.5
    mdurl               0.1.2
    netifaces           0.11.0
    oauthlib            3.2.2
    pip                 24.0
    platformdirs        4.2.0
    pyasn1              0.4.8
    pyasn1-modules      0.2.8
    pycurl              7.45.3
    Pygments            2.17.2
    PyGObject           3.48.2
    PyHamcrest          2.1.0
    PyJWT               2.7.0
    pyOpenSSL           23.2.0
    pyparsing           3.1.1
    pyrsistent          0.20.0
    pyserial            3.5
    python-apt          2.7.7+ubuntu1
    pytz                2024.1
    PyYAML              6.0.1
    requests            2.31.0
    rich                13.7.1
    service-identity    24.1.0
    setuptools          68.1.2
    six                 1.16.0
    systemd-python      235
    Twisted             24.3.0
    typing_extensions   4.10.0
    ubuntu-pro-client   8001
    unattended-upgrades 0.1
    urllib3             2.0.7
    virtualenv          20.25.0+ds
    wadllib             1.3.6
    wheel               0.42.0
    zope.interface      6.1
    ```
- Now we need to work on IPython but in normal env it is not listed
  - ***Command:***
    ```
    madireddydevops@MadireddyOmen:~$ pip list|grep -i python
    
    ```
  - ***Output:***
    ```
    dbus-python         1.3.2
    python-apt          2.7.7+ubuntu1
    systemd-python      235
    ```
- So again we move to BOTO3 Environment
  - ***Command:***
    ```
    madireddydevops@MadireddyOmen:~$ source pythonVenv/BOTO3/bin/activate
    
    ```
  - ***Output:****
    ```
    (BOTO3) madireddydevops@MadireddyOmen:~$
    
    ```
- Now we list it in BOTO3 Env
  - ***Command:***
    ```
    (BOTO3) madireddydevops@MadireddyOmen:~$ pip list|grep -i Ipython
    ```
  - ***Output:****
    ```
    
    ipython                   8.27.0
    ```
- Now we will go into IPython
  - ***Command:***
    ```
    (BOTO3) madireddydevops@MadireddyOmen:~$ python -m IPython
    
    ```
  - ***Output:***
    ```
    Python 3.12.3 (main, Jul 31 2024, 17:43:48) [GCC 13.2.0]
    Type 'copyright', 'credits' or 'license' for more information
    IPython 8.27.0 -- An enhanced Interactive Python. Type '?' for help.
    
    In [1]:
    ```
- Now we shall use sample code in here
- Now mainthing is with IPython is indentation is easy.
  ```
  (BOTO3) madireddydevops@MadireddyOmen:~$ python -m IPython
  Python 3.12.3 (main, Jul 31 2024, 17:43:48) [GCC 13.2.0]
  Type 'copyright', 'credits' or 'license' for more information
  IPython 8.27.0 -- An enhanced Interactive Python. Type '?' for help.
  
  In [1]: def hello(num):
     ...:     if num % 2 == 0:
     ...:         return f"{num} is an EVEN"
     ...:     else:
     ...:         return f"{num} is an ODD"
     ...:
  
  In [2]: hello(234)
  Out[2]: '234 is an EVEN'
  
  In [3]:
  ```
  ```
  In [12]: def hello(*nums):
    ...:     EVEN_NUM = []
    ...:     ODD_NUM = []
    ...:     for num in nums:
    ...:         if num % 2 == 0:
    ...:             EVEN_NUM.append(num)
    ...:         else:
    ...:             ODD_NUM.append(num)
    ...:     return f'The EVEN nums are {EVEN_NUM} &  The ODD nums are {ODD_NUM}'
    ...:

  In [13]: hello(1, 2, 3, 5, 66, 88, 99)
  Out[13]: 'The EVEN nums are [2, 66, 88] &  The ODD nums are [1, 3, 5, 99]'
  ```
## Python Strings
  - ***Single Line String:***
    ```
    name = 'Anil Kumar Reddy'
    name1 = "Madireddy Anil Kumar"
    ```
  - ***Multiline String:***
    ```
    name = '''
    Anil Kumar Reddy
    Madireddy Anil Kumar
    '''
    ```
```
```

## Python List
  ```
  aws_regions = ["us-east-1", "us-west-1", "us-west-2", "eu-west-1", "eu-central-1"]
  print("Type of aws_regions: ", type(aws_regions))   # Type of aws_regions:  <class 'list'>
  print("Regions:", aws_regions)  # Regions: ['us-east-1', 'us-west-1', 'us-west-2', 'eu-west-1', 'eu-central-1']
  print("First region:", aws_regions[0])  # First region: us-east-1
  print("Second region:", aws_regions[1]) # Second region: us-west-1
  print("Third region:", aws_regions[2])  # Third region: us-west-2
  print("Fourth region:", aws_regions[3]) # Fourth region: eu-west-1
  print("Fifth region:", aws_regions[4])  # Fifth region: eu-central-1
  print("Last region:", aws_regions[-1])  # Last region: eu-central-1
  print("Second to last region:", aws_regions[-2])    # Second to last region: eu-west-1
  print("Third to last region:", aws_regions[-3])     # Third to last region: us-west-2
  print("Fourth to last region:", aws_regions[-4])    # Fourth to last region: us-west-1
  print("Fifth to last region:", aws_regions[-5])     # Fifth to last region: us-east-1
  print("Second to fifth region:", aws_regions[2:5])  # Second to fifth region: ['us-west-2', 'eu-west-1', 'eu-central-1']
  print("Second to fourth region:", aws_regions[2:4]) # Second to fourth region: ['us-west-2', 'eu-west-1'] 
  print("First to fourth region:", aws_regions[:4])   # First to fourth region: ['us-east-1', 'us-west-1', 'us-west-2', 'eu-west-1']       
  print("Third to last region:", aws_regions[2:])     # Third to last region: ['us-west-2', 'eu-west-1', 'eu-central-1']
  print("Second to last region:", aws_regions[-4:-1]) # Second to last region: ['us-west-2', 'eu-west-1', 'eu-central-1']
  print("Third to last region:", aws_regions[-4:-2])  # Third to last region: ['us-west-2', 'eu-west-1']
  print("Fourth to last region:", aws_regions[-4:])   # Fourth to last region: ['us-west-2', 'eu-west-1', 'eu-central-1']
  print("Length of aws_regions:", len(aws_regions))   # Length of aws_regions: 5
  aws_regions.append("ap-southeast-1")    # Add an element to the end of the list using append method
  print("Regions:", aws_regions)  # Regions: ['us-east-1', 'us-west-1', 'us-west-2', 'eu-west-1', 'eu-central-1', 'ap-southeast-1']
  aws_regions.insert(2, "ap-southeast-2") # Add an element to a specific index using insert method
  print("Regions:", aws_regions)  # Regions: ['us-east-1', 'us-west-1', 'ap-southeast-2', 'us-west-2', 'eu-west-1', 'eu-central-1', 'ap-southeast-1']
  aws_regions.remove("us-west-2") # Remove an element by value
  print("Regions:", aws_regions)  # Regions: ['us-east-1', 'us-west-1', 'ap-southeast-2', 'eu-west-1', 'eu-central-1', 'ap-southeast-1']
  aws_regions.pop()   # Remove the last element
  print("Regions:", aws_regions)  # Regions: ['us-east-1', 'us-west-1', 'ap-southeast-2', 'eu-west-1', 'eu-central-1']
  aws_regions.pop(2)  # Remove an element by index
  print("Regions:", aws_regions)  # Regions: ['us-east-1', 'us-west-1', 'eu-west-1', 'eu-central-1']
  aws_regions.reverse()   # Reverse the list
  print("Regions:", aws_regions)  # Regions: ['eu-central-1', 'eu-west-1', 'us-west-1', 'us-east-1']
  aws_regions.sort()  # Sort the list
  print("Regions:", aws_regions)  # Regions: ['eu-central-1', 'eu-west-1', 'us-east-1', 'us-west-1']
  aws_regions.sort(reverse=True)  # Sort the list in reverse order
  print("Regions:", aws_regions)  # Regions: ['us-west-1', 'us-east-1', 'eu-west-1', 'eu-central-1']
  aws_regions.clear() # Remove all elements from the list
  print("Regions:", aws_regions)  # Regions: []
  # aws_regions[0] = "us-east-2" # This will throw an error as list is mutable
  ```

## Python Tuple:
  ```
  # Tuple:
  # 1. Tuple is a collection of items.
  # 2. Tuple is immutable. It means that we cannot change the elements of a tuple once it is assigned.
  # 3. Tuple is ordered. It means that the items have a defined order, and that order will not change.
  # 4. Tuple items are indexed, the first item has index [0], the second item has index [1] and so on.
  # 5. Tuple allows duplicate values.
  # 6. Tuple allows different data types.
  # 7. Tuple allows nested tuple.
  # 8. Tuple is written with round brackets.
  # # Create a Tuple:
  import sys
  tuple_1 = (1,2,3)
  size_of_tuple = sys.getsizeof(tuple_1)  # 72
  print("Tuple:",tuple_1)  # (1, 2, 3)
  # # Tuple allows duplicate values.
  tuple_2 = (1,2,3,1,2,3)
  print("Tuple:",tuple_2)  # (1, 2, 3, 1, 2, 3)
  # # Tuple allows different data types.
  tuple_3 = (1,2,3,"Hello","World")
  print("Tuple:",tuple_3)  # (1, 2, 3, 'Hello', 'World')
  # # Tuple allows nested tuple.
  tuple_4 = (1,2,3,(4,5,6))   # (1, 2, 3, (4, 5, 6))
  print("Tuple:",tuple_4) # (1, 2, 3, (4, 5, 6))
  # # Tuple is ordered. It means that the items have a defined order, and that order will not change.
  tuple_5 = (1,2,3)
  print("Tuple:",tuple_5)  # (1, 2, 3)
  # # Tuple items are indexed, the first item has index [0], the second item has index [1] and so on.
  print("Tuple:",tuple_5[0])    # 1
  print("Tuple:",tuple_5[1])    # 2
  print("Tuple:",tuple_5[2])    # 3
  # # Tuple is immutable. It means that we cannot change the elements of a tuple once it is assigned.
  # # tuple_5[0] = 4 # TypeError: 'tuple' object does not support item assignment
  # # Tuple is written with round brackets.
  tuple_6 = (1,2,3)
  print("Tuple:",tuple_6)  # (1, 2, 3)
  # # Tuple is written with round brackets.
  tuple_7 = 1,2,3
  print("Tuple:",tuple_7)  # (1, 2, 3)
  # # Tuple is written with round brackets.
  tuple_8 = (1)
  print("Tuple:",tuple_8)  # 1
  # # Tuple Methods:
  # # Tuple has only two methods. count() and index().
  # # count() method returns the number of times a specified value appears in the tuple.
  # # index() method returns the index of the specified value.
  
  # Tuple Operations:
  # # 1. Tuple Concatenation:
  tuple_9 = (1,2,3)
  tuple_10 = (4,5,6)
  tuple_11 = tuple_9 + tuple_10
  print("Tuple:",tuple_11)    # (1, 2, 3, 4, 5, 6)
  # # 2. Tuple Repetition:
  tuple_12 = (1,2,3)
  tuple_13 = tuple_12 * 3
  print("Tuple:",tuple_13)    # (1, 2, 3, 1, 2, 3, 1, 2, 3)
  # # 3. Tuple Membership:
  tuple_14 = (1,2,3)
  print(1 in tuple_14)    # True
  print(4 in tuple_14)    # False
  # # 4. Tuple Iteration:
  tuple_15 = (1,2,3)
  for i in tuple_15:
      print(i)
  # # 5. Tuple Length:
  tuple_16 = (1,2,3)
  print(len(tuple_16))    # 3
  # # 6. Tuple Slicing:
  tuple_17 = (1,2,3,4,5,6)
  print("Tuple:",tuple_17[1:4])  # (2, 3, 4)
  # # 7. Tuple Sorting:
  tuple_18 = (4,2,1,3,5)
  print("Tuple:",sorted(tuple_18))   # [1, 2, 3, 4, 5]
  # # 8. Tuple Reverse:
  tuple_19 = (1,2,3,4,5)
  print("Tuple:",tuple_19[::-1])    # (5, 4, 3, 2, 1)
  # # 9. Tuple Clear:
  # # tuple_19.clear() # AttributeError: 'tuple' object has no attribute 'clear'
  # # 10. Tuple Copy:
  tuple_20 = (1,2,3)
  tuple_21 = tuple_20
  print("Tuple:",tuple_21)    # (1, 2, 3)
  # # Tuple Unpacking:
  # # Tuple unpacking is also possible in Python.
  # # # Unpacking a Tuple:
  tuple_22 = (1,2,3)
  a,b,c = tuple_22
  print("Tuple:",a)   # 1
  print("Tuple:",b)   # 2
  print("Tuple:",c)   # 3
  # # Tuple Packing:
  # # Tuple packing is the reverse of tuple unpacking.
  # # # Packing a Tuple:
  a = 1
  b = 2
  c = 3
  tuple_23 = a,b,c
  print("Tuple:",tuple_23)    # (1, 2, 3)
  # # Tuple Comparison:
  # # Tuple comparison is similar to list comparison.
  # # # Compare two tuples:
  tuple_24 = (1,2,3)
  tuple_25 = (1,2,3)
  print(tuple_24 == tuple_25) # True
  ```


  

# 32. Amazon EventBridge

- If any user creates EBS VOlume other than gp2 & gp3, it should be deleted.(Event Driven)
- If any user creates EBS Volume and dont attach in a min, it should be deleted. (Scheduled Lambda run)

## 32.1. EventBridge:

- Open Event Bridge
  ![1398](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1398.png)
- If you see in cloud Trail Every event will be recorded.
  ![1399](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1399.png)

### 32.1.1. Volume Creation:

- Click on Create volume button
  ![1400](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1400.png)
  ![1401](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1401.png)
  ![1402](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1402.png)
  ![1403](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1403.png)
- After volume creation you can see the event recorded.
  ![1404](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1404.png)
- Now if you list volumes in CLI
  ***Command:***
  ```
  (BOTO3) madireddydevops@MadireddyOmen:~$ aws ec2 describe-volumes --region us-east-1
  
  ```
  ***Output:***
  ```
  {
      "Volumes": [
          {
              "Attachments": [],
              "AvailabilityZone": "us-east-1a",
              "CreateTime": "2024-09-10T07:22:01.312000+00:00",
              "Encrypted": false,
              "Size": 100,
              "SnapshotId": "",
              "State": "available",
              "VolumeId": "vol-03a7457d79e70246e",
              "Iops": 3000,
              "VolumeType": "io1",
              "MultiAttachEnabled": false
          }
      ]
  }
  ```

### IPYTHON Test Executions:

- Sample IPYTHON Executions for testing.
  ***IPython Commands:***
  ```
  (BOTO3) madireddydevops@MadireddyOmen:~$ python -m IPython
  Python 3.12.3 (main, Jul 31 2024, 17:43:48) [GCC 13.2.0]
  Type 'copyright', 'credits' or 'license' for more information
  IPython 8.27.0 -- An enhanced Interactive Python. Type '?' for help.
  
  In [1]: import boto3
  
  In [2]: r = boto3.client('ec2', region_name="us-east-1")
  
  In [3]: r.describe_volumes()
  ```
  ***Output:***
  ```
  Out[3]:
  {'Volumes': [{'Attachments': [],
     'AvailabilityZone': 'us-east-1a',
     'CreateTime': datetime.datetime(2024, 9, 10, 7, 22, 1, 312000, tzinfo=tzlocal()),
     'Encrypted': False,
     'Size': 100,
     'SnapshotId': '',
     'State': 'available',
     'VolumeId': 'vol-03a7457d79e70246e',
     'Iops': 3000,
     'VolumeType': 'io1',
     'MultiAttachEnabled': False}],
   'ResponseMetadata': {'RequestId': '2e4d7b29-201f-4724-a454-18ad3422ac40',
    'HTTPStatusCode': 200,
    'HTTPHeaders': {'x-amzn-requestid': '2e4d7b29-201f-4724-a454-18ad3422ac40',
     'cache-control': 'no-cache, no-store',
     'strict-transport-security': 'max-age=31536000; includeSubDomains',
     'content-type': 'text/xml;charset=UTF-8',
     'content-length': '562',
     'date': 'Tue, 10 Sep 2024 07:52:24 GMT',
     'server': 'AmazonEC2'},
    'RetryAttempts': 0}}
  ```
  ***IPython Commands:***
  ```
  In [4]: r.describe_volumes().keys()
  
  ```
  ***Output:***
  ```
  Out[4]: dict_keys(['Volumes', 'ResponseMetadata'])
  ```
  ***IPython Commands:***
  ```
  In [5]: r.describe_volumes().get('Volumes')
  
  ```
  ***Output:***
  ```
  Out[5]:
  [{'Attachments': [],
    'AvailabilityZone': 'us-east-1a',
    'CreateTime': datetime.datetime(2024, 9, 10, 7, 22, 1, 312000, tzinfo=tzlocal()),
    'Encrypted': False,
    'Size': 100,
    'SnapshotId': '',
    'State': 'available',
    'VolumeId': 'vol-03a7457d79e70246e',
    'Iops': 3000,
    'VolumeType': 'io1',
    'MultiAttachEnabled': False}]
  ```
  ***IPython Commands:***
  ```
  In [9]: for volumes in r.describe_volumes().get('Volumes'):
     ...:     print(volumes['VolumeId'])
     ...:
  ```
  ***Output:***
  ```
  vol-03a7457d79e70246e
  
  ```

### 32.1.2. AWS Lambda Creation:

- Click on ```Create a function``` button
  ![1405](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1405.png)
  ![1406](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1406.png)
- Add the below code in the function.
  ***Delete-EBS-Volume.py***
  ```
  # program to delete the Volumes other than gp2 and gp3 next minute when they have created.
  import json
  import boto3
  import time
  
  def lambda_handler(event, context):
      time.sleep(4)
      print(event)
      string = " ".join(event['resources'])
      volid = string.split("/", 1)[1]
      print(volid)
      client = boto3.client('ec2', region_name='us-east-1')
      vols = client.describe_volumes(VolumeIds=[volid])
      vsize = vols['Volumes'][0]['Size']
      vid = vols['Volumes'][0]['VolumeId']
      vtype = vols['Volumes'][0]['VolumeType']
      if vtype == "gp2" or vtype == "gp3":
          print(f"The Volume {vid} is {vtype} Volume and hence is a valid Volume.")
      else:
          print(f"The Volume {vid} don't belong to gp2 or gp3 and hence will be deleted.")
          client.delete_volume( VolumeId=vid)
  ```
  ![1407](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/940-1407/1407.png)

### 32.1.3. Lambda Role Permission providing:

- Giving permissions to the role which is attached to lambda.
  ![1408](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1408.png)
  ![14089](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1409.png)
  ![1410](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1410.png)
  ![1411](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1411.png)

### 32.1.4. Amazon EventBridge Rules Creation:

- Click on ```Create rule``` button
  ![1412](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1412.png)
  ![1413](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1413.png)
  ![1414](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1414.png)
  ![1415](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1415.png)
  ![1416](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1416.png)
  ![1417](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1417.png)
  ![1418](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1418.png)
  ![1419](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1419.png)
  ![1420](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1420.png)

- Log groups will be created
  ![1425](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1425.png)
- Changing the lambda time out to 1 min as it is mentioned in python code
  ![1424](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1424.png)
  ![1426](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1426.png)
  ![1427](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1427.png)

### 32.1.5. Testing the Event Bridge:

- Now create a volume and see then the volume will get deleted
  ![1421](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1421.png)
  ![1422](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1422.png)
  ![1423](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1423.png)
  ![1428](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1428.png)

## 32.2. Scheduled Events:

### 32.2.1 Lambda Function Creation:

- Click on ```Create function``` button.
  ![1429](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1429.png)
  ![1430](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1430.png)

- Create volumes for testing the function.
  ![1430-1](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1430-1.png)

- paste the below code for Testing the function.

  ***03-delete-ebs-unatt-multi-region.py***
  ```
  import json
  import boto3
  import time
  regions = ['us-east-1','us-east-2','ap-south-1']
  def lambda_handler(event, context):
      for reg in regions:
          client = boto3.client('ec2',region_name=reg)
          resp = client.describe_volumes().get('Volumes',[])
          unattachedvols = []
          for vol in resp:
            if len(vol['Attachments']) == 0:
               volid = vol['VolumeId']
               print(f"Volume {volid} is not attached and will be deleted.")
               unattachedvols.append(vol['VolumeId'])
            else:
               volid = vol['VolumeId']
               """print(f"Volume {volid} is attached")"""
          
          ec2_resource = boto3.resource('ec2', region_name=reg)
          if  len(unattachedvols) != 0:
              print(f"The Volumes which are not attached and will be deleted are {unattachedvols} in {reg}.")
              for vol in unattachedvols:
                volume = ec2_resource.Volume(vol)
                volume.delete()
          else:
              print(f'NO UNATTACHED VOLUME TO DELETE IN REGION {reg}')
  ```
  ![1431](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1431.png)
  ![1432](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1432.png)
  ![1433](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1433.png)
  ![1434](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1434.png)

### 32.2.2 Scheduling the Function:

- Click on create rule.
  ![1435](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1435.png)
  ![1436](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1436.png)
  ![1437](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1437.png)
  ![1438](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1438.png)
  ![1439](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1439.png)
  ![1440](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1440.png)
  ![1441](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1441.png)
  ![1442](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1442.png)
  ![1443](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1443.png)
  ![1444](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Notes-Images/1408-1444/1444.png)
- Now create ther few volumes which are unattached all will be deleted in few min as scheduled.

  
    
    
