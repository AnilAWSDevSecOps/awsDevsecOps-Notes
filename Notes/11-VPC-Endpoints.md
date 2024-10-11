# 11. VPC Endpoints:

- Launch two instances public and private and assign roles to them and transfer packets in s3 using the public and
  private subnets via internet, which will cost in AWS so we use end Points to transfer packets via AWS intranet.
- VPC Endpoints are used to access other AWS services from VPC internally
  ![98](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/98.jpg)

## 11.1. Gateway Endpoints:

- Gateway endpoints are used for s3 & DynamoDB, Gateway endpoints adds internal route to the route table

### 11.1.1. Creating Gateway Endpoint:

- Click Create endpoint button.
  ![99](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/99.jpg)

- Specify the name and service category
  ![100](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/100.jpg)

- Specify the service and the service name and VPC name in the below.
  ![101](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/101.jpg)

- Select the Private Route table and policy
  ![102](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/102.jpg)

- Click on create button.
  ![103](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/103.jpg)

### 11.1.2. Creating S3 Bucket:

- Now to test the S3 Gateway endpoint we need to create the s3 bucket. Click on Create bucket button.
  ![104](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/104.jpg)

- Fill in the details like Bucket type & Bucket name and rest are defaults as photo.
  ![105](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/105.jpg)
  ![106](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/106.jpg)

- Click on Create bucket for creating the s3 bucket.
  ![107](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/107.jpg)

- S3 bucket created successfully.
  ![108](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/108.jpg)

### 11.1.3. Launching Connecting to Private Instance:

- Connect to the Public Instance using putty
  ![109](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/109.jpg)

- Then Connect to the private instance through public instance
  ![110](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/110.jpg)

- Connected to Private instance 10.20.0.115 using putty
  ![111](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/111.jpg)

- Unable to locate credentials. You can configure credentials by runnin ```aws configure ``` Command.
  ![112](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/112.jpg)

### 11.1.4. User Access key Creation:

- Before configuring aws cli we need to create the access key by going in security credentials under account name. Click
  on Security credentials button.
  ![113](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/113.jpg)

- Click on Create access key button
  ![114](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/114.jpg)

- For Root user access keys are not recommended but create now no issue. Click on Create access key button.
  ![115](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/115.jpg)

- Download the .csv file and save it for future AWS CLI configuring. Click on Done button once creds are saved..
  ![116](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/116.jpg)

### 11.1.5. Configuring the CLI Using the Access key and testing the S3 file transfer:

- Now configure the aws cli by updating the access key creds.
  ![117](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/117.jpg)

- Uploaded one dummy file for testing into s3 bucket by clicking on Upload button.
  ![118](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/118.jpg)

- By this way we have downloaded by configuring the root access key but this happened due to internet but our goal using
  end point without internet only locally this should happen.
  ![119](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/119.jpg)

- To use of Gateway endpoint data transfer we need to launch the new private server in the private subnet and assign the
  role to the server
- Creating the new subnet and associating to the new route table which doesn’t have any gateways in it like internet
  gateway and NAT gateway
- Fill the details like VPC ID, Subnet name, Availability Zone, IPv4 VPC CIDR block & IPv4 subnet CIDR block.

## 11.2. Full Private Network Creation:

### 11.2.1 Private Subnet Creation:

- Click on Create subnet button.
  ![120](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/120.jpg)

- Creating the new route table fully private, and will associate the new subnet.
- Fill the details like Name and VPC, click on Create route table button
  ![121](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/121.jpg)

### 11.2.2 Private Subnet Explicit Association:

- Explicit subnet association of new subnet VPC-01-Subnet-03 was done successfully into the VPC-01-Rtb-01-FullPrivate
  route table.
  ![122](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/122.jpg)

- Launching the new instance under VPC-01-Subnet-03, Click on the Launch button and create the instance
  ![123](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/123.jpg)
  ![124](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/124.jpg)
  ![125](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/125.jpg)

### 11.2.3 IAM Role Creation:

- Creating New role to assign to the Private instance ubuntu-03. Click on Create role button
  ![126](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/126.jpg)

- Select the AWS service and EC2 and click on next button
  ![127](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/127.jpg)
  ![128](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/128.jpg)

- For now, I have given the admin access rights for this role but generally we should give the below given roles and
  click on Next button

  ![129](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/129.jpg)

- These are the roles in general for EC2 should be given but not admin rights.
  ![130](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/130.jpg)

- Fil in the details like Role name
  ![131](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/131.jpg)

- By leaving the remaining to defaults click on Create role button.
  ![132](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/132.jpg)

- Role EC2-AdminAccess created
  ![133](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/133.jpg)

- Assign this role to the Private server

### Testing the Endpoint Gateway:

- Initially when I tried the download from s3 it did not happen as no NAT in it thereafter. When I changed the
  routable (VPC-01-Rtb-01-FullPrivate) details in the Gateway endpoint which I have created earlier then the download
  completed without any NAT of IGW
  ![134](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/134.jpg)

- By clicking on Manage route table button I have changed the route table so that subnet details also changed
  automatically as that subnet is Explicitly associated to the same route table. Thereafter packets are getting
  downloaded using the Gateway endpoint.
  ![135](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/135.jpg)

- This way upload and download are happening using Gateway endpoints.
  ![136](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/136.jpg)

- Sample Diagram describing Gateway Endpoints, the red line indicates gateway endpoint to s3 bucket.
  ![137](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/137.jpg)

## 11.3. Process to upload a new key into AWS Public instances when old key lost:

- Click on Session Manager under AWS Systems Manager.
  ![138](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/138.jpg)

- Click on Start Session button
  ![139](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/139.jpg)

- By default, you will not see any instances here as default permissions for the instance will not grand access here.
- So, we need to assign the IAM role which we have created above so that the public instances will be appeared here.
  ![140](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/140.jpg)

- Right Click on Instance and under security > Modify IAM role
- Assign the Role to the instance so that you can see the instance under AWS System Manager > Session Manager
  ![141](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/141.jpg)

- Again, I have attached few policy Names to the IAM role so that instances can appear under Session manager.
- Note: This Role Should be assigned to the Private servers also if not they won’t be seen in the session manager
  section for system Management.

  ![142](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/.142jpg)

- Select the Server and click on the Start Session button
  ![143](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/143.jpg)

- Now generate the Public and private keys in Puttygen and public key should be added into the server under highlighted
  path in the screenshot below.
  ![144](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/144.jpg)

- So, you need to add the public key generated in the Puttygen can be added along with the existing public key so that
  you can login to the instance which you lost the access key.
  ![145](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/145.jpg)

## 11.4. Process to upload a new key into AWS Private instances when old key lost:

- Now we must create 3 interface endpoints to make private server available in the AWS Systems Manager.
  ![146](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/146.jpg)

### 11.4.1. 1st Interface Endpoint Creation.

- Click on Create endpoint button
  ![147](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/147.jpg)

- Fill in the details like Name Tag, Service category (AWS Services)
  ![148](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/148.jpg)

- Fill in the Details like Service name = com.amazonaws.us-east-1.ssm, VPC, Subnets, Security Groups.
  ![149](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/149.jpg)

- Select the Full access Policy.
  ![150](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/150.jpg)

- Click on Create endpoint button
  ![151](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/151.jpg)

### 11.4.2. 2nd Interface Endpoint Creation:

- Click on Create endpoint button
  ![152](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/152.jpg)

- Fill in the Details like Name, Service name = com.amazonaws.us-east-1.ssmmessages, VPC, Subnets, Security Groups.
  ![153](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/153.jpg)

- Select Full access Policy.
  ![154](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/154.jpg)

- Click on Create endpoint button.
  ![155](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/155.jpg)

### 11.4.3. 3rd Interface Endpoint Creation:

- Click on Create endpoint button
  ![156](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/156.jpg)

- Fill in the Details like Name, Service name = com.amazonaws.us-east-1.ec2messages, VPC, Subnets, Security Groups.
  Select Full access Policy, Click on Create endpoint button.
  ![157](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/157.jpg)
  ![158](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/158.jpg)
  ![159](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/159.jpg)
  ![160](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/160.jpg)

- Once all the Interface Endpoints are in available status, we must reboot the servers.
  ![161](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/161.jpg)

- Now Under AWS Systems Manager  Session Manager  Start a session, you can find the all-Private server’s session
  Manager is available, you can select once and can login and can make changes as required..
  ![162](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/162.jpg)

- Diagram Elaborating the Endpoints.
  ![163](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/163.jpg)

  
