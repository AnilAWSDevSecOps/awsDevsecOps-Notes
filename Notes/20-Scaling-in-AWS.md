# 20. Scaling in AWS:
- Two types of scaling 
  ### 1. Vertical Scaling :
  - Changing instance type to (low to high) or (high to low) is called Vertical scaling. To do this instance stop and start is required. Good for database servers or file servers.
  ![545](https://github.com/user-attachments/assets/70d5197d-621b-4a48-88d9-37579594e759)

  ### 2. Horizontal scaling:
  - Increasing the instance number is called Horizontal scaling. To do this instance stop and start is not required. Good for web servers and app servers

  ### 3. Autoscaling:
  - Adding and removing the instances according to the load is called autoscaling. Adding machines(Scale Out), Removing Machines(Scale In).
  ![546](https://github.com/user-attachments/assets/3c9e448c-3835-43e3-960d-a944b82ea1e5)

## 20.1. Steps to Vertical Scaling:
- Right click on Instance > Instance’s Settings > Change Instance Type. 
- Under New instance type change it to any.
  ![547](https://github.com/user-attachments/assets/b8f32386-70cb-429e-b381-c4fe0392547f)

## 20.2. Steps to Horizontal Scaling:
### 20.2.1 Instance Launching:
- For testing the Horizontal Scaling, we need to launch one t2.medium instance and create one AMI for t2.medium instance with below user data.
  ![548](https://github.com/user-attachments/assets/bc52048c-de02-4827-bec1-f4c40cfc6e70)

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
  ![549](https://github.com/user-attachments/assets/ed57e580-c646-457e-aeb5-7dc99513b4c4)

- Once the machine image is in available status, we will deploy a machine using this AMI
  ![550](https://github.com/user-attachments/assets/36bb3fa2-2823-444e-befd-2404bafd3423)

- Now run ```ansible-playbook /myrepo/playbook.yaml``` command to make nginx colourful.
- Now delete the old server and launch the new server with New Updated image and test and see if nginx is working as here.
  ![551](https://github.com/user-attachments/assets/30650046-b4c6-4793-9936-2f401005ce26)

### 20.2.2 AMI Creation:
- ASG comes under the Horizontal Scaling
- We create one Image from One Instance.
- Fill in the details and click on create image.
  ![552](https://github.com/user-attachments/assets/f9fa26af-1f17-480c-b271-25d18524f041)

- Created the Image successfully. In this Image we have Amazon Linux, t2.micro and Nginx with colour game
  ![553](https://github.com/user-attachments/assets/a9122720-b643-4834-8184-3207d66347d8)

### 20.2.3 Launch Template Creation:
- Creating One Launch Template with the above Amazon-Linux-Nginx-Image
- Under Launch Templates click on Launch Template button.
- Fill in the details like Name, Description, under My AMIs select the Amazon-Linux-Nginx-Image 
  ![554](https://github.com/user-attachments/assets/031a9a1e-a31e-4bcd-9d81-4f6774779ea8)

- Select Instance type
  
  ![555](https://github.com/user-attachments/assets/66e377bf-ad39-45f5-8f0f-6bb69b1b2b69)

- Fill in the details as shown.
- ```Note``` : Don’t include Subnet now coz we need to add subnets in ASG
  ![556](https://github.com/user-attachments/assets/12c41139-dcf9-42bd-8ac1-bf31935e5e55)

- Add user data as shown in below.
- Here in the image already we have used other user data related gitRepo.
- Now click on Create a launch template button.
  
  ![557](https://github.com/user-attachments/assets/399ef5a5-24f6-4a2c-bd83-f23d247164e5)

- Enable the Detailed CloudWatch Monitoring
  ![558](https://github.com/user-attachments/assets/4321c2dc-8ee7-40e6-aaa9-e0edc955eaec)

- Created launch template successfully.
  ![559](https://github.com/user-attachments/assets/c99ef9c4-3d87-4486-bd93-625581e49d5b)

### 20.2.4 Auto Scaling Group Creation:
- Now Come to Auto scaling groups under Auto Scaling
- Click on Create Auto Scaling group button.
  ![560](https://github.com/user-attachments/assets/ff49db7e-76b4-4c87-8b35-89860b01a81b)

- Fill in the Name, Select the Launch Template which we created with Amazon-Linux-Nginx-Image.
  ![561](https://github.com/user-attachments/assets/0fc1a00c-e86d-4b98-bdd6-4d5b333d994c)

- Click on next button.
  
  ![562](https://github.com/user-attachments/assets/46f22b43-9bf7-452e-b922-a44ed2f0243a)

- Select the VPC and Subnets which you want to do Auto Scaling, Click on Next.
  ![563](https://github.com/user-attachments/assets/a3af3057-ba76-48f6-8e10-5d20aeb19534)

- Fill in details as shown
  
  ![564](https://github.com/user-attachments/assets/41c8e74a-ce2e-4b6d-967a-ee324eacfc42)

- Fill in details as shown
  
  ![565](https://github.com/user-attachments/assets/8dbdfc1a-fd6c-4243-9e85-f16c1d020076)

- Health grace period 30 sec
  
  ![566](https://github.com/user-attachments/assets/600354b8-e4a5-4036-9f97-efaad8e45304)

- Click on Next Button
  
  ![567](https://github.com/user-attachments/assets/5f0b37d3-31f6-42a6-9854-e6a077a30ef8)

- Fill in details as shown, click on Next.
  ![568](https://github.com/user-attachments/assets/6c51d94a-bbb2-4b7d-a476-56d6da0a741a)

- Click on Next, verify all and click on create button.
  ![569](https://github.com/user-attachments/assets/bcb160d8-3ab1-4f90-9625-7fff5594cb1e)

- Auto Scaling Group created successfully
- Now in instances one Machine will get deployed.
  ![570](https://github.com/user-attachments/assets/bec4ff7f-e993-4dcb-93a3-744a9f2ed0a5)

- Auto Scaling Server Deployed successfully
  ![571](https://github.com/user-attachments/assets/16130cb6-5bf8-4a29-aed8-bf93cb418fbe)

- On what basis the scaling should happen can be mentioned under ASG’s Automatic Scaling, before adding the Scaling we need to add the Notification under Application Integration’s Simple Notification Service. Under Amazon SNS’s Topics.
  ![572](https://github.com/user-attachments/assets/0e041f0c-09d4-49fc-852f-d4a70ccf3a12)

### 20.2.5 Notification Creation For Autoscaling:
- Click on Create topic button.
  ![573](https://github.com/user-attachments/assets/b8c39ad4-0dd4-438b-ae69-38f066aef574)

- Fill in details as shown, click on Create Topic button.
  ![574](https://github.com/user-attachments/assets/e9bd2907-bebd-4e91-a6f3-1a9c691fccb6)

- In Topics Create Subscription.
  ![575](https://github.com/user-attachments/assets/8f26a1e5-8c52-4184-a7f2-485a9ba4150f)

- Select email and fill our email id, and click on create subscription.
  ![576](https://github.com/user-attachments/assets/623b6a3f-e3e7-4e20-8dff-651a78855a91)

- Confirm Subscription.
  ![577](https://github.com/user-attachments/assets/3ef27ccb-ec7b-400c-abd2-46643a1686d0)
  ![578](https://github.com/user-attachments/assets/d636d0ce-2a2b-4d86-8053-c89800ff31e1)

### 20.2.6 Alarm Creation for AutoScaling:
- Create a cloud watch alarm, click on Select metric button.
  ![579](https://github.com/user-attachments/assets/1161eb11-6187-4ffe-8338-75fed08dcf9f)

- Select metric > EC2 > By Auto scaling group > ASG’s CPU Utilization. And click on select metrics button.
  ![580](https://github.com/user-attachments/assets/c4c3e410-15a4-4a81-a37d-e5bb963ea8ad)

- Fill in details as shown.
  ![581](https://github.com/user-attachments/assets/e9bf9fec-f5b9-40f7-9347-7d45002d203f)

- Fill in as shown, click Next.
  ![582](https://github.com/user-attachments/assets/61994a76-52f1-4431-a383-cf4f4fbc91d8)

- Fill in as shown, click on next.
  ![583](https://github.com/user-attachments/assets/817a68a6-f53f-47fd-8f6f-0b137d5ea9c2)

- Fill name, click on Next.
- Review and click on create Alarm Button.
  ![584](https://github.com/user-attachments/assets/53f8e88d-62cb-4421-8988-6ab6842d8c4b)

- Alarm Created Successfully.
- You can see insufficient data once you add in scaling policy then data will come.
  ![585](https://github.com/user-attachments/assets/5cea1489-fd48-472b-8c12-b713cda60d96)

### 20.2.7 Dynamic scaling policy Creation in ASG:
- Now come to ASG’s Automatic Scaling, click on Create Dynamic Scaling Policy
  ![586](https://github.com/user-attachments/assets/bb3e379c-ba0f-43e6-ab4b-41c8d685b5aa)

- Fill in the details as shown, click on create button.
  ![587](https://github.com/user-attachments/assets/baf1b35f-917b-469b-9bcc-0414e2cb0228)

- Now we will create another policy, before creating the policy we create new alarm for that.
- Click on Create Alarm button.
- Create a cloud watch alarm, click on Select metric button.
  ![588](https://github.com/user-attachments/assets/cc162d09-afe4-4e8d-a140-f18ca2169bd7)

- Select metric > EC2 > By Auto scaling group > ASG’s CPU Utilization. And click on select metrics button
  ![589](https://github.com/user-attachments/assets/8219e7fa-b9b4-4b2e-93ca-d2cf9b8112c6)

- Fill in details as shown.
  ![590](https://github.com/user-attachments/assets/660898f9-72be-4044-9c7c-b1d4a3400f06)

- Fill as shown, click Next.
  ![591](https://github.com/user-attachments/assets/7544eb53-69db-40a4-8851-9f38d528031f)

- Fill as shown.
  
  ![592](https://github.com/user-attachments/assets/7f7e1aa7-245c-4a68-8fc8-7a5aac1bf743)

- Click on next after name fill and review and create alarm button.
  ![593](https://github.com/user-attachments/assets/47b170a8-0e3e-4017-abda-66861c0946cb)

- Created alarm for deletion.
  ![594](https://github.com/user-attachments/assets/c5e725ce-675b-4bde-acb1-ab2755972606)

- Now come to ASG’s Automatic Scaling, click on Create Dynamic Scaling Policy
  ![595](https://github.com/user-attachments/assets/eaec50ed-b1de-40a8-9365-120a44d0c678)

- Fill in the details as shown, click on create button 
- Now you can add the HTTPs and Route53 entry, then you can check the app access with ```asg.madireddyanil.in.```
  ![596](https://github.com/user-attachments/assets/d16ba32b-92a8-4a70-9b8d-6d2c08ab123e)

- please check if enabled or not. Right Click on Instance > Monitoring and troubleshooting > Manage Detailed monitoring.
  ![597](https://github.com/user-attachments/assets/2946a3ec-7889-4e68-b0ad-dd000c943c06)

### 20.2.8 Testing the AutoScaling:
- Run stress to keep load on server
  ```
  stress --cpu 8 --io 4 --vm 2 --vm-bytes 128M --timeout 15m
  ```
  ![599](https://github.com/user-attachments/assets/8082f37d-3871-4b20-b1aa-e845a2557eca)

- After sometime desired capacity will increase to 2 as we ran stress command.
  ![598](https://github.com/user-attachments/assets/c89848d8-d1b0-48ac-a3c1-999c7022d518)

- Extra server launched.
- Parallelly connect to new server and run stress and go on till 4 or 5 servers and then stop stress one by one so that instances will get deleted automatically.
  ![600](https://github.com/user-attachments/assets/fc9de3a5-2376-4579-be98-f1fcb1d80cab)

- Alarm triggered; AWS Autoscaling Groups(ASG) must be used with Stateless Applications Only. Like Frontend/Webservers and Backend/AppServer. ASG must not be used with Database server as the servers can be deleted any time.
  ![601](https://github.com/user-attachments/assets/df2317ef-4f86-40b1-85c7-1ea15577549d)

