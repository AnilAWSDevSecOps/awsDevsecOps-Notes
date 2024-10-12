## AWS Identity Center

## 23.7. Active Directory Creation in Master Account:

- For single ```sign-on``` we use Active directory
- Click on Set up directory under ```Directory Services > Active Directory.```
  ![752](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/752.png)

- Select ```AWS Managed Microsoft AD``` click on next button.
  ![753](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/753.png)

- Select Edition(```Standard edition```), DNS Name(```madireddy.com```) and BIOS name(```MADIREDDY```)
- Create password and click on Next button.
  ![754](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/754.png)
  ![755](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/755.png)

- Select the ```VPC``` and ```Subnets(Public Subnets)``` and click on Next button
  ![756](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/756.png)

- Review and create directory.
  ![757](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/757.png)

- It will take ```20 to 45``` min to create the Active directory.
  ![758](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/758.png)

- Now its active after 45 min
  ![759](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/759.png)

- Now Launch the Windows Server in Same VPC and Subnet. with t2.large as Instance Type.
  ![766](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/766.png)

- Connect to the windows server above created and modify the Active Directory as shown
- Create two users anilkumar and reddy
    - open command prompt and put below command in the command prompt.
  ```
  ncpa.cpl
  ```
- Goto IPV4 > Properties > DNS
  ![767](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/767.png)

- Copy the Active directory DNS address
  ![768](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/768.png)

- Enter the DNS servers IPs which are in Active directory
  ![769](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/769.png)

- Go to Server Manager in Windows.
  ![770](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/770.png)

- Click on Manage > Add Roles and Features
  ![771](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/771.png)

- click on Next.
  ![772](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/772.png)

- Select Role and Next.

  ![773](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/773.png)

- click on Next.

  ![774](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/774.png)

- click on Next.

  ![775](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/775.png)

- Select AD DS and AD LDS Tools under Remote Server Administration Tools > Role Administration Tools
  ![776](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/776.png)

- Click install

  ![777](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/777.png)

- Now in Cmd again enter the below command.
  ```
  sysdm.cpl
  ```
- Click on Change button
  ![778](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/778.png)

- Give domain name as madireddy.com and click on ok
  ![779](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/779.png)

- Now User name is admin and the password id Domain Creation Password.
  ![780](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/780.png)

- After successful authentication welcome message wil come
  ![781](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/781.png)

- click ok to restart

  ![782](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/782.png)

- Login to Ad aserver now using admin@domain name and pwd is Domain Pwd
  ![783](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/783.png)

- Now enter below command in cmd
  ```
  dsa.msc
  ```
  ![784](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/784.png)

- under madireddy.com domain create the two users ```anilkumar``` and ```reddy```
  ![785](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/785.png)

  ![786](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/786.png)

  ![787](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/787.png)

- Add Email also

  ![788](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/788.png)

  ![789](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/789.png)

  ![790](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/790.png)

- Users added successfully.

  ![791](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/791.png)

## Permission Sets Creation

- Now under IAM Identity Center > Permission Sets
- Click on Create permission set button
  ![806](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/806.png)

- Select Custom Permission Set, Click on Next Button.
  ![807](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/807.png)

- Under AWS Managed Policies, Provide EC2 Full, S3 Read only and Route53 Read only.
- Click on Next button

  ![808](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/808.png)

- Fill in Name and Description.
- Click on Next button.
  ![809](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/809.png)

- Review and Click on Create button.
  ![810](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/810.png)
  ![811](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/811.png)

- After permission set creation it looks.
  ![812](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/812.png)

- Now we will test the Active directory by logging in to the console
- under IAM Identity Center > Dashboard
- Copy the AWS access portal URL which is given below
  ```
  https://madireddy.awsapps.com/start
  ```
  ![812-1](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/812-1.png)

- Now in the Browser paste the ```AWS access portal URL``` and use the ```reddy@madireddy.com``` to login and password
  ![812-2](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/812-2.png)
  ![812-3](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/812-3.png)

- After logging in you will not ne having any permissions to work on any services.
- We need to assign permission Set to the Accounts. under IAM Identity Center > AWS Accounts
- Now under IAM Identity Center > AWS Organizations: AWS accounts add users and Permission set
- Click on Slave1 and open
  ![813](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/813.png)

- Under Users and Groups > Assign Users or Groups >
  ![814](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/814.png)

- Under Users add the two users click on Next.
  ![815](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/815.png)

- Now add the created Permission set here and click on next button.
  ![816](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/816.png)

- Review and submit.

  ![817](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/817.png)

- After submitting it looks this way.
  ![817-1](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/817-1.png)

- Now when you refresh the browser which we logged in with ```reddy@madireddy.com```
- You can see one acount added to the AWS access portal i.e ```Slave1``` account
  ![818](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/818.png)

- Similarly we need to do it for Slave 2 account.
- Now under IAM Identity Center > AWS Organizations: AWS accounts add users and Permission set
- Click on Slave2 and open
  ![819](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/819.png)

- Under Users and Groups > Assign Users or Groups >
  ![820](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/820.png)

- Under Users add the two users click on Next.
  ![821](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/821.png)

- Now add the created Permission set here and click on next button.
  ![822](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/822.png)

- Review and submit.

  ![823](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/823.png)

- After submitting it looks this way.
  ![824](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/824.png)

- Now when you refresh the browser which we logged in with ```reddy@madireddy.com```
- You can see one more acount added to the AWS access portal i.e ```Slave2``` account
  ![825](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/825.png)

- Now click on Slave1 > Permission set to go to slave 1 Console
  ![826](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/826.png)

- After in it looks.
  ![827](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/827.png)

- As we gave EC2 Full , S3 Read only and Route53 Readonly we can access them only
  ![828](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/828.png)

  ![829](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/829.png)

  ![830](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/830.png)

- Others we dont have access give so it will give denied.
  ![831](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/831.png)

- Similarly goto Slave2 > Permission set
  ![832](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/832.png)

- As we gave EC2 Full , S3 Read only and Route53 Readonly we can access them only
  ![833](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/833.png)

  ![834](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/834.png)

  ![835](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/835.png)

- Others we dont have access give so it will give denied.
  ![836](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/836.png)

- This way by using active directory users we can manage the Single sign on in the AWS Accounts.
- Now by using same active Directories we can use FSx also in AWS

## 23.8. AWS FSX CReation:

- Click on Crterate file system under Amazon FSX > Filesystems
  ![760](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/760.png)

- Select Amazon FSx for Windows File Server and click on Next.
  ![761](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/761.png)

- Select Quick Create, Name, Singlr AZ, SSD(32), VPC, Subnet.
- Finally selsct our Active directory Whcich created earlier
  ![762](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/762.png)

- Review and select create.
  ![763](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/763.png)
  ![764](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/764.png)

- After creation it will take some time to create.
  ![765](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765.png)

- Once the FSX is in Available, open the FSx
  ![765-1](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-1.png)

- Copy the FSx DNS Name.
  ![765-2](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-2.png)

- paste in run you will get shared location
  ```
  \\fs-08cd78bfa94551000.madireddy.com
  ```
  ![765-3](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-3.png)

- Open the share Folder
  ![765-4](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-4.png)

- Create 3 folders ```Commondata, anikumar and reddy```
  ![765-5](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-5.png)

- Disable inheritance for common Data coz we can delete other users in decurity
  ![765-6](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-6.png)

- Now click on Add button

  ![765-7](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-7.png)

- Now Click on Select a principal link
  ![765-8](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-8.png)

- Add ```anilkumar``` user and click on ok
  ![765-9](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-9.png)

- Next Give full control to anilkumar for common data
  ![765-10](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-10.png)

- again click on Add button

  ![765-11](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-11.png)

- Now Click on Select a principal link
  ![765-12](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-12.png)

- Add ```reddy``` user and click on ok
  ![765-13](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-13.png)

- Next Give full control to reddy for common data
  ![765-14](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-14.png)

- Now remove all except ```anilkumar``` and ```reddy```
  ![765-15](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-15.png)

- Now click on Apply and ok and ok
  ![765-16](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-16.png)

- Now For anilkumar folder
  ![765-17](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-17.png)

- Add anilkumar user id

  ![765-18](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-18.png)

- Added anilkumar by checking names button
  ![765-19](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-19.png)

- Provided full control to ```anilkumar folder``` for ```anilkumar``` user
  ![765-20](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-20.png)

- Disable inheritance for anilkumar dir
  ![765-21](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-21.png)
  ![765-22](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-22.png)

- Remove all except anilkumar as it is personal folder for anilkumar
- click on ok. and apply

  ![765-23](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-23.png)

- Now For reddy folder

  ![765-24](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-24.png)

- Disable inheritance

  ![765-25](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-25.png)
  ![765-26](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-26.png)

- click on add button

  ![765-27](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-27.png)

- Click on select principal button
  ![765-28](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-28.png)

- Add reddy user id by checking names
  ![765-29](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-29.png)

- Provide the full access for reddy
  ![765-30](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-30.png)

- Remoe all except reddy as it is personal folder for reddy user
  ![765-31](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-31.png)

- click on ok. and apply

  ![765-32](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-32.png)

- Now in power shell run below command
  ```
  lusrmgr.msc
  ```
- open remote desktop users
  ![765-33](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-33.png)

- Click on add button

  ![765-34](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-34.png)

- Add users ```anilkumar``` and ```reddy``` as they should login to the Windows AD instance
  ![765-35](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-35.png)

- Click on ok and apply
  ![765-36](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-36.png)

- NOw login to AD instance with ```anilkumar@madireddy.com``` as username
  ![765-37](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-37.png)

- Logged in as anilkumar.
  ![765-38](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-38.png)

- to check the shared location you can run ```set``` command in cmd prompt
  ![765-39](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-39.png)

- NOw do nslookup LOCALAPPDATAPATH in the above image
- out put shoes the IP address of Active dir
  ![765-40](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-40.png)

- Copy FSx DNS Name
  ![765-41](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-41.png)

- Pate in run
  ```
  \\fs-08cd78bfa94551000.madireddy.com
  ```
  ![765-42](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-42.png)

- Share folder opens , open share
  ![765-43](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-43.png)

- As you logged in with anilkumar id you wont be able to open reddy folder
  ![765-44](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-44.png)

- anikumar have access to common data
  ![765-45](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-45.png)

- anilkumar have access to anilkumar dir and copied few files
  ![765-46](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-46.png)

- NOw login to AD instance with ```reddy@madireddy.com``` as username

  ![765-47](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-47.png)

- As admin and anilkumar already loggedin it ask for disconnect one to login reddy user
  ![765-48](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-48.png)

- disconnecting anilkumar Remote desktop.
  ![765-49](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-49.png)

- Copy FSx DNS Name and Pate in run
  ```
  \\fs-08cd78bfa94551000.madireddy.com
  ```
  ![765-50](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-50.png)

- Share folder opens , open share.
- As you logged in with ```reddy``` id you wont be able to open ```anilkumar``` folder
  ![765-51](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-51.png)

- reddy have access to common data
  ![765-52](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-52.png)

- reddy have access to reddy dir and copied few files
  ![765-53](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-53.png)

- Now you can delete FSX. as our test finished and we dont want that any more.
  ![765-54](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-54.png)

- it will take minutes to delete.
  ![765-55](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/765-55.png)
