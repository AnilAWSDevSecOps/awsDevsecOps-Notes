# 12. Process of Creating Connection Between AWS and AZURE:

## 12.1. Creating Virtual Network in AZURE:
- Go to Home > Virtual Networks > Create virtual network
  ![164](https://github.com/user-attachments/assets/15666ec7-5490-4ddb-b9fa-4ec8888d6572)

- Fill in the details like Resource group, Virtual network name. Click on Next button.
  ![165](https://github.com/user-attachments/assets/4a4a277e-6e5f-441d-beed-ce8d27529a08)
  ![166](https://github.com/user-attachments/assets/6dbe9fc4-6cba-4b84-9e78-2d7d06c4c8d5)

- Click on Next button.
  
  ![167](https://github.com/user-attachments/assets/e9222c81-ee64-4c0b-addb-236736d57a2a)

- Fill in the details like IP Range, and click on Add a subnet to add subnets here.
  ![168](https://github.com/user-attachments/assets/49e1cd45-03ea-4b28-b486-d599b597ef3b)

- Fill in the details like Name, IPv4 address range, size and click on add Subnet button. Rest of details leave it with defaults
  ![169](https://github.com/user-attachments/assets/4f9053c7-e244-4649-92b4-5ab5698cd045)

- One subnet added successfully and click on Add a subnet and add another subnet
  ![170](https://github.com/user-attachments/assets/c23abd31-6984-4eab-a63c-23a0e1b413b0)

- Fill in the details like Subnet purpose, IPv4, Size. Click on Add button, rest of details leave it with defaults.
  ![171](https://github.com/user-attachments/assets/2bccd076-df74-4f2f-97b2-4715892e7f3d)

- Gateway subnet created successfully, click on Next button, skip the tags menu, click on next, click on create button.
  ![172](https://github.com/user-attachments/assets/9df061fa-a7db-4b1c-9d0f-f273a177b61f)

- Review the content and click on create button to create the Virtual network.
  ![173](https://github.com/user-attachments/assets/9350692a-2db2-42ea-b8c1-a572e2fe3f3b)

- After creating the VNET we will deploy the virtual network gateway in it and it will take 15 min to get deployed. Click on got to resource button.
  ![174](https://github.com/user-attachments/assets/4d7feade-89fc-491b-af6c-2646dd273923)

## 12.2. DNS Servers creation in AZURE:
- Under Settings go to DNS Servers.
  
  ![175](https://github.com/user-attachments/assets/f157eaf8-1ab9-44be-b026-17053b2f3b6e)

- Fill in the details like DNS servers, IP Address (10.56.1.100 and 8.8.8.8 (google DNS)) and save it, usually it might take 30 min to create it. Meanwhile we will create the rest.
  
  ![176](https://github.com/user-attachments/assets/d8d6b01b-cd86-43a6-aeea-7b4f442fd3bf)

- Created Virtual Network.
  ![177](https://github.com/user-attachments/assets/f429492f-39fc-4480-acf9-bb6cec5a6d29)

- You can view the created subnets under Virtual network > Subnets.
  ![178](https://github.com/user-attachments/assets/77aa3d77-001b-4aa3-848e-474a7f237ad7)

## 12.3. Virtual Machine creation in AZURE:
- Go to virtual machines Column and create one windows Virtual Machine by clicking on Create button
  ![179](https://github.com/user-attachments/assets/c390d389-9f72-41e5-b405-9731408f1c9f)

- Fill in the details like Resource group, Virtual machine name, Security type, Image.
  ![180](https://github.com/user-attachments/assets/a6abb299-7760-4771-b18c-53da81a9c242)

- Fill in the details like Size, Username, Password, confirm password and click on Next: Disk button.
  ![181](https://github.com/user-attachments/assets/ae04013a-e1f9-494d-9e81-f62c8df489a7)

- Fill in the details like OS disk type and click on Next: Networking button.
  ![182](https://github.com/user-attachments/assets/be5c0f07-85ea-4ecc-9f13-b3749f12987f)

- Fill in the details like Virtual Network, Subnet, Public IP, NIC network security group and Configure network security group and click on Next: Management, button and click on Next: Monitoring button.
  ![183](https://github.com/user-attachments/assets/48fe62a6-b746-45e8-93a7-20eff35255bb)

- Fill in the details like Boot diagnostics and click on Next: Advanced button. And click on Review and create. And click on create button finally to create Virtual Machine.
  ![184](https://github.com/user-attachments/assets/29d10626-52ab-42e7-be3b-c1b9044c73ed)

- Now meanwhile we will try to deploy Virtual Network Gateway.
  ![185](https://github.com/user-attachments/assets/efe2af4e-95d7-4832-8c89-11a361cde2aa)

## 12.4. Virtual Network gateway creation in AZURE:
- Fill the Details as marked and click on Review + create button.
  ![186](https://github.com/user-attachments/assets/c11a7990-f6f5-436d-b09c-a5b9e66b5c35)

- This will take 18 to 30 min to get deployed.
  ![187](https://github.com/user-attachments/assets/74283a21-bb4c-4af9-a8c6-791a62fd1243)

- Now login to the Azure virtual machine which we created
- Home > Virtual Machines > Windows-01 > Public IP,  here copy the public IP and login using Creds. 
  ![188](https://github.com/user-attachments/assets/6dffdc96-098d-4702-a302-53aa733469d3)

## 12.5. Launching the Instances in AWS:
- New Instance
  
  ![189](https://github.com/user-attachments/assets/61fb377f-c5a9-4716-99b1-0f3c8bb3317e)    
  ![190](https://github.com/user-attachments/assets/987b9185-026b-4c72-9193-1fee47ee822b)

- Assigning the Primary IP to the Server, so that we can add it in AZURE DNS
  ![191](https://github.com/user-attachments/assets/acd98c13-9329-412b-96d5-0a2745332e66)
  ![192](https://github.com/user-attachments/assets/297d6c41-32e2-4a49-bd2f-b0bf03634c52)

- Now we will login to the Windows instance. Click on Connect by selecting the Server.
  ![193](https://github.com/user-attachments/assets/4cf34c56-6e19-4edc-a9a2-ac7fe12bc490)

- After clicking on connect button, go to RDP Client and click on Get password button.
  ![194](https://github.com/user-attachments/assets/0a676fcc-9af4-4b65-be09-cb8774c3575c)

- Click on Upload and upload a private key and click on Decrypt Password Button.
  ![195](https://github.com/user-attachments/assets/a6c9f1b2-403a-4318-ba8f-a80e67d4a6b3)

- After clicking the get password you will get the password then copy the password. Connect using the Remote Desktop Connection. After Connecting we need to create the active directory in the server.
  ![196](https://github.com/user-attachments/assets/4a98f29b-1501-43c8-8e73-5c645a1e1c21)

## 12.6. Active Directory Creation in AWS Instance:
- Now follow the screenshot and right click on Ethernet 2 > Properties select properties button and enter the below details.
  ![197](https://github.com/user-attachments/assets/bb32c42d-b2f4-4ab7-b3f8-41a6a0b2e99e)

- By typing command ipconfig /all you will get the details enter the DNS details in the above screenshot properties.
  ![198](https://github.com/user-attachments/assets/6ad021a4-823b-40c9-8aba-ab935c5b0071)

- Fill preferred DNS and alternate DNS Server and click on ok.
  
  ![199](https://github.com/user-attachments/assets/6bafe37b-e128-47ae-91b4-f0552ad999c2)

- Click on Server Manager button. And configure the Active Directory.
  ![200](https://github.com/user-attachments/assets/6cbb9a85-86c6-4483-b7a7-e5ec09756db2)

- Click on manage > Add Roles and Feature.
  ![201](https://github.com/user-attachments/assets/10a716b3-fe57-4911-b5d2-fe0a3fab11d9)

- Click on Next.
  ![202](https://github.com/user-attachments/assets/fef327b9-ee88-43ad-aada-08d4fd44cb00)

- Select the Role-based on feature and click on Next.
  ![203](https://github.com/user-attachments/assets/43aabc42-05cd-4487-9bae-a7488ae4d26d)

- Select our Server and click on next.
  
  ![204](https://github.com/user-attachments/assets/3be7fefc-a21d-4ba6-938c-5a984166cd72)

- Click on Active Directory Role shown in Picture.
  ![205](https://github.com/user-attachments/assets/5e531171-3314-4dde-a99b-7d0ae466f4e2)

- Click on Add Feature.
  
  ![206](https://github.com/user-attachments/assets/acb363c4-0417-41f4-83ad-5a0ea3492e88)

- Click on Next.
  
  ![207](https://github.com/user-attachments/assets/963aa0a7-8b0e-41b4-a901-c48826f0e4ea)

- Select the Telnet client and click on Next.
  ![208](https://github.com/user-attachments/assets/ae007e80-74d7-4050-8242-b26a92639ebc)

- Click on Next.
  
  ![209](https://github.com/user-attachments/assets/97035b50-a09a-4c0b-b58a-b8cb246be555)

- Click on Install.
  
  ![210](https://github.com/user-attachments/assets/b8eb8bd5-3efe-4934-9f87-e2241aa6b4fc)

- Click on Promote this server.
  ![211](https://github.com/user-attachments/assets/97727461-1973-49c8-b3c8-74ce5ffe49e0)

- Click on Add a new Forest, fill in Root Domain name and Click Next.
  ![212](https://github.com/user-attachments/assets/e935dcf7-e82e-47dd-9e4d-132218116164)

- Fill the Password and click on Next.
  ![213](https://github.com/user-attachments/assets/39913896-6384-433d-b4f9-077bfbd425ca)

- Click on Next.
  
  ![214](https://github.com/user-attachments/assets/6e3a3967-b91d-4f6a-9c23-ed54cf334a36)

- Click on Next. Then Next, Then Next and Then Install.
  ![215](https://github.com/user-attachments/assets/955130ae-41d5-4d6b-82d4-ea59953a2e33)

- Click on Install. After installation server will automatically reboots
  ![216](https://github.com/user-attachments/assets/b23e8494-e592-4924-aaa8-ef73a88c90cb)

- After creating the active directory, we need to login to the AWS windows server with Admnistrator @ madireddy.xyz id as we configured root domain name while configuring the active directory in the AWS windows server.
  ![217](https://github.com/user-attachments/assets/884000aa-3579-478e-94aa-28349bafe7d3)

- We need to disable the local firewall in the servers.
  ![218](https://github.com/user-attachments/assets/e582698d-919b-49ee-98a4-aac7ac8486c9)

- This way we can disable the firewalls. Follow the same process in the azure server also. To disable the firewalls.
  ![219](https://github.com/user-attachments/assets/972e61e9-d45b-4ef2-9303-04d8c107e65b)

- After Active directory creation Domain will change. Like in screenshot. That which we added while creating the active directory. ```sysdm.cpl``` Command.
  
  ![220](https://github.com/user-attachments/assets/5c56657f-ed62-4fab-a1a3-76d020b4ffce)

- Now we will go to the path shown in the screenshot.
  ![221](https://github.com/user-attachments/assets/9a695ce0-cf7e-4ac3-850d-52d3e8bcc9df)

- We will create new users in here by clicking on users > New Users.
  ![222](https://github.com/user-attachments/assets/104ac6b1-0e6a-45be-a1b6-3d8c9d76e7fd)

- We will enter the names and click on next to create users.
  ![223](https://github.com/user-attachments/assets/16c91d39-e405-4d70-992d-d7fbeb1d15af)

- After password entered click on next. And click on finish button.
  ![224](https://github.com/user-attachments/assets/be4c23af-0ead-403d-bf3f-6df539f747bd)

- The created user is arrowed here.
  ![225](https://github.com/user-attachments/assets/42cc42ec-cd34-42b1-af4b-dbe06bf3b3a8)

- Click on Created user go to member of and click on add, Enter the Object name and click on ok.
- Same way by right click and copy the anilkumar user and create new user reddy and its password Anil@1201
  ![226](https://github.com/user-attachments/assets/b9c0678a-56ba-4cbe-b66f-73d471229a1f)

## 12.7. Virtual private gateway creation in AWS:
- Now we need to create the VPG in the AWS VPC  
  ![227](https://github.com/user-attachments/assets/dbe5e741-9171-4fb0-aaef-4722c7e3995d)

- Click on the Create virtual private gateway button and create it.
  ![228](https://github.com/user-attachments/assets/1be94d8f-3fb4-4a02-8b5b-de3188f12877)

- Fill in the Name and click on Create virtual private gateway button
  ![229](https://github.com/user-attachments/assets/f3f717cf-76ff-4c77-9d73-933b706a654f)

- You should attach the VPG to the VPC by this way.
  ![230](https://github.com/user-attachments/assets/81dec730-e420-4470-9f57-35a8489404a2)

- Attach out VPG to our VPC.
  ![231](https://github.com/user-attachments/assets/0ea4d457-3208-46b1-8e6b-a11e15f4fb7d)

- Successfully attached.
  ![232](https://github.com/user-attachments/assets/f64d5560-a7a4-4b8b-9939-ec38303148e6)

## 12.8. Customer gateways creation in AWS:
- Now we need to establish the VPN connection by providing the azure IP address in Customer gateway under VPN.
  ![233](https://github.com/user-attachments/assets/eafdaca1-588d-41b6-9260-3b9daeb491e4)

- Now Click on Create Customer gateway button.
  ![234](https://github.com/user-attachments/assets/5641830c-6326-4a62-8b12-d8c63d34c241)

- Now you should copy the VNG01-PIP IP and should enter in the below Customer gateway creation.
  ![235](https://github.com/user-attachments/assets/268a8663-9eff-4bc1-99e6-5dc13ea96f6d)

- Now copy the IP address.
  ![236](https://github.com/user-attachments/assets/25896625-edaa-4925-9662-050eff75ca39)

- Now fill in the details and click on Click on Create Customer gateway button.
  ![237](https://github.com/user-attachments/assets/3096130e-9ee0-49d2-bd8e-185006532d53)
  ![238](https://github.com/user-attachments/assets/f1bd83f2-1967-4954-89d3-233183ec9961)

- Now we need to establish the Site-to-site VPN Connection in AWS
  ![239](https://github.com/user-attachments/assets/e14202fe-d837-4122-88cc-5a78ac88cf04)

## 12.9. Site-to-Site VPN connections creation in AWS:
- Now click on Create VPN Connection Button and Fill in the details as marked and leave rest to defaults.
- Here Static IP prefixes range should be azures IP range.
- Now click on Create VPN Connection Button to create.
  ![240](https://github.com/user-attachments/assets/fa40ad12-5f9d-45fe-97fe-8719e22018dd)

- Once this VPN is Available, we need to edit the Route table to shoe the way to Azure.
  ![241](https://github.com/user-attachments/assets/0de3173e-0a8d-4656-a52c-eaa521e1ce90)

- Go to the Private route table of AWS windows server and click on Edit routes and add the Azure IP Range.
  ![242](https://github.com/user-attachments/assets/00bd5241-e8cb-4d81-a629-5fd9d459000b)

- Now here we have added the Azure IP range in the AWS route table. Now Click on Save Changes button.
  ![243](https://github.com/user-attachments/assets/4090cee6-e8f1-42ef-936b-c0a10b8538d7)

- After adding the Routes in AWS route table.
  ![244](https://github.com/user-attachments/assets/e87fd101-9b62-447b-bbe1-2936a3a43d1a)

- Now after long time Virtual Network Gateway has deployed in AZURE, Click on Goto resource button.
  ![245](https://github.com/user-attachments/assets/07e42586-6e58-4d72-bdd9-2d2a7cf1c51c)

- Now in AWS go to Site-to-Site VPN and Click on Download configuration by selecting the VPN.
  ![246](https://github.com/user-attachments/assets/66e87c7e-c140-4677-8fca-779a10ab4fc8)

- Fill details as shown and click on download button you will get one file downloaded now open the file in notepad.
  ![247](https://github.com/user-attachments/assets/1cb64813-13da-4300-bdc6-9d32ab8d98e0)

- Now in the file Line 55 pre-shared-key address and line 200 pre-shared-key address should be placed in the azure to establish the connection between from azure to AWS.
  ![248](https://github.com/user-attachments/assets/ab6201df-f5cd-4c67-9800-d1c87edb8f10)

## 12.10. Local Network Gateway creation iin AZURE:
- Now go to Local Network Gateway in AZURE and start creating the New Local Network Gateway by clicking.
  ![249](https://github.com/user-attachments/assets/dcfa08b7-5251-4041-8398-404b4f629576)

- Fill in the details Resource group, Name, IP address (First IP From Downloaded file in the above) and Address Space(s).
- Click on Review and Create. And then click on create.
  ![250](https://github.com/user-attachments/assets/ae4cd496-937d-4fb2-a26b-7909002b73d7)

- Now we should create the one more Local network gateways.    
  ![251](https://github.com/user-attachments/assets/77c405c3-7ce8-43a8-b3b4-c773715b8cf3)

- Fill in the details Resource group, Name, IP address (Second IP From Downloaded file in the above) and Address Space(s)
- Click on Review and Create. And then click on create
  ![252](https://github.com/user-attachments/assets/67ed6ea1-dd31-4efe-939b-dd70a3b13ccd)

- Created Successfully
- Still there won’t be any ping between AZURE and AWS Servers in command prompt.
  ![253](https://github.com/user-attachments/assets/271dedb7-5665-40fd-8663-f2544dba1484)

- Now if you see in aws VPN two tunnels will be in down.
- We need to bring them up, for that
  ![254](https://github.com/user-attachments/assets/75cb996b-71c4-456f-a11a-083f35aadaff)

- Come to Virtual Network Gateway (VNG01) which we created and under settings go to Connections
  ![255](https://github.com/user-attachments/assets/ba7aa018-318c-41b4-9175-cc580dfd5690)

- Click on Add button to add connections.
  ![256](https://github.com/user-attachments/assets/cb8d22ad-5c66-444e-ac20-a8ac28644426)
  
- Fill in the details like Resource group, Connection type and Name. and click on Next: Setting.
  ![257](https://github.com/user-attachments/assets/5a23a507-93c2-484c-b027-46736973b7c1)

- Fill in the details like Virtual network gateway (Which created earlier and select in drop down), Local network gateway (Which created earlier and select in drop down), Shared Key (PSK) {which is from aws downloaded file from line 55 key} and click on Next: tag and Click Review and Create and then Click Create buttons.
  ![258](https://github.com/user-attachments/assets/584e5a6c-b8bf-4090-88d3-b557de1a5959)

- Now Create one more by clicking Our VNG > Connections button
  ![259](https://github.com/user-attachments/assets/331b6e0c-5cf9-44ef-8f32-2215f943aa3c)

- Fill in the details like Resource group, Connection type and Name. and click on Next: Setting.
  ![260](https://github.com/user-attachments/assets/bf23ab61-d735-4db2-8b7c-696e4d33dec9)

- Fill in the details like Virtual network gateway (Which created earlier and select in drop down), Local network gateway (Which created earlier and select in drop down), Shared Key (PSK) {which is from aws downloaded file from line 200 key} and click on Next: tag and Click Review and Create and then Click Create buttons.
  ![261](https://github.com/user-attachments/assets/f88ec000-5e1d-4091-b866-ad2b92fccdf5)

- Now test the connection between Azure windows and AWS Windows servers.
- Test From Azure to AWS Servers.
  
  ![262](https://github.com/user-attachments/assets/6633e602-d024-4f82-b06e-07212933f090)

- Now test the connection between Azure windows and AWS Windows servers.
- Test From AWS to Azure Servers.
  
  ![263](https://github.com/user-attachments/assets/e5bbaf79-41c1-4a0d-8bd4-7416947586b8)

- Note: Check Security Group inbound rules if possible.
- Now our goal is to connect to Azure Server from Laptop and from that we need to connect to AWS server.
- Now first login to Azure Server.
  
  ![264](https://github.com/user-attachments/assets/4f379ad4-70ee-4141-967c-ff7e5407a9c5)

- Now sysdm.cpl > change > domain (madireddy.xyz), Click on Ok button
  ![265](https://github.com/user-attachments/assets/e3daf2f1-2c59-45be-9b19-3dc22dd0ed37)

- Now Enter the AWS Username @ Domain Name and fill the password
  ![266](https://github.com/user-attachments/assets/e7466ec5-4626-42ca-b0a6-7ee3c4d4b505)

- You should get the Welcome message and click on OK button.
- Changes will affect only after restarting the server.
- Now you will use the reddy id (Which is created in AWS Domain users) to login to the Azure server
  ![267](https://github.com/user-attachments/assets/a9a97a4d-fe8d-4212-97f0-ae78a200792e)

- Now we have connected to the Azure Server using the Aws Server userid and Password
- NOTE: Check in Azure server after changing domain name, we need to turn off the domain firewall to communicate from aws server to azure server.
- Delete All the services in AWS and Azure in the Reverse order
  ![268](https://github.com/user-attachments/assets/31940e37-0a70-4f5e-8bdf-eb89f23ccd87)

- Overview AZURE
  ![269](https://github.com/user-attachments/assets/ec0eba2f-758a-4793-a430-9ac867d58393)

- Overview AWS.
  ![270](https://github.com/user-attachments/assets/156175d3-ed38-4530-86aa-aedbfe926ade)

## 12.11. Process to connect Multiple VPCs to the Azure
- Create 3 Extra VPCs
  ![271](https://github.com/user-attachments/assets/b0f9c1ae-1ac7-4eb5-a9ef-3b5a7b0379d5)

- Create 3 Extra instances in each VPC
  ![272](https://github.com/user-attachments/assets/78104bfc-74a8-46e9-b0eb-9c3a489f840b)

## 12.12. Transit Gateway creation:
- This is used to connect Multiple VPCs in AWS and then connect to VNG in Azure so that VPN Connection is established.
  ![273](https://github.com/user-attachments/assets/30a8a355-e2c3-49df-a807-d1fc6ef49c51)

- Fill the details like Name and Description.
  ![274](https://github.com/user-attachments/assets/79f96a3c-b678-4eb0-bc16-6671b64f84cd)

- Click on Create transit gateway.
  ![275](https://github.com/user-attachments/assets/01a3cec9-2552-4c6b-9f9c-d2ee769ef074)
  ![276](https://github.com/user-attachments/assets/f78207a2-d089-46fd-bd52-bff5fca4b344)

- Fill in the details like name, Transit gateway ID, Attachment type and Subnet id.
  ![277](https://github.com/user-attachments/assets/7c0cd564-6c98-4de1-a0b5-b101a408a61f)

- Click on create button.
  ![278](https://github.com/user-attachments/assets/5435aa3f-c2a4-4586-879a-7500b1bf1b12)

- Similarly, you create for VPC 3 and 4
- Listing all 3 Transit Gateways.
  ![279](https://github.com/user-attachments/assets/c11710a9-0372-46cc-8351-11c873eb9a79)

- Attachment for Azure VPN, fill in the details like Transit Gateway ID and Attachment Type and IP address (Azure Virtual Network Gateway PIP).
  
  ![280](https://github.com/user-attachments/assets/21b6935d-4dff-4fd8-94e3-49681afdb518)

- Click on Create button.  
  ![281](https://github.com/user-attachments/assets/c9a90fa3-74e6-4e89-a0ec-78df43d25ca8)

- Now showing all 4 attachments. Including azure Virtual Network Gateway attachment.  
  ![282](https://github.com/user-attachments/assets/cadf7600-a425-445a-bdb4-1709e1ed6daf)

- Now login to all 4 servers using the putty, before this you need to create one Linux VM in azure.
- Now when we see here no ping connection for one another
  ![283](https://github.com/user-attachments/assets/f8ae521f-0076-4f21-84c1-be744c44f0be)

- Here in the all 3 VPC’s route tables we will add the other three VPCs IP ranges so that routes will get establish and ping happens each other for all VPCs except the Azure Server.
  ![285](https://github.com/user-attachments/assets/236314d2-d94c-4c02-bc29-bdd2b828a4d3)

- Now after adding routes in route table ping happens successfully in all 3 Servers.
- But in azure server no ping.
  ![286](https://github.com/user-attachments/assets/83bbd6ae-2580-427a-8fb9-a858f7a5893d)
  ![287](https://github.com/user-attachments/assets/88ef3637-10c0-42c9-8349-dc96f95e9aa8)

- Under site-to-site VPN Connections you will get one VPN Automatically go to that and download the Configuration file and add the data into the azure gateways. 
  ![288](https://github.com/user-attachments/assets/e4940920-eecb-447f-bdfe-1285c29fc820)

- Download the file and go to azure Gateways and add the IP and Keys as we did earlier in Local Network gateway and Virtual Network gateway.
  
  ![289](https://github.com/user-attachments/assets/348ceefa-a68d-4240-92c9-e620b5aa19df)

- Add the configuration in the Azure Local Network Gateway 
- Fill in the details like Name, IP address and Address Spaces (All 3 VPC’s range added in here)
- Click on Create button
  ![290](https://github.com/user-attachments/assets/9617f4f6-1df3-4053-ac15-a979844e1008)

- Fill in the details like Name, IP address and Address Spaces (All 3 VPC’s range added n here), Click on Create Button
  ![291](https://github.com/user-attachments/assets/48e2a8fe-b312-4b63-923c-8086993e2865)

- Fill in the details like Resource group, Connection type and Name. and click on Next: Setting.
  ![292](https://github.com/user-attachments/assets/58edcab5-2403-4f5f-aebe-2dbcf8a27db8)

- Fill in the details like Virtual network gateway (Which created earlier and select in drop down), Local network gateway (Which created earlier and select in drop down), Shared Key (PSK) {which is from aws downloaded file from line 200 key} and click on Next: tag and Click Review and Create and then Click Create buttons.
  ![293](https://github.com/user-attachments/assets/1cd4d098-10df-4ff9-9b0c-926f9880c3d3)

- Fill in the details like Resource group, Connection type and Name. and click on Next: Setting
  ![294](https://github.com/user-attachments/assets/d06b2b91-3491-4f7a-b6f1-e11d7176bd0c)

- Fill in the details like Virtual network gateway (Which created earlier and select in drop down), Local network gateway (Which created earlier and select in drop down), Shared Key (PSK) {which is from aws downloaded file from line 200 key} and click on Next: tag and Click Review and Create and then Click Create buttons.
  ![295](https://github.com/user-attachments/assets/dc9cdee3-b376-422e-892a-c94f3d9ba965)

- You need to add the Azure IP range in the Transit gateway route tables
  ![296](https://github.com/user-attachments/assets/a756195e-7493-4a65-9423-73af8dc83f69)

- Now you will be able to ping the Azure server from AWS Servers.
- This way you can get the communication between multiple VPC and one Azure VPN
  ![297](https://github.com/user-attachments/assets/b7f1cdb1-abbc-4ca5-955c-89738b5dbd42)
