# 14. AWS Network Firewalls:

- Firewalls are of two types
    - Stateful Firewall: Stateful firewall will Allow Request’s Response either in or out. Stateful firewall are
      Security Groups.
    - Stateless Firewall: Stateless Firewall will not allow Request’s Response either in or out. Stateless Firewall are
      AWS Network Access Control List (NACL)
      ![299](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/299.png)

- AWS Security Groups:
  Most of the services in AWS like EC2, Load balancers, Data Base, Lambda...Etc., uses the Security Groups except the
  Subnets. Security Group is VPC scoped.
- AWS Network Access Control List (NACL):
  This is used only in Subnets and Not used much in other services. NACL is VPC scoped

### 14.1. Network Creation For Firewall Setup:

- Security Groups are VPC scoped i.e. they work only within the VPCs but Firewalls can be Implemented for multiple VPCs
  i.e. network level we can implement security using firewalls.
- For implementing this firewall, we will Create One VPC with Two Subnets Private and Public
  ![300](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/300.png)

- VPC Created successfully.
  ![301](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/301.png)

- We will rename subnets Public Subnet as Firewall-subnet and private subnet as Protected-subnet.
  ![302](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/302.png)

- Now we will launch one windows server in Protected Subnet to block the websites but Sg and NACL will never block the
  websites.
  ![303](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/303.png)

- Fill in the details in screenshot
  ![304](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/304.png)

- Fill the details in screenshot and we are creating new Security group and then launch the instance.
  ![305](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/305.png)

## 14.1.1 Rule Groups Creation:

### 14.1.1.1 Doamin List Rule Group Format:

- Goto Network Firewall: Rule groups and create one.
  ![306](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/306.png)

- AWS Network Firewall will disable all traffic by default. Create Firewall Rule Group and select Domain list and
  provide the domain names which need to be Allowed.
    - facebook.com
    - amazon.com
    - flipkart.com
- Fill in the details as shown in screenshot.
  ![307](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/307.png)

- Fill in the details as shown
  ![308](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/308.png)

- Fill in the details as shown. And Next
  ![309](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/309.png)

- Click Next.

  ![310](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/310.png)

- Click Next. And then click on Create Rule Group button.
  ![311](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/311.png)

- This is what which we created and create new one by clicking the Create button.
  ![312](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/312.png)

### 14.1.1.2 Standard Stateful Rule Group Format:

- Fill in the details. Click on Next.
  ![313](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/313.png)

- Fill in the details and Next.
- Note: Capacity value is 100 not 1.
  ![314](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/314.png)

- Fill in the details as shown. And add rule.
  ![315](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/315.png)

- Add another rule by filling the details shown.
  ![316](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/316.png)

- After adding rules check and click Next.

  ![317](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/317.png)

- Click Next.

  ![318](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/318.png)

- Click Next.

  ![319](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/319.png)

- Click on create button.
  ![320](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/320.png)

- Created two rule Groups.
  ![321](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/321.png)

## 14.2 Firewall Policy Creation:

- Now come to Firewall Policies create one.
  ![322](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/322.png)

- Fill in the details shown. Click Next.
  ![323](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/323.png)

- Scroll down to Stateful rule group and click on Add Stateful rule group button.
  ![324](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/324.png)

- Add both rules which we created earlier, click on Add rule groups.
  ![325](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/325.png)

- Click on Next, Next, Next, Create Firewall Policy buttons.
  ![326](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/326.png)

- Firewall policy that we created.
  ![327](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/327.png)

## 14.3 Firewall Creation:

- Now we will create the firewall
  ![328](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/328.png)

- Fill in the details.

  ![329](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/329.png)

- Fill in the details.

  ![330](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/330.png)

- Fill in the details.

  ![331](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/331.png)

- Attaching the firewall policy which created earlier. Next and Create Firewall.
- It Will take few min to get firewall deployed.
  ![332](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/332.png)

- Sample Firewall Demo Diagram
  ![333](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/333.png)

- It is still in provisioning will take time to create firewall.
  ![334](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/334.png)

- This will create end point.
  ![335](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/335.png)
  ![336](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/336.png)

- Firewall is ready now go to route tables.
  ![337](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/337.png)

## 14.4 Route table Creation for IGW Ingress:

- We will just rename route tables and create new one for IGW ingress for allowing traffic from outside to inside.
  ![338](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/338.png)

- Fill the Name, VPC and click on Create button.
  ![339](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/339.png)

- Now we need to add routes in all route tables for our vpc.
- First, we will open the Protected-rtb and add the routes.
- Here in this route table, we will add the network interface route
  ![340](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/340.png)

- Collect the Network Interface ID and add it in the above route table. Protected-rtb.
  ![341](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/341.png)

- Here we are adding the Network Interface ID which is created automatically while mail firewall creation and, in that
  firewall, it is attached and we collect that ID and associate here.
  ![342](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/342.png)

- After adding Network Interface ID in Routetables.
  ![343](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/343.png)

- For Firewall-rtb no need to change anything it already in good shape.
  ![344](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/344.png)

- Now for IGW-Ingress-rtb we need to edit routes and add the same network interface ID here also and also need to edit
  edge associations.
  ![345](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/345.png)

- Here we are adding the Network Interface ID which is created automatically while mail firewall creation and, in that
  firewall, it is attached and we collect that ID and associate here
  ![346](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/346.png)

- After adding Network Interface ID in Routetables
- Now we will edit edge associations in the IGW-Ingress-rtb.
  ![347](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/347.png)

- Click on Edit Edge associations button
  ![348](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/348.png)

- Select the IGW and save changes.
  ![349](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/349.png)

- Now connect to the Protected windows server and check the
- Here in windows browser, you will be able to access only website which you give in the rule group only.
- Here amazon is not given in rule group.
  ![350](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/350.png)

- Now we will add amazon in the Firewall rule group
  ![351](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/351.png)

- Click on edit and add ```.amazon.com ```
  ![352](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/352.png)
  ![353](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/353.png)

- Added amazon website.
  ![354](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/354.png)

- Now amazon is loading.
  ![355](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/355.png)

- Parallelly we will launch one Linux server in the VPC
  ![356](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/356.png)

- Launched the Linux server
  ![357](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/357.png)

- We have connected but not able to access the internet, as it is in protected subnet.
  ![358](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/358.png)

- So, if you want to enable the traffic out bound you can do that in firewall rule group.
- Click on save rule group after adding the rule.
  ![359](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/359.png)

- For multiple AZ we will see sample diagram
  ![360](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/360.png)
  ![361](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/361.png)
