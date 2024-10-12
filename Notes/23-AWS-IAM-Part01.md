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
      ![647](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/647.png)

    - Fill in the details like User name, tik in Provide user access to the AWS Management Console and provide the
      password.
    - Click on Next button to proceed.      
      ![648](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/648.png)

    - Lets skip Permissions for now. and Click on Next Button.
      ![649](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/649.png)

    - Verify and click on Create user button.
      ![650](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/650.png)

    - User ```test-user-01``` Created Successfully. If require download the cvs file or return to user list.
      ![651](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/651.png)

    - Similarly we create another user ```test-user-02```
      ![652](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/652.png)

    - Now we will launch the two servers
      ![653](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/653.png)

    - We create ```owner tags``` to the both istances
      ![654](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/654.png)
      ![655](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/655.png)

  ### 23.2. IAM Policies.
    - our goal is to make ```test-user-0l``` must be able to ```stop, start, reboot``` only ```Test-vm-0l```
    - ```test-user-02``` must be able to ```stop, start, reboot``` only ```Test-vm-02```.
    - For this we need to create policies in IAM , ``` IAM > Policies```
    - Click on create Policy for test-user-01
      ![656](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/656.png)

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
      ![657](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/657.png)

    - Fill the Policy Name and Click on Create Policy button.
      ![658](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/658.png)

    - Click on create Policy for test-user-02
      ![656](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/656.png)

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
      ![659](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/659.png)

    - Fill the Policy Name and Click on Create Policy button.
      ![660](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/660.png)

    - Policies Created Successfully.
      ![661](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/661.png)

    - Now we need to add these policies to the users ```test-user-0l``` & ```test-user-02```
    - Under IAM > Users, Click on test-user-01
      ![662](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/662.png)

    - Click on Add Permissions button
      ![663](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/663.png)

    - Select Attach Policies directly, select test-user-01 policy and click on next button.
      ![664](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/664.png)

    - Review and Click on Add Permissions button
      ![665 1](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/665.png)

    - After adding permission looks like below. for ```test-user-0l```
      ![665 2](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/665.png)

    - Under IAM > Users, Click on test-user-02
      ![666](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/666.png)

    - Click on Add Permissions button
      ![667](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/667.png)

    - Select Attach Policies directly, select test-user-02 policy and click on next button.
      ![668](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/668.png)

    - Review and Click on Add Permissions button
      ![669](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/669.png)

    - After adding permission looks like below. for ```test-user-02```
      ![670](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/670.png)

    - Now we will try to login with ```test-user-01``` & ```test-user-02```
    - To Login try using the URL which is under IAM > Dashboard
      ![671](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/671.png)
      ```
      https://905418264970.signin.aws.amazon.com/console
      ```
    - After login.
      ![672](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/672.png)

    - User will only be having the EC2 access as we defined in the Policy.
    - Policies will work as shown in below.
      ![673](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/673.png)

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
      ![674](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/674.png)

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
      ![675](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/675.png)

    - Fill in the name and click on Create Policy button.
      ![676](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/676.png)

    - After adding inline Policy it looks like below image.
      ![677](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/677.png)

    - Now when test-user-01 tries to stop Test-vm-02 it shows below error.
      ![678](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/678.png)

    - Now when test-user-01 tries to stop Test-vm-01 it Stops.
      ![679](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/679.png)

    - Now login with test-user-02 and Stop Test-vm-02 and Start Both Test-vm-02 and Test-vm-01 as we gave Ec2 full
      access to test-user-02.
      ![680](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/680.png)
      ![681](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/681.png)

  ## 23.3. Permission Boundaries:
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
      ![682](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/682.png)

    - Fill the above code. Click on Next
      ![683](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/683.png)

    - Fill Names and click on Create Policy Button
      ![684](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/684.png)

    - Permission Boudary Created Successfully.
      ![685](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/685.png)

    - Now we should add that Permission Boundary into test-user-02.
    - Click on Set Permission Bounday Under IAM > Users > test-user-02 > Permission boundary
      ![688](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/688.png)

    - Now Select our Permission Boundary which we created earlier.
      ![689](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/689.png)

    - After adding.
      ![690](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/690.png)

    - Now when you login with test-user-02 you should be able to access everything except IAM and S3.
      ![686](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/686.png)
      ![687](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/687.png)

    - Make sure you have assigned admin policy before for user test-user-02.
    - Now we are able to access the All except IAM and S3 even though test-user-02 has ```admin rights``` enabled.
    - Because of Permission Boundry. S3 and IAM Not able to access.
      ![691](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/691.png)
