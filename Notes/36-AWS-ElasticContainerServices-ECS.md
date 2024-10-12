# AWS Elastic Container Services (ECS):

### 1. Virtual machines vs Containers

### 2. Installing Docker and Running containers.

### 3. Creating custom container images using Docker.

### 4. Pushing container images to AWS Elastic Container Registry(ECR)

## Amazon Elastic Container Sservices:

### 1. Fargate

### 2. EC2

## 1. Virtual machines vs Containers:

- Sample diagram demonstrating the Virtual machines vs Containers.
  ![1317](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1317.png)

- Explonation Diagram
  ![1318](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1318.png)

- Launching the ubuntu instance for docker installation
  ```
  apt update -y
  apt install -y unzip
  apt install -y net-tools
  ```
  ```
  ifconfig
  ```
- Intially try ifconfig
  ![1319](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1319.png)

  ```
  curl https://get.docker.com | bash
  docker version
  ```

- Docker installed successfully.
  ![1321](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1321.png)

  ```
  ifconfig
  ```

- After docker installation try ifconfig
  ![1320](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1320.png)

- Sample docker run
  ```
  docker run --rm -d --name app1 -p 80:80 nginx:latest
  ```
    - docker run --> is used to run the docker
    - --rm --> is used to delete the docker container if some reason docker container stops
    - -d --> is used to detach the container without going in ti the container
    - -name --> container name
    - -p --> port number in:Expose
    - nginx:latest --> image

  ![1322](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1322.png)

  ![1323](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1323.png)
  ```
  docker ps
  ```
  ```
  root@ip-10-1-1-226:~# docker ps
  CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                               NAMES
  0309276c319f   nginx:latest   "/docker-entrypoint.…"   13 minutes ago   Up 13 minutes   0.0.0.0:80->80/tcp, :::80->80/tcp   app1
  root@ip-10-1-1-226:~#
  ```
- Now if you browse with Publicip:80 you can get nginx.
  ![1324](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1324.png)

- Now Sample Docker file.
- you can find this in sampleDockerBuild dir in this repo
  ### Dockerfile
  ```
  FROM nginx:latest
  MAINTAINER practice@devopbymak.xyz
  RUN apt install -y curl
  COPY index.html /usr/share/nginx/html/
  COPY scorekeeper.js /usr/share/nginx/html/
  COPY style.css /usr/share/nginx/html/
  COPY error.html /usr/share/nginx/html/
  COPY ngnix_default.config /etc/nginx/sites-enabled/default
  COPY error.html /usr/share/nginx/html/
  CMD ["nginx", "-g", "daemon off;"]
  ```
- these are the files used
  ```
  root@ip-10-1-1-226:~/dockertest1# ll
  total 32
  drwxr-xr-x 3 root root 4096 Aug 31 12:59 ./
  drwx------ 5 root root 4096 Aug 31 12:59 ../
  drwxr-xr-x 8 root root 4096 Aug 31 12:54 .git/
  -rw-r--r-- 1 root root  384 Aug 31 12:59 Dockerfile
  -rw-r--r-- 1 root root 1581 Aug 31 12:54 error.html
  -rw-r--r-- 1 root root  753 Aug 31 12:54 index.html
  -rw-r--r-- 1 root root 1437 Aug 31 12:54 scorekeeper.js
  -rw-r--r-- 1 root root  340 Aug 31 12:54 style.css
  ```
- Docker build to build the image
  ```
  docker build -t madireddydocker/dockertestnginx:v1 .
  ```
- To run the image
  ```
  docker run --rm -d --name app10 -p 5001:80 madireddydocker/dockertestnginx:v1
  ```
- To check the images
  ```
  docker images
  ```
- To check the process
  ```
  docker ps
  ```

- In realtime we use private repositories Amazon Elastic Container Registry

## Amazon Elastic Container Registry (ECR):

![1325](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1325.png)
![1326](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1326.png)
![1327](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1327.png)
![1328](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1328.png)

- Install AWS CLI to push the images to Amazon Elastic Container Registry
  ```
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  ```

- Now configure the aws
  ```
  aws configure
  ```

- Now Open the Registry.
  ![1329](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1329.png)
  ![1330](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1330.png)

- Now we have to rename to tags to match the registry.
  ![1331](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1331.png)
  ![1332](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1332.png)
  ![1333](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1333.png)

## Amazon Elastic Container Services (ECS):

## 1. Fargate:

- Now We create fargate
  ![1334](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1334.png)
  ![1335](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1335.png)
  ![1336](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1336.png)

- Now after creating the fargate we need to do the task definition
  ### Role Creation
  ![1342-01](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1342-01.png)
  ![1342-02](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1342-02.png)
  ![1342-03](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1342-03.png)
  ### ECSFargateAllowExecuteCommand
  ```
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "Statement1",
              "Effect": "Allow",
              "Action": [
                  "ssmmessages:CreateControlChannel",
                  "ssmmessages:CreateDataChannel",
                  "ssmmessages:OpenControlChannel",
                  "ssmmessages:OpenDataChannel"
              ],
              "Resource": [
                  "*"
              ]
          }
      ]
  }
  ```
  ### EnableExecuteCommand
  ```
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "VisualEditor0",
              "Effect": "Allow",
              "Action": "ecs:ExecuteCommand",
              "Resource": "*"
          }
      ]
  }
  ```
  ### nginx_fargate.json
  ```
  {
      "requiresCompatibilities": [
        "FARGATE"
      ],
      "containerDefinitions": [
        {
          "name": "nginxtest",
          "image": "559050220397.dkr.ecr.us-east-1.amazonaws.com/devopsbymak:ngtestv1",
          "memory": 256,
          "cpu": 256,
          "essential": true,
          "portMappings": [
            {
              "containerPort": 80,
              "protocol": "tcp"
            }
          ],
          "logConfiguration":{
                "logDriver":"awslogs",
                "options":{
                   "awslogs-group":"ecs-log-group",
                   "awslogs-region":"us-east-1",
                   "awslogs-stream-prefix":"ecs"
                }
          }
        }
      ],
      "volumes": [],
      "networkMode": "awsvpc",
      "placementConstraints": [],
      "family": "nginxtest",
      "memory": "512",
      "cpu": "256",
      "executionRoleArn": "arn:aws:iam::559050220397:role/AnilECSTaskExecutionRole"
    }
  ```

- Now here we need to change the Image name to our image, and need to create the log-group
- under cloud watch create one log-group.
  ![1337](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1337.png)
  ![1338](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1338.png)
  ![1339](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1339.png)

  ![1340](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1340.png)
  ![1341](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1341.png)
  ![1342](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1342.png)
  ![1343](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1343.png)
  ![1344](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1344.png)
  ![1345](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1345.png)
  ![1346](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1346.png)
  ![1347](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1347.png)
  ![1348](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1348.png)
  ![1349](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1349.png)
  ![1350](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1350.png)
  ![1351](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1351.png)
  ![1352](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1352.png)
  ![1353](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1353.png)
  ![1354](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1354.png)
  ![1355](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1355.png)

- Now if you update the task definition of something , but we do in environment update.
  ### updating nginx_fargate.json
  ```
  {
      "requiresCompatibilities": [
        "FARGATE"
      ],
      "containerDefinitions": [
        {
          "name": "nginxtest",
          "image": "559050220397.dkr.ecr.us-east-1.amazonaws.com/devopsbymak:ngtestv1",
          "memory": 256,
          "cpu": 256,
          "essential": true,
          "environment": [
            {
                "name": "AWS_ACCESS_KEY_ID",
                "value": "value"
            },
            {
                "name": "AWS_SECRET_ACCESS_KEY",
                "value": "value"
            }
        ],        
          "portMappings": [
            {
              "containerPort": 80,
              "protocol": "tcp"
            }
          ],
          "logConfiguration":{
                "logDriver":"awslogs",
                "options":{
                   "awslogs-group":"ecs-log-group",
                   "awslogs-region":"us-east-1",
                   "awslogs-stream-prefix":"ecs"
                }
          }
        }
      ],
      "volumes": [],
      "networkMode": "awsvpc",
      "placementConstraints": [],
      "family": "nginxtest",
      "memory": "512",
      "cpu": "256",
      "executionRoleArn": "arn:aws:iam::559050220397:role/AnilECSTaskExecutionRole"
    }
  ```
- Now we can update the task definition in console.
  ![1356](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1356.png)
  ![1357](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1357.png)
  ![1358](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1358.png)
  ![1359](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1359.png)
  ![1360](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1360.png)

- Click on Update button
- After update old one will get deleted and three more tasks will create here
  ![1361](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1361.png)

- Again try to browse the application from Amazon Elastic Container Service > Clusters > devClusterFargate01 >
  Services >application > Tasks > openanytask > Configuration > Network binding > Externallink

## 2. ECS EC2

### ECS Cluster Creation:

![1362](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1362.png)
![1363](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1363.png)
![1364](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1364.png)
![1365](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1365.png)
![1366](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1366.png)
![1366-01](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1366-01.png)
![1366-02](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1366-02.png)
![1366-03](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1366-03.png)
![1366-04](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1366-04.png)

### Task Definition Creation for ECS EC2:

![1367](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1367.png)
![1368](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1368.png)
![1369](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1369.png)
![1370](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1370.png)

### Dummy user CReation for the ECS EC2:

![1370-01](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1370-01.png)
![1370-02](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1370-02.png)
![1370-03](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1370-03.png)
![1370-04](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1370-04.png)
![1370-05](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1370-05.png)

### CReating Task For ECS EC2 Cluster:

![1371](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1371.png)
![1372](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1372.png)
![1373](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1373.png)
![1374](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1374.png)
![1375](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1375.png)
![1376](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1376.png)
![1376-01](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1376-01.png)
![1377](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1377.png)
![1378](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1378.png)

- if you click on stop all then its all gone app wont be working
  ![1379](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1379.png)

- so we create the services in cluster.
- for this we create the one role.
  ![1380](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1380.png)

### Service CReation in ECS Cluster:

![1381](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1381.png)
![1381-00](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1381-00.png)
![1381-00-01](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1381-00-01.png)
![1381-01](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1381-01.png)
![1381-02](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1381-02.png)
![1381-03](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1381-03.png)
![1381-04](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1381-04.png)
![1381-05](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1381-05.png)
![1381-06](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1381-06.png)
![1381-07](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1381-07.png)
![1381-08](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1381-08.png)
![1381-09](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1381-09.png)
![1382](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1382.png)
![1383](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1383.png)
![1384](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1384.png)
![1385](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1385.png)
![1386](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1386.png)
![1387](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1387.png)
![1388](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1388.png)

- Now if you try to delete the tasks in the Cluster then services will automatically bring up the tasks
  ![1389](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1389.png)
  ![1390](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1390.png)
  ![1391](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1391.png)

- First delete Service then Cluster
