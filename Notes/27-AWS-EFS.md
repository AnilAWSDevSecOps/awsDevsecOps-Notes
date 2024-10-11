# 27. AWS Elastic File Systems (EFS):
- Also Called as Network File Systems.
- for this we will launch two t2.medium in public subnets with below user data
  ### Userdata
  ```
  #!/bin/bash

  # Updating the OS
  apt update

  # Installing mounting app
  apt install -y nfs-common

  # Installing the default jdk
  apt install default-jdk -y
  
  ```
  ![858](https://github.com/user-attachments/assets/68cb23c7-78e1-41e7-a249-93dc4e12517e)
  
- EBS is limited to Availability Zone but EFS has no Availability Zone Limitations.
- Come to EFS > Create file system
  ![859](https://github.com/user-attachments/assets/65a61a8f-433b-4b36-80ee-6d90d5197b19)

- Fill in the details like Name and VPC
  
  ![860](https://github.com/user-attachments/assets/f752460b-1cd6-42ea-b0a1-facbe5bacb82)
  
- Select Regional, disable backup and click on Next.
  ![861](https://github.com/user-attachments/assets/7bc1f8e8-d204-46f3-a8f7-b2118ef7267b)
  ![862](https://github.com/user-attachments/assets/a7ba6d2a-93f7-4e32-8cc9-f6508f926fe9)

- Select VPC and Subnets, clcik on Next.
  ![863](https://github.com/user-attachments/assets/c9f1cfb3-55b4-4f15-9e3c-13dd45975866)

- Now skip and click on Next.
  ![864](https://github.com/user-attachments/assets/286a6833-163f-44ef-ace6-73eb3db595eb)

- Review all and click on crceate EFS button.
  ![865](https://github.com/user-attachments/assets/28fc6173-cd9c-4a7c-b8a0-ec4081ddee70)

- After creating file system.
  ![866](https://github.com/user-attachments/assets/780398a6-2362-400d-8a21-3bd81359567b)

- Now Connect to the two instances
  ![867](https://github.com/user-attachments/assets/37167632-9260-4dbd-b2c2-60b5c4bd2d81)

- Now run These commands in both instances
  ```
  mkdir -p /var/lib/jenkins
  ```
  ![869](https://github.com/user-attachments/assets/8b5b0a04-1e63-4dfd-9ebd-2bd7ee7db249)

- Now copy the DNS Name in EFS which we created.
  ![868](https://github.com/user-attachments/assets/feacf92a-06c1-46a3-bd0c-e140a557b6d8)

- Now add the DNS of EFS in ```/etc/fstab```, then even the server reboots it will not unmount.
  ```
  fs-04d0d5a49bda2f948.efs.us-east-1.amazonaws.com:/   	/var/lib/jenkins/   	nfs
  ```
  ![870](https://github.com/user-attachments/assets/32fd893f-77b5-46ca-b982-5afff2f84b8c)

- If you do ``` df -h ``` in both servers still file system is not created.
  ![871](https://github.com/user-attachments/assets/1dd9abdd-fee7-4cb9-9fe3-4b291c4500f5)

- do ``` mount -a ``` if will apply the fstab changes.
  ![872](https://github.com/user-attachments/assets/7007cebb-f832-4c76-8d1a-e13204cc0d85)

- If you do ``` df -h ``` in both servers you can see file system is created.
- it looks in the below format.
  ```
  fs-04d0d5a49bda2f948.efs.us-east-1.amazonaws.com:/  8.0E     0  8.0E   0% /var/lib/jenkins
  ```
  ![873](https://github.com/user-attachments/assets/638728a8-2d5e-4e9e-96ab-bb0b6deaea43)

- Now you type ``` watch ls ``` command under ```/var/lib/jenkins```
- to see the changes that we make in another server
- if you create or delete the files in one location automatically in another location also it will get effect
- as it is the shared location in linux servers.
  ![874](https://github.com/user-attachments/assets/e606ee7e-9eeb-4133-b62b-beeb6b0a0f81)

- I have created few files in  2nd server under ```/var/lib/jenkins```
- But automatically in 1st server also files created.
  ![875](https://github.com/user-attachments/assets/b30c950d-5d31-4d38-8df3-8bc8f664160b)

## Jenkins Installation
- Now we will install the Jenkins in the 1st or second server.
  ```
  sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
  echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
  sudo apt-get update
  sudo apt-get install jenkins -y
  ```
  ![876](https://github.com/user-attachments/assets/b0f6c73d-7f72-47de-8d3f-21f2d98e0e7e)

## JenkinsConfiguration
- Now open Jenkins and Configure.
  ```
  http://98.82.19.60:8080
  ```
- Fill in the password and login
  ![877](https://github.com/user-attachments/assets/af03ad7c-e103-4b85-919b-c95cda975eef)
  ![878](https://github.com/user-attachments/assets/8d652302-d07c-4dbf-ae1f-b9be16b6d029)
  ![879](https://github.com/user-attachments/assets/7a09e28a-5e0f-4515-b0db-44e30aab6249)
  ![880](https://github.com/user-attachments/assets/0fa7adc6-4479-412f-8289-f040305eaf52)
  ![881](https://github.com/user-attachments/assets/f517dbdc-9a23-45c3-80db-fb132c067304)
  ![882](https://github.com/user-attachments/assets/beb2a687-8fd9-4fd9-be7b-fdeb4542d4cd)

## Jenkins Job Creation
- Now Create one job and run it.
  ![883](https://github.com/user-attachments/assets/fe817292-94fe-49ba-a097-94f9faaca7fe)
  ![884](https://github.com/user-attachments/assets/c5e0f8c5-8598-436f-adc6-33880f743d99)
  ```
  #!/bin/bash
  for i in {1..10}
  do
  echo $(date)
  done  
  ```
  ![885](https://github.com/user-attachments/assets/f4f04f4c-83a4-4b41-916a-bd031edb3396)
  ![886](https://github.com/user-attachments/assets/1420e30c-838c-4331-897d-c950d6dbbc14)
  ![887](https://github.com/user-attachments/assets/9956aa63-b447-4716-b792-71ee6a5c9345)

- Now install the jenkins in second server also by same steps
- and login to the jenkins and if you see the test job will be there.
- which means files sharing between two servers happenning
  ![888](https://github.com/user-attachments/assets/32732547-8302-47ec-a022-b66ce36d573a)

- If you run job for few more times to see changes in second jenkins console you need to restart the jenkins
  ```
  http://98.81.75.40:8080/restart
  ```
  ![889](https://github.com/user-attachments/assets/581a1363-cb0e-416b-9b14-003600c7026f)
  ![890](https://github.com/user-attachments/assets/11e5086c-dd56-4df5-a45e-11b9292482b9)

- Genarally we use EFS for centralised logs, Database dumps, etc.,

# AWS Backup:
- Now Goto AWS Backup
  ![891](https://github.com/user-attachments/assets/f5492274-d0b9-4fb2-b628-e59e3b04f5e7)

- AWS Backup > Vault > Create new Vault
  ![892](https://github.com/user-attachments/assets/3186399f-a054-43ae-a772-95192c276df7)

- Fill In the Details as shown and click on Create button.
  ![893](https://github.com/user-attachments/assets/00ed7094-712a-41cd-a3d8-9afe7230a721)

- After vault creation it shows like below.
  ![894](https://github.com/user-attachments/assets/335626d3-518d-48c7-8086-a73c217b67ec)

- Now for the Jenkins-01 and Jenkins-02 instances create tags as shown.
  ![895](https://github.com/user-attachments/assets/bbb0c041-8f4d-4dc7-b181-8a6c8c628625)
  ![896](https://github.com/user-attachments/assets/eb378484-ffdc-46ba-879f-44f8d45f1529)

- NOw got to AWS Backup > Protected Resources.
- Click on Create on demand backup button.
  ![897](https://github.com/user-attachments/assets/56af78f0-1092-4422-9c2f-2f3bd3d85cf3)

- Fill in the deatils as shown below.
- Click on create on demand button backup button.
  ![898](https://github.com/user-attachments/assets/92beac3d-2c55-400b-afcb-644a203dbe00)

- After on emand Backup it looks like below.
  ![899](https://github.com/user-attachments/assets/f62f5b66-6553-43f5-b90d-e754f976f22a)

- Backup job Completed under AWS BAckup > jobs > BAckup jobs
  ![900](https://github.com/user-attachments/assets/46cb471f-c520-4024-91c5-b7c17240660c)
  ![901](https://github.com/user-attachments/assets/c4d22040-f675-49fe-9017-1fbcc366fdbf)

- NOw create backu plan
  ![902](https://github.com/user-attachments/assets/acfc6db9-188c-4263-9a07-363945100ddd)
  ![903](https://github.com/user-attachments/assets/3b6d9a48-3a26-4016-94b1-d6462fb80dba)
  ![904](https://github.com/user-attachments/assets/431c764a-3612-4504-9533-12219e6ea5af)
  ![905](https://github.com/user-attachments/assets/3bb6c861-dd6f-4c7e-8c9f-0a8145fcf0ec)
  ![906](https://github.com/user-attachments/assets/f11e5c14-0cb6-48b4-bee1-6aff5c7b7552)

- Now if you want you restore under AWS BAckup > Protected Resources as shown.
  ![907](https://github.com/user-attachments/assets/0c32cf07-1649-4ff7-a88e-31c8b57abed4)
  ![908](https://github.com/user-attachments/assets/ae2538ec-6696-4b78-991e-9cd7ea1f4f7f)
  ![909](https://github.com/user-attachments/assets/a7c01b83-8701-40fe-adad-445236f47d79)
  ![910](https://github.com/user-attachments/assets/fab99033-ac67-4764-99e5-46b4563fcecf)
  ![911](https://github.com/user-attachments/assets/791343cc-fef5-4ab3-a898-aa7c17e233ef)
