## Amazon EC2:
- Ec2 Machines
- EBS Volumes
- Amazon Machine Image (AMI)
- Snapshots
- Load Balancers (NLB and ALB)
- Autoscaling Groups

## EC2 Instances:
  1.	EC2 instances are of 4 types 
  2.	OnDemand Instance
  3.	Spot Instance
  4.	Reserved Instance
  5.	Dedicated Instance or Host.

# 15. EBS Volumes:
- EBS is provided during the instance creation and can be assigned extra to the instance after instance creation also. 
- Windows OS 30GB for C:/ drive, Linux OS 8GB for /root drive.
  ![362](https://github.com/user-attachments/assets/48ac7dff-733c-4004-b834-559cc0f5ee61)

## 15.1. Instance Store (IS):
  1. It’s a temporary storage, means the data is deleted when the server stops.2. It’s a fixed size.
  2. It’s a fixed size.
  3. It cannot be snapshotted.
  4. Its disk type if fixed mostly SSD.
  5. Using as SWAP or Virtual Memory for Linux and Windows Servers.
  6. Can be used as TempDB for Databases

- For demonstrating Instance Store, we will launch on C5xlarge instance which has 75GB of IS
- Command: ```lsblk``` > to list the disks in the server
  ![363](https://github.com/user-attachments/assets/3f91adf7-81eb-4ca6-8b53-84a11c9dd6d1)

- Here we will use command: ```fdisk /dev/nvme1n1``` > to format the disk and partition the disk
  ![364](https://github.com/user-attachments/assets/d6da6f36-86ea-4ba2-80fc-53340b83144a)

- Image after partition the IS i.e. 75GB (nvme1n1p1)
  ![365](https://github.com/user-attachments/assets/0bc77a68-9c44-42fb-9eb4-a0ff81d4c42e)

- Creating Filesystem by command: ```mkfs.ext4 /dev/nvme1m1p1```
  ![366](https://github.com/user-attachments/assets/42b7e6a9-d413-4197-bcc8-00f91ad4817d)

- Creating new volume, mounting the new volume to nvme1n1p1 so that 75GB is assigned to new volume ```/isvol1```.
  ![367](https://github.com/user-attachments/assets/4a5f266a-a2f2-4d36-b7bf-52d52b42effd)

- As this is an instance store whatever the data exist in it will get deleted once server is stopped.
  ![368](https://github.com/user-attachments/assets/bf80dbd7-a0f7-4e29-b3cb-8fe2ffedb72d)

- After stopping and starting the server all IS store data deleted and partition also deleted.
  ![369](https://github.com/user-attachments/assets/78997d20-eb14-4c88-b2b5-0f27e19621ce)

# 15.1. AWS EBS Volumes:
- Attached new EBS volume to server
- Follow the same partition process to make the 5 GB partition available.
  ![370](https://github.com/user-attachments/assets/88fcbfd6-acfa-499c-a8d8-cb574650a7ab)

- Same Commands to make FS
  ![371](https://github.com/user-attachments/assets/7fef48c5-1e43-4211-a522-37ff983bbbf9)

- After partition collecting ```blkid```
  ![372](https://github.com/user-attachments/assets/77fea878-6753-42e0-bfba-19ce978516f8)

- Mounting the 5gb EBS to /appdata in fstab
  ![373](https://github.com/user-attachments/assets/5bec3855-5643-48e2-9e51-9c578f23dea8)

- in fstab assigning the volume.
  ![374](https://github.com/user-attachments/assets/effa5f2d-deb8-4e69-a836-bd58959f6af1)

- Use ```mount -a``` to mount
- maybe this 5gb won’t be sufficient if we want to extend the volume there are two ways.
  ![375](https://github.com/user-attachments/assets/cdd26188-94e1-494a-b29a-b9f999e56b6e)

- right click on volume and modify.
  ![376](https://github.com/user-attachments/assets/151f6361-3da5-45d0-9c44-570f923d51ae)

- Extending 5 as 8
  ![377](https://github.com/user-attachments/assets/ffba70e0-4513-4241-a46f-224407d1e8cd)

- Extended the volume and not partitioned yet.
  ![378](https://github.com/user-attachments/assets/424ef5e4-223d-40dd-abea-4a27286d44b6)

- We use growpart command to extend.
  ![379](https://github.com/user-attachments/assets/c190d54a-ae3e-40aa-89ae-a21825e52f3a)

- and we need to extend the filesystem too.
  ![380](https://github.com/user-attachments/assets/c4dee57d-7f40-47bf-bde2-3500ae57b114)

- After extending.
  ![381](https://github.com/user-attachments/assets/d3075753-9bf9-47b3-b4c0-9f5f09ed1d03)
