# 18. Load Balancers:

- Process of Data transfer is shown in OSI layers.
- Load balancers are in Application layer and in the Transport layer, in transport layer we have Network Loan Balancer(
  NLB) and in Application layer we have Application Load Balancer(ALB).
- If require please study here
  ![422](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/422.png)

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
   ![423](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/423.png)

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
  ![424](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/424.png)

- Now before creating load balancer, we need to create target group.

### 18.1.2 Target Group Creation:

- Click on Create target Group.
  ![425](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/425.png)

- Select Instances
  ![426](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/426.png)

- Fill in the details like name, Protocol : Port, IP address type, VPC and Health check protocol. And click on Next.
  ![427](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/427.png)

- Select the target group set of instances and click on Include as pending below.
  ![428](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/428.png)

- Click on Create target group
  ![429](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/429.png)
  ![430](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/430.png)

### 18.1.3 NLB Creation:

- Now we will create NLB Network Load Balancer, by clicking on Create load balancer button.
  ![431](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/431.png)

- Click on NLB create button.
  ![432](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/432.png)

- Fill in the details like Name, Scheme, IP,
  ![433](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/433.png)

- Select VPC and Public Subnets for NLB, no private Subnets for NLB selected.
  ![434](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/434.png)

- Select the Sg, TLS, Target group, Security Policy
- Now click on Create Load Balancer button
  ![435](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/435.png)
  ![436](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/436.png)

- NLB created successfully still it is in provisioning after some time it will be in available state.
  ![437](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/437.png)

- Now it’s Active. Once the Load balancer is active the target group servers should be healthy.
  ![438](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/438.png)

- Take the DNS name and if you browse in browser the load balancer will work.
  ![439](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/439.png)

- This way all target group servers will be in healthy state
  ![440](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/440.png)

### 18.1.4 Domain Creation in Route53

- Now we will create route53 domain in AWS. Click on Create hosted zone.
  ![441](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/441.png)

- Under Route53 Hosted Zones > Create hosted zone
- Name should be GoDaddy domain name, Type should be Public
  ![442](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/442.png)

- Once Hosted Zone is created, we need to add the Nameservers in GoDaddy site
  ![443](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/443.png)

- This way we can add the name servers in GoDaddy.
  ![444](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/444.png)

- Now in madireddyanil.in Hosted Zone we need to create the record, Click on Create record button.
  ![445](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/445.png)

- Fill in the Record name, Record type and Value (LB DNS Name) and click on Create record button.
  ![446](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/446.png)

### 18.1.5 Testing the Application in NLB:

- Now once the record is added we can fetch the nginx through ```nginx.madireddyanil.in```
- Now you will get response from any of 3 servers which are grouped in target group.
  ![447](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/447.png)

- Here application is not secure to make secure we need to do TLS
  ![448](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/448.png)

### 18.1.6 Redirecting Application to HTTPS:

- Click on Add Listener button.
  ![449](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/449.png)

- Select TLS and Target Group.
  ![450](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/450.png)

- Select From ACM and Select the created certificate.
- Here certificate we selected is created below.
  ![451](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/451.png)

- Once the Listener is added now after some time, we are able to login with ```https://nginx.madireddyanil.in```
  ![452](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/452.png)

## 18.2. Process Of Certificate Creation:

- Click on Request a certificate button.
  ![453](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/453.png)

- Select request a public certificate and click on next button.
  ![454](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/454.png)

- Fill the domain name which is in GoDaddy Domain name
  ![455](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/455.png)

- Select the details shown and click Request button.
  ![456](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/456.png)

- Once the certificate is created it is pending for validation. Open it Certificate.
  ![457](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/457.png)

- Use CNAME Name and CNAME Value to validate the certificate.
  ![458](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/458.png)

- Click on Create Record button
  ![459](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/459.png)

- Record Name as Cert's CNAME Name, and Value is Cert's CNAME Value.
  ![460](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/460.png)

- Once the record is created and it is in SYNC now certificate status will turn into Issued.
  ![461](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/461.png)

## 18.3. Enabling the logs in the Load balancer:

- Enabling the logs in the NLB to check for errors.
  ![462](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/462.png)

- Created one new s3 bucket and go to permissions.
  ![463](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/463.png)

- Click edit button.
  ![464](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/464.png)

- Uncheck Block all public access and save changes.
  ![465](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/465.png)

- Click on edit button under bucket policy.
  ![466](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/466.png)

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
  ![467](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/467.png)

- Under attributes in load balancer, we will enable logs this way
- Enable Access logs button, S3 URL and save changes.
  ![468](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/468.png)

- Now start using the NLB logs will get generated, as shown in image.
  ![469](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/469.png)

### Things not possible in NLB:

1. http to https redirection.
2. URL/Path Based Routing
3. Blue/Green or Canary Based Deployment.
4. Integration with Web Application Firewall(WAF)

## 18.4. Configuring the ALB:

### 18.4.1 Target Group Creation:

- Create the new target group for ALB
  ![470](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/470.png)

- Select Instances.

  ![471](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/471.png)

- Fill the Name, Protocol, IP and VPC details.
  ![472](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/472.png)

- Fill in the details and select Next.
  ![473](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/473.png)

- Select the target server and click on include as pending below.
  ![474](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/474.png)

- Now select Create target group button
  ![475](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/475.png)

- Target group created successfully but still it is None associated that means we need to add to a load balancer so that
  we can use this target group.
  ![476](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/476.png)

### 18.4.2 ALB Creation:

- Now Click on Create button
  ![477](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/477.png)

- Now select the ALB

  ![478](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/478.png)

- Fill Name, Scheme, IP and VPC and their subnets.
  ![479](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/479.png)
  ![480](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/480.png)

- Select HTTPS and Certificate for that.
  ![481](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/481.png)

- Click on create button.
  ![482](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/482.png)

### 18.4.3 Http to Https Redirection in ALB:

- Now open the ALB and add listener 80 and redirect it to 443
- Click on Add button
  ![483](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/483.png)

- Now select 80 port and redirect to URL, full URL and click on Add button
  ![484](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/484.png)

- Added the Listener
  ![485](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/485.png)

- Now we will create a record in the hosted zones and add the ALB DNS Name
  ![486](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/486.png)

- Adding record name(appnginx), record type(CNAME ), Value (ALB DNS Name) and click on create button
  ![487](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/487.png)

- Now we will test the application in the browser.
- Even though we give http now it will automatically redirect to the https.
  ![488](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/488.png)

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
  ![489](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/489.png)

- we browse these with Public IPv4 DNS/netflix, Public IPv4 DNS/hotstar
  ![490](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/490.png)

- Now we will create two target groups with two servers for Netflix and Hotstar. Same as we created previously but only
  change is in Health check path. for Netflix Server.

  ![491](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/491.png)

- For Hotstar server

  ![492](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/492.png)

- The two created Target groups.
- Target group created successfully but still it is None associated that means we need to add to a load balancer so that
  we can use this target group.
  ![493](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/493.png)

- So, we need to add this in our ALB which we have created earlier. Click on rule for HTTPS
  ![494](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/494.png)

- Click on Add rule.
  ![495](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/495.png)

- Fill Name and Click Next button.
  ![496](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/496.png)

- Click on Add Condition button.
  ![497](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/497.png)

- Select Path under Rule condition type, Path ```/netflix/*``` and click on Confirm.
  ![498](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/498.png)

- Click on Next

  ![499](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/499.png)

- Select Forward to target group, Target group(Netflix-TargetGroup) and click Next.
  ![500](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/500.png)

- Set Priority to 1

  ![501](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/501.png)

- Click on create Button.

  ![502](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/502.png)

- Similarly add another rule for Hotstar Target Group by path = ```/hotstar/*```
  ![503](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/503.png)

- Two rules added in the ALB Listeners Rules.
  ![504](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/504.png)

- Now if you browse the apps ```/hotstar/```  will get the app with path-based Routing.
  ![505](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/505.png)

- Now if you browse the apps ```/netflix/``` will get the app with path-based Routing.
  ![506](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/506.png)

## 18.6. Blue Green or Canary Based Deployment:

- If we do any changes to the current Target group servers we remove one server, update, attach it to the new Target
  Group and Add that in the ALB’s HTTPS Listener’s default rule
  ![507](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/507.png)

- Add the new target group by clicking on add target group button and add the weight 0 to old target group and 1 to new
  group if you wish to stop traffic to the old target group and start new updated traffic to the new target group or
  according to your requirement you can change the weightage so that traffic moves between old and new target groups.
  ![508](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/508.png)
