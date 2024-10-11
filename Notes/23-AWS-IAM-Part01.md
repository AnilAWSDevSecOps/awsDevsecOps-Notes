# 23. AWS IAM(Identity and Access Management):

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

## 23.1. Users & Groups:
  - Now we will create 2 ```test-user-01``` and ```test-user-02``` in IAM
    ### 23.1.1 User creation:
    - Click on Create user button under IAM > Users to create ```test-user-01``` user
      ![647](https://github.com/user-attachments/assets/45404671-cbf3-4763-b0ca-2e0bfdead02c)
      
    - Fill in the details like User name, tik in Provide user access to the AWS Management Console and provide the password.
    - Click on Next button to proceed.      
      ![648](https://github.com/user-attachments/assets/34213c09-532e-46a5-978b-f25086a8bde5)

    - Lets skip Permissions for now. and Click on Next Button.
      ![649](https://github.com/user-attachments/assets/1edb638b-50c3-4bad-a4c0-f2a74d670c85)

    - Verify and click on Create user button.
      ![650](https://github.com/user-attachments/assets/78279469-8fde-46ca-9d28-07c8413baf74)

    - User ```test-user-01``` Created Successfully. If require download the cvs file or return to user list.
      ![651](https://github.com/user-attachments/assets/a4a0f64b-4aef-4138-8493-36e08d58125c)

    - Similarly we create another user ```test-user-02```
      ![652](https://github.com/user-attachments/assets/003fef1f-e462-4715-8517-be6cbb3fca2a)

    - Now we will launch the two servers
      ![653](https://github.com/user-attachments/assets/2c7a9a08-9baa-45d9-b61c-6477fab440c2)

    - We create ```owner tags``` to the both istances
      ![654](https://github.com/user-attachments/assets/5863cde6-513b-4250-a489-cd42007a0b38)
      ![655](https://github.com/user-attachments/assets/e3ccb120-12a4-4dcc-bd63-53327be29f99)

    ### 23.2. IAM Policies.
    - our goal is to make ```test-user-0l``` must be able to ```stop, start, reboot``` only ```Test-vm-0l```
    -  ```test-user-02``` must be able to ```stop, start, reboot``` only ```Test-vm-02```.
    - For this we need to create policies in IAM , ``` IAM > Policies```
    - Click on create Policy for test-user-01
      ![656](https://github.com/user-attachments/assets/aab369d1-9721-4065-a5af-3ccab076d12b)

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
      ![657](https://github.com/user-attachments/assets/241937dd-06d9-48fd-b8c5-26c7674b3507)

    - Fill the Policy Name and Click on Create Policy button.
      ![658](https://github.com/user-attachments/assets/906d3ceb-767f-4628-bd0f-5b4c0d4d1347)

    - Click on create Policy for test-user-02
      ![656](https://github.com/user-attachments/assets/aab369d1-9721-4065-a5af-3ccab076d12b)
      
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
      ![659](https://github.com/user-attachments/assets/849c9000-8b35-4294-ad88-6415213c6712)
         
    - Fill the Policy Name and Click on Create Policy button.
      ![660](https://github.com/user-attachments/assets/07685261-1d07-463c-ba36-2a018ad6e579)
   
    - Policies Created Successfully.
      ![661](https://github.com/user-attachments/assets/a15a238a-21b2-4179-a08e-40b0ae583853)

    - Now we need to add these policies to the users ```test-user-0l``` & ```test-user-02```
    - Under IAM > Users, Click on test-user-01
      ![662](https://github.com/user-attachments/assets/babdeacd-15f5-4c35-a5f8-69efef7b72ab)
   
    - Click on Add Permissions button
      ![663](https://github.com/user-attachments/assets/5d181af9-ad7b-4c57-8126-6b9bf5ab415a)
   
    - Select Attach Policies directly, select test-user-01 policy and click on next button.
      ![664](https://github.com/user-attachments/assets/1ba35ff0-92c5-44ec-995e-bb6389f54772)
   
    - Review and Click on Add Permissions button
      ![665 1](https://github.com/user-attachments/assets/fb32097f-f13e-48be-b393-8d94108a7ccd)
   
    - After adding permission looks like below. for ```test-user-0l```
      ![665 2](https://github.com/user-attachments/assets/d9af479c-e23f-418e-a041-d311dad78fac)
   
    - Under IAM > Users, Click on test-user-02
      ![666](https://github.com/user-attachments/assets/f96359d0-ee9d-4f89-a2da-53021f3d7a8f)
   
    - Click on Add Permissions button
      ![667](https://github.com/user-attachments/assets/2cd26101-34cf-4964-8f1a-288bf6855b2c)
   
    - Select Attach Policies directly, select test-user-02 policy and click on next button.
      ![668](https://github.com/user-attachments/assets/b66b7375-2ca4-4604-846e-4c344b2fe3c8)
   
    - Review and Click on Add Permissions button
      ![669](https://github.com/user-attachments/assets/714f63ad-ea48-4924-8919-1d5ee95d75f4)
   
    - After adding permission looks like below. for ```test-user-02```
      ![670](https://github.com/user-attachments/assets/7d28bb49-f3c0-40ec-9611-62658872cbdb)

    - Now we will try to login with ```test-user-01``` & ```test-user-02```
    - To Login try using the URL which is under IAM > Dashboard
      ![671](https://github.com/user-attachments/assets/7bc9e9c6-765e-4ee4-9771-acb565a2cfc5)
      ```
      https://905418264970.signin.aws.amazon.com/console
      ```
    - After login.
      ![672](https://github.com/user-attachments/assets/4d731963-872f-4a89-82de-e39f76148a74)

    - User will only be having the EC2 access as we defined in the Policy.
    - Policies will work as shown in below.
      ![673](https://github.com/user-attachments/assets/a0447afb-1ee3-4f16-942d-7949fdf23843)

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
    - For test-user-02 we will assign the inline policy(EC2 full access) under IAM > Users > test-user-02, as shown in below image.
    - Click on Create inline policy button
      ![674](https://github.com/user-attachments/assets/b4066356-e36b-4f13-8d14-724ad6c69f05)
   
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
      ![675](https://github.com/user-attachments/assets/9499ae5c-643e-4947-8a9f-97c2725a183d)

    - Fill in the name and click on Create Policy button.
      ![676](https://github.com/user-attachments/assets/cd00b05f-edca-4f04-98c7-18b5484770a6)

    - After adding inline Policy it looks like below image.
      ![677](https://github.com/user-attachments/assets/390a3586-dc68-4bb5-af24-4ea7427c2707)

    - Now when test-user-01 tries to stop Test-vm-02 it shows below error.
      ![678](https://github.com/user-attachments/assets/99b484a2-9608-4357-82e1-2bfd547fed43)

    - Now when test-user-01 tries to stop Test-vm-01 it Stops.
      ![679](https://github.com/user-attachments/assets/f185cbb1-01de-426b-8d66-db8ce5ce4142)

    - Now login with test-user-02 and Stop Test-vm-02 and Start Both Test-vm-02 and Test-vm-01 as we gave Ec2 full access to test-user-02.
      ![680](https://github.com/user-attachments/assets/3ce102b2-fddd-4004-a188-d35d16fea774)
      ![681](https://github.com/user-attachments/assets/5de249e3-fad6-48b0-bbac-5666b37b5418)
      
    ## 23.3. Permission Boundaries:
    - Given ```admin access``` to test-user-02 Under IAM > Users > test-user-02 > Add Permissions > add ```admin Policy``` save it.
    - Some times by mistake you can give privilaged or admin rights to the users, then in such case we can do IAM Permission boundaries.
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
      ![682](https://github.com/user-attachments/assets/0691d453-fc8b-4e5f-b21c-4eeac4c948c1)

    - Fill the above code. Click on Next
      ![683](https://github.com/user-attachments/assets/2c58672c-a1af-436d-b26a-c736b2157252)

    - Fill Names and click on Create Policy Button
      ![684](https://github.com/user-attachments/assets/07fc6406-8410-4bc9-8a59-41bb4d71d619)

    - Permission Boudary Created Successfully.
      ![685](https://github.com/user-attachments/assets/b734a70e-be8a-4c30-8a6f-0e70c246230d)

    - Now we should add that Permission Boundary into test-user-02.
    - Click on Set Permission Bounday Under IAM > Users > test-user-02 > Permission boundary
      ![688](https://github.com/user-attachments/assets/6a2fb0a9-4609-4357-bf66-e56aac087735)

    - Now Select our Permission Boundary which we created earlier.
      ![689](https://github.com/user-attachments/assets/6f750beb-a51f-426e-92f0-d82276d7c7f4)

    - After adding.
      ![690](https://github.com/user-attachments/assets/dd1d528e-f989-403e-8f5e-2d2e2408b75d)

    - Now when you login with test-user-02 you should be able to access everything except IAM and S3.
      ![686](https://github.com/user-attachments/assets/ecb84f8f-d38e-48ee-952c-e57d438306ec)
      ![687](https://github.com/user-attachments/assets/90d70a1b-dae5-448a-8cdf-6beab433ee4a)

    - Make sure you have assigned admin policy before for user test-user-02.
    - Now we are able to access the All except IAM and S3 even though test-user-02 has ```admin rights``` enabled.
    - Because of Permission Boundry. S3 and IAM Not able to access.
      ![691](https://github.com/user-attachments/assets/39169a80-5fd1-4b13-8f28-1e9c0a58e982)
