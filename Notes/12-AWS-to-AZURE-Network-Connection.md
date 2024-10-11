# 12. Process of Creating Connection Between AWS and AZURE:

## 12.1. Creating Virtual Network in AZURE:

- Go to Home > Virtual Networks > Create virtual network
  ![164](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/164.png)

- Fill in the details like Resource group, Virtual network name. Click on Next button.
  ![165](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/165.png)
  ![166](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/166.png)

- Click on Next button.

  ![167](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/167.png)

- Fill in the details like IP Range, and click on Add a subnet to add subnets here.
  ![168](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/168.png)

- Fill in the details like Name, IPv4 address range, size and click on add Subnet button. Rest of details leave it with
  defaults
  ![169](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/169.png)

- One subnet added successfully and click on Add a subnet and add another subnet
  ![170](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/170.png)

- Fill in the details like Subnet purpose, IPv4, Size. Click on Add button, rest of details leave it with defaults.
  ![171](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/171.png)

- Gateway subnet created successfully, click on Next button, skip the tags menu, click on next, click on create button.
  ![172](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/172.png)

- Review the content and click on create button to create the Virtual network.
  ![173](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/173.png)

- After creating the VNET we will deploy the virtual network gateway in it and it will take 15 min to get deployed.
  Click on got to resource button.
  ![174](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/174.png)

## 12.2. DNS Servers creation in AZURE:

- Under Settings go to DNS Servers.

  ![175](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/175.png)

- Fill in the details like DNS servers, IP Address (10.56.1.100 and 8.8.8.8 (google DNS)) and save it, usually it might
  take 30 min to create it. Meanwhile we will create the rest.

  ![176](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/176.png)

- Created Virtual Network.
  ![177](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/177.png)

- You can view the created subnets under Virtual network > Subnets.
  ![178](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/178.png)

## 12.3. Virtual Machine creation in AZURE:

- Go to virtual machines Column and create one windows Virtual Machine by clicking on Create button
  ![179](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/179.png)

- Fill in the details like Resource group, Virtual machine name, Security type, Image.
  ![180](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/180.png)

- Fill in the details like Size, Username, Password, confirm password and click on Next: Disk button.
  ![181](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/181.png)

- Fill in the details like OS disk type and click on Next: Networking button.
  ![182](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/182.png)

- Fill in the details like Virtual Network, Subnet, Public IP, NIC network security group and Configure network security
  group and click on Next: Management, button and click on Next: Monitoring button.
  ![183](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/183.png)

- Fill in the details like Boot diagnostics and click on Next: Advanced button. And click on Review and create. And
  click on create button finally to create Virtual Machine.
  ![184](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/184.png)

- Now meanwhile we will try to deploy Virtual Network Gateway.
  ![185](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/185.png)

## 12.4. Virtual Network gateway creation in AZURE:

- Fill the Details as marked and click on Review + create button.
  ![186](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/186.png)

- This will take 18 to 30 min to get deployed.
  ![187](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/187.png)

- Now login to the Azure virtual machine which we created
- Home > Virtual Machines > Windows-01 > Public IP, here copy the public IP and login using Creds.
  ![188](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/188.png)

## 12.5. Launching the Instances in AWS:

- New Instance

  ![189](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/189.png)
  ![190](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/190.png)

- Assigning the Primary IP to the Server, so that we can add it in AZURE DNS
  ![191](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/191.png)
  ![192](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/192.png)

- Now we will login to the Windows instance. Click on Connect by selecting the Server.
  ![193](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/193.png)

- After clicking on connect button, go to RDP Client and click on Get password button.
  ![194](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/194.png)

- Click on Upload and upload a private key and click on Decrypt Password Button.
  ![195](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/195.png)

- After clicking the get password you will get the password then copy the password. Connect using the Remote Desktop
  Connection. After Connecting we need to create the active directory in the server.
  ![196](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/196.png)

## 12.6. Active Directory Creation in AWS Instance:

- Now follow the screenshot and right click on Ethernet 2 > Properties select properties button and enter the below
  details.
  ![197](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/197.png)

- By typing command ipconfig /all you will get the details enter the DNS details in the above screenshot properties.
  ![198](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/198.png)

- Fill preferred DNS and alternate DNS Server and click on ok.

  ![199](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/199.png)

- Click on Server Manager button. And configure the Active Directory.
  ![200](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/200.png)

- Click on manage > Add Roles and Feature.
  ![201](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/201.png)

- Click on Next.
  ![202](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/202.png)

- Select the Role-based on feature and click on Next.
  ![203](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/203.png)

- Select our Server and click on next.

  ![204](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/204.png)

- Click on Active Directory Role shown in Picture.
  ![205](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/205.png)

- Click on Add Feature.

  ![206](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/206.png)

- Click on Next.

  ![207](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/207.png)

- Select the Telnet client and click on Next.
  ![208](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/208.png)

- Click on Next.

  ![209](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/209.png)

- Click on Install.

  ![210](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/210.png)

- Click on Promote this server.
  ![211](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/211.png)

- Click on Add a new Forest, fill in Root Domain name and Click Next.
  ![212](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/212.png)

- Fill the Password and click on Next.
  ![213](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/213.png)

- Click on Next.

  ![214](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/214.png)

- Click on Next. Then Next, Then Next and Then Install.
  ![215](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/215.png)

- Click on Install. After installation server will automatically reboots
  ![216](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/216.png)

- After creating the active directory, we need to login to the AWS windows server with Admnistrator @ madireddy.xyz id
  as we configured root domain name while configuring the active directory in the AWS windows server.
  ![217](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/217.png)

- We need to disable the local firewall in the servers.
  ![218](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/218.png)

- This way we can disable the firewalls. Follow the same process in the azure server also. To disable the firewalls.
  ![219](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/219.png)

- After Active directory creation Domain will change. Like in screenshot. That which we added while creating the active
  directory. ```sysdm.cpl``` Command.

  ![220](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/220.png)

- Now we will go to the path shown in the screenshot.
  ![221](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/221.png)

- We will create new users in here by clicking on users > New Users.
  ![222](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/222.png)

- We will enter the names and click on next to create users.
  ![223](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/223.png)

- After password entered click on next. And click on finish button.
  ![224](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/224.png)

- The created user is arrowed here.
  ![225](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/225.png)

- Click on Created user go to member of and click on add, Enter the Object name and click on ok.
- Same way by right click and copy the anilkumar user and create new user reddy and its password Anil@1201
  ![226](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/226.png)

## 12.7. Virtual private gateway creation in AWS:

- Now we need to create the VPG in the AWS VPC  
  ![227](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/227.png)

- Click on the Create virtual private gateway button and create it.
  ![228](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/228.png)

- Fill in the Name and click on Create virtual private gateway button
  ![229](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/229.png)

- You should attach the VPG to the VPC by this way.
  ![230](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/230.png)

- Attach out VPG to our VPC.
  ![231](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/231.png)

- Successfully attached.
  ![232](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/232.png)

## 12.8. Customer gateways creation in AWS:

- Now we need to establish the VPN connection by providing the azure IP address in Customer gateway under VPN.
  ![233](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/233.png)

- Now Click on Create Customer gateway button.
  ![234](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/234.png)

- Now you should copy the VNG01-PIP IP and should enter in the below Customer gateway creation.
  ![235](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/235.png)

- Now copy the IP address.
  ![236](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/236.png)

- Now fill in the details and click on Click on Create Customer gateway button.
  ![237](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/237.png)
  ![238](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/238.png)

- Now we need to establish the Site-to-site VPN Connection in AWS
  ![239](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/239.png)

## 12.9. Site-to-Site VPN connections creation in AWS:

- Now click on Create VPN Connection Button and Fill in the details as marked and leave rest to defaults.
- Here Static IP prefixes range should be azures IP range.
- Now click on Create VPN Connection Button to create.
  ![240](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/240.png)

- Once this VPN is Available, we need to edit the Route table to shoe the way to Azure.
  ![241](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/241.png)

- Go to the Private route table of AWS windows server and click on Edit routes and add the Azure IP Range.
  ![242](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/242.png)

- Now here we have added the Azure IP range in the AWS route table. Now Click on Save Changes button.
  ![243](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/243.png)

- After adding the Routes in AWS route table.
  ![244](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/244.png)

- Now after long time Virtual Network Gateway has deployed in AZURE, Click on Goto resource button.
  ![245](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/245.png)

- Now in AWS go to Site-to-Site VPN and Click on Download configuration by selecting the VPN.
  ![246](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/246.png)

- Fill details as shown and click on download button you will get one file downloaded now open the file in notepad.
  ![247](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/247.png)

- Now in the file Line 55 pre-shared-key address and line 200 pre-shared-key address should be placed in the azure to
  establish the connection between from azure to AWS.
  ![248](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/248.png)

## 12.10. Local Network Gateway creation iin AZURE:

- Now go to Local Network Gateway in AZURE and start creating the New Local Network Gateway by clicking.
  ![249](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/249.png)

- Fill in the details Resource group, Name, IP address (First IP From Downloaded file in the above) and Address Space(
  s).
- Click on Review and Create. And then click on create.
  ![250](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/250.png)

- Now we should create the one more Local network gateways.    
  ![251](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/251.png)

- Fill in the details Resource group, Name, IP address (Second IP From Downloaded file in the above) and Address Space(
  s)
- Click on Review and Create. And then click on create
  ![252](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/252.png)

- Created Successfully
- Still there won’t be any ping between AZURE and AWS Servers in command prompt.
  ![253](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/253.png)

- Now if you see in aws VPN two tunnels will be in down.
- We need to bring them up, for that
  ![254](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/254.png)

- Come to Virtual Network Gateway (VNG01) which we created and under settings go to Connections
  ![255](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/255.png)

- Click on Add button to add connections.
  ![256](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/256.png)

- Fill in the details like Resource group, Connection type and Name. and click on Next: Setting.
  ![257](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/257.png)

- Fill in the details like Virtual network gateway (Which created earlier and select in drop down), Local network
  gateway (Which created earlier and select in drop down), Shared Key (PSK) {which is from aws downloaded file from line
  55 key} and click on Next: tag and Click Review and Create and then Click Create buttons.
  ![258](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/258.png)

- Now Create one more by clicking Our VNG > Connections button
  ![259](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/259.png)

- Fill in the details like Resource group, Connection type and Name. and click on Next: Setting.
  ![260](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/260.png)

- Fill in the details like Virtual network gateway (Which created earlier and select in drop down), Local network
  gateway (Which created earlier and select in drop down), Shared Key (PSK) {which is from aws downloaded file from line
  200 key} and click on Next: tag and Click Review and Create and then Click Create buttons.
  ![261](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/261.png)

- Now test the connection between Azure windows and AWS Windows servers.
- Test From Azure to AWS Servers.

  ![262](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/262.png)

- Now test the connection between Azure windows and AWS Windows servers.
- Test From AWS to Azure Servers.

  ![263](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/263.png)

- Note: Check Security Group inbound rules if possible.
- Now our goal is to connect to Azure Server from Laptop and from that we need to connect to AWS server.
- Now first login to Azure Server.

  ![264](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/264.png)

- Now sysdm.cpl > change > domain (madireddy.xyz), Click on Ok button
  ![265](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/265.png)

- Now Enter the AWS Username @ Domain Name and fill the password
  ![266](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/266.png)

- You should get the Welcome message and click on OK button.
- Changes will affect only after restarting the server.
- Now you will use the reddy id (Which is created in AWS Domain users) to login to the Azure server
  ![267](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/267.png)

- Now we have connected to the Azure Server using the Aws Server userid and Password
- NOTE: Check in Azure server after changing domain name, we need to turn off the domain firewall to communicate from
  aws server to azure server.
- Delete All the services in AWS and Azure in the Reverse order
  ![268](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/268.png)

- Overview AZURE
  ![269](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/269.png)

- Overview AWS.
  ![270](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/270.png)

## 12.11. Process to connect Multiple VPCs to the Azure

- Create 3 Extra VPCs
  ![271](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/271.png)

- Create 3 Extra instances in each VPC
  ![272](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/272.png)

## 12.12. Transit Gateway creation:

- This is used to connect Multiple VPCs in AWS and then connect to VNG in Azure so that VPN Connection is established.
  ![273](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/273.png)

- Fill the details like Name and Description.
  ![274](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/274.png)

- Click on Create transit gateway.
  ![275](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/275.png)
  ![276](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/276.png)

- Fill in the details like name, Transit gateway ID, Attachment type and Subnet id.
  ![277](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/277.png)

- Click on create button.
  ![278](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/278.png)

- Similarly, you create for VPC 3 and 4
- Listing all 3 Transit Gateways.
  ![279](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/279.png)

- Attachment for Azure VPN, fill in the details like Transit Gateway ID and Attachment Type and IP address (Azure
  Virtual Network Gateway PIP).

  ![280](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/280.png)

- Click on Create button.  
  ![281](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/281.png)

- Now showing all 4 attachments. Including azure Virtual Network Gateway attachment.  
  ![282](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/282.png)

- Now login to all 4 servers using the putty, before this you need to create one Linux VM in azure.
- Now when we see here no ping connection for one another
  ![283](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/283.png)
  ![284](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/284.png)
-
- Here in the all 3 VPC’s route tables we will add the other three VPCs IP ranges so that routes will get establish and
  ping happens each other for all VPCs except the Azure Server.
  ![285](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/285.png)

- Now after adding routes in route table ping happens successfully in all 3 Servers.
- But in azure server no ping.
  ![286](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/286.png)
  ![287](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/287.png)

- Under site-to-site VPN Connections you will get one VPN Automatically go to that and download the Configuration file
  and add the data into the azure gateways.
  ![288](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/288.png)

- Download the file and go to azure Gateways and add the IP and Keys as we did earlier in Local Network gateway and
  Virtual Network gateway.

  ![289](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/289.png)

- Add the configuration in the Azure Local Network Gateway
- Fill in the details like Name, IP address and Address Spaces (All 3 VPC’s range added in here)
- Click on Create button
  ![290](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/290.png)

- Fill in the details like Name, IP address and Address Spaces (All 3 VPC’s range added n here), Click on Create Button
  ![291](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/291.png)

- Fill in the details like Resource group, Connection type and Name. and click on Next: Setting.
  ![292](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/292.png)

- Fill in the details like Virtual network gateway (Which created earlier and select in drop down), Local network
  gateway (Which created earlier and select in drop down), Shared Key (PSK) {which is from aws downloaded file from line
  200 key} and click on Next: tag and Click Review and Create and then Click Create buttons.
  ![293](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/293.png)

- Fill in the details like Resource group, Connection type and Name. and click on Next: Setting
  ![294](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/294.png)

- Fill in the details like Virtual network gateway (Which created earlier and select in drop down), Local network
  gateway (Which created earlier and select in drop down), Shared Key (PSK) {which is from aws downloaded file from line
  200 key} and click on Next: tag and Click Review and Create and then Click Create buttons.
  ![295](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/295.png)

- You need to add the Azure IP range in the Transit gateway route tables
  ![296](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/296.png)

- Now you will be able to ping the Azure server from AWS Servers.
- This way you can get the communication between multiple VPC and one Azure VPN
  ![297](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/297.png)
