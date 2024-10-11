## AWS Identity Center
## 23.7. Active Directory Creation in Master Account:
- For single ```sign-on``` we use Active directory
- Click on Set up directory under ```Directory Services > Active Directory.```
  ![752](https://github.com/user-attachments/assets/985dc956-58fa-4d47-ae40-037be192a239)

- Select ```AWS Managed Microsoft AD``` click on next button.
  ![753](https://github.com/user-attachments/assets/eee311bd-3e9c-474f-9435-f50fab263f38)

- Select Edition(```Standard edition```), DNS Name(```madireddy.com```) and BIOS name(```MADIREDDY```)
- Create password and click on Next button.
  ![754](https://github.com/user-attachments/assets/32f1f75b-6c22-4eb1-839e-615f75067978)
  ![755](https://github.com/user-attachments/assets/055f74ea-4ed0-4cab-90d5-958503ceba15)

- Select the ```VPC``` and ```Subnets(Public Subnets)``` and click on Next button
  ![756](https://github.com/user-attachments/assets/cd34b531-f075-472a-bdaa-03557191e8f8)

- Review and create directory.
  ![757](https://github.com/user-attachments/assets/567d8a96-f7d5-492c-a513-9f5d6b517b51)

- It will take ```20 to 45``` min to create the Active directory.
  ![758](https://github.com/user-attachments/assets/7f02923b-fda2-4b3f-9994-6ee9f80de272)

- Now its active after 45 min
  ![759](https://github.com/user-attachments/assets/5037c978-d472-427c-82ca-79773fe6d443)

- Now Launch the Windows Server in Same VPC and Subnet. with t2.large as Instance Type.
  ![766](https://github.com/user-attachments/assets/09007a99-b470-4ffd-8bed-5782ece1757d)

- Connect to the windows server above created and modify the Active Directory as shown
- Create two users anilkumar and reddy
  - open command prompt and put below command in the command prompt.
  ```
  ncpa.cpl
  ```
- Goto IPV4 > Properties > DNS
  ![767](https://github.com/user-attachments/assets/c7222c0d-f066-4d04-9147-0a712a97927b)

- Copy the Active directory DNS address
  ![768](https://github.com/user-attachments/assets/ff2c2fc2-7145-4373-89f2-10df5246ebff)

- Enter the DNS servers IPs which are in Active directory
  ![769](https://github.com/user-attachments/assets/02f48bc2-7559-4f7e-a6bd-888c98bad085)

- Go to Server Manager in Windows.
  ![770](https://github.com/user-attachments/assets/63dcfcfe-dbc8-4ad0-bb26-27603c773524)

- Click on Manage > Add Roles and Features
  ![771](https://github.com/user-attachments/assets/2c58f3e4-6f8d-4da3-b097-a6742d35c4c0)

- click on Next.
  ![772](https://github.com/user-attachments/assets/1b41772c-9c1f-4200-98f4-20d093f66e33)

- Select Role and Next.
  
  ![773](https://github.com/user-attachments/assets/2f89fba1-cbb8-4d5c-8866-4ebdbcdf5138)

- click on Next.
  
  ![774](https://github.com/user-attachments/assets/b27127cc-3e8f-4682-9cea-6d3ed392c4d5)

- click on Next.
  
  ![775](https://github.com/user-attachments/assets/a0cf1f01-2db3-4c4b-baa4-3caae52534af)

- Select AD DS and AD LDS Tools under Remote Server Administration Tools > Role Administration Tools
  ![776](https://github.com/user-attachments/assets/afaf6d80-4459-4836-9828-0da810184d0f)

- Click install
  
  ![777](https://github.com/user-attachments/assets/606b1d8f-545a-4e44-8e20-4d65d5b01a67)

- Now in Cmd again enter the below command.
  ```
  sysdm.cpl
  ```
- Click on Change button
  ![778](https://github.com/user-attachments/assets/e1511017-4bea-4925-aae3-b3f463cb0ad4)

- Give domain name as madireddy.com and click on ok
  ![779](https://github.com/user-attachments/assets/a6048c94-133e-4920-8f9a-836d5ccce109)

- Now User name is admin and the password id Domain Creation Password.
  ![780](https://github.com/user-attachments/assets/db0b95c6-4328-46bd-b882-d6fc4e72ed69)

- After successful authentication welcome message wil come 
  ![781](https://github.com/user-attachments/assets/837949c7-d7fe-4413-b127-2b9cb973ce8a)

- click ok to restart
  
  ![782](https://github.com/user-attachments/assets/a570e2c1-56da-47bb-8853-e66327e91a7b)

- Login to Ad aserver now using admin@domain name and pwd is Domain Pwd 
  ![783](https://github.com/user-attachments/assets/570b7a7a-a97e-43d4-9816-0c38f9a29881)

- Now enter below command in cmd
  ```
  dsa.msc
  ```
  ![784](https://github.com/user-attachments/assets/abe5f5fd-4e27-421f-a26d-fedae6b6a535)

- under madireddy.com domain create the two users ```anilkumar``` and ```reddy```
  ![785](https://github.com/user-attachments/assets/b79b1926-fdc3-4f91-99e5-55e4c9fe005c)

  ![786](https://github.com/user-attachments/assets/e6dd288d-17fb-4542-8526-cb3a21e9d85d)

  ![787](https://github.com/user-attachments/assets/a8933b49-7bfd-4fb5-a340-5465d263479b)

- Add Email also
  
  ![788](https://github.com/user-attachments/assets/4ca1fdd6-3464-4faf-b209-83c1d773968e)

  ![789](https://github.com/user-attachments/assets/fcf895b1-1421-4411-a6d0-405ab27c0530)

  ![790](https://github.com/user-attachments/assets/d74618d3-2e30-40d5-a4ad-656653b7b321)

- Users added successfully.
  
  ![791](https://github.com/user-attachments/assets/ee4b3103-9d1b-4e89-a157-80af1a39b6d3)

## Permission Sets Creation
- Now under IAM Identity Center > Permission Sets
- Click on Create permission set button
  ![806](https://github.com/user-attachments/assets/67787bb4-6736-4d89-aa57-8b5937e1cf2f)

- Select Custom Permission Set, Click on Next Button.
  ![807](https://github.com/user-attachments/assets/c26f4f50-7fe7-453a-9691-4fb1fce010ad)

- Under AWS Managed Policies, Provide EC2 Full, S3 Read only and Route53 Read only.
- Click on Next button
  
  ![808](https://github.com/user-attachments/assets/3d3a5cca-908d-4279-a9a1-37825a444339)

- Fill in Name and Description.
- Click on Next button.
  ![809](https://github.com/user-attachments/assets/2d9f0ee8-ee82-43f4-8657-d1b1188165b3)

- Review and Click on Create button.
  ![810](https://github.com/user-attachments/assets/823b72d7-f3a1-4a3c-ab16-885cbf2ae6ea)
  ![811](https://github.com/user-attachments/assets/a51afa07-5f99-4a1e-857f-c3cf8327a265)
  
- After permission set creation it looks.
  ![812](https://github.com/user-attachments/assets/9edfafc7-a492-440a-8df6-f57509af7f74)

- Now we will test the Active directory by logging in to the console
- under IAM Identity Center > Dashboard
- Copy the AWS access portal URL which is given below
  ```
  https://madireddy.awsapps.com/start
  ```
  ![812-1](https://github.com/user-attachments/assets/4446254d-3d1e-422b-af41-587ccf755445)

- Now in the Browser paste the ```AWS access portal URL``` and use the ```reddy@madireddy.com``` to login and password
  ![812-2](https://github.com/user-attachments/assets/a437b1f8-22ff-4087-be77-40d51b2a157d)
  ![812-3](https://github.com/user-attachments/assets/5ea31a3a-a129-499a-aeb6-cf3c8b9edc67)

- After logging in you will not ne having any permissions to work on any services.
- We need to assign permission Set to the Accounts. under IAM Identity Center > AWS Accounts
- Now under IAM Identity Center > AWS Organizations: AWS accounts add users and Permission set
- Click on Slave1 and open
  ![813](https://github.com/user-attachments/assets/8661ede6-5f56-4084-8731-cd664e8dd9c9)

- Under Users and Groups > Assign Users or Groups >
  ![814](https://github.com/user-attachments/assets/be4db313-2745-45ed-96d8-eda12b8dd162)

- Under Users add the two users click on Next.
  ![815](https://github.com/user-attachments/assets/36dd79fc-58c0-4702-8469-df6ae92dad69)

- Now add the created Permission set here and click on next button.
  ![816](https://github.com/user-attachments/assets/78b72b86-ced7-4621-b813-cd2dbfefdde6)

- Review and submit.
  
  ![817](https://github.com/user-attachments/assets/056f610f-9c8d-46a7-b2af-5c6e5db12179)

- After submitting it looks this way.
  ![817-1](https://github.com/user-attachments/assets/1c692a3c-715d-497d-b3c1-196bda9eb8b6)

- Now when you refresh the browser which we logged in with ```reddy@madireddy.com```
- You can see one acount added to the AWS access portal i.e ```Slave1``` account
  ![818](https://github.com/user-attachments/assets/3ef71bf9-b034-44e0-96f8-4c3e9295417b)

- Similarly we need to do it for Slave 2 account.
- Now under IAM Identity Center > AWS Organizations: AWS accounts add users and Permission set
- Click on Slave2 and open
  ![819](https://github.com/user-attachments/assets/8b4363f2-dd38-42d8-8daa-b626662914af)

- Under Users and Groups > Assign Users or Groups >
  ![820](https://github.com/user-attachments/assets/60750d42-1666-4c1d-b7b5-0c595fe42a1b)

- Under Users add the two users click on Next.
  ![821](https://github.com/user-attachments/assets/91207930-9c95-4d08-818c-5cf914267993)

- Now add the created Permission set here and click on next button.
  ![822](https://github.com/user-attachments/assets/42cfe624-da51-43d1-b7c3-7141adc981cf)

- Review and submit.
  
  ![823](https://github.com/user-attachments/assets/a45b35f1-fde2-49d2-8302-8639487dcbb8)

- After submitting it looks this way.
  ![824](https://github.com/user-attachments/assets/4341a5b6-a5c9-4c7b-9f1e-d875f3fd175e)

- Now when you refresh the browser which we logged in with ```reddy@madireddy.com```
- You can see one more acount added to the AWS access portal i.e ```Slave2``` account
  ![825](https://github.com/user-attachments/assets/5424d220-3ca0-44fc-a4e1-c64c645a242f)

- Now click on Slave1 > Permission set to go to slave 1 Console
  ![826](https://github.com/user-attachments/assets/0e947072-bb07-412d-814c-02d7b26225a5)

- After in it looks.
  ![827](https://github.com/user-attachments/assets/9fc2d994-8b7a-4fc2-89b7-12d2de3e096e)

- As we gave EC2 Full , S3 Read only and Route53 Readonly we can access them only
  ![828](https://github.com/user-attachments/assets/c0a3cb04-6035-4251-b87a-db10e0aac37a)

  ![829](https://github.com/user-attachments/assets/e9c4da38-e8eb-4e28-9aff-5e7c61672b8e)

  ![830](https://github.com/user-attachments/assets/523ba528-eeb0-4f91-9f28-a180981389fb)

- Others we dont have access give so it will give denied.
  ![831](https://github.com/user-attachments/assets/59824231-ff3b-499e-8a02-ae3613b3cea5)

- Similarly  goto Slave2 > Permission set
  ![832](https://github.com/user-attachments/assets/dd3ba3fe-4780-4cfa-a786-90e7b022f02c)

- As we gave EC2 Full , S3 Read only and Route53 Readonly we can access them only
  ![833](https://github.com/user-attachments/assets/c6d8ddb7-25df-4150-b4c4-947204087044)

  ![834](https://github.com/user-attachments/assets/a728fc76-296d-4b87-88ef-3e98e185ecbb)

  ![835](https://github.com/user-attachments/assets/a0c62121-7071-47d8-95f0-8b5e0afe1333)
  
- Others we dont have access give so it will give denied.
  ![836](https://github.com/user-attachments/assets/e6fecd94-39a0-4a32-bb08-7eee23766317)

- This way by using active directory users we can manage the Single sign on in the AWS Accounts.
- Now by using same active Directories we can use FSx also in AWS

## 23.8. AWS FSX CReation:
- Click on Crterate file system under Amazon FSX > Filesystems
  ![760](https://github.com/user-attachments/assets/7740ba9c-d63b-4df9-91a7-c6df50ec5b3f)

- Select Amazon FSx for Windows File Server and click on Next.
  ![761](https://github.com/user-attachments/assets/13e92815-ae0d-443e-991e-f0245fb4ecdc)

- Select Quick Create, Name, Singlr AZ, SSD(32), VPC, Subnet.
- Finally selsct our Active directory Whcich created earlier
  ![762](https://github.com/user-attachments/assets/19f62498-bffc-4846-a3f9-cfe2ac129531)

- Review and select create.
  ![763](https://github.com/user-attachments/assets/d170e2e4-dc8a-4376-a217-02bb14b8620b)
  ![764](https://github.com/user-attachments/assets/30b1bca8-9d18-4f8e-b53c-400242cbc3a6)

- After creation it will take some time to create.
  ![765](https://github.com/user-attachments/assets/d135b061-8d31-4574-adcb-fa121587d613)

- Once the FSX is in Available, open the FSx
  ![765-1](https://github.com/user-attachments/assets/b0b841af-8006-4cfd-9697-16fc4683358b)

- Copy the FSx DNS Name.
  ![765-2](https://github.com/user-attachments/assets/ca3c9bc4-ddee-4c30-bc57-0a222b5e18f8)

- paste in run you will get shared location
  ```
  \\fs-08cd78bfa94551000.madireddy.com
  ```
  ![765-3](https://github.com/user-attachments/assets/0d9f76e2-7f02-4ccc-9f8f-94cbce0154ea)

- Open the share Folder
  ![765-4](https://github.com/user-attachments/assets/506a4075-5aa4-4cdf-b128-27cafb828653)

- Create 3 folders ```Commondata, anikumar and reddy```
  ![765-5](https://github.com/user-attachments/assets/b014e4da-4642-46fc-9e73-e5d67bfe1882)

- Disable inheritance for common Data coz we can delete other users in decurity
  ![765-6](https://github.com/user-attachments/assets/7f0d19e5-e620-4000-a3f5-8e3894d55957)

- Now click on Add button
  
  ![765-7](https://github.com/user-attachments/assets/0a3ce831-f987-4db1-a406-99de49b873e5)

- Now Click on Select a principal link
  ![765-8](https://github.com/user-attachments/assets/22a041ac-f765-4d92-95f8-a2ad0d934649)

- Add ```anilkumar``` user and click on ok
  ![765-9](https://github.com/user-attachments/assets/5ff21e62-dbab-4b41-9d6f-3970fe209dd1)

- Next Give full control to anilkumar for common data
  ![765-10](https://github.com/user-attachments/assets/921b824d-df20-447e-9c29-9f97a7cb0320)

- again click on Add button
  
  ![765-11](https://github.com/user-attachments/assets/f52003b6-1f37-4ed0-973c-760b6662e402)

- Now Click on Select a principal link
  ![765-12](https://github.com/user-attachments/assets/6f26e1f9-36b3-4f0b-8806-f12e7e5db87f)

- Add ```reddy``` user and click on ok
  ![765-13](https://github.com/user-attachments/assets/4a56b114-de9f-4df8-b29e-112c9f7049ad)

- Next Give full control to reddy for common data
  ![765-14](https://github.com/user-attachments/assets/e306d7ea-cf71-4ebe-9f31-0f10c2c48876)

- Now remove all except ```anilkumar``` and ```reddy```
  ![765-15](https://github.com/user-attachments/assets/69b1e284-1542-4181-b094-373521a3f839)

- Now click on Apply and ok and ok
  ![765-16](https://github.com/user-attachments/assets/b54e8827-213c-4082-bedb-22a6b857b71b)

- Now For anilkumar folder
  ![765-17](https://github.com/user-attachments/assets/c3997e7b-b49c-4bfe-836d-1c56e9ccff17)

- Add anilkumar user id
  
  ![765-18](https://github.com/user-attachments/assets/fdaf6c6b-39e8-448a-94d7-f56af14a7345)

- Added anilkumar by checking names button
  ![765-19](https://github.com/user-attachments/assets/6653c77c-993e-434d-bd3b-463d755cf96c)

- Provided full control to ```anilkumar folder``` for ```anilkumar``` user
  ![765-20](https://github.com/user-attachments/assets/37471cd9-072a-46a1-b86b-c0a4964d80a8)

- Disable inheritance for anilkumar dir
  ![765-21](https://github.com/user-attachments/assets/68bc1d20-2d90-483f-a490-c8d779284e00)
  ![765-22](https://github.com/user-attachments/assets/405ab986-7752-4b9d-bd4e-db489accfa08)

- Remove all except anilkumar as it is personal folder for anilkumar
- click on ok. and apply
  
  ![765-23](https://github.com/user-attachments/assets/49c6a0ba-cbf4-457a-b406-5a9eb9094db0)

- Now For reddy folder
  
  ![765-24](https://github.com/user-attachments/assets/002164d2-730b-40a5-96ce-255ad645ee6c)

- Disable inheritance
  
  ![765-25](https://github.com/user-attachments/assets/64731e5b-802f-4982-a97b-de87fd60a014)
  ![765-26](https://github.com/user-attachments/assets/16862bc4-b816-4824-9095-dee4bbb7fbf6)

- click on add button
  
  ![765-27](https://github.com/user-attachments/assets/8c033603-d3be-478f-be89-6c23222c7276)

- Click on select principal button
  ![765-28](https://github.com/user-attachments/assets/c19b5e98-a658-4fb5-969b-d4de59706632)

- Add reddy user id by checking names
  ![765-29](https://github.com/user-attachments/assets/4887fc84-2837-4f2a-bcd3-f3aad24bb864)

- Provide the full access for reddy
  ![765-30](https://github.com/user-attachments/assets/6f230082-9256-46d4-a76e-c01219aea1b6)

- Remoe all except reddy as it is personal folder for reddy user
  ![765-31](https://github.com/user-attachments/assets/8f1d70b4-5eb6-435e-895c-37d9b837bccf)

- click on ok. and apply
  
  ![765-32](https://github.com/user-attachments/assets/ad608242-c733-4e30-a006-2bec1bc74182)

- Now in power shell run below command
  ```
  lusrmgr.msc
  ```
- open remote desktop users
  ![765-33](https://github.com/user-attachments/assets/d77f8efd-924e-4451-ac2a-41cfbd49e5e6)

- Click on add button
  
  ![765-34](https://github.com/user-attachments/assets/637f0f21-d4fe-434c-bb5f-6e6f1dacba41)

- Add users ```anilkumar``` and ```reddy``` as they should login to the Windows AD instance
  ![765-35](https://github.com/user-attachments/assets/851e78df-1549-461d-964c-ccc5e0ba0104)

- Click on ok and apply
  ![765-36](https://github.com/user-attachments/assets/22452152-7c50-4d53-8813-27e831c304ef)

- NOw login to AD instance with ```anilkumar@madireddy.com``` as username
  ![765-37](https://github.com/user-attachments/assets/4622d865-768d-4aa3-a1c4-a1c6466938c1)

- Logged in as anilkumar.
  ![765-38](https://github.com/user-attachments/assets/66895200-e2a8-4edb-8df7-6f60070a09d6)

- to check the shared location you can run ```set``` command in cmd prompt
  ![765-39](https://github.com/user-attachments/assets/cbd8cb5e-9d1d-4632-9561-9c14e501f33c)

- NOw do nslookup LOCALAPPDATAPATH in the above image
- out put shoes the IP address of Active dir
  ![765-40](https://github.com/user-attachments/assets/46075c2e-c14f-4d0d-a41c-6c1cc862e32b)

- Copy FSx DNS Name
  ![765-41](https://github.com/user-attachments/assets/e0e693db-a3a2-4fd6-882d-bbb0c647ec4a)

- Pate in run
  ```
  \\fs-08cd78bfa94551000.madireddy.com
  ```
  ![765-42](https://github.com/user-attachments/assets/f3e56d47-1d1f-41bd-ad29-6ca28e8cbb34)

- Share folder opens , open share
  ![765-43](https://github.com/user-attachments/assets/6232bef9-32c9-49d8-bebc-b55e70d22c4f)

- As you logged in with anilkumar id you wont be able to open reddy folder
  ![765-44](https://github.com/user-attachments/assets/6730e42c-4edd-4372-a9f8-a04ea140fa4a)

- anikumar have access to common data
  ![765-45](https://github.com/user-attachments/assets/11f30ff6-5604-428e-aaa7-125c85f5c946)

- anilkumar have access to anilkumar dir and copied few files
  ![765-46](https://github.com/user-attachments/assets/863da306-b57b-45a8-b072-52e7ae666029)

- NOw login to AD instance with ```reddy@madireddy.com``` as username
  
  ![765-47](https://github.com/user-attachments/assets/deafe0eb-4b45-4fdc-b9bd-9331dfc76432)

- As admin and anilkumar already loggedin it ask for disconnect one to login reddy user
  ![765-48](https://github.com/user-attachments/assets/76af7265-7bcf-4a54-b854-23c4c1b98766)

- disconnecting anilkumar Remote desktop.
  ![765-49](https://github.com/user-attachments/assets/c2e04432-3ad0-4db7-81fe-bf7a88c6089f)

- Copy FSx DNS Name and Pate in run
  ```
  \\fs-08cd78bfa94551000.madireddy.com
  ```
  ![765-50](https://github.com/user-attachments/assets/9e5239b0-b01b-4547-942b-dccb693ffda6)

- Share folder opens , open share.
- As you logged in with ```reddy``` id you wont be able to open ```anilkumar``` folder
  ![765-51](https://github.com/user-attachments/assets/a6a64421-5633-49e4-8477-9e4a25e7ec69)

- reddy have access to common data
  ![765-52](https://github.com/user-attachments/assets/88790fd6-86b7-43fd-9c63-dfb8cf3b186b)

- reddy have access to reddy dir and copied few files
  ![765-53](https://github.com/user-attachments/assets/97ebfa53-edfb-4521-9774-cb11cb36e439)

- Now you can delete FSX. as our test finished and we dont want that any more.
  ![765-54](https://github.com/user-attachments/assets/f7845a3c-ecdc-4991-b1c8-13ab9f0e1051)

- it will take minutes to delete.
  ![765-55](https://github.com/user-attachments/assets/a4d1766f-0783-4ba4-82e4-b27ee603f15d)
