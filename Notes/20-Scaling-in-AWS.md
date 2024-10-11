# 20. Scaling in AWS:

- Two types of scaling
  ### 1. Vertical Scaling :
    - Changing instance type to (low to high) or (high to low) is called Vertical scaling. To do this instance stop and
      start is required. Good for database servers or file servers.
      ![545](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/545.png)

  ### 2. Horizontal scaling:
    - Increasing the instance number is called Horizontal scaling. To do this instance stop and start is not required.
      Good for web servers and app servers

  ### 3. Autoscaling:
    - Adding and removing the instances according to the load is called autoscaling. Adding machines(Scale Out),
      Removing Machines(Scale In).
      ![546](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/546.png)

## 20.1. Steps to Vertical Scaling:

- Right click on Instance > Instance’s Settings > Change Instance Type.
- Under New instance type change it to any.
  ![547](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/547.png)

## 20.2. Steps to Horizontal Scaling:

### 20.2.1 Instance Launching:

- For testing the Horizontal Scaling, we need to launch one t2.medium instance and create one AMI for t2.medium instance
  with below user data.
  ![548](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/548.png)

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
  ![549](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/549.png)

- Once the machine image is in available status, we will deploy a machine using this AMI
  ![550](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/550.png)

- Now run ```ansible-playbook /myrepo/playbook.yaml``` command to make nginx colourful.
- Now delete the old server and launch the new server with New Updated image and test and see if nginx is working as
  here.
  ![551](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/551.png)

### 20.2.2 AMI Creation:

- ASG comes under the Horizontal Scaling
- We create one Image from One Instance.
- Fill in the details and click on create image.
  ![552](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/552.png)

- Created the Image successfully. In this Image we have Amazon Linux, t2.micro and Nginx with colour game
  ![553](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/553.png)

### 20.2.3 Launch Template Creation:

- Creating One Launch Template with the above Amazon-Linux-Nginx-Image
- Under Launch Templates click on Launch Template button.
- Fill in the details like Name, Description, under My AMIs select the Amazon-Linux-Nginx-Image
  ![554](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/554.png)

- Select Instance type

  ![555](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/555.png)

- Fill in the details as shown.
- ```Note``` : Don’t include Subnet now coz we need to add subnets in ASG
  ![556](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/556.png)

- Add user data as shown in below.
- Here in the image already we have used other user data related gitRepo.
- Now click on Create a launch template button.

  ![557](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/557.png)

- Enable the Detailed CloudWatch Monitoring
  ![558](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/558.png)

- Created launch template successfully.
  ![559](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/559.png)

### 20.2.4 Auto Scaling Group Creation:

- Now Come to Auto scaling groups under Auto Scaling
- Click on Create Auto Scaling group button.
  ![560](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/560.png)

- Fill in the Name, Select the Launch Template which we created with Amazon-Linux-Nginx-Image.
  ![561](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/561.png)

- Click on next button.

  ![562](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/562.png)

- Select the VPC and Subnets which you want to do Auto Scaling, Click on Next.
  ![563](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/563.png)

- Fill in details as shown

  ![564](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/564.png)

- Fill in details as shown

  ![565](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/565.png)

- Health grace period 30 sec

  ![566](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/566.png)

- Click on Next Button

  ![567](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/567.png)

- Fill in details as shown, click on Next.
  ![568](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/568.png)

- Click on Next, verify all and click on create button.
  ![569](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/569.png)

- Auto Scaling Group created successfully
- Now in instances one Machine will get deployed.
  ![570](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/570.png)

- Auto Scaling Server Deployed successfully
  ![571](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/571.png)

- On what basis the scaling should happen can be mentioned under ASG’s Automatic Scaling, before adding the Scaling we
  need to add the Notification under Application Integration’s Simple Notification Service. Under Amazon SNS’s Topics.
  ![572](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/572.png)

### 20.2.5 Notification Creation For Autoscaling:

- Click on Create topic button.
  ![573](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/573.png)

- Fill in details as shown, click on Create Topic button.
  ![574](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/574.png)

- In Topics Create Subscription.
  ![575](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/575.png)

- Select email and fill our email id, and click on create subscription.
  ![576](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/576.png)

- Confirm Subscription.
  ![577](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/577.png)
  ![578](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/578.png)

### 20.2.6 Alarm Creation for AutoScaling:

- Create a cloud watch alarm, click on Select metric button.
  ![579](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/579.png)

- Select metric > EC2 > By Auto scaling group > ASG’s CPU Utilization. And click on select metrics button.
  ![580](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/580.png)

- Fill in details as shown.
  ![581](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/581.png)

- Fill in as shown, click Next.
  ![582](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/582.png)

- Fill in as shown, click on next.
  ![583](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/583.png)

- Fill name, click on Next.
- Review and click on create Alarm Button.
  ![584](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/584.png)

- Alarm Created Successfully.
- You can see insufficient data once you add in scaling policy then data will come.
  ![585](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/585.png)

### 20.2.7 Dynamic scaling policy Creation in ASG:

- Now come to ASG’s Automatic Scaling, click on Create Dynamic Scaling Policy
  ![586](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/586.png)

- Fill in the details as shown, click on create button.
  ![587](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/587.png)

- Now we will create another policy, before creating the policy we create new alarm for that.
- Click on Create Alarm button.
- Create a cloud watch alarm, click on Select metric button.
  ![588](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/588.png)

- Select metric > EC2 > By Auto scaling group > ASG’s CPU Utilization. And click on select metrics button
  ![589](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/589.png)

- Fill in details as shown.
  ![590](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/590.png)

- Fill as shown, click Next.
  ![591](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/591.png)

- Fill as shown.

  ![592](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/592.png)

- Click on next after name fill and review and create alarm button.
  ![593](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/593.png)

- Created alarm for deletion.
  ![594](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/594.png)

- Now come to ASG’s Automatic Scaling, click on Create Dynamic Scaling Policy
  ![595](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/595.png)

- Fill in the details as shown, click on create button
- Now you can add the HTTPs and Route53 entry, then you can check the app access with ```asg.madireddyanil.in.```
  ![596](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/596.png)

- please check if enabled or not. Right Click on Instance > Monitoring and troubleshooting > Manage Detailed monitoring.
  ![597](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/597.png)

### 20.2.8 Testing the AutoScaling:

- Run stress to keep load on server
  ```
  stress --cpu 8 --io 4 --vm 2 --vm-bytes 128M --timeout 15m
  ```
  ![599](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/599.png)

- After sometime desired capacity will increase to 2 as we ran stress command.
  ![598](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/598.png)

- Extra server launched.
- Parallelly connect to new server and run stress and go on till 4 or 5 servers and then stop stress one by one so that
  instances will get deleted automatically.
  ![600](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/600.png)

- Alarm triggered; AWS Autoscaling Groups(ASG) must be used with Stateless Applications Only. Like Frontend/Webservers
  and Backend/AppServer. ASG must not be used with Database server as the servers can be deleted any time.
  ![601](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/601.png)

