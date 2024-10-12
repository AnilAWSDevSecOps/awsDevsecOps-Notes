# Systems Manager:

- Sessions Manager
- Run Commands
    - Install Nginx using Run Commands
    - Install and configure the cloudwatch Agent using Run Commands
- Parameter Store

## IAM ROLE:

- We will create one role with below permissions and we assign to the Ec2 instances.
  ![1159](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1159.png)

- Now we will launch 2 instances for this demo
  ![1160](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1160.png)

## INstance Launching

- Now we will create tags for the two instances.
  ![1163](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1163.png)
  ![1164](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1164.png)

## RUN COMMAND

- Now Come to AWS System Manager > Run Command., Click on Run a Command button.
  ![1161](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1161.png)
  ![1162](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1162.png)

- Select AWS-RunShellScript
  ![1165](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1165.png)

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
  ![1166](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1166.png)

- Provide the Tag for which Run command should execute.
  ![1167](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1167.png)

- Disable s3 bucket option and click on Run.
  ![1168](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1168.png)

- Run will start and will be in progess.
  ![1169](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1169.png)

- Command History will look like this.
  ![1170](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1170.png)

- Now when you browse nginx you will get if installed correctly by run command. in both servers.
  ![1171](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1171.png)
  ![1172](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1172.png)

## Installing Cloudwatch Agent by RunCommand:

### COPY CLOUDWATCH AGENT:

- AWS Systems Manager > Run Command > Runcommand Button
  ![1173](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1173.png)

- Select AWS-ConfigureAWSPackage which will copy the cloud watch agent into servers.
  ![1174](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1174.png)
  ![1175](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1175.png)
  ![1176](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1176.png)
  ![1177](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1177.png)
  ![1178](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1178.png)

## CONFIGURING THE COPIED CLOUDWATCH AGENT

- Now login in to the two instances and see if the cloud watch agent is coped or not.
- under /opt/aws/amazon-cloudwatch-agent/bin
- run ```./amazon-cloudwatch-agent-config-wizard``` in both servers and configure as below
- Server 1 configuration
- actually you can do it only in one server but i did in 2 servers
- you can skip the server 2 if needed and follow ```copy to new``` process which explained below
  ![1179](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1179.png)
  ![1180](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1180.png)
  ![1182](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1182.png)
  ![1184](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1184.png)
  ![1186](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1186.png)
  ![1188](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1188.png)

- Server 2 configuration
  ![1181](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1181.png)
  ![1183](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1183.png)
  ![1185](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1185.png)
  ![1187](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1187.png)
  ![1189](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1189.png)

- After the configuration you can see this parameter in parameter store under AWS Systems Manager.
  ![1190](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1190.png)
  ![1191](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1191.png)

- Now you can go to AWS Systems Manager > Runcommand > Command History
- Select command id which has AWS-ConfigureAWSPackage as Document name and clcik on ```copy to new``` button
- and select the targets and copy the same config to as many as targets possible if needed.
  ![1192](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1192.png)
  ![1193](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1193.png)
  ![1194](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1194.png)

## CONFIGURING THE CLOUD WATCH MANAGER AGENT

- Now we will configure the AmazonCloudWatch-ManagerAgent in the two instances.
  ![1195](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1195.png)
  ![1196](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1196.png)
  ![1197](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1197.png)
  ![1198](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1198.png)
  ![1199](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1199.png)
  ![1200](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1200.png)
  ![1201](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1201.png)

- After configure the AmazonCloudWatch-ManagerAgent in the two instances this will be shown in cloudwatch > Metrics
  ![1202](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1202.png)

- This will be shown in shown in Cloudwatch > Log Groups
  ![1203](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1203.png)
  ![1204](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1204.png)
  ![1205](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1205.png)

  ## Log Insights
  ### Checking with 404:
  ```
  fields @timestamp, @message, @logStream, @log
  | sort @timestamp desc
  | filter @message like /404/
  | limit 200
  ```
  ![1206](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1206.png)

  ### Checking with IP:
  ```
  fields @timestamp, @message, @logStream, @log
  | sort @timestamp desc
  | filter @message like "49.47.233.31"
  | limit 200
  ```
  ![1207](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1207.png)

## SSM Hybrid Activation:

- This manages the instances which are out side AWS.
  ![1208](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1208.png)
  ![1209](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1209.png)

- You will get activation code and ID
  ![1210](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1210.png)

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
- Now after installing go to Sessions Manager in AWS and Click on start session button then our Azure server should
  appear.
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
  ![1211](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1211.png)
  ![1212](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1212.png)
  ![1213](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1213.png)
  ![1214](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1214.png)

- Now you can browse the azure server nginx.

# CloudWatch-Alarams & Notifications:

## Configuring SNS (Simple Notification Service):

![1215](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1215.png)

- We will configure the Memory Monitor and Disk MOnitor for the instances
  ![1216](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1216.png)
  ![1217](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1217.png)
  ![1218](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1218.png)
  ![1219](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1219.png)
  ![1220](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1220.png)

- Topic Creation and subscription creation.
  ![1221](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1221.png)
  ![1222](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1222.png)
  ![1223](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1223.png)
  ![1224](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1224.png)
  ![1225](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1225.png)
  ![1225-01](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1225-01.png)

- In Pager Duty Integrationg the Slack Extension.
  ![1226](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1226.png)

- Now for two instances we will ```System-Manager-01:```i-087690faf88417e6f(Monitor Memory)
- ```System-Manager-02:```i-0b343119cbbd2f780(Disk Monitor)
  ![1226-01](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1226-01.png)
  ![1226-02](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1226-02.png)
- Now we will create alarms for that
  ![1227](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1227.png)
  ![1228](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1228.png)
  ![1229](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1229.png)
  ![1230](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1230.png)
  ![1231](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1231.png)
  ![1232](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1232.png)
  ![1233](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1233.png)
  ![1234](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1234.png)
  ![1235](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1235.png)
  ![1236](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1236.png)
  ![1237](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1237.png)
  ![1238](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1238.png)
  ![1239](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1239.png)
  ![1240](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1240.png)
  ![1241](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1241.png)
  ![1242](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1242.png)
  ![1243](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1243.png)
  ![1244](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1244.png)
  ![1245](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1245.png)
  ![1246](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1246.png)
  ![1247](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1247.png)
  ![1248](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1248.png)
  ![1249](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1249.png)
  ![1250](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1250.png)
  ![1251](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1251.png)
  ![1252](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1252.png)
  ![1253](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1253.png)
  ![1254](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1254.png)
  ![1255](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1255.png)


