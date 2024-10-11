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
  ![1317](https://github.com/user-attachments/assets/c4363277-6978-4c39-a90f-4c80f6b58fc5)

- Explonation Diagram
  ![1318](https://github.com/user-attachments/assets/01f6d3e3-da4f-4dd0-ab52-b1b6ea882709)

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
  ![1319](https://github.com/user-attachments/assets/925cb614-970b-4c6e-b3e9-86b46cd5d537)

  
  ```
  curl https://get.docker.com | bash
  docker version
  ```
- Docker installed successfully.
  ![1321](https://github.com/user-attachments/assets/befef950-6466-4fb1-9fc6-e0ae941792e0)


  ```
  ifconfig
  ```
- After docker installation try ifconfig
  ![1320](https://github.com/user-attachments/assets/73a8e7aa-b2c0-4f5c-9758-f5681dda76be)
  
- Sample docker run
  ```
  docker run --rm -d --name app1 -p 80:80 nginx:latest
  ```
  - docker run   --> is used to run the docker
  - --rm         --> is used to delete the docker container if some reason docker container stops
  - -d           --> is used to detach the container without going in ti the container
  - -name        --> container name
  - -p           --> port number in:Expose
  - nginx:latest --> image
    
  ![1322](https://github.com/user-attachments/assets/70ee12d0-ad82-4744-a87a-6fdf77ff7c61)

  ![1323](https://github.com/user-attachments/assets/fb3fca46-fa96-4265-a479-4a178b057086)
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
  ![1324](https://github.com/user-attachments/assets/88af3a56-eceb-45a0-8683-25003ef63598)

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

  ![1325](https://github.com/user-attachments/assets/e3a781cb-bdd3-4586-9023-41d888982a1e)
  ![1326](https://github.com/user-attachments/assets/e78e3537-59b4-47e3-a8b7-165399471217)
  ![1327](https://github.com/user-attachments/assets/4289e291-bdb3-431c-8c84-e3bfbc487a4a)
  ![1328](https://github.com/user-attachments/assets/200c86f4-fbf5-471c-9e5b-e1b81130105e)

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
  ![1329](https://github.com/user-attachments/assets/7df52d80-9324-4810-8fc2-1eb5a57e4496)
  ![1330](https://github.com/user-attachments/assets/ba31540f-d31c-4516-8eba-80edaf87e1ff)

- Now we have to rename to tags to match the registry.
  ![1331](https://github.com/user-attachments/assets/92942404-9836-4f11-9115-46eecb2bd3cf)
  ![1332](https://github.com/user-attachments/assets/7d20bd2f-21a2-4944-b03f-74a7402c818e)
  ![1333](https://github.com/user-attachments/assets/1ba12ca2-5f13-4562-91a8-99f10ae99952)

## Amazon Elastic Container Services (ECS):
## 1. Fargate:
- Now We create fargate
  ![1334](https://github.com/user-attachments/assets/87471db6-947b-4e43-8f4d-adf94e69dabd)
  ![1335](https://github.com/user-attachments/assets/8809b5c1-e406-41bd-9c26-49465cf6b748)
  ![1336](https://github.com/user-attachments/assets/4295e072-83bd-465a-aa2f-a06340fe1327)

- Now after creating the fargate we need to do the task definition
  ### Role Creation
  ![1342-01](https://github.com/user-attachments/assets/eaf415de-e8bc-446e-832a-b2bb5f7c5d69)
  ![1342-02](https://github.com/user-attachments/assets/0c2b9a3c-761e-43bd-875e-ede11ba06422)
  ![1342-03](https://github.com/user-attachments/assets/347951b8-8568-432b-b38a-f3875febdbc1)
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
  ![1337](https://github.com/user-attachments/assets/f78917ec-85a3-4b70-bce3-b239af38d6cf)
  ![1338](https://github.com/user-attachments/assets/6d58ffbe-2362-41a9-9342-35d52460d8f0)
  ![1339](https://github.com/user-attachments/assets/b607ae91-8a73-4315-b5b0-0b088f44b2cf)

  ![1340](https://github.com/user-attachments/assets/1e44c02e-3dec-49ac-8e97-e6e6594018b8)
  ![1341](https://github.com/user-attachments/assets/7e078e7e-8a2d-4b97-9a80-2605cc858799)
  ![1342](https://github.com/user-attachments/assets/58202b33-fc38-41ac-bc8a-06c25038e04a)
  ![1343](https://github.com/user-attachments/assets/757d8115-542f-4a09-934b-714c63e7e7b8)
  ![1344](https://github.com/user-attachments/assets/3deff1d0-eb3e-42ba-a218-a74bce394215)
  ![1345](https://github.com/user-attachments/assets/c1a5e842-238a-47b1-a7e6-b41cf3c37fe0)
  ![1346](https://github.com/user-attachments/assets/067b8c9c-98c9-4c87-be0b-1b868af330c8)
  ![1347](https://github.com/user-attachments/assets/e2281e8e-f0d1-49d6-a3e5-500858d6e0df)
  ![1348](https://github.com/user-attachments/assets/c9d7e990-92b1-468e-be3b-08cb06c1e8df)
  ![1349](https://github.com/user-attachments/assets/689bf7e0-a30d-4676-a648-9d135573dbda)
  ![1350](https://github.com/user-attachments/assets/516aa94b-9187-4b74-895c-1d041a445d23)
  ![1351](https://github.com/user-attachments/assets/6862632d-1e8e-472c-96b2-170adde968d1)
  ![1352](https://github.com/user-attachments/assets/d1da891f-7260-4773-986a-a9d0450ade45)
  ![1353](https://github.com/user-attachments/assets/dcda65a8-4df1-415c-9091-d1768a669ba1)
  ![1354](https://github.com/user-attachments/assets/8fcc4943-4ced-4f72-b035-bdcdc9b74ff9)
  ![1355](https://github.com/user-attachments/assets/e03eb673-3f3c-437a-8956-e1e3fbb9fc51)

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
  ![1356](https://github.com/user-attachments/assets/013859e6-33ec-4ee4-b43f-f6011663314a)
  ![1357](https://github.com/user-attachments/assets/af406d31-ed36-4466-90db-95e5f571b24e)
  ![1358](https://github.com/user-attachments/assets/d8fd3e84-afca-4c77-8741-c14959c8a54e)
  ![1359](https://github.com/user-attachments/assets/dd986086-8361-4262-84a3-c317482af220)
  ![1360](https://github.com/user-attachments/assets/887572ce-e4f0-4499-9f00-71d40373bdaa)

- Click on Update button
- After update old one will get deleted and three more tasks will create here
  ![1361](https://github.com/user-attachments/assets/97710952-75a0-45b2-9f99-834c9d44e854)

- Again try to browse the application from Amazon Elastic Container Service > Clusters > devClusterFargate01 > Services >application > Tasks > openanytask > Configuration > Network binding > Externallink

## 2. ECS EC2
### ECS Cluster Creation:
  ![1362](https://github.com/user-attachments/assets/bee46278-93cd-4d22-90a8-20328195f6ec)
  ![1363](https://github.com/user-attachments/assets/d6fc2d32-bcc3-4c68-ba3c-05ba4dadf6c9)
  ![1364](https://github.com/user-attachments/assets/c010e896-79fa-4fa4-929b-ab6acb2b100b)
  ![1365](https://github.com/user-attachments/assets/fc07b7b5-ec0d-4602-b867-97e625392554)
  ![1366](https://github.com/user-attachments/assets/7aca0e54-e01f-4ab2-a1a9-742cbd09902b)
  ![1366-01](https://github.com/user-attachments/assets/a27f7553-51d0-4a59-a368-0e39f42c8a1c)
  ![1366-02](https://github.com/user-attachments/assets/4752b08a-11cd-4dad-925b-c7f08131bd98)
  ![1366-03](https://github.com/user-attachments/assets/bce9e532-8f91-48ff-a7a5-43574be1755b)
  ![1366-04](https://github.com/user-attachments/assets/c1087e58-424c-4ad3-b897-0d80e6d674cb)

### Task Definition Creation for ECS EC2:
  ![1367](https://github.com/user-attachments/assets/0d28e7a9-f47a-4754-9d4f-893bad7eba31)
  ![1368](https://github.com/user-attachments/assets/111dd1d6-7f14-4d92-b522-c2c604df0114)
  ![1369](https://github.com/user-attachments/assets/813de023-c8ef-4599-8816-76c9060ba0b2)
  ![1370](https://github.com/user-attachments/assets/0a8db530-383f-49bf-93e7-95dd078ce0d3)

### Dummy user CReation for the ECS EC2:
  ![1370-01](https://github.com/user-attachments/assets/d0e4d4b9-5e8c-4874-abec-d7ad0cb8b21c)
  ![1370-02](https://github.com/user-attachments/assets/fdd3f871-6c10-47a1-91e9-7e472539da02)
  ![1370-03](https://github.com/user-attachments/assets/6e05629b-082d-4253-a2fc-ae6a24a06dd7)
  ![1370-04](https://github.com/user-attachments/assets/ca0f9ac8-ef7a-49bd-9b87-d60d4fb0c7cb)
  ![1370-05](https://github.com/user-attachments/assets/d5b940c2-e0f0-4f36-b26e-dd5439146952)

### CReating Task For ECS EC2 Cluster:
  ![1371](https://github.com/user-attachments/assets/e3da3e5f-a0ca-4169-99db-8c9a7d2712c1)
  ![1372](https://github.com/user-attachments/assets/21f5abd9-f260-43ef-a7bf-dd6c610204f0)
  ![1373](https://github.com/user-attachments/assets/2c81aec9-2540-4209-940e-dd8c2443e441)
  ![1374](https://github.com/user-attachments/assets/7902688c-b1fa-4c82-b07c-8d7c434c4579)
  ![1375](https://github.com/user-attachments/assets/c13a2951-4da0-4a02-abf1-aeb648590f10)
  ![1376](https://github.com/user-attachments/assets/2019c331-b626-49d8-af6d-af7561445fc4)
  ![1376-01](https://github.com/user-attachments/assets/302e0d02-d1b1-4070-a518-12a8316d17e4)
  ![1377](https://github.com/user-attachments/assets/2a9492b1-3c91-4cbb-bd53-9cbbcce6dd9c)
  ![1378](https://github.com/user-attachments/assets/eb89685b-f48c-45c8-84c8-03a468f56d0a)
  
- if you click on stop all then its all gone app wont be working 
  ![1379](https://github.com/user-attachments/assets/0ed375b2-d37d-45bd-a09f-9f10188badbc)
  
- so we create the services in cluster.
- for this we create the one role.
  ![1380](https://github.com/user-attachments/assets/dfd021dd-8692-40bc-8ce3-08b1506134ca)

### Service CReation in ECS Cluster:
  ![1381](https://github.com/user-attachments/assets/4dca903b-658e-42c2-98c2-567cf5dcbf3f)
  ![1381-00](https://github.com/user-attachments/assets/4bd49611-9129-4be9-a91f-7aedfa842786)
  ![1381-00-01](https://github.com/user-attachments/assets/796cb17f-8c9b-4bed-8a5c-12917a3860ab)
  ![1381-01](https://github.com/user-attachments/assets/603275bd-a052-4d3e-8cab-fe2acde4a574)
  ![1381-02](https://github.com/user-attachments/assets/849cc0eb-6733-46ca-af8d-a62dbe11b386)
  ![1381-03](https://github.com/user-attachments/assets/9439d4ba-3bf7-43fb-8ef3-b124b4486e72)
  ![1381-04](https://github.com/user-attachments/assets/49809542-0f26-4de8-ab1d-5fabe09c4478)
  ![1381-05](https://github.com/user-attachments/assets/89c52c4f-ae82-41d1-8d19-9e7ee0a0e389)
  ![1381-06](https://github.com/user-attachments/assets/03bf4176-786b-4d68-b44a-90d9ae928bb1)
  ![1381-07](https://github.com/user-attachments/assets/880a8b21-eac4-470a-8dbb-e4a8c055262f)
  ![1381-08](https://github.com/user-attachments/assets/089b2b15-2ad6-48a5-8369-8e81074a2a77)
  ![1381-09](https://github.com/user-attachments/assets/6add677c-9ca2-4e6d-b184-e170f3cad2eb)
  ![1382](https://github.com/user-attachments/assets/74f5a451-4b6c-4a12-9f81-d9468023d761)
  ![1383](https://github.com/user-attachments/assets/3ff9fa53-570c-41d0-8e55-a7c8f82b82e1)
  ![1384](https://github.com/user-attachments/assets/9ae0c05a-9409-4bc8-bcfa-634781d8970e)
  ![1385](https://github.com/user-attachments/assets/a2b1971a-097f-4f5f-af98-50eb86371ac7)
  ![1386](https://github.com/user-attachments/assets/9392259d-906f-4f6a-b49d-07012a29551b)
  ![1387](https://github.com/user-attachments/assets/d1818dd8-2c8f-4e84-93ba-cbc33a52961f)
  ![1388](https://github.com/user-attachments/assets/48562bb3-d474-4408-8b31-bd3c8d224946)
  
- Now if you try to delete the tasks in the Cluster then services will automatically bring up the tasks
  ![1389](https://github.com/user-attachments/assets/bf37d884-2b17-4ccd-a121-25884e4a90b5)
  ![1390](https://github.com/user-attachments/assets/186f14b1-7644-45d7-b78d-871f7e15981a)
  ![1391](https://github.com/user-attachments/assets/11e8eb49-ed28-4911-a352-0ab49fe3d19f)

- First delete Service then Cluster
