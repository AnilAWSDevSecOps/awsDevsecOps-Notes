# 14. AWS Network Firewalls:
- Firewalls are of two types 
  - Stateful Firewall: Stateful firewall will Allow Request’s Response either in or out. Stateful firewall are Security Groups.
  - Stateless Firewall: Stateless Firewall will not allow Request’s Response either in or out. Stateless Firewall are AWS Network Access Control List (NACL)
![299](https://github.com/user-attachments/assets/6e7b525a-ed07-429c-8f39-6bd96cbd6923)

- AWS Security Groups:
  Most of the services in AWS like EC2, Load balancers, Data Base, Lambda...Etc., uses the Security Groups except the Subnets. Security Group is VPC scoped.
- AWS Network Access Control List (NACL):
  This is used only in Subnets and Not used much in other services. NACL is VPC scoped


### 14.1. Network Creation For Firewall Setup:
- Security Groups are VPC scoped i.e. they work only within the VPCs but Firewalls can be Implemented for multiple VPCs i.e. network level we can implement security using firewalls.
- For implementing this firewall, we will Create One VPC with Two Subnets Private and Public
  ![300](https://github.com/user-attachments/assets/8f08f699-08ef-4bda-9b86-f15f6b874dd9)

- VPC Created successfully.
  ![301](https://github.com/user-attachments/assets/99e1ec20-b879-45dd-bec9-55bfd59d97bc)

- We will rename subnets Public Subnet as Firewall-subnet and private subnet as Protected-subnet.
  ![302](https://github.com/user-attachments/assets/ada13baf-9c3d-4c05-8837-dfbfc461067f)

- Now we will launch one windows server in Protected Subnet to block the websites but Sg and NACL will never block the websites.
  ![303](https://github.com/user-attachments/assets/a5e071f4-18e1-4fc2-9d99-2d89f31cd91b)

- Fill in the details in screenshot
  ![304](https://github.com/user-attachments/assets/0f0ffb44-fabf-41ab-9fb1-c25e8a63cd53)

- Fill the details in screenshot and we are creating new Security group and then launch the instance.
  ![305](https://github.com/user-attachments/assets/be85acaf-ad87-4f42-8d37-f299d625f000)

## 14.1.1 Rule Groups Creation:
### 14.1.1.1 Doamin List Rule Group Format:
- Goto Network Firewall: Rule groups and create one.
  ![306](https://github.com/user-attachments/assets/c6c75690-3327-4f13-b38c-edffef29f8d6)

- AWS Network Firewall will disable all traffic by default. Create Firewall Rule Group and select Domain list and provide the domain names which need to be Allowed.
  - facebook.com
  - amazon.com
  - flipkart.com
- Fill in the details as shown in screenshot.
  ![307](https://github.com/user-attachments/assets/d02c4e53-861d-4bde-8995-4a1bd8bb544b)

- Fill in the details as shown
  ![308](https://github.com/user-attachments/assets/e4f2838c-7239-42af-92e6-3a6cfb671631)

- Fill in the details as shown. And Next
  ![309](https://github.com/user-attachments/assets/12cfc467-b269-4b5e-afd5-c426b1b83eea)

- Click Next.
  
  ![310](https://github.com/user-attachments/assets/aff57c90-27fa-4c09-a463-dce97da2e095)

- Click Next. And then click on Create Rule Group button.
  ![311](https://github.com/user-attachments/assets/7430d239-5416-42e7-84ff-ea1a9a7e062f)

- This is what which we created and create new one by clicking the Create button.
  ![312](https://github.com/user-attachments/assets/b8c23619-ba89-492e-80ad-8c87fb7bfafb)

### 14.1.1.2 Standard Stateful Rule Group Format:
- Fill in the details. Click on Next.
  ![313](https://github.com/user-attachments/assets/c731d161-57e0-4850-8681-51353270688b)

- Fill in the details and Next.
- Note: Capacity value is 100 not 1.
  ![314](https://github.com/user-attachments/assets/ad36565c-2591-467f-9c12-94eeb2431474)

- Fill in the details as shown. And add rule.
  ![315](https://github.com/user-attachments/assets/e00f31be-d1e8-478a-977e-04cca4709755)

- Add another rule by filling the details shown.
  ![316](https://github.com/user-attachments/assets/fefeb05f-ace9-4844-ba2c-c794d007bd51)

- After adding rules check and click Next.
  
  ![317](https://github.com/user-attachments/assets/9086fd4b-ffd1-4c68-a4be-40e8ee76f281)

- Click Next.
  
  ![318](https://github.com/user-attachments/assets/5d6a19a9-3980-4a84-8c43-9179380028a0)

- Click Next.
  
  ![319](https://github.com/user-attachments/assets/68776391-1a09-438a-a885-8a3fd88702bb)

- Click on create button.
  ![320](https://github.com/user-attachments/assets/3a8feec6-c339-4d72-88e2-17bdc67af392)

- Created two rule Groups.
  ![321](https://github.com/user-attachments/assets/6f93d3c6-7597-4cf4-b573-26b4360fa4b5)

## 14.2 Firewall Policy Creation:
- Now come to Firewall Policies create one.
  ![322](https://github.com/user-attachments/assets/52023e83-18d8-4d2e-9dd4-925e3216e5d2)

- Fill in the details shown. Click Next.
  ![323](https://github.com/user-attachments/assets/b48e0915-c79e-4db8-918d-4a8ad6a8b4a3)

- Scroll down to Stateful rule group and click on Add Stateful rule group button.
  ![324](https://github.com/user-attachments/assets/557f0d7c-3090-44b3-a19e-9d3e4a9361a1)

- Add both rules which we created earlier, click on Add rule groups.
  ![325](https://github.com/user-attachments/assets/d29c97cd-41ca-4b9c-8841-e6aa1ad4315d)

- Click on Next, Next, Next, Create Firewall Policy buttons.
  ![326](https://github.com/user-attachments/assets/43e76ed1-f63d-41fd-92d9-e7f9a0fa0427)

- Firewall policy that we created.
  ![327](https://github.com/user-attachments/assets/077bae7a-8776-4c55-aa20-8f9e8d1f49ed)

## 14.3 Firewall Creation:
- Now we will create the firewall
  ![328](https://github.com/user-attachments/assets/5dfc437b-da76-4b2c-86d9-3c74c4f6bb54)

- Fill in the details.
  
  ![329](https://github.com/user-attachments/assets/9e2848db-0b92-480d-9cbd-1ab37fdeea8b)

- Fill in the details.
  
  ![330](https://github.com/user-attachments/assets/553d5911-86c1-4307-bf02-8c0019412a34)

- Fill in the details.
  
  ![331](https://github.com/user-attachments/assets/524283b7-7bd6-4620-a580-c759ffcd169f)

- Attaching the firewall policy which created earlier. Next and Create Firewall.
- It Will take few min to get firewall deployed.
  ![332](https://github.com/user-attachments/assets/8534170b-3f2d-4baf-91f0-55f36b6e0d84)

- Sample Firewall Demo Diagram
  ![333](https://github.com/user-attachments/assets/53919b5f-54a0-4876-acce-33d65fd1705e)

- It is still in provisioning will take time to create firewall.
  ![334](https://github.com/user-attachments/assets/9a1ad414-3e7d-423f-b0e4-28a70cc6763c)

- This will create end point.
  ![335](https://github.com/user-attachments/assets/b9e4565f-6796-4f3d-927b-e7282fc7208e)
  ![336](https://github.com/user-attachments/assets/7e4881d4-8abb-45fb-a752-514205a60799)

- Firewall is ready now go to route tables.
  ![337](https://github.com/user-attachments/assets/0fbffc78-85f1-40d8-a7be-406621f5a08e)

## 14.4 Route table Creation for IGW Ingress:
- We will just rename route tables and create new one for IGW ingress for allowing traffic from outside to inside.
  ![338](https://github.com/user-attachments/assets/b4267765-23c0-4790-b57b-3e1a411e66cd)

- Fill the Name, VPC and click on Create button.
  ![339](https://github.com/user-attachments/assets/dba55ec1-3262-4d45-a9bc-4ef707e9f2d7)

- Now we need to add routes in all route tables for our vpc.
- First, we will open the Protected-rtb and add the routes.
- Here in this route table, we will add the network interface route 
  ![340](https://github.com/user-attachments/assets/266444b0-34f3-4c83-a3d7-b6e0310f3b67)

- Collect the Network Interface ID and add it in the above route table. Protected-rtb.
  ![341](https://github.com/user-attachments/assets/ea393337-a828-4274-9b1b-fd5ffc6d9023)

- Here we are adding the Network Interface ID which is created automatically while mail firewall creation and, in that firewall, it is attached and we collect that ID and associate here.
  ![342](https://github.com/user-attachments/assets/e6ccc240-8f7b-40ad-8720-9a642ad4cbdb)

- After adding Network Interface ID in Routetables.
  ![343](https://github.com/user-attachments/assets/106ec2b4-de1f-4617-8741-f09325f1f676)

- For Firewall-rtb no need to change anything it already in good shape.
  ![344](https://github.com/user-attachments/assets/633212e4-26ff-4acf-8715-de52e052ba42)

- Now for IGW-Ingress-rtb we need to edit routes and add the same network interface ID here also and also need to edit edge associations.
  ![345](https://github.com/user-attachments/assets/fb0128e6-824c-462e-aa82-1892868f32d3)

- Here we are adding the Network Interface ID which is created automatically while mail firewall creation and, in that firewall, it is attached and we collect that ID and associate here
  ![346](https://github.com/user-attachments/assets/43b8cd7c-91a8-4006-9e46-09fc083cfe0e)

- After adding Network Interface ID in Routetables 
- Now we will edit edge associations in the IGW-Ingress-rtb.
  ![347](https://github.com/user-attachments/assets/817f7b32-deb3-4859-906b-6f26b33b23d6)

- Click on Edit Edge associations button
  ![348](https://github.com/user-attachments/assets/22e0ea70-3cdb-4027-8603-fb9279b324c2)

- Select the IGW and save changes.
  ![349](https://github.com/user-attachments/assets/9aa8e37c-a88c-4e36-9e7c-1f489b0d650a)

- Now connect to the Protected windows server and check the 
- Here in windows browser, you will be able to access only website which you give in the rule group only.
- Here amazon is not given in rule group.
  ![350](https://github.com/user-attachments/assets/2f0a1265-c13b-4b2e-852f-570b9bbe68f2)

- Now we will add amazon in the Firewall rule group
  ![351](https://github.com/user-attachments/assets/d9bcffa8-e1c4-4323-94c9-a97c41af5f9e)

-  Click on edit and add ```.amazon.com ```
  ![352](https://github.com/user-attachments/assets/38dde563-50d4-4bcf-8238-db9b67032bb6)
  ![353](https://github.com/user-attachments/assets/5ee9f433-31b2-4adb-8416-b19954edfc50)

- Added amazon website.
  ![354](https://github.com/user-attachments/assets/270ec031-b680-478e-80aa-9f2d0a518d29)

- Now amazon is loading.
  ![355](https://github.com/user-attachments/assets/24966cae-1936-4fef-8965-4151b491fab6)

- Parallelly we will launch one Linux server in the VPC
  ![356](https://github.com/user-attachments/assets/be5e01fc-0c10-4647-abaa-8786422740c3)

- Launched the Linux server
  ![357](https://github.com/user-attachments/assets/4b0e2852-dd44-4145-a635-e362733dce4c)

- We have connected but not able to access the internet, as it is in protected subnet.
  ![358](https://github.com/user-attachments/assets/856f4f30-cc7a-46f9-ab5e-1ac36a10d5f6)

- So, if you want to enable the traffic out bound you can do that in firewall rule group.
- Click on save rule group after adding the rule.
  ![359](https://github.com/user-attachments/assets/938c19ec-507a-4835-869b-909fddc13729)

- For multiple AZ we will see sample diagram
  ![360](https://github.com/user-attachments/assets/57a48f1f-7265-4ae6-bba7-f1cf7f4e6fb3)
  ![361](https://github.com/user-attachments/assets/7a194960-a513-4e14-9d01-f150e296183a)
