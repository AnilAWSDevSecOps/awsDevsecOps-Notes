## 23.4. Multiaccount Management Using Role Switching:
### 1. Master account Users Creation:
- Here we are going to link three accounts(```MadireddyMaster, MadireddySlave1 and MadireddySlave2```) for Single Management Purpose, Using IAM.
- Now we take 3 accounts(```MadireddyMaster, MadireddySlave1 and MadireddySlave2```)
- MadireddyMaster Account
  ![692](https://github.com/user-attachments/assets/bf7e8284-9bc3-426e-beb3-9edcf4073e1d)
  
- MadireddySlave1 Account
  ![693](https://github.com/user-attachments/assets/6be54745-e71e-4666-86a0-8717b55d0252)
  
- MadireddySlave1 Account
  ![694](https://github.com/user-attachments/assets/6a72d535-d488-49dc-a8ee-da9b82684cc1)
  
- here we create two users(```madireddy-01``` & ```madireddy-02```) in the Master account.
- Under IAM > Users, Click on Create user button
  ![699](https://github.com/user-attachments/assets/bfb1dff0-3f92-4fa6-b17b-358c70bba8d3)
  
- Fill in the username, Provide console access and Password and click on Next.
  ![695](https://github.com/user-attachments/assets/f13cda7a-c84e-4447-bdea-d9c3da9db553)
  
- No Permissions for now click on Next
  ![696](https://github.com/user-attachments/assets/8f239f35-28eb-4fe3-9fa7-8c4f462e0eea)
  
- Click on Create User button.
  ![697](https://github.com/user-attachments/assets/f28b41d1-70d5-4aa3-b20d-eb084e8922ae)
  
- Check Password if possible.
  ![698](https://github.com/user-attachments/assets/09525348-aa47-42a7-8004-bdaecaafa224)
  
- Similarly Create another user.
- After two users created looke like below.
  ![700](https://github.com/user-attachments/assets/c2cd2a2b-150b-4d3a-8572-f55173403fe4)
  
### 2. Slave Accounts Role Creation:
- Role Creation in ```MadireddySlave1``` account
- Click on Create Role under IAM > Roles
  ![701](https://github.com/user-attachments/assets/43fe0854-6321-4cd7-89c7-aa053c18748a)
  
- Select AWS account, and Select another AWS account (Give master account details here), Click on Next button
  ![702](https://github.com/user-attachments/assets/bac92f25-2c35-44e0-a854-9a096de34290)
  
- Add Permissions , here we have added EC2 full Access and click on next button.
  ![703](https://github.com/user-attachments/assets/1e053de8-aa01-4378-96ad-ff24e94e88d0)
  
- Fill Role name, Description and review & Create role.
  ![704](https://github.com/user-attachments/assets/e5b5f335-fb70-483b-afd1-5dbc4b74e3a8)
  ![705](https://github.com/user-attachments/assets/6734d895-34eb-4025-b093-3b33ca2ac74c)
  
- After creating the role.
  ![706](https://github.com/user-attachments/assets/33c3fd62-b63b-44df-8266-08b9ec5eb944)
  ![707](https://github.com/user-attachments/assets/1a69ed67-34a2-475c-953c-d7fbaa95c6a5)
  
- Role Creation in ```MadireddySlave2``` account
- Click on Create Role under IAM > Roles
  ![701](https://github.com/user-attachments/assets/43fe0854-6321-4cd7-89c7-aa053c18748a)
  
- Select AWS account, and Select another AWS account (Give master account details here), Click on Next button
  ![702](https://github.com/user-attachments/assets/bac92f25-2c35-44e0-a854-9a096de34290)
  
- Add Permissions , here we have added ```EC2 full Access``` & ``` S3 Full Access``` and click on next button.
  ![703](https://github.com/user-attachments/assets/1e053de8-aa01-4378-96ad-ff24e94e88d0)
  
- Fill Role name, Description and review & Create role.
  ![704](https://github.com/user-attachments/assets/e5b5f335-fb70-483b-afd1-5dbc4b74e3a8)
  ![705](https://github.com/user-attachments/assets/6734d895-34eb-4025-b093-3b33ca2ac74c)
  
- After creating the role.
  ![706](https://github.com/user-attachments/assets/33c3fd62-b63b-44df-8266-08b9ec5eb944)
  ![708](https://github.com/user-attachments/assets/105fdc58-8b6c-4bb9-b2bd-31b073149cce)
  
- Now Collect the Two Slave accounts ARN numbers
- MadireddySlave1
  ![709](https://github.com/user-attachments/assets/226892bf-b58f-4150-8dfd-199b56c32877)
  
- MadireddySlave2
    ![710](https://github.com/user-attachments/assets/dec405b3-cad3-4994-971f-dcfe54a27300)

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
  ![711](https://github.com/user-attachments/assets/c2bb014e-b0c4-4add-864c-f92392315c94)
  
- Pasting the above code in the Policy editor and click on Next button.
  ![712](https://github.com/user-attachments/assets/4f7666bd-01ac-4f72-96e6-2a26cf2e9089)
  
- Fill Name and Description and Click on Create Policy Button.
  ![713](https://github.com/user-attachments/assets/2a8ab269-3bf9-4c8f-8ea3-c8f887177ae0)
  
- After policy creation.
  ![714](https://github.com/user-attachments/assets/67471971-a1ba-4ec0-b83d-c991554a7f37)
  ![715](https://github.com/user-attachments/assets/29c8a26e-0b4f-4d60-876f-e38c0a07f235)
  
- Now we will create the New group and add users anad Crossaccount policy in MasterMadireddy account.

## 4. User Group Creation in MadireddyMaster account:
- Under IAM > UserGroups click on Create group button.
  ![716](https://github.com/user-attachments/assets/f7b36fe6-66e5-469a-8489-d31fdeaece3e)
  
- Fill in Name and Select Users and Assume Policy
  ![717](https://github.com/user-attachments/assets/03494012-fb78-4bdd-b7c9-891d0a55dfa7)
  
- After Group Creation.
  ![718](https://github.com/user-attachments/assets/6ade6204-884e-44c3-97f4-8d819ed68d4b)
  ![719](https://github.com/user-attachments/assets/2d8a8a86-26b2-470e-aa7e-d2e901ccecca)
- Now aw should test the login to the Slave Accounts by two users in Master account by using the below master url

## 5. Testing login to Slave1 account with madireddy-01 user:
- Under IAM > Dashboard copy the Aws Account URl which is below
  ```
  https://559050220397.signin.aws.amazon.com/console
  ```
- Sign in to ```Master account```
  ![720](https://github.com/user-attachments/assets/aaae80b3-bb33-4274-a609-1c38a0ed3463)
  
- Initially We signed in to ```master``` account and ```no access``` at all.
- As we did not give permission in MAster account to ```madireddy-01```
  ![721](https://github.com/user-attachments/assets/7138e4d9-8485-4e21-9690-bd986cca4029)
  
- Now from here we will switch to ```Slave 1``` account
- Click on Switch role button.
  ![722](https://github.com/user-attachments/assets/9c56dc33-622c-4b39-a59e-0a9f6e2e7bc8)
  
- Fill in the Slave 1's (account ID and IAM Role and display name)
  ![723](https://github.com/user-attachments/assets/fc7e8a5f-4aca-425d-89fb-fca390836348)
  
- After login.
  ![724](https://github.com/user-attachments/assets/b26842d7-2d08-4544-bc6d-864e3c9df618)
  
- Here only ```EC2``` as we did same to user madireddy-01
  ![725](https://github.com/user-attachments/assets/56796aa3-7c82-4189-af13-1c8f2c127286)
  
- No s3 access to user madireddy-01 as we not gave.
  ![726](https://github.com/user-attachments/assets/5fb5f6e4-0523-4b22-b3f9-9fc5356d9021)
  
- Check as below in whcih account you are in
  ![727](https://github.com/user-attachments/assets/db80f537-8c40-4dc3-8e03-b9e48a4f8879)

## 6. Testing login to Slave2 account with madireddy-01 user:
- Under IAM > Dashboard copy the Aws Account URl which is below
  ```
  https://559050220397.signin.aws.amazon.com/console
  ```
- Sign in to ```Master account```
  ![720](https://github.com/user-attachments/assets/aaae80b3-bb33-4274-a609-1c38a0ed3463)
  
- Initially We signed in to ```master``` account and ```no access``` at all.
- As we did not give permission in MAster account to ```madireddy-01```
  ![721](https://github.com/user-attachments/assets/7138e4d9-8485-4e21-9690-bd986cca4029)
  
- Now from here we will switch to ```Slave 2``` account
- Click on Switch role button.
  ![722](https://github.com/user-attachments/assets/9c56dc33-622c-4b39-a59e-0a9f6e2e7bc8)
  
- Fill in the Slave 2's (account ID and IAM Role and display name)
  ![728](https://github.com/user-attachments/assets/1f7a3eeb-6fa1-4c67-969c-f6fc4b80250f)
  
- After login.
  ![729](https://github.com/user-attachments/assets/16863fc5-322d-4481-bca7-342fe4c55909)
  
- Here only ```EC2``` and ```s3``` access as we did same to user madireddy-01
  ![729](https://github.com/user-attachments/assets/16863fc5-322d-4481-bca7-342fe4c55909)
  ![730](https://github.com/user-attachments/assets/83f5ec67-8460-40a7-9f6d-39b66d89acf1)
  
- No Route53 access to user madireddy-01 as we not gave.
  ![731](https://github.com/user-attachments/assets/4170814e-8616-415d-95fd-7921292e4d01)
  
- Check as below in whcih account you are in
  ![732](https://github.com/user-attachments/assets/30dfc73c-66e9-4449-82bf-a68873401a72)
  
- Similarly do with the ```madireddy-02``` user in ```Slave1``` and ```Slave2``` accounts.
- Only cahnge after switching to madireddy-02 is switching will show before only.
- As we assigned same policy to madireddy-01 and madireddy-02 users
  ![733](https://github.com/user-attachments/assets/5e6077ff-0d2b-4bb6-90a9-2459c81b60c6)

### Note:
  - This process is little complicate
  - Switching roles with users. Account info will be little messy.
  - for less number of users it is ok but what if many users thing.
    - so now a days they are using ```AWS Organisations```

## 23.5. AWS Organizations:
- Click on Create an Organization.
  ![734](https://github.com/user-attachments/assets/8cec4585-97b7-4151-95e8-7166bc11bd75)
  
- Click on add AWS account button to add slaves 1 and 2.
  ![735](https://github.com/user-attachments/assets/5354eaa0-c520-444a-ba08-8beea894fef6)
  
- Fill in the Account(Sub account1 and Sub account2) and Message and send invite
  ![736](https://github.com/user-attachments/assets/c9b66725-60b1-4159-955a-4df9e7bceed0)
  
- Accept the invitation in two aaccounts
  ![737](https://github.com/user-attachments/assets/e74ee890-cb2a-44d5-a136-ac5be1d200d0)
  ![738](https://github.com/user-attachments/assets/4751b0ad-fecb-46d2-8aa8-94fba9334031)
  
- After accepting in ```Master account```.
  ![739](https://github.com/user-attachments/assets/90537085-5250-4db1-905f-249fd8662412)

  ### Advantages of AWS Organisations:
    - centralised billing
    - By This AWS Organizations we can create the restrictions to the Sub accounts
    - Security policies
    - Service restrictions

## 23.6. Service Control Policies Under AWS Organisations.
- Clcik on Policies Under AWS Organisations > Policies > Service control policies.
  ![740](https://github.com/user-attachments/assets/8b44b0c0-573a-4eaf-adc5-8e8218663c0b)

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
  ![741](https://github.com/user-attachments/assets/84aa322f-6197-415e-b2b3-fa4b383c8f3e)
  ![742](https://github.com/user-attachments/assets/f33c730f-c38c-4bd8-b9bd-1d2b929b4f90)
  
- After Policy creation
  ![743](https://github.com/user-attachments/assets/48021098-5642-47dc-9ebe-6f3cdeee2e98)

- Now you should assign the policy to the both slave Accounts
- Click on Slave1 account
  ![744](https://github.com/user-attachments/assets/1413310c-0fca-4b65-a794-4a472fc3e642)
  
- Click on attach button under Slave1 > Policies > Attach
  ![745](https://github.com/user-attachments/assets/691fd268-51f6-4691-b221-3007331a05a1)
  
- Select the Service control Policy which we created earlier resctricting the few features in the code.
- Click on attach policy button.
  ![746](https://github.com/user-attachments/assets/de140fc0-d335-4eb7-aaf1-7177e1c8fab8)

- Similarly do to the Slave2 account
- Click on Slave2
  ![747](https://github.com/user-attachments/assets/f3c4bb15-93f5-4cec-9f77-edc60878f615)

- Click on attach button under Slave2 > Policies > Attach
  ![748](https://github.com/user-attachments/assets/cf8cafb8-1708-409c-8f26-04ebcb64ae58)

- Select the Service control Policy which we created earlier resctricting the few features in the code.
- Click on attach policy button.
  ![749](https://github.com/user-attachments/assets/04bed567-8487-4fa3-a2c2-227624db2d84)

- Now test in Slave 1 nad 2 for access
- IAM, Route53 should be denied and etc, specified in the above code.
  ![750](https://github.com/user-attachments/assets/cb949ced-00ae-4f58-bc80-5551568869de)
  ![751](https://github.com/user-attachments/assets/5fe1d8a2-6dff-4689-a4bf-fb1b6e995fc9)
- Similarly there should be restrictions in many as above per code.
- Testing might be long so ```skipping``` few tests.
- NOw you can remove the policies if required for slave 1 and 2 accounts.
- Next we will Create Active Directory in AWS and shows how organizations users are maintained at singlr point.
