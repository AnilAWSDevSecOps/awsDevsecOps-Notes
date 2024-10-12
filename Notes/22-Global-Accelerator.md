# 22. Global Accelerator:

- Its like Global Load Balancer
- It provides two static IP Address
- You can select the Ports TCP/UDP

## 22.1. Configuring Global Accelerator:

- Click on Create accelerator button
  ![635](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/635.png)

- Fill in the details as shown below. Click on Next Button.
  ![636](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/636.png)

- Under Listener 1 ports you can give multiple ports seperated by comma, select protocol TCP, Client Affinity as
  None/Sorce IP. Click on Next button.

  ![637](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/637.png)

- Here we select the Regions Which we need to do Load Balancing. and click on Next button.
  ![638](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/638.png)

- Here we need to select the Endpoint Type as EC2 as we are using EC2.
- Under Endpoint we need to select the Endpoint which we created earlier for US, India and Ireland
- Weight is same as we have only one server in it. Click on Create accelerator button
  ![639](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/639.png)
  ![640](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/640.png)

- After creating Global Accelerator. you will get two static Public IPv4 address that you can share with your clients.
- They will whitelist those IPv4 address in their firewall and use them.
  ![641](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/641.png)

- We will take the Global Accelerator's DNS Name and create a ```CNAME record``` with ```Simple Routing``` Routing
  Policy in the Rootr53 > Hosted zones
  ![642](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/642.png)

- Now we create a ```CNAME record``` with ```Simple Routing``` Routing Policy in the Rootr53 > Hosted zones
- Click on Create record button.
  ![643](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/643.png)

- After adding record.
  ![644](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/644.png)

- Now if you do simple nslookup for ```global.madireddyanil.in``` you can see the two Public IPv4 of Global Accelerator.
  after accelerator status is in Deployed.
  ![646](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/646.png)
  ***Command:***
  ```
  madireddydevops@MadireddyOmen:~$ nslookup global.madireddyanil.in
  ```
  ***Output:***
  ```
  Server:         10.255.255.254
  Address:        10.255.255.254#53
  
  Non-authoritative answer:
  global.madireddyanil.in canonical name = a5183848ae7ffde43.awsglobalaccelerator.com.
  Name:   a5183848ae7ffde43.awsglobalaccelerator.com
  Address: 76.223.73.247
  Name:   a5183848ae7ffde43.awsglobalaccelerator.com
  Address: 75.2.49.238
  Name:   a5183848ae7ffde43.awsglobalaccelerator.com
  Address: 64:ff9b::4cdf:49f7
  Name:   a5183848ae7ffde43.awsglobalaccelerator.com
  Address: 64:ff9b::4b02:31ee
  ```
- Now when you browse ```global.madireddyanil.in``` you will get with nearest server
- Here i am browsing from India
  ![645](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/645.png)

