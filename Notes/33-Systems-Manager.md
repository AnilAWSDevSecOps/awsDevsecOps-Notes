# Systems Manager:
- Sessions Manager
- Run Commands
  - Install Nginx using Run Commands
  - Install and configure the cloudwatch Agent using Run Commands
- Parameter Store

## IAM ROLE:
- We will create one role with below permissions and we assign to the Ec2 instances.
  ![1159](https://github.com/user-attachments/assets/66decdda-6f4b-4520-a1a8-1e67a098966a)
  
- Now we will launch 2 instances for this demo
  ![1160](https://github.com/user-attachments/assets/cc801369-7ee0-43db-b6db-13415f379ebe)
  
## INstance Launching
- Now we will create tags for the two instances.
  ![1163](https://github.com/user-attachments/assets/c9c19bba-9d0b-4a56-a940-a60d30f1ae05)
  ![1164](https://github.com/user-attachments/assets/f4c1a2f7-8b20-47fe-881e-d0aeb5062594)

## RUN COMMAND
- Now Come to AWS System Manager > Run Command., Click on Run a Command button.
  ![1161](https://github.com/user-attachments/assets/9cc482ac-c9fd-4f54-aad0-d808c7daaabc)
  ![1162](https://github.com/user-attachments/assets/1a70136b-2c3e-4252-bffc-1cd932f67f9d)

- Select AWS-RunShellScript
  ![1165](https://github.com/user-attachments/assets/3bdf566c-bcde-4e05-8933-361d892fe48f)

- Provide shell commands to execute.
  ```
  #!/bin/bash
  yum update -y
  yum install telnet -y
  yum install tmux -y
  yum install nginx -y
  service nginx start
  systemctl enable nginx
  ```
  ![1166](https://github.com/user-attachments/assets/d9bfb7b6-6409-4cbd-a3b6-b919740440de)

- Provide the Tag for which Run command should execute.
  ![1167](https://github.com/user-attachments/assets/2812565d-4001-476a-9c9e-012a08eb7e55)

- Disable s3 bucket option and click on Run.
  ![1168](https://github.com/user-attachments/assets/9d61a807-7503-4a84-8449-408c314d575f)

- Run will start and will be in progess.
  ![1169](https://github.com/user-attachments/assets/3ea09661-e0ce-455a-a018-45d52fac9768)

- Command History will look like this.
  ![1170](https://github.com/user-attachments/assets/8ab7d708-09ad-4d15-a5d9-413da008037c)

- Now when you browse nginx you will get if installed correctly by run command. in both servers.
  ![1171](https://github.com/user-attachments/assets/d71f290f-f77c-4ba6-8842-0b5f9e22afdd)
  ![1172](https://github.com/user-attachments/assets/574c6bdc-4a53-4e13-90db-87df30258d2f)

## Installing Cloudwatch Agent by RunCommand:
### COPY CLOUDWATCH AGENT:
- AWS Systems Manager > Run Command > Runcommand Button
  ![1173](https://github.com/user-attachments/assets/26e23406-2426-4066-b127-456e9d9814cf)

- Select AWS-ConfigureAWSPackage which will copy the cloud watch agent into servers.
  ![1174](https://github.com/user-attachments/assets/3c8d97b7-5e73-4654-89b6-fd4b4139fddc)
  ![1175](https://github.com/user-attachments/assets/5e86e86d-efb0-4252-9d5b-00188b77686a)
  ![1176](https://github.com/user-attachments/assets/cc1cdabf-7b64-47d3-bd27-2b67855d0d5a)
  ![1177](https://github.com/user-attachments/assets/d7ae46af-6a89-4bd2-a4b8-51fe6900ec93)
  ![1178](https://github.com/user-attachments/assets/9180f4ce-0df5-4099-a2e2-c230850d5fc8)

## CONFIGURING THE COPIED CLOUDWATCH AGENT
- Now login in to the two instances and see if the cloud watch agent is coped or not.
- under /opt/aws/amazon-cloudwatch-agent/bin
- run ```./amazon-cloudwatch-agent-config-wizard``` in both servers and configure as below
- Server 1 configuration
- actually you can do it only in one server but i did in 2 servers
- you can skip the server 2 if needed and follow ```copy to new``` process which explained below
  ![1179](https://github.com/user-attachments/assets/52432990-941d-4133-843d-5afc329ae501)
  ![1180](https://github.com/user-attachments/assets/2db908ec-2d08-41fd-a366-eac3a44402ac)  
  ![1182](https://github.com/user-attachments/assets/8dd1bc04-d933-4ad5-b5b6-b6a796d81862)  
  ![1184](https://github.com/user-attachments/assets/0be17b26-21ec-437b-ba92-c46a56b7128d) 
  ![1186](https://github.com/user-attachments/assets/5e9072f4-a228-4186-966d-232bd6cf5b8d)  
  ![1188](https://github.com/user-attachments/assets/fa0055bd-1d19-4a15-9f34-a156fe68c392)

- Server 2 configuration
  ![1181](https://github.com/user-attachments/assets/6a6508ad-ccf9-4549-94b1-8d051d3184dd)
  ![1183](https://github.com/user-attachments/assets/4ca9e4a1-4a50-40f1-9a6d-0dd2638d149c)
  ![1185](https://github.com/user-attachments/assets/34718d95-cc48-49b4-8c4f-50996d3f2a4f)
  ![1187](https://github.com/user-attachments/assets/fc265dfb-d5df-4a0e-9a57-e8442cd9ec66)
  ![1189](https://github.com/user-attachments/assets/b3c3585d-2a9b-44a6-aad9-1cf5ae917ebd)

- After the configuration you can see this parameter in parameter store under AWS Systems Manager.
  ![1190](https://github.com/user-attachments/assets/1063fb01-f3fd-4d8b-a8ba-874b05240cc5)
  ![1191](https://github.com/user-attachments/assets/6b1a2aff-4e13-433b-94cd-c19eb966a6cd)

- Now you can go to AWS Systems Manager > Runcommand > Command History
- Select command id which has AWS-ConfigureAWSPackage as Document name and clcik on ```copy to new``` button
- and select the targets and copy the same config to as many as targets possible if needed.
  ![1192](https://github.com/user-attachments/assets/aa0756bd-a4b7-4453-8bee-f0b131982b41)
  ![1193](https://github.com/user-attachments/assets/ab51676c-f7b3-40ba-84e5-9b025b3ad288)
  ![1194](https://github.com/user-attachments/assets/5e49aae7-2bf2-4d3d-a12c-e65831f179bc)

## CONFIGURING THE CLOUD WATCH MANAGER AGENT
- Now we will configure the AmazonCloudWatch-ManagerAgent in the two instances.
  ![1195](https://github.com/user-attachments/assets/bbf56ae5-2cea-48a0-b49e-8aed7dba721f)
  ![1196](https://github.com/user-attachments/assets/aeb66939-b0a6-4922-848b-fb966b4d5639)
  ![1197](https://github.com/user-attachments/assets/85b1b36c-f51b-410e-acdd-bc8f1aebc1ae)
  ![1198](https://github.com/user-attachments/assets/34d1d645-0463-4cbf-8829-e0b1b419e1bb)
  ![1199](https://github.com/user-attachments/assets/bfe06e32-c68e-4575-b5dc-13a6f724158c)
  ![1200](https://github.com/user-attachments/assets/5d4dd5f6-e963-44d9-b346-db18d123a0c4)
  ![1201](https://github.com/user-attachments/assets/1a1367f8-9634-4612-999e-79bffa77dec8)

- After configure the AmazonCloudWatch-ManagerAgent in the two instances this will be shown in cloudwatch > Metrics
  ![1202](https://github.com/user-attachments/assets/135eb671-702d-477a-aa81-c95850478af9)

- This will be shown in shown in Cloudwatch > Log Groups
  ![1203](https://github.com/user-attachments/assets/d1e27408-ce01-410a-9391-e0103705a9ea)
  ![1204](https://github.com/user-attachments/assets/b476b021-5171-46c6-b2e4-ae9bafee5e31)
  ![1205](https://github.com/user-attachments/assets/94ec5d1c-9a6a-4d95-a894-3b71525cb163)

  ## Log Insights
  ### Checking with 404:
  ```
  fields @timestamp, @message, @logStream, @log
  | sort @timestamp desc
  | filter @message like /404/
  | limit 200
  ```
  ![1206](https://github.com/user-attachments/assets/93d4d686-5245-432e-81cd-4b3af55a7033)

  ### Checking with IP:
  ```
  fields @timestamp, @message, @logStream, @log
  | sort @timestamp desc
  | filter @message like "49.47.233.31"
  | limit 200
  ```
  ![1207](https://github.com/user-attachments/assets/8610758a-585f-48f2-bcfb-9976871dae2d)



## SSM Hybrid Activation:
- This manages the instances which are out side AWS.
  ![1208](https://github.com/user-attachments/assets/5056d8bc-364c-484a-8b20-21fd04821d40)
  ![1209](https://github.com/user-attachments/assets/e6ad691b-77c3-4b66-92fa-6a2497d7f6e4)

- You will get activation code and ID
  ![1210](https://github.com/user-attachments/assets/136b4bec-6fab-423f-9720-5b7d7b59fb08)

- Now launch the Azure VM Ubuntu in azure.
- Use the below commands and install SSM Hybrid
- only thing in code is replace the activation code and ID with your Hybrid Activation Code and ID
  ```
  mkdir /tmp/ssm
  curl https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb -o /tmp/amazon-ssm-agent.deb
  sudo dpkg -i /tmp/amazon-ssm-agent.deb
  sudo service amazon-ssm-agent stop
  sudo amazon-ssm-agent -register -code "jC+mM+7sjLq6e7RB5iys" -id "cf970a3b-6bba-4637-9eb1-bc1b05a0ad5c" -region "us-east-1" 
  sudo service amazon-ssm-agent start
  ```
- Now after installing go to Sessions Manager in AWS and Click on start session button then our Azure server should appear.
- Now you can use the Runcommands and manage the Azure server from AWS.
  ```
  #!/bin/bash
  sudo apt update -y
  apt install -y nginx
  git clone https://github.com/mavrick202/dockertest1.git
  cd dockertest1
  rm -f /var/www/html/index.nginx-debian.html
  cp index.html /var/www/html/index.nginx-debian.html
  cp style.css  /var/www/html/style.css
  cp scorekeeper.js /var/www/html/scorekeeper.js
  echo "<h1>$(cat /etc/hostname)</h1>" >> /var/www/html/index.nginx-debian.html
  ```
  ![1211](https://github.com/user-attachments/assets/0320d980-e69a-4643-ab16-629276129559)
  ![1212](https://github.com/user-attachments/assets/51d8b7a7-0909-4bd7-9f47-82b29c69e7a4)
  ![1213](https://github.com/user-attachments/assets/4089972a-e05d-4b17-ac0f-d4dea3102f40)
  ![1214](https://github.com/user-attachments/assets/799c02f7-8319-415c-8fd2-150e909c2900)

- Now you can browse the azure server nginx.


# CloudWatch-Alarams & Notifications:

## Configuring SNS (Simple Notification Service):
  ![1215](https://github.com/user-attachments/assets/825c6c7f-2473-4910-b1b3-3fd86108fd48)

- We will configure the Memory Monitor and Disk MOnitor for the instances
  ![1216](https://github.com/user-attachments/assets/3fa35343-b062-4555-84b8-6febe1980108)
  ![1217](https://github.com/user-attachments/assets/648a180b-0373-4d9b-a097-4fa68205ea7e)
  ![1218](https://github.com/user-attachments/assets/bb356f9d-d454-4f52-a68f-f240e35693d5)
  ![1219](https://github.com/user-attachments/assets/8ffab62b-6e0c-4efd-8aa9-1a28aca9fffe)
  ![1220](https://github.com/user-attachments/assets/086e7272-ea72-4837-a4f6-41401eee1ee3)

- Topic Creation and subscription creation.
  ![1221](https://github.com/user-attachments/assets/27bc31e6-9ce7-4fa0-9368-358b174ca315)
  ![1222](https://github.com/user-attachments/assets/431c2bcb-d66f-4827-8fe5-c070381ad215)
  ![1223](https://github.com/user-attachments/assets/692aca74-51a3-437c-bc65-f8f66daf9ccd)
  ![1224](https://github.com/user-attachments/assets/13194c64-c189-44f8-b0a6-8b6f612e60db)
  ![1225](https://github.com/user-attachments/assets/1f241d68-3d77-4db9-a417-120f8137f2f7)
  ![1225-01](https://github.com/user-attachments/assets/45175300-fc81-4505-95cf-aa04181e984e)
  
- In Pager Duty Integrationg the Slack Extension.
  ![1226](https://github.com/user-attachments/assets/81406f65-a09c-43cc-93dc-b06ca7aeee4c)

- Now for two instances we will ```System-Manager-01:```i-087690faf88417e6f(Monitor Memory)
- ```System-Manager-02:```i-0b343119cbbd2f780(Disk Monitor)
  ![1226-01](https://github.com/user-attachments/assets/a80ca326-ade1-45d5-8195-132db2ea1cb7)
  ![1226-02](https://github.com/user-attachments/assets/bfff867a-5ee3-4a2b-854e-b8bdb41ad7bc)
- Now we will create alarms for that
  ![1227](https://github.com/user-attachments/assets/1d27379f-2be7-424b-b1d1-8a0e3796bd25)
  ![1228](https://github.com/user-attachments/assets/d018c1ac-af56-4f46-ad1b-e850e003c723)
  ![1229](https://github.com/user-attachments/assets/e1613c9b-3d2b-4e4f-b6af-a8aad618a4fe)
  ![1230](https://github.com/user-attachments/assets/9d800efa-74d4-4bbe-85c5-4e380bc0b0ad)
  ![1231](https://github.com/user-attachments/assets/34a15fcf-6b6b-4b8c-9b5a-1468fac04cf4)
  ![1232](https://github.com/user-attachments/assets/a5ab856d-ba3a-4f06-be83-392187d64e9f)
  ![1233](https://github.com/user-attachments/assets/ee569193-65e8-4392-b3f2-eb286a70bec3)
  ![1234](https://github.com/user-attachments/assets/c6c3efce-3159-4db4-8ace-2509e0671bc5)
  ![1235](https://github.com/user-attachments/assets/d67b82f0-ce32-43e9-9b1a-8da8446055f5)
  ![1236](https://github.com/user-attachments/assets/56f41632-ea6b-4303-8dc5-5048cde6cd66)
  ![1237](https://github.com/user-attachments/assets/c8458512-9820-4c65-aa50-11ee45ef1fcd)
  ![1238](https://github.com/user-attachments/assets/5650aabb-5b3a-432e-924f-11b8ecb1b3c9)
  ![1239](https://github.com/user-attachments/assets/0636e95d-7a48-4221-b41a-db4a1e872a6f)
  ![1240](https://github.com/user-attachments/assets/ba665753-518f-40ad-b268-cb78a49a8fde)
  ![1241](https://github.com/user-attachments/assets/593d12aa-78a8-4724-8d6a-ed7e1acac41c)
  ![1242](https://github.com/user-attachments/assets/75885f7d-57ef-4a79-98b3-f510a6a0ad58)
  ![1243](https://github.com/user-attachments/assets/f0491a57-5891-4f2e-8f07-b7eeae1e70a3)
  ![1244](https://github.com/user-attachments/assets/9297b228-cae8-4ebb-993b-766bde60a6f2)
  ![1245](https://github.com/user-attachments/assets/5d9c97e2-c9cc-4e12-97ce-c0e57424c01c)
  ![1246](https://github.com/user-attachments/assets/04851f36-b6ee-4b0b-85e0-e079fd368770)
  ![1247](https://github.com/user-attachments/assets/3903513c-cd56-4bed-a191-49156a3dffab)
  ![1248](https://github.com/user-attachments/assets/8f14bdd9-a374-4787-b580-c198c5b59d21)
  ![1249](https://github.com/user-attachments/assets/c591e801-66d2-4058-a172-a626389801d3)
  ![1250](https://github.com/user-attachments/assets/8a992d25-09b0-4728-84d9-2bfde147d017)
  ![1251](https://github.com/user-attachments/assets/ab5a9255-df02-435a-ad5f-5a30d558424b)
  ![1252](https://github.com/user-attachments/assets/2a2ab01a-fd2d-44b0-825d-adee9860e7db)
  ![1253](https://github.com/user-attachments/assets/7ca4d15c-99cb-42bd-aa43-3124e17262ce)
  ![1254](https://github.com/user-attachments/assets/b086d6c9-3d16-4871-869d-f8123274dfca)
  ![1255](https://github.com/user-attachments/assets/42ddb587-b7ad-4877-9663-409fee2c85a8)


