## 23.4. Multiaccount Management Using Role Switching:

### 1. Master account Users Creation:

- Here we are going to link three accounts(```MadireddyMaster, MadireddySlave1 and MadireddySlave2```) for Single
  Management Purpose, Using IAM.
- Now we take 3 accounts(```MadireddyMaster, MadireddySlave1 and MadireddySlave2```)
- MadireddyMaster Account
  ![692](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/692.png)

- MadireddySlave1 Account
  ![693](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/693.png)

- MadireddySlave1 Account
  ![694](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/694.png)

- here we create two users(```madireddy-01``` & ```madireddy-02```) in the Master account.
- Under IAM > Users, Click on Create user button
  ![699](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/699.png)

- Fill in the username, Provide console access and Password and click on Next.
  ![695](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/695.png)

- No Permissions for now click on Next
  ![696](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/696.png)

- Click on Create User button.
  ![697](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/697.png)

- Check Password if possible.
  ![698](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/698.png)

- Similarly Create another user.
- After two users created looke like below.
  ![700](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/700.png)

### 2. Slave Accounts Role Creation:

- Role Creation in ```MadireddySlave1``` account
- Click on Create Role under IAM > Roles
  ![701](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/701.png)

- Select AWS account, and Select another AWS account (Give master account details here), Click on Next button
  ![702](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/702.png)

- Add Permissions , here we have added EC2 full Access and click on next button.
  ![703](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/703.png)

- Fill Role name, Description and review & Create role.
  ![704](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/704.png)
  ![705](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/705.png)

- After creating the role.
  ![706](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/706.png)
  ![707](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/707.png)

- Role Creation in ```MadireddySlave2``` account
- Click on Create Role under IAM > Roles
  ![701](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/701.png)

- Select AWS account, and Select another AWS account (Give master account details here), Click on Next button
  ![702](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/702.png)

- Add Permissions , here we have added ```EC2 full Access``` & ``` S3 Full Access``` and click on next button.
  ![703](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/703.png)

- Fill Role name, Description and review & Create role.
  ![704](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/704.png)
  ![705](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/705.png)

- After creating the role.
  ![706](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/706.png)
  ![708](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/708.png)

- Now Collect the Two Slave accounts ARN numbers
- MadireddySlave1
  ![709](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/709.png)

- MadireddySlave2
  ![710](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/710.png)

## 3. Master Account AssumeRole Policy Creation

- Now we will add this ARNs in the Assume role policy. Under ```MadireddyMaster``` account by creating the ploicy
  ```
  {
      "Version": "2012-10-17",
      "Statement": {
        "Effect": "Allow",
        "Action": "sts:AssumeRole",
        "Resource": [
          "arn:aws:iam::905418264970:role/CrossAccountRole",
          "arn:aws:iam::232789740929:role/CrossAccountRole"
        ]
      }
    }
  ```
- Click on Create Policy under IAM > Policies in ```MadireddyMaster``` account
  ![711](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/711.png)

- Pasting the above code in the Policy editor and click on Next button.
  ![712](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/712.png)

- Fill Name and Description and Click on Create Policy Button.
  ![713](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/713.png)

- After policy creation.
  ![714](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/714.png)
  ![715](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/715.png)

- Now we will create the New group and add users anad Crossaccount policy in MasterMadireddy account.

## 4. User Group Creation in MadireddyMaster account:

- Under IAM > UserGroups click on Create group button.
  ![716](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/716.png)

- Fill in Name and Select Users and Assume Policy
  ![717](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/717.png)

- After Group Creation.
  ![718](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/718.png)
  ![719](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/719.png)
- Now aw should test the login to the Slave Accounts by two users in Master account by using the below master url

## 5. Testing login to Slave1 account with madireddy-01 user:

- Under IAM > Dashboard copy the Aws Account URl which is below
  ```
  https://559050220397.signin.aws.amazon.com/console
  ```
- Sign in to ```Master account```
  ![720](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/720.png)

- Initially We signed in to ```master``` account and ```no access``` at all.
- As we did not give permission in MAster account to ```madireddy-01```
  ![721](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/721.png)

- Now from here we will switch to ```Slave 1``` account
- Click on Switch role button.
  ![722](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/722.png)

- Fill in the Slave 1's (account ID and IAM Role and display name)
  ![723](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/723.png)

- After login.
  ![724](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/724.png)

- Here only ```EC2``` as we did same to user madireddy-01
  ![725](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/725.png)

- No s3 access to user madireddy-01 as we not gave.
  ![726](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/726.png)

- Check as below in whcih account you are in
  ![727](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/727.png)

## 6. Testing login to Slave2 account with madireddy-01 user:

- Under IAM > Dashboard copy the Aws Account URl which is below
  ```
  https://559050220397.signin.aws.amazon.com/console
  ```
- Sign in to ```Master account```
  ![720](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/720.png)

- Initially We signed in to ```master``` account and ```no access``` at all.
- As we did not give permission in MAster account to ```madireddy-01```
  ![721](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/721.png)

- Now from here we will switch to ```Slave 2``` account
- Click on Switch role button.
  ![722](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/722.png)

- Fill in the Slave 2's (account ID and IAM Role and display name)
  ![728](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/728.png)

- After login.
  ![729](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/729.png)

- Here only ```EC2``` and ```s3``` access as we did same to user madireddy-01
  ![729](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/729.png)
  ![730](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/730.png)

- No Route53 access to user madireddy-01 as we not gave.
  ![731](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/731.png)

- Check as below in whcih account you are in
  ![732](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/732.png)

- Similarly do with the ```madireddy-02``` user in ```Slave1``` and ```Slave2``` accounts.
- Only cahnge after switching to madireddy-02 is switching will show before only.
- As we assigned same policy to madireddy-01 and madireddy-02 users
  ![733](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/733.png)

### Note:

- This process is little complicate
- Switching roles with users. Account info will be little messy.
- for less number of users it is ok but what if many users thing.
    - so now a days they are using ```AWS Organisations```

## 23.5. AWS Organizations:

- Click on Create an Organization.
  ![734](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/734.png)

- Click on add AWS account button to add slaves 1 and 2.
  ![735](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/735.png)

- Fill in the Account(Sub account1 and Sub account2) and Message and send invite
  ![736](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/736.png)

- Accept the invitation in two aaccounts
  ![737](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/737.png)
  ![738](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/738.png)

- After accepting in ```Master account```.
  ![739](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/739.png)

  ### Advantages of AWS Organisations:
    - centralised billing
    - By This AWS Organizations we can create the restrictions to the Sub accounts
    - Security policies
    - Service restrictions

## 23.6. Service Control Policies Under AWS Organisations.

- Clcik on Policies Under AWS Organisations > Policies > Service control policies.
  ![740](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/740.png)

- Fill in the Policy name and description, and paste the below code in the code section.
- Click on Creste Policy button.
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
                      "ec2:InstanceType": "t2.micro"
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
  ![741](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/741.png)
  ![742](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/742.png)

- After Policy creation
  ![743](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/743.png)

- Now you should assign the policy to the both slave Accounts
- Click on Slave1 account
  ![744](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/744.png)

- Click on attach button under Slave1 > Policies > Attach
  ![745](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/745.png)

- Select the Service control Policy which we created earlier resctricting the few features in the code.
- Click on attach policy button.
  ![746](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/746.png)

- Similarly do to the Slave2 account
- Click on Slave2
  ![747](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/747.png)

- Click on attach button under Slave2 > Policies > Attach
  ![748](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/748.png)

- Select the Service control Policy which we created earlier resctricting the few features in the code.
- Click on attach policy button.
  ![749](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/749.png)

- Now test in Slave 1 nad 2 for access
- IAM, Route53 should be denied and etc, specified in the above code.
  ![750](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/750.png)
  ![751](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/751.png)
- Similarly there should be restrictions in many as above per code.
- Testing might be long so ```skipping``` few tests.
- NOw you can remove the policies if required for slave 1 and 2 accounts.
- Next we will Create Active Directory in AWS and shows how organizations users are maintained at singlr point.
