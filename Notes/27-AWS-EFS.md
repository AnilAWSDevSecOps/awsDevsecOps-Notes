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
  ![858](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/858.png)

- EBS is limited to Availability Zone but EFS has no Availability Zone Limitations.
- Come to EFS > Create file system
  ![859](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/859.png)

- Fill in the details like Name and VPC

  ![860](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/860.png)

- Select Regional, disable backup and click on Next.
  ![861](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/861.png)
  ![862](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/862.png)

- Select VPC and Subnets, clcik on Next.
  ![863](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/863.png)

- Now skip and click on Next.
  ![864](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/864.png)

- Review all and click on crceate EFS button.
  ![865](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/865.png)

- After creating file system.
  ![866](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/866.png)

- Now Connect to the two instances
  ![867](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/867.png)

- Now run These commands in both instances
  ```
  mkdir -p /var/lib/jenkins
  ```
  ![869](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/869.png)

- Now copy the DNS Name in EFS which we created.
  ![868](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/868.png)

- Now add the DNS of EFS in ```/etc/fstab```, then even the server reboots it will not unmount.
  ```
  fs-04d0d5a49bda2f948.efs.us-east-1.amazonaws.com:/   	/var/lib/jenkins/   	nfs
  ```
  ![870](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/870.png)

- If you do ``` df -h ``` in both servers still file system is not created.
  ![871](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/871.png)

- do ``` mount -a ``` if will apply the fstab changes.
  ![872](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/872.png)

- If you do ``` df -h ``` in both servers you can see file system is created.
- it looks in the below format.
  ```
  fs-04d0d5a49bda2f948.efs.us-east-1.amazonaws.com:/  8.0E     0  8.0E   0% /var/lib/jenkins
  ```
  ![873](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/873.png)

- Now you type ``` watch ls ``` command under ```/var/lib/jenkins```
- to see the changes that we make in another server
- if you create or delete the files in one location automatically in another location also it will get effect
- as it is the shared location in linux servers.
  ![874](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/874.png)

- I have created few files in 2nd server under ```/var/lib/jenkins```
- But automatically in 1st server also files created.
  ![875](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/875.png)

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
  ![876](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/876.png)

## JenkinsConfiguration

- Now open Jenkins and Configure.
  ```
  http://98.82.19.60:8080
  ```
- Fill in the password and login
  ![877](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/877.png)
  ![878](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/878.png)
  ![879](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/879.png)
  ![880](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/880.png)
  ![881](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/881.png)
  ![882](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/882.png)

## Jenkins Job Creation

- Now Create one job and run it.
  ![883](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/883.png)
  ![884](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/884.png)
  ```
  #!/bin/bash
  for i in {1..10}
  do
  echo $(date)
  done  
  ```
  ![885](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/885.png)
  ![886](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/886.png)
  ![887](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/887.png)

- Now install the jenkins in second server also by same steps
- and login to the jenkins and if you see the test job will be there.
- which means files sharing between two servers happenning
  ![888](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/888.png)

- If you run job for few more times to see changes in second jenkins console you need to restart the jenkins
  ```
  http://98.81.75.40:8080/restart
  ```
  ![889](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/889.png)
  ![890](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/890.png)

- Genarally we use EFS for centralised logs, Database dumps, etc.,

# AWS Backup:

- Now Goto AWS Backup
  ![891](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/891.png)

- AWS Backup > Vault > Create new Vault
  ![892](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/892.png)

- Fill In the Details as shown and click on Create button.
  ![893](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/893.png)

- After vault creation it shows like below.
  ![894](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/894.png)

- Now for the Jenkins-01 and Jenkins-02 instances create tags as shown.
  ![895](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/895.png)
  ![896](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/896.png)

- NOw got to AWS Backup > Protected Resources.
- Click on Create on demand backup button.
  ![897](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/897.png)

- Fill in the deatils as shown below.
- Click on create on demand button backup button.
  ![898](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/898.png)

- After on emand Backup it looks like below.
  ![899](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/899.png)

- Backup job Completed under AWS BAckup > jobs > BAckup jobs
  ![900](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/900.png)
  ![901](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/901.png)

- NOw create backu plan
  ![902](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/902.png)
  ![903](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/903.png)
  ![904](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/904.png)
  ![905](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/905.png)
  ![906](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/906.png)

- Now if you want you restore under AWS BAckup > Protected Resources as shown.
  ![907](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/907.png)
  ![908](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/908.png)
  ![909](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/909.png)
  ![910](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/910.png)
  ![911](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/911.png)
