# 18. Load Balancers:
- Process of Data transfer is shown in OSI layers.
- Load balancers are in Application layer and in the Transport layer, in transport layer we have Network Loan Balancer(NLB) and in Application layer we have Application Load Balancer(ALB).
- If require please study here
  ![422](https://github.com/user-attachments/assets/8414c2d2-4c36-4169-9310-5555e0aa9f09)

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
  ![423](https://github.com/user-attachments/assets/6c343cc1-292c-40fd-89d8-40280ab4abac)

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
## 18.1. Configuring NLB:
### 18.1.1 Launching Instances:
- Now launch the 3 instances with below optional data
  ![424](https://github.com/user-attachments/assets/f31be454-2414-4e3d-be24-a1c57e285c10)

- Now before creating load balancer, we need to create target group.

### 18.1.2 Target Group Creation:
- Click on Create target Group.
  ![425](https://github.com/user-attachments/assets/c6985391-ea56-4594-b149-7e8d98c2f9fa)

- Select Instances
  ![426](https://github.com/user-attachments/assets/074dd8b4-6d84-4128-a680-999906d50e6d)

- Fill in the details like name, Protocol : Port, IP address type, VPC and Health check protocol. And click on Next.
  ![427](https://github.com/user-attachments/assets/d3defc74-063b-4179-adec-16fec2826713)

- Select the target group set of instances and click on Include as pending below.
  ![428](https://github.com/user-attachments/assets/6e06f89c-c293-4807-9d23-b6cf2533f92a)

- Click on Create target group
  ![429](https://github.com/user-attachments/assets/ce974667-77ad-44eb-bd00-174065511052)
  ![430](https://github.com/user-attachments/assets/bc709a42-4ec5-4cee-88f9-cbb34dce061d)

### 18.1.3 NLB Creation:
- Now we will create NLB Network Load Balancer, by clicking on Create load balancer button.
  ![431](https://github.com/user-attachments/assets/57d6e222-0f4a-42cb-98d8-abe73af26346)

- Click on NLB create button.
  ![432](https://github.com/user-attachments/assets/d82da6cb-35d1-409f-a8d9-2e9d1184e888)

- Fill in the details like Name, Scheme, IP,
  ![433](https://github.com/user-attachments/assets/4bd666a9-9107-4327-b1c6-2c43795fe38c)

- Select VPC and Public Subnets for NLB, no private Subnets for NLB selected.
  ![434](https://github.com/user-attachments/assets/1e25f293-c944-4d51-9950-d849575160f2)

- Select the Sg, TLS, Target group, Security Policy 
- Now click on Create Load Balancer button
  ![435](https://github.com/user-attachments/assets/83c9216f-a74a-45f0-abfa-c922be40ee4e)
  ![436](https://github.com/user-attachments/assets/42b594aa-f06f-4721-9c29-279c07609937)

- NLB created successfully still it is in provisioning after some time it will be in available state.
  ![437](https://github.com/user-attachments/assets/5042f34e-1a73-4f62-888c-55407d817bcb)

- Now it’s Active. Once the Load balancer is active the target group servers should be healthy. 
  ![438](https://github.com/user-attachments/assets/b537edc2-a6c5-477d-9e1d-99a20ac11190)

- Take the DNS name and if you browse in browser the load balancer will work.
  ![439](https://github.com/user-attachments/assets/5c8e0190-2ea4-4483-ab5c-a71c622fe9d6)

- This way all target group servers will be in healthy state
  ![440](https://github.com/user-attachments/assets/f24cb874-b05d-44f0-b03b-3b52671faceb)

### 18.1.4 Domain Creation in Route53
- Now we will create route53 domain in AWS. Click on Create hosted zone.
  ![441](https://github.com/user-attachments/assets/f7aafca0-cf76-40b7-adab-29be6a672fbf)

- Under Route53 Hosted Zones > Create hosted zone
- Name should be GoDaddy domain name, Type should be Public
  ![442](https://github.com/user-attachments/assets/a8f9798b-2f8f-455a-9db5-cf8d2e9cb270)

- Once Hosted Zone is created, we need to add the Nameservers in GoDaddy site
  ![443](https://github.com/user-attachments/assets/19f41368-70d4-4118-83c2-3e014ef987b9)

- This way we can add the name servers in GoDaddy.
  ![444](https://github.com/user-attachments/assets/4078ca0e-863f-4be5-887a-60b16f41d279)

- Now in madireddyanil.in Hosted Zone we need to create the record, Click on Create record button.
  ![445](https://github.com/user-attachments/assets/4cca5051-9baa-4e2c-9077-c89e6f96ce6a)

- Fill in the Record name, Record type and Value (LB DNS Name) and click on Create record button.
  ![446](https://github.com/user-attachments/assets/055941d3-eee5-4b8a-be26-fe5c3b997011)

### 18.1.5 Testing the Application in NLB:
- Now once the record is added we can fetch the nginx through ```nginx.madireddyanil.in```
- Now you will get response from any of 3 servers which are grouped in target group.
  ![447](https://github.com/user-attachments/assets/19949a2a-c521-4582-b3bc-2e16e0b2719f)

- Here application is not secure to make secure we need to do TLS
  ![448](https://github.com/user-attachments/assets/c986c5af-ae07-463d-bde8-6c5b4fa44847)

### 18.1.6 Redirecting Application to HTTPS:
- Click on Add Listener button.
  ![449](https://github.com/user-attachments/assets/4e2c7b0e-744e-4b06-8c29-229c0340ed03)

- Select TLS and Target Group.
  ![450](https://github.com/user-attachments/assets/513647e2-9401-43b5-a239-1b9eab39252b)

- Select From ACM and Select the created certificate.
- Here certificate we selected is created below.
  ![451](https://github.com/user-attachments/assets/90a2eb87-97f6-4aef-b578-b97380ef62ef)

- Once the Listener is added now after some time, we are able to login with ```https://nginx.madireddyanil.in```
  ![452](https://github.com/user-attachments/assets/a1747825-0830-4f59-9dc2-dfaa25515b48)

## 18.2. Process Of Certificate Creation:
- Click on Request a certificate button.
  ![453](https://github.com/user-attachments/assets/2f79efbb-a87a-42bf-bb7b-6f2caaa152fd)

- Select request a public certificate and click on next button.
  ![454](https://github.com/user-attachments/assets/a1485f66-bc94-4356-bad4-a53804bc8129)

- Fill the domain name which is in GoDaddy Domain name
  ![455](https://github.com/user-attachments/assets/27ccf0b2-eaa4-4e78-9d39-e7872069415d)

- Select the details shown and click Request button.
  ![456](https://github.com/user-attachments/assets/da1d4a64-7fa8-4a1f-8d1a-9eb3a37e6513)

- Once the certificate is created it is pending for validation. Open it Certificate.
  ![457](https://github.com/user-attachments/assets/d6090d60-b3c0-4de7-9ee7-81c92d75b255)

- Use CNAME Name and CNAME Value to validate the certificate.
  ![458](https://github.com/user-attachments/assets/2f34ec47-6b31-48ad-a63b-59a4ece7bae2)

- Click on Create Record button
  ![459](https://github.com/user-attachments/assets/19873750-fded-4528-954e-4cc9af99c95b)

- Record Name as Cert's CNAME Name, and Value is Cert's CNAME Value.
  ![460](https://github.com/user-attachments/assets/25952874-7640-41ea-851d-bd47740ccfdd)

- Once the record is created and it is in SYNC now certificate status will turn into Issued.
  ![461](https://github.com/user-attachments/assets/3b7ef319-9910-468e-93d7-252e71b4e85e)
  

## 18.3. Enabling the logs in the Load balancer:
- Enabling the logs in the NLB to check for errors.
  ![462](https://github.com/user-attachments/assets/bf0fb1f5-d614-46c5-8285-e932bf2c0df1)

- Created one new s3 bucket and go to permissions.
  ![463](https://github.com/user-attachments/assets/241501dc-1856-4d1c-bcca-c54f431344b4)

- Click edit button.
  ![464](https://github.com/user-attachments/assets/5a4b1151-7e93-4360-b1e4-29b682ac6e09)

- Uncheck Block all public access and save changes.
  ![465](https://github.com/user-attachments/assets/b439d09b-40b1-4b3c-8ebe-3fbe31f3a528)

- Click on edit button under bucket policy.
  ![466](https://github.com/user-attachments/assets/b6063854-efa5-4a17-b98a-ca61747fe1d1)

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
  ![467](https://github.com/user-attachments/assets/09529b1f-6c02-45a5-b143-914395f6f121)

- Under attributes in load balancer, we will enable logs this  way
- Enable Access logs button, S3 URL and save changes.
  ![468](https://github.com/user-attachments/assets/63bb124f-7a67-4a89-b319-15f66d4476e7)

- Now start using the NLB logs will get generated, as shown in image.
  ![469](https://github.com/user-attachments/assets/878bab85-f0b1-45d1-aba4-2b949517d42b)

### Things not possible in NLB:
  1. http to https redirection.
  2. URL/Path Based Routing
  3. Blue/Green or Canary Based Deployment.
  4. Integration with Web Application Firewall(WAF)

## 18.4. Configuring the ALB:
### 18.4.1 Target Group Creation:
- Create the new target group for ALB
  ![470](https://github.com/user-attachments/assets/433f3e53-3890-44f6-a399-98224523d199)

- Select Instances.
  
  ![471](https://github.com/user-attachments/assets/a314989b-e2be-46f9-825b-96fe25fe3e3f)

- Fill the Name, Protocol, IP and VPC details.
  ![472](https://github.com/user-attachments/assets/c2b7d4fc-4e14-4c3c-8106-e51c1ab51dfc)

- Fill in the details and select Next.
  ![473](https://github.com/user-attachments/assets/ea0bd160-807b-4087-a7d3-8304ce894936)

- Select the target server and click on include as pending below.
  ![474](https://github.com/user-attachments/assets/f46c02c1-d48f-47fa-bbd9-71b1017840ce)

- Now select Create target group button
  ![475](https://github.com/user-attachments/assets/05b88bc1-235b-478c-88eb-a5579734f3cc)

- Target group created successfully but still it is None associated that means we need to add to a load balancer so that we can use this target group.
  ![476](https://github.com/user-attachments/assets/72ee911f-dae9-4455-bff1-01dfb367769f)

### 18.4.2 ALB Creation:
- Now Click on Create button
  ![477](https://github.com/user-attachments/assets/64894fbc-0055-4d40-b6d2-d3a7217616bb)

- Now select the ALB
  
  ![478](https://github.com/user-attachments/assets/01dbba01-bf7f-4fe0-bf13-a7d231bf9a82)

- Fill Name, Scheme, IP and VPC and their subnets.
  ![479](https://github.com/user-attachments/assets/2db0aa1b-7d85-4fbf-9df0-49e881e5fe4e)
  ![480](https://github.com/user-attachments/assets/de255e40-317c-4246-8d4c-67bdb85f1805)

- Select HTTPS and Certificate for that.
  ![481](https://github.com/user-attachments/assets/553a4f87-1bc5-4a3f-9211-0fd1c1d50287)

- Click on create button.
  ![482](https://github.com/user-attachments/assets/dae4cd41-9288-4927-8c7c-b4daa678187a)

### 18.4.3 Http to Https Redirection in ALB:
- Now open the ALB and add listener 80 and redirect it to 443
- Click on Add button
  ![483](https://github.com/user-attachments/assets/fe63524e-804b-4f13-8f83-08114b4b36fd)

- Now select 80 port and redirect to URL, full URL and click on Add button
  ![484](https://github.com/user-attachments/assets/a8f58043-997c-4231-be0f-8cf4ded377c0)

- Added the Listener
  ![485](https://github.com/user-attachments/assets/c44a7622-0bf4-4b39-afc9-dec70ce3077e)

- Now we will create a record in the hosted zones and add the ALB DNS Name
  ![486](https://github.com/user-attachments/assets/a7a77400-92b7-4d01-bf9e-f3731ee06bfa)

- Adding record name(appnginx), record type(CNAME ), Value (ALB DNS Name) and click on create button
  ![487](https://github.com/user-attachments/assets/451bc428-4513-461b-a649-35aee355a374)

- Now we will test the application in the browser.
- Even though we give http now it will automatically redirect to the https.
  ![488](https://github.com/user-attachments/assets/928fff26-4ba7-4c3e-864f-1bad098826f9)

## 18.5. Configuring Path Based/URL based routing in Hosted Zones: 
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
  ![489](https://github.com/user-attachments/assets/bf4c7047-61b8-4caf-aabb-721699a481fd)

- we browse these with Public IPv4 DNS/netflix, Public IPv4 DNS/hotstar
  ![490](https://github.com/user-attachments/assets/f5e15f46-b8db-463d-9f0c-b1688750d586)

- Now we will create two target groups with two servers for Netflix and Hotstar. Same as we created previously but only change is in Health check path. for Netflix Server.
  
  ![491](https://github.com/user-attachments/assets/05785bc8-e48a-48a8-944a-e7b14a4c652a)

- For Hotstar server
  
  ![492](https://github.com/user-attachments/assets/d294f8eb-40a5-49c4-91d5-8d83672d960f)

- The two created Target groups.
- Target group created successfully but still it is None associated that means we need to add to a load balancer so that we can use this target group.
  ![493](https://github.com/user-attachments/assets/7efedf72-57e0-4791-be94-1d8540288778)

- So, we need to add this in our ALB which we have created earlier. Click on rule for HTTPS
  ![494](https://github.com/user-attachments/assets/65acd9eb-380a-4780-bf65-ffd0993ac215)

- Click on Add rule.
  ![495](https://github.com/user-attachments/assets/380d9ce5-a008-43be-963d-49f68bbb91df)

- Fill Name and Click Next button.
  ![496](https://github.com/user-attachments/assets/590a635e-3cc8-48c4-b7d8-6ceac01bb437)

- Click on Add Condition button.
  ![497](https://github.com/user-attachments/assets/afeac44f-4581-476e-9935-35240b410ab4)

- Select Path under Rule condition type, Path ```/netflix/*``` and click on Confirm.
  ![498](https://github.com/user-attachments/assets/b1392306-4f43-480b-9230-6d854638d216)

- Click on Next
  
  ![499](https://github.com/user-attachments/assets/6b9629a3-2ea0-4871-91c8-37db92698887)

- Select Forward to target group, Target group(Netflix-TargetGroup) and click Next.
  ![500](https://github.com/user-attachments/assets/13c5eb77-6902-44dc-9b06-20677cefafca)

- Set Priority to 1
  
  ![501](https://github.com/user-attachments/assets/a983d303-16ca-40a7-9c17-83bc2fc6b60e)

- Click on create Button.
  
  ![502](https://github.com/user-attachments/assets/64844593-642f-4913-a2ed-1acab1e882e1)

- Similarly add another rule for Hotstar Target Group by path = ```/hotstar/*```
  ![503](https://github.com/user-attachments/assets/6cce817a-db55-4b68-8fc9-268be623a6d1)

- Two rules added in the ALB Listeners Rules.
  ![504](https://github.com/user-attachments/assets/7ef1c1e0-92bb-4883-8672-2a3bd3bc0a13)

- Now if you browse the apps ```/hotstar/```  will get the app with path-based Routing.
  ![505](https://github.com/user-attachments/assets/939c842d-e72b-4a0d-b40e-e9c957584511)

- Now if you browse the apps ```/netflix/``` will get the app with path-based Routing.
  ![506](https://github.com/user-attachments/assets/0e86f878-2cab-471f-b7a6-4b977b505aad)

## 18.6. Blue Green or Canary Based Deployment:
- If we do any changes to the current Target group servers we  remove one server, update, attach it to the new Target Group and Add that in the ALB’s HTTPS Listener’s default rule
  ![507](https://github.com/user-attachments/assets/76db6eb7-a103-4987-aeb9-07dc42c9eb5c)

- Add the new target group by clicking on add target group button and add the weight 0 to old target group and 1 to new group if you wish to stop traffic to the old target group and start new updated traffic to the new target group or according to your requirement you can change the weightage so that traffic moves between old and new target groups.
  ![508](https://github.com/user-attachments/assets/4880749d-e9ea-438e-86df-75ba6887f477)
