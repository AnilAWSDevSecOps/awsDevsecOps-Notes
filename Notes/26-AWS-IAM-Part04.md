# Service Control Ploicies (SCP):

- SCP mainly focus on the lmiting access of AWS services and regions
- Like restricting on only specific regions.
- Like restricting to only few services in AWS it may be any service.
- Now come to AWS Organizations > AWS accounts > Policies
  ![837](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/837.png)

- Click on Service control Policies and enable it.
  ![838](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/838.png)

- Click on Create policy.
  ![839](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/839.png)

- Fill Policy Name and Description.
  ![840](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/840.png)

  ```
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "AllowAll",
              "Effect": "Allow",
              "Action": [
                  "*"
              ],
              "Resource": "*"
          },
          {
              "Sid": "DenyIAMandR53",
              "Effect": "Deny",
              "Action": [
                  "iam:*",
                  "route53:*"
              ],
              "Resource": "*"
          },
          {
              "Sid": "RequireMicroInstanceType",
              "Effect": "Deny",
              "Action": [
                  "ec2:RunInstances",
                  "ec2:StartInstances"
              ],
              "Resource": [
                  "arn:aws:ec2:*:*:instance/*"
              ],
              "Condition": {
                  "StringNotEquals": {
                      "ec2:InstanceType": "t2.nano"
                  }
              }
          },
          {
              "Sid": "BlockRegions",
              "Effect": "Deny",
              "Action": [
                  "*"
              ],
              "Resource": "*",
              "Condition": {
                  "StringNotEquals": {
                      "aws:RequestedRegion": [
                          "us-east-1",
                          "us-east-2"
                      ]
                  }
              }
          },
          {
              "Sid": "RestrictIO1IO2SC1ST1STD",
              "Effect": "Deny",
              "Action": [
                  "ec2:CreateVolume",
                  "ec2:ModifyVolume"
              ],
              "Resource": "*",
              "Condition": {
                  "StringNotEquals": {
                      "ec2:VolumeType": [
                          "gp2",
                          "gp3"
                      ]
                  }
              }
          }
      ]
  }
  ```
- Fill the above code in and click on Create Policy button.
  ![841](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/841.png)

- After creating the policy.
  ![842](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/842.png)

- Now go to AWS accounts and attach this policy to one Account.
- Open the slave1 account and add it
  ![843](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/843.png)

- Under Ploicies > attach
  ![844](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/844.png)

- Select our Policy and click on attach policy.
  ![845](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/845.png)

- After attaching policy.
  ![846](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/846.png)

- Remove the FullAWSAccess policy.
  ![847](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/847.png)

- After removing it looks.
  ![848](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/848.png)

- Now login to slave account and check for service access as per policy
  ![849](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/849.png)

  ![850](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/850.png)

- Now again if you want to restore remove our SCP and add Fullaccess policy.
  ![851](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/851.png)

- This way you can restrict the services in Accounts

# Reverting the IAM Changes:

- first from AD we need to disconnect the Identity center
- Now you can delete the AD
  ![852](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/852.png)
  ![853](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/853.png)
  ![854](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/854.png)
  ![855](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/855.png)
  ![856](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/856.png)
  ![857](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/857.png)
