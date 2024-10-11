## Amazon EC2:

- Ec2 Machines
- EBS Volumes
- Amazon Machine Image (AMI)
- Snapshots
- Load Balancers (NLB and ALB)
- Autoscaling Groups

## EC2 Instances:

1. EC2 instances are of 4 types
2. OnDemand Instance
3. Spot Instance
4. Reserved Instance
5. Dedicated Instance or Host.

# 15. EBS Volumes:

- EBS is provided during the instance creation and can be assigned extra to the instance after instance creation also.
- Windows OS 30GB for C:/ drive, Linux OS 8GB for /root drive.
  ![362](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/362.png)

## 15.1. Instance Store (IS):

1. It’s a temporary storage, means the data is deleted when the server stops.2. It’s a fixed size.
2. It’s a fixed size.
3. It cannot be snapshotted.
4. Its disk type if fixed mostly SSD.
5. Using as SWAP or Virtual Memory for Linux and Windows Servers.
6. Can be used as TempDB for Databases

- For demonstrating Instance Store, we will launch on C5xlarge instance which has 75GB of IS
- Command: ```lsblk``` > to list the disks in the server
  ![363](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/363.png)

- Here we will use command: ```fdisk /dev/nvme1n1``` > to format the disk and partition the disk
  ![364](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/364.png)

- Image after partition the IS i.e. 75GB (nvme1n1p1)
  ![365](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/365.png)

- Creating Filesystem by command: ```mkfs.ext4 /dev/nvme1m1p1```
  ![366](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/366.png)

- Creating new volume, mounting the new volume to nvme1n1p1 so that 75GB is assigned to new volume ```/isvol1```.
  ![367](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/367.png)

- As this is an instance store whatever the data exist in it will get deleted once server is stopped.
  ![368](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/368.png)

- After stopping and starting the server all IS store data deleted and partition also deleted.
  ![369](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/369.png)

# 15.1. AWS EBS Volumes:

- Attached new EBS volume to server
- Follow the same partition process to make the 5 GB partition available.
  ![370](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/370.png)

- Same Commands to make FS
  ![371](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/371.png)

- After partition collecting ```blkid```
  ![372](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/372.png)

- Mounting the 5gb EBS to /appdata in fstab
  ![373](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/373.png)

- in fstab assigning the volume.
  ![374](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/374.png)

- Use ```mount -a``` to mount
- maybe this 5gb won’t be sufficient if we want to extend the volume there are two ways.
  ![375](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/375.png)

- right click on volume and modify.
  ![376](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/376.png)

- Extending 5 as 8
  ![377](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/377.png)

- Extended the volume and not partitioned yet.
  ![378](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/378.png)

- We use growpart command to extend.
  ![379](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/379.png)

- and we need to extend the filesystem too.
  ![380](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/380.png)

- After extending.
  ![381](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/381.png)
