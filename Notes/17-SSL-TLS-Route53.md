# 17. SSL/TLS Certificates:
- Generating SSL/TLS Certificates 
  - Using AWS Certificate Manager(ACM)
  - Using 3rd Party Tools Certbot and importing in to ACM. 
- Understanding OSI Layers. 
- Types of Load Balancers. 
- Diff between Layer 4 vs Layer 7 Load Balancers

- To establish the connection, we use asymmetric encryption and during data transfer we use symmetric encryption.
  ![391](https://github.com/user-attachments/assets/89deede8-b43f-4725-b4f3-053ad38d5891)

## 17.1 Route53 Domain Creation:
- Provide the Domain name as the GoDaddy domain name and type and click on create button
  ![392](https://github.com/user-attachments/assets/f69e6cf1-cb19-436f-af52-98b534d915b9)
  ![393](https://github.com/user-attachments/assets/5a3671bc-a384-4aa6-8a59-e4262450d455)
  
- After Hosted Zone creation we need to add the nameservers in the Domain Website.
  ![394](https://github.com/user-attachments/assets/fa296d54-6034-47a2-92ed-42ccd8bab61e)

## 17.2 AWS Cetificate Creation:
- Click on Request button to create new cert.
  ![395](https://github.com/user-attachments/assets/3eb12e49-2862-4878-8f09-fe4ef2130823)

- Select Public and Next
  
  ![396](https://github.com/user-attachments/assets/09ff3c53-0b81-49e9-813f-485bac93a812)

- Fill in Fully qualified domain name with, validation method DNS, Key algorithm RSA and click on Request.
  ![397](https://github.com/user-attachments/assets/c6f42930-58ab-4c61-82f4-12ca22f434df)
  
- After Cert Creation Status will be pending until you validate it in your Domain by adding simple route with CNAME Name and CNAME Value.
  
  ![398](https://github.com/user-attachments/assets/aed76206-b8a2-4e1c-90da-dde1d219e6b5)
  
- After Cert Creation Status will be pending until you validate it in your Domain by adding simple route with CNAME Name and CNAME Value
  
  ![399](https://github.com/user-attachments/assets/dd6d52c1-f34c-42d0-b74b-d67628a7f429)
  
- Fill Record name with CNAME Name and Value with CNAME Value with Simple routing in Routing and click on Create button.
  ![400](https://github.com/user-attachments/assets/3b3a2ffc-3022-4566-80e3-1e1a7768a5d9)
  
- Once the validation complete it shows the Issued Status.
- These certificates we can only use with in AWS but to use out we need to get 3rd party certificates imported.
  ![401](https://github.com/user-attachments/assets/55c6d41b-34d2-426e-9091-8d4c12bdad0f)

## 17.3. Third Party Cert Creation:  
- We need to launch one new Ubuntu for that.
  ![402](https://github.com/user-attachments/assets/db47db96-89cf-49e4-9bd5-2a99d74a799b)
  
- Install the Certbot.
  ```
  sudo snap install --classic certbot
  ```
  ![403](https://github.com/user-attachments/assets/ab04f179-3eee-4851-8f24-2d57fb9b17c7)
  
- Cert creation command for wildcard domain, type yes to continue.
  ```
  certbot certonly --manual --preferred-challenges=dns --key-type rsa --email anilreddy.m8@gmail.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d *.devopsbymak.xyz
  ```
  ![404](https://github.com/user-attachments/assets/ea8fe449-da2d-443c-88c9-8277a0fc29cf)
  
- Here before creating cert, it will ask to validate domain by creating the text record in hosted zones by given name and value. And press enter to continue.
  ![405](https://github.com/user-attachments/assets/e359a89d-548f-44a2-9121-c9ea0139e20c)
  
- Cert created successfully.
- Public and private keys are saved at location given in screenshot.
- We will save the ```fullchain.pem``` as ```wc_any_file.crt``` and ```privkey.pem``` as ```wc_any_file.key```
  ![406](https://github.com/user-attachments/assets/70e20df3-86aa-49dd-9e52-a03fc91cd983)
  
- Cert creation command for Naked domain, type yes to continue
  ```
  certbot certonly --manual --preferred-challenges=dns --key-type rsa --email anilreddy.m8@gmail.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d devopsbymak.xyz
  ```
- Here before creating cert, it will ask to validate domain by creating the text record in hosted zones by given name and value. And press enter to continue
  ![407](https://github.com/user-attachments/assets/258797d9-c45f-4c4f-80a9-5455d6c76690)
  
- Cert created successfully.
- Public and private keys are saved at location given in screenshot.
- We will save the fullchain.pem as any_file.crt and privkey.pem as any_file.key
  ![408](https://github.com/user-attachments/assets/fb6b7ea4-99ec-4a2d-a7e5-3896c68d96fa)

### 17.3.1 Third Party Certs import into AWS:  
- Now we need to import the certs in the AWS
- Click on Import button. To import naked certificates
  ![409](https://github.com/user-attachments/assets/3cefbcc1-ed24-4e0a-88d2-6626ea919986)
  

- Fill in the details with Certificate body(fullchain.pem first key), Certificate private key(privkey.pem) and Certificate chain(fullchain.pem second key) and click on Import certificate button.
  ![410](https://github.com/user-attachments/assets/767cef1b-cec2-4401-9e88-a99a97c3e2af)
  

- Cert imported successfully and status should be in issued state.
  ![411](https://github.com/user-attachments/assets/79e083b8-cb68-4cab-8544-fa927ddf073d)

- Now we need to import the certs in the AWS
- Click on Import button. To import wild card certificates
  ![412](https://github.com/user-attachments/assets/7012e0a0-863b-4a27-a6fa-d0b14287e2a4)

- Fill in the details with Certificate body(fullchain.pem first key), Certificate private key(privkey.pem) and Certificate chain(fullchain.pem second key) and click on Import certificate button.
  ![413](https://github.com/user-attachments/assets/0f1de7dd-5d84-4714-80d1-aa711c6d3ea6)

- Certificates imported two certificates successfully
  ![414](https://github.com/user-attachments/assets/591174da-c130-4c1f-8868-2378aaaaee8d)

### 17.3.2 Nginx Installation in Server:
- Installing Nginx in the server.
  ![415](https://github.com/user-attachments/assets/7ae75604-3be7-47ae-b1b2-9d0381e40dbc)

- Finding the public IP
  
  ![416](https://github.com/user-attachments/assets/ab87cd3c-bf9b-4f1e-81f6-be0de173a537)

- If you want to do the simple routing for one server you can do it without any Load Balancer, by adding the simple route A record in the Hosted zone.
  ![417](https://github.com/user-attachments/assets/7e9fc57c-e75a-49bb-9fa7-2e61337ca5f0)

- Routed the nginx in our server to ```nginx.devopsbymak.xyz``` to make this secure we will run the cert bot command.
  ![418](https://github.com/user-attachments/assets/9ff72179-f9e3-49d3-a4c1-3468ef381b22)

- After running the ```certbot --nginx``` command we should give the domain name (nginx.devopsbymak.xyz) then enter you nginx will be secure now.
  ![419](https://github.com/user-attachments/assets/da2ccb1e-c357-45d3-a723-921153f82826)

- Now nginx is secured.
- This way you can create, import and use the certificates in AWS or outside AWS.
  ![420](https://github.com/user-attachments/assets/4623896b-303a-4148-a580-c8107fa9e57d)

- Command to check the website details.
  ![421](https://github.com/user-attachments/assets/08b039c6-11ec-4a60-b297-c50f6f9c8ebd)
