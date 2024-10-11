# 22. Global Accelerator:
- Its like Global Load Balancer
- It provides two static IP Address
- You can select the Ports TCP/UDP
## 22.1. Configuring Global Accelerator:
- Click on Create accelerator button
  ![635](https://github.com/user-attachments/assets/e5aefd6a-3839-4d1a-8b80-c4572ad82732)

- Fill in the details as shown below. Click on Next Button.
  ![636](https://github.com/user-attachments/assets/6deb71c1-8598-47b8-8a1f-f17b1b866952)

- Under Listener 1 ports you can give multiple ports seperated by comma, select protocol TCP, Client Affinity as None/Sorce IP. Click on Next button.
  
  ![637](https://github.com/user-attachments/assets/1ba8b308-5b2d-426b-b3b9-fd26f3ae105b)

- Here we select the Regions Which we need to do Load Balancing. and click on Next button.
  ![638](https://github.com/user-attachments/assets/e48d5c64-8569-48ac-accb-05602c4f8f05)

- Here we need to select the Endpoint Type as EC2 as we are using EC2.
- Under Endpoint we need to select the Endpoint which we created earlier for US, India and Ireland
- Weight is same as we have only one server in it. Click on Create accelerator button
  ![639](https://github.com/user-attachments/assets/a5ed9ba0-374b-495a-aa6e-9b2d2f300a17)
  ![640](https://github.com/user-attachments/assets/8a05d34a-9121-4e08-be59-41e95e1b6553)

- After creating Global Accelerator. you will get two static Public IPv4 address that you can share with your clients.
- They will whitelist those IPv4 address in their firewall and use them.
  ![641](https://github.com/user-attachments/assets/f560e8a0-57cd-42ed-b0e2-a3973639b5b1)

- We will take the Global Accelerator's DNS Name and create a ```CNAME record``` with ```Simple Routing``` Routing Policy in the Rootr53 > Hosted zones
  ![642](https://github.com/user-attachments/assets/1c097649-6a78-4fde-a4fb-e955601315c2)

- Now we create a ```CNAME record``` with ```Simple Routing``` Routing Policy in the Rootr53 > Hosted zones
- Click on Create record button.
  ![643](https://github.com/user-attachments/assets/f28e7675-da4a-4e19-bd2a-20d83924093d)

- After adding record.
  ![644](https://github.com/user-attachments/assets/cdf5927f-b0fd-4b49-bb00-e62d9bf72059)

- Now if you do simple nslookup for ```global.madireddyanil.in``` you can see the two Public IPv4 of Global Accelerator. after accelerator status is in Deployed.
  ![646](https://github.com/user-attachments/assets/b3346a21-c644-4583-a361-337c6e4ab18c)
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
  ![645](https://github.com/user-attachments/assets/e51e4b80-9059-445e-a455-788ac336acd7)

