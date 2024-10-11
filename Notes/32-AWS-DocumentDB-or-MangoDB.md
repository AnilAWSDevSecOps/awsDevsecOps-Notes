# Amazon DocumentDB or MangoDB
- it is like RDS DB only but few changes. Documetn based NoSQL Solution.

## Amazon DocumentDB Creation:
- Click on Create button
  ![1107](https://github.com/user-attachments/assets/72d35847-8800-46f4-8542-3d534d7ed3d2)
- Before that you should have created Subnet group for DB
  ![1107-01](https://github.com/user-attachments/assets/15351a4a-9926-46d1-8c60-a136f0598e44)

- Fill in the details.
- No of instances should be 3 we have selected onlt 1
  ![1108](https://github.com/user-attachments/assets/2eb69b93-1648-44d3-b89d-6a3301ea9146)
  ![1109](https://github.com/user-attachments/assets/a7ceaa06-ea94-4126-86ef-ecc404ed4204)
  ![1110](https://github.com/user-attachments/assets/4705c44b-26ad-4f7a-a833-4c810cc4b6bb)
  ![1111](https://github.com/user-attachments/assets/840f9ac6-7657-4caa-b04b-db313df68944)
  ![1112](https://github.com/user-attachments/assets/8ccafe88-cecc-4a55-af85-dc8876142a5d)
  ![1113](https://github.com/user-attachments/assets/3d863e08-ffaf-4f43-a56e-66474cbeb93f)
  ![1114](https://github.com/user-attachments/assets/889980ef-0eac-407f-8064-ee3c1ea88c7a)

# AWS ElasticCache 
- InMemory NoSQL Solution

## Amazon ElasticCache Creation:
- Subnet group creation for Elastic cache.
  ![1115](https://github.com/user-attachments/assets/8c40ff97-d69e-4569-b0cb-1d12c5259536)
  ![1116](https://github.com/user-attachments/assets/3a120cab-e0f4-4209-8251-9d1464d5a620)
  ![1117](https://github.com/user-attachments/assets/56f1e505-1951-4faa-a433-c5719e7f8e8c)
  ![1118](https://github.com/user-attachments/assets/f7e0b077-39c0-483e-9088-c0b9125a0c7a)
  ![1119](https://github.com/user-attachments/assets/e4734c91-afc6-495a-9446-5dac75c8565b)
  ![1120](https://github.com/user-attachments/assets/8b049cff-2f99-44eb-9479-c6bf40ff028b)

- Now elasticCache creation, go to create cluster > Create Redis OSS cache.
  ![1121](https://github.com/user-attachments/assets/9b382fcc-c884-402f-9937-8be802b83486)
  ![1122](https://github.com/user-attachments/assets/d250ae20-b692-430b-9f83-d0b103d2ed94)
  ![1123](https://github.com/user-attachments/assets/a6534366-d426-4e66-8022-405dbf4c984c)
  ![1124](https://github.com/user-attachments/assets/58f0a501-1cec-42ba-8407-10a20b126856)

- Now as the above we can do or come back and select the Cluster cache instead of Easy Create
  ![1125](https://github.com/user-attachments/assets/67f913a9-f773-438f-83bb-a6993d22b3fa)
  ![1126](https://github.com/user-attachments/assets/c5fd2b50-7309-405d-9f17-a7857c3e66b2)
  ![1127](https://github.com/user-attachments/assets/de459345-9dc1-4049-9efd-f2a50bd6d8b2)
  ![1128](https://github.com/user-attachments/assets/284b3a27-0ac8-4b5a-8736-a7b01a728c83)
  ![1129](https://github.com/user-attachments/assets/7562ded1-7f58-43e2-b654-d4abb603ca18)
  ![1130](https://github.com/user-attachments/assets/b2ff99f2-ea88-4350-a3e1-33571ce48c35)
  ![1131](https://github.com/user-attachments/assets/adafe21e-bdce-4456-90b7-4d38c8248463)
  ![1132](https://github.com/user-attachments/assets/330e06b9-ac61-4138-9bbe-7a9d9efa2ec7)

- So Document DB and ElasticCache will take time to get ready till then.
- We need to connect to the DBs right we do that.
- Now Launch the t2.medium Ubuntu Instance with apt update && apt install unzip -y
  ![1133](https://github.com/user-attachments/assets/ff0c4cc6-f498-42db-9e56-627dc69b0d6d)

- Now login to the above instance. to install so Mango DB Dependencies.
  ### Installing Mango shell:
  - Use the below link to install it.
  ```
  https://www.mongodb.com/docs/mongodb-shell/install/
  ```

  ```
  wget -qO- https://www.mongodb.org/static/pgp/server-7.0.asc | sudo tee /etc/apt/trusted.gpg.d/server-7.0.asc
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
  sudo apt-get update
  sudo apt-get install -y mongodb-mongosh
  mongosh --version
  ```
  - If any doubts reach above install url.
  - Now after installing Mango Shell we need to connect to the mangoDB.
  - Copy the certificate in the DocumentDB > Cluster > ourCluster > Connectivity & Security
    ![1134](https://github.com/user-attachments/assets/3a470fe4-f00c-485b-b6a5-9d5312b69ce1)
    ![1135](https://github.com/user-attachments/assets/480a0ec8-8c5f-4181-a5e0-a3678f2747f7)
 
  - A pem is created with above command.
    ![1136](https://github.com/user-attachments/assets/c7fd54c7-c46d-470e-9a46-b748bbcdcb4c)
 
  - Connecting to the DB now.
    ![1137](https://github.com/user-attachments/assets/8d3ac2a3-3f14-4801-b307-5b34ec82b241)
    ![1138](https://github.com/user-attachments/assets/405a7b5f-932c-44f6-b26e-934d46c78f8a)
 
  - Try Checking Replica sets by using below command
    ```
    rs.status()
    ```
    ![1139](https://github.com/user-attachments/assets/04f92313-cf8d-414f-ab11-d20990dc9434)
    ### To Check DB in DB
    ```
    show dbs;
    ```
    ### INserting Some data into DB
    ```
    db.helo.insertMany([
            	{ "_id" : 1, "name" : "Matt", "status": "active", "level": 12, "score":202},
            	{ "_id" : 2, "name" : "Frank", "status": "inactive", "level": 2, "score":9},
            	{ "_id" : 3, "name" : "Karen", "status": "active", "level": 7, "score":87},
            	{ "_id" : 4, "name" : "Katie", "status": "active", "level": 3, "score":27, "status": "married", "emp": "yes", "kids": 3}
            	])
    ```
    ![1140](https://github.com/user-attachments/assets/a801f4ad-acda-470b-a403-4aa5ea27894a)

    ### Command to find the details with name
    ```
    db.helo.find({name: "Katie"})
    ```
    ![1141](https://github.com/user-attachments/assets/4b9f5e4f-4625-42bc-b9d6-a69bb038c1c7)
    
  - Executing some DB commands in Mango Shell.  
    ```
    show dbs;
    use test;
    show collections;
    ```
    ![1142](https://github.com/user-attachments/assets/ef8c1670-0ee4-493d-8d7d-cff90c6d0f71)

  - We can use Studio3T to connect to the Document DB via graphically.
  - Download and install the studio3T from below url
    ```
    https://studio3t.com/download/
    ```
    ![1143](https://github.com/user-attachments/assets/8358afdd-e4f7-4a78-929e-f42433de5847)
    ![1144](https://github.com/user-attachments/assets/fc7a39f5-072f-44b8-acc1-8f4f02f81733)
    ![1145](https://github.com/user-attachments/assets/5d244b1e-b35c-4fde-88f2-5dd80a038aaa)
    ![1146](https://github.com/user-attachments/assets/411bd809-4c62-4d21-bc39-f2eeef8628c0)
    ![1147](https://github.com/user-attachments/assets/fca21a7d-9e0b-4958-a581-13cf2c893e36)
    ![1148](https://github.com/user-attachments/assets/4985cae4-6f78-42f3-bc72-24fdfb6b2e67)
    ![1149](https://github.com/user-attachments/assets/cb899603-d9aa-486e-94bb-a8d42af213f6)
    ![1150](https://github.com/user-attachments/assets/24a3a7bb-e473-4879-a2fb-1c7e57e12ca5)
    ![1151](https://github.com/user-attachments/assets/f8e1a2fa-39f5-4a35-8b01-f9b679ffb0f0)
    ![1151-01](https://github.com/user-attachments/assets/4af4923f-49f7-4c53-91d5-7baaf4954a13)
    ![1151-02](https://github.com/user-attachments/assets/6227994c-ce5c-4c96-872f-14e965373b51)
    ![1152](https://github.com/user-attachments/assets/7f22c59c-9f20-48a7-977e-340d785e814e)
    ![1153](https://github.com/user-attachments/assets/a2f1adc5-65ff-41d0-a828-574b1fcbe401)
    ![1154](https://github.com/user-attachments/assets/cbf047d6-b761-4bb4-9df4-b17cd3a26e76)
    ![1155](https://github.com/user-attachments/assets/04cb47b3-17bd-46e6-9775-d16caa950a29)
    ![1156](https://github.com/user-attachments/assets/3a74b521-a688-4ed3-856c-676f1d21d7ca)

- Now Come to redis
- in the same instance install thhe following.
  ```
  apt install redis -y
  apt install python3-pip -y
  ```

  ### Ansible installation:
  ```
  sudo apt update
  sudo apt install software-properties-common
  sudo add-apt-repository --yes --update ppa:ansible/ansible
  sudo apt install ansible -y
  ```

  ```
  apt install python3-redis -y
  ```
  
  ### use the below command to connect to redis CLI
  ```
  redis-cli -h redis-elstic.nwaor1.ng.0001.use1.cache.amazonaws.com
  ```
  ![1157](https://github.com/user-attachments/assets/e0141fe0-44f4-435b-a647-8a83549e2285)
  ![1158](https://github.com/user-attachments/assets/c8fd7429-6d7b-497e-8395-bedb98a07d58)

    

    
    
