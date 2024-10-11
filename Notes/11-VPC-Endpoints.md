# 11. VPC Endpoints:

- Launch two instances public and private and assign roles to them and transfer packets in s3 using the public and private subnets via internet, which will cost in AWS so we use end Points to transfer packets via AWS intranet.
- VPC Endpoints are used to access other AWS services from VPC internally
  ![98](https://github.com/user-attachments/assets/3ce1283e-df38-45bc-848f-c5c40d6dd552)

## 11.1. Gateway Endpoints:
- Gateway endpoints are used for s3 & DynamoDB, Gateway endpoints adds internal route to the route table

### 11.1.1. Creating Gateway Endpoint:
- Click Create endpoint button.
  ![99](https://github.com/user-attachments/assets/76a8c375-7f44-4cdf-a7b3-524e6b673a09)

- Specify the name and service category
  ![100](https://github.com/user-attachments/assets/b625a105-16e1-4232-90c2-62444d69a40f)

- Specify the service and the service name and VPC name in the below.
  ![101](https://github.com/user-attachments/assets/38ca1498-5a9f-48cc-b386-26cab2f42329)

- Select the Private Route table and policy
  ![102](https://github.com/user-attachments/assets/22fae114-3e7c-44c9-b627-65c2219764e2)

- Click on create button.
  ![103](https://github.com/user-attachments/assets/d9873cbd-3570-4473-bb08-3156844f2a96)

### 11.1.2. Creating S3 Bucket:
- Now to test the S3 Gateway endpoint we need to create the s3 bucket. Click on Create bucket button.
  ![104](https://github.com/user-attachments/assets/cf429a1c-80a3-4c11-9b09-1040f1aa6b2d)

- Fill in the details like Bucket type & Bucket name and rest are defaults as photo.
  ![105](https://github.com/user-attachments/assets/8c83435f-731b-4f26-a00a-eb198e9c1e5c)
  ![106](https://github.com/user-attachments/assets/61e1c824-47be-4f27-80c3-2ad2fe18b453)

- Click on Create bucket for creating the s3 bucket.
  ![107](https://github.com/user-attachments/assets/d9c57163-423e-4de2-bb29-7c02b351e587)

- S3 bucket created successfully.
  ![108](https://github.com/user-attachments/assets/db44b343-1eca-4d68-94a9-f354ab974ec1)
  
### 11.1.3. Launching Connecting to Private Instance:
- Connect to the Public Instance using putty
  ![109](https://github.com/user-attachments/assets/d7605c40-f661-4ecd-88d6-2b12d842a137)

- Then Connect to the private instance through public instance
  ![110](https://github.com/user-attachments/assets/cebf318d-3d0c-4584-b4c7-379b6418e951)

 - Connected to Private instance 10.20.0.115 using putty 
  ![111](https://github.com/user-attachments/assets/2b8a6689-8167-4395-b44d-e6d7cab326c2)

- Unable to locate credentials. You can configure credentials by runnin ```aws configure ``` Command.
  ![112](https://github.com/user-attachments/assets/ea143fe9-c014-4d2c-a3cd-78dcf7d66331)
  
### 11.1.4. User Access key Creation:
- Before configuring aws cli we need to create the access key by going in security credentials under account name. Click on Security credentials button.
  ![113](https://github.com/user-attachments/assets/1339681c-0f96-4dca-82e8-da9f85f3d2a3)

- Click on Create access key button
  ![114](https://github.com/user-attachments/assets/5b029b2e-c6d4-44ac-9630-6e2f939923d2)

- For Root user access keys are not recommended but create now no issue. Click on Create access key button.
  ![115](https://github.com/user-attachments/assets/83ccd873-d416-4ce3-9d82-baebc3b1f4f0)

- Download the .csv file and save it for future AWS CLI configuring. Click on Done button once creds are saved..
  ![116](https://github.com/user-attachments/assets/111e0cf2-10ea-41c4-a82a-b9b627556d3c)

### 11.1.5. Configuring the CLI Using the Access key and testing the S3 file transfer:
- Now configure the aws cli by updating the access key creds.
  ![117](https://github.com/user-attachments/assets/d831f3c5-746f-4c17-9cd0-2fdee4c73f78)

- Uploaded one dummy file for testing into s3 bucket by clicking on Upload button.
  ![118](https://github.com/user-attachments/assets/b048d150-6574-4466-920a-c6bbc41a0b12)

- By this way we have downloaded by configuring the root access key but this happened due to internet but our goal using end point without internet only locally this should happen.
  ![119](https://github.com/user-attachments/assets/b1b4dda0-41f1-4acf-bb85-20ccec875d23)

- To use of Gateway endpoint data transfer we need to launch the new private server in the private subnet and assign the role to the server 
- Creating the new subnet and associating to the new route table which doesn’t have any gateways in it like internet gateway and NAT gateway
- Fill the details like VPC ID, Subnet name, Availability Zone, IPv4 VPC CIDR block & IPv4 subnet CIDR block.

## 11.2. Full Private Network Creation:
### 11.2.1 Private Subnet Creation:
- Click on Create subnet button.
  ![120](https://github.com/user-attachments/assets/3fd80d9f-1e38-4dab-86c4-0bdf3985d5d4)

- Creating the new route table fully private, and will associate the new subnet.
- Fill the details like Name and VPC, click on Create route table button
  ![121](https://github.com/user-attachments/assets/89ab3cba-afb0-432d-8cfa-58d55d91aa99)

### 11.2.2 Private Subnet Explicit Association:
- Explicit subnet association of new subnet VPC-01-Subnet-03 was done successfully into the VPC-01-Rtb-01-FullPrivate route table.
  ![122](https://github.com/user-attachments/assets/c42561f0-d929-4a2a-afd5-e0d5d9bac23d)

- Launching the new instance under VPC-01-Subnet-03, Click on the Launch button and create the instance
  ![123](https://github.com/user-attachments/assets/8c140434-02e4-4125-a70f-a96b968c4dd6)
  ![124](https://github.com/user-attachments/assets/2b3eb339-bee5-445c-82f4-3deb68eef09b)
  ![125](https://github.com/user-attachments/assets/4ccf65ef-b631-48ef-92d9-728358fa9885)

### 11.2.3 IAM Role Creation:
- Creating New role to assign to the Private instance ubuntu-03. Click on Create role button
  ![126](https://github.com/user-attachments/assets/f090acb1-4373-4e44-80fb-016a93c592d9)

- Select the AWS service and EC2 and click on next button
  ![127](https://github.com/user-attachments/assets/e24e2185-74cd-4a80-a489-5c667ea0dfc5)
  ![128](https://github.com/user-attachments/assets/d1c51984-a5aa-49d6-bbba-5078738b52b3)

- For now, I have given the admin access rights for this role but generally we should give the below given roles and click on Next button
  
  ![129](https://github.com/user-attachments/assets/9424ee2a-7820-40a9-8ac7-0531d5c5b0ce)

- These are the roles in general for EC2 should be given but not admin rights.
  ![130](https://github.com/user-attachments/assets/41ce269f-1b69-49fa-9fd6-82df30b90d3e)

- Fil in the details like Role name
  ![131](https://github.com/user-attachments/assets/1ec85efd-5877-472d-abf7-96110fbbc0f5)

- By leaving the remaining to defaults click on Create role button.
  ![132](https://github.com/user-attachments/assets/f0bfa37d-e217-42e6-a148-046cdf436720)

- Role EC2-AdminAccess created
  ![133](https://github.com/user-attachments/assets/209f200a-5ed0-41f3-826d-34eab90a37bd)

- Assign this role to the Private server

### Testing the Endpoint Gateway:
- Initially when I tried the download from s3 it did not happen as no NAT in it thereafter. When I changed the routable (VPC-01-Rtb-01-FullPrivate) details in the Gateway endpoint which I have created earlier then the download completed without any NAT of IGW
  ![134](https://github.com/user-attachments/assets/9f641cdc-ed42-4594-9796-8e587e1b3f9f)

- By clicking on Manage route table button I have changed the route table so that subnet details also changed automatically as that subnet is Explicitly associated to the same route table. Thereafter packets are getting downloaded using the Gateway endpoint.
  ![135](https://github.com/user-attachments/assets/5f2c130d-847b-42dd-a634-0c8dcb153c38)

- This way upload and download are happening using Gateway endpoints.
  ![136](https://github.com/user-attachments/assets/43e5201e-e847-4261-8499-6fc7fb279979)

- Sample Diagram describing Gateway Endpoints, the red line indicates gateway endpoint to s3 bucket.
  ![137](https://github.com/user-attachments/assets/407c1719-07e8-441a-9ef7-db51dd3aad3e)

## 11.3. Process to upload a new key into AWS Public instances when old key lost:
- Click on Session Manager under AWS Systems Manager.
  ![138](https://github.com/user-attachments/assets/9dab2857-a194-4f8b-8aa7-ddb17a94df8d)

- Click on Start Session button
  ![139](https://github.com/user-attachments/assets/05416120-1215-4025-b320-9370af089113)

- By default, you will not see any instances here as default permissions for the instance will not grand access here.
- So, we need to assign the IAM role which we have created above so that the public instances will be appeared here.
  ![140](https://github.com/user-attachments/assets/45377bff-5597-476a-9f00-202d0e96dc29)

- Right Click on Instance and under security > Modify IAM role
- Assign the Role to the instance so that you can see the instance under AWS System Manager > Session Manager
  ![141](https://github.com/user-attachments/assets/4fd3015a-e1b8-455a-ae91-3f9aefe6bc4a)

- Again, I have attached few policy Names to the IAM role so that instances can appear under Session manager.
- Note: This Role Should be assigned to the Private servers also if not they won’t be seen in the session manager section for system Management.

  ![142](https://github.com/user-attachments/assets/fb8b2a3f-f4f8-4baa-b977-74ce876f507a)

- Select the Server and click on the Start Session button
  ![143](https://github.com/user-attachments/assets/d6676ffe-8d5f-425e-9549-6cc22e3840aa)

- Now generate the Public and private keys in Puttygen and public key should be added into the server under highlighted path in the screenshot below.
  ![144](https://github.com/user-attachments/assets/43ab498f-d3c1-4445-ae54-7effa7a75bb0)

- So, you need to add the public key generated in the Puttygen can be added along with the existing public key so that you can login to the instance which you lost the access key.
  ![145](https://github.com/user-attachments/assets/e9bdcaf6-f0ad-4827-ae60-7ebb6204c9c5)

## 11.4. Process to upload a new key into AWS Private instances when old key lost:
- Now we must create 3 interface endpoints to make private server available in the AWS Systems Manager.
  ![146](https://github.com/user-attachments/assets/6f92a3b3-bc0a-4a99-a355-4b5742a05550)

### 11.4.1. 1st Interface Endpoint Creation.
- Click on Create endpoint button
  ![147](https://github.com/user-attachments/assets/e7de8f4c-3fa2-4c23-b0bd-7fa90e048538)

- Fill in the details like Name Tag, Service category (AWS Services)
  ![148](https://github.com/user-attachments/assets/902c964a-438c-463e-a0c8-083df05acf4a)

- Fill in the Details like Service name = com.amazonaws.us-east-1.ssm, VPC, Subnets, Security Groups.
  ![149](https://github.com/user-attachments/assets/53222588-3cbb-48b1-8edc-783c822844a3)

- Select the Full access Policy.
  ![150](https://github.com/user-attachments/assets/4f10cdfb-c0ea-456a-80af-0342d592c36b)

- Click on Create endpoint button
  ![151](https://github.com/user-attachments/assets/2579338b-255a-46bc-bb5d-f7be3ca63aed)

### 11.4.2. 2nd Interface Endpoint Creation:
- Click on Create endpoint button
  ![152](https://github.com/user-attachments/assets/77094414-fee7-42ca-a008-715325d6bedd)

- Fill in the Details like Name, Service name = com.amazonaws.us-east-1.ssmmessages, VPC, Subnets, Security Groups.
  ![153](https://github.com/user-attachments/assets/369ad2ae-edd5-4ddc-9f32-bc8a56779636)

- Select Full access Policy.
  ![154](https://github.com/user-attachments/assets/d67ee130-c482-4105-9f91-f94bc944f266)

- Click on Create endpoint button.
  ![155](https://github.com/user-attachments/assets/deb7fc14-2f45-4d83-aacf-13764ea518a9)

### 11.4.3. 3rd Interface Endpoint Creation:
- Click on Create endpoint button
  ![156](https://github.com/user-attachments/assets/0a8551b3-e0fe-4a8d-a102-a3d5a24b4f4f)

- Fill in the Details like Name, Service name = com.amazonaws.us-east-1.ec2messages, VPC, Subnets, Security Groups. Select Full access Policy, Click on Create endpoint button.
  ![157](https://github.com/user-attachments/assets/bbded0f7-939d-4b09-b767-3b540cf1f8c2)
  ![158](https://github.com/user-attachments/assets/2098ff5d-7e1f-46cb-a738-e9742a99aa55)
  ![159](https://github.com/user-attachments/assets/d65ad46c-6f95-4b46-9b6a-326b2f0a6c7e)
  ![160](https://github.com/user-attachments/assets/4ad7f086-be19-461d-ba7c-164bec9f5c1d)

- Once all the Interface Endpoints are in available status, we must reboot the servers.
  ![161](https://github.com/user-attachments/assets/d3033681-48a7-4419-97b1-c4810f906835)

- Now Under AWS Systems Manager  Session Manager  Start a session, you can find the all-Private server’s session Manager is available, you can select once and can login and can make changes as required..
  ![162](https://github.com/user-attachments/assets/b70314e2-2316-4109-b08a-819b94bdfced)

- Diagram Elaborating the Endpoints.
  ![163](https://github.com/user-attachments/assets/0eeaccca-faff-4d70-8b44-c15f48f37e4f)

  
