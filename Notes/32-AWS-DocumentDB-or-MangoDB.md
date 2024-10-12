# Amazon DocumentDB or MangoDB

- it is like RDS DB only but few changes. Documetn based NoSQL Solution.

## Amazon DocumentDB Creation:

- Click on Create button
  ![1107](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1107.png)
- Before that you should have created Subnet group for DB
  ![1107-01](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1107.png)

- Fill in the details.
- No of instances should be 3 we have selected onlt 1
  ![1108](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1108.png)
  ![1109](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1109.png)
  ![1110](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1110.png)
  ![1111](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1111.png)
  ![1112](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1112.png)
  ![1113](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1113.png)
  ![1114](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1114.png)

# AWS ElasticCache

- InMemory NoSQL Solution

## Amazon ElasticCache Creation:

- Subnet group creation for Elastic cache.
  ![1115](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1115.png)
  ![1116](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1116.png)
  ![1117](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1117.png)
  ![1118](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1118.png)
  ![1119](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1119.png)
  ![1120](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1120.png)

- Now elasticCache creation, go to create cluster > Create Redis OSS cache.
  ![1121](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1121.png)
  ![1122](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1122.png)
  ![1123](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1123.png)
  ![1124](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1124.png)

- Now as the above we can do or come back and select the Cluster cache instead of Easy Create
  ![1125](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1125.png)
  ![1126](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1126.png)
  ![1127](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1127.png)
  ![1128](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1128.png)
  ![1129](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1129.png)
  ![1130](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1130.png)
  ![1131](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1131.png)
  ![1132](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1132.png)

- So Document DB and ElasticCache will take time to get ready till then.
- We need to connect to the DBs right we do that.
- Now Launch the t2.medium Ubuntu Instance with apt update && apt install unzip -y
  ![1133](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1133.png)

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
      ![1134](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1134.png)
      ![1135](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1135.png)

    - A pem is created with above command.
      ![1136](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1136.png)

    - Connecting to the DB now.
      ![1137](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1137.png)
      ![1138](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1138.png)

    - Try Checking Replica sets by using below command
      ```
      rs.status()
      ```
      ![1139](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1139.png)
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
      ![1140](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1140.png)

      ### Command to find the details with name
      ```
      db.helo.find({name: "Katie"})
      ```
      ![1141](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1141.png)

    - Executing some DB commands in Mango Shell.
      ```
      show dbs;
      use test;
      show collections;
      ```
      ![1142](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1142.png)

    - We can use Studio3T to connect to the Document DB via graphically.
    - Download and install the studio3T from below url
      ```
      https://studio3t.com/download/
      ```
      ![1143](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1143.png)
      ![1144](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1144.png)
      ![1145](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1145.png)
      ![1146](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1146.png)
      ![1147](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1147.png)
      ![1148](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1148.png)
      ![1149](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1149.png)
      ![1150](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1150.png)
      ![1151](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1151.png)
      ![1151-01](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1151-01.png)
      ![1151-02](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1151-02.png)
      ![1152](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1152.png)
      ![1153](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1153.png)
      ![1154](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1154.png)
      ![1155](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1155.png)
      ![1156](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1156.png)

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
  ![1157](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1157.png)
  ![1158](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1158.png)

    

    
    
