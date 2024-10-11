# Service Control Ploicies (SCP):
- SCP mainly focus on the lmiting access of AWS services and regions
- Like restricting on only specific regions.
- Like restricting to only few services in AWS it may be any service.
- Now come to AWS Organizations > AWS accounts > Policies
  ![837](https://github.com/user-attachments/assets/ec60be20-cc18-4cde-82fb-3d5c76c680ba)

- Click on Service control Policies and enable it.
  ![838](https://github.com/user-attachments/assets/22545294-5110-498b-aabb-83edb42a0f97)

- Click on Create policy.
  ![839](https://github.com/user-attachments/assets/25b0f3d5-4369-415a-8058-9550c3bd672c)

- Fill Policy Name and Description.
  ![840](https://github.com/user-attachments/assets/64ca97da-a007-44cd-bc97-35fab9ec73c8)

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
  ![841](https://github.com/user-attachments/assets/da059005-e176-46b1-bf17-9b2264831f2b)

- After creating the policy.
  ![842](https://github.com/user-attachments/assets/7cec67a7-3d14-433d-a6ac-61f9b92c17a7)

- Now go to AWS accounts and attach this policy to one Account.
- Open the slave1 account and add it
  ![843](https://github.com/user-attachments/assets/19b03214-0be7-4e9b-876d-0afe475499bb)

- Under Ploicies > attach
  ![844](https://github.com/user-attachments/assets/e111cf5e-277a-4d9d-bc26-b9f171574bba)

- Select our Policy and click on attach policy.
  ![845](https://github.com/user-attachments/assets/89682cd6-a0ec-4b99-99e2-263d3cf1b9a3)

- After attaching policy.
  ![846](https://github.com/user-attachments/assets/0e3fd3b5-3617-494d-975f-285981775aa1)

- Remove the FullAWSAccess policy.
  ![847](https://github.com/user-attachments/assets/e3a5ec68-826a-4de3-8cc5-f8c81a4297b8)

- After removing it looks.
  ![848](https://github.com/user-attachments/assets/30214c2d-725e-4431-8c7f-dc378bda723a)

- Now login to slave account and check for service access as per policy
  ![849](https://github.com/user-attachments/assets/1757ae3c-0d88-4d15-8956-faa8719a6d81)
  
  ![850](https://github.com/user-attachments/assets/e925b774-0ee9-4634-b84e-35c295835485)

- Now again if you want to restore remove our SCP and add Fullaccess policy.
  ![851](https://github.com/user-attachments/assets/034aa504-bdcd-4fac-9263-effa11120bcd)

- This way you can restrict the services in Accounts



# Reverting the IAM Changes:
- first from AD we need to disconnect the Identity center
- Now you can delete the AD
  ![852](https://github.com/user-attachments/assets/f5abfdd0-ab15-42eb-bce9-db62863222aa)
  ![853](https://github.com/user-attachments/assets/127c4525-a0ed-4137-a5f4-0b69fc991975)
  ![854](https://github.com/user-attachments/assets/8c6a6a56-b9c7-46f0-86dc-67bcb041f900)
  ![855](https://github.com/user-attachments/assets/8d9bc2ef-6779-4dcb-93b9-46bf3aa47d7e)
  ![856](https://github.com/user-attachments/assets/5b674488-ffa5-4ada-8225-40285a658ef2)
  ![857](https://github.com/user-attachments/assets/1aa5b4a6-27b2-473d-9db5-2e149457f767)
