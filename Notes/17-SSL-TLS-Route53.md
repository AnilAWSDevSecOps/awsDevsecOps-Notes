# 17. SSL/TLS Certificates:

- Generating SSL/TLS Certificates
    - Using AWS Certificate Manager(ACM)
    - Using 3rd Party Tools Certbot and importing in to ACM.
- Understanding OSI Layers.
- Types of Load Balancers.
- Diff between Layer 4 vs Layer 7 Load Balancers

- To establish the connection, we use asymmetric encryption and during data transfer we use symmetric encryption.
  ![391](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/391.png)

## 17.1 Route53 Domain Creation:

- Provide the Domain name as the GoDaddy domain name and type and click on create button
  ![392](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/392.png)
  ![393](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/393.png)

- After Hosted Zone creation we need to add the nameservers in the Domain Website.
  ![394](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/394.png)

## 17.2 AWS Cetificate Creation:

- Click on Request button to create new cert.
  ![395](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/395.png)

- Select Public and Next

  ![396](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/396.png)

- Fill in Fully qualified domain name with, validation method DNS, Key algorithm RSA and click on Request.
  ![397](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/397.png)

- After Cert Creation Status will be pending until you validate it in your Domain by adding simple route with CNAME Name
  and CNAME Value.

  ![398](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/398.png)

- After Cert Creation Status will be pending until you validate it in your Domain by adding simple route with CNAME Name
  and CNAME Value

  ![399](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/399.png)

- Fill Record name with CNAME Name and Value with CNAME Value with Simple routing in Routing and click on Create button.
  ![400](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/400.png)

- Once the validation complete it shows the Issued Status.
- These certificates we can only use with in AWS but to use out we need to get 3rd party certificates imported.
  ![401](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/401.png)

## 17.3. Third Party Cert Creation:

- We need to launch one new Ubuntu for that.
  ![402](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/402.png)

- Install the Certbot.
  ```
  sudo snap install --classic certbot
  ```
  ![403](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/403.png)

- Cert creation command for wildcard domain, type yes to continue.
  ```
  certbot certonly --manual --preferred-challenges=dns --key-type rsa --email anilreddy.m8@gmail.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d *.devopsbymak.xyz
  ```
  ![404](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/404.png)

- Here before creating cert, it will ask to validate domain by creating the text record in hosted zones by given name
  and value. And press enter to continue.
  ![405](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/405.png)

- Cert created successfully.
- Public and private keys are saved at location given in screenshot.
- We will save the ```fullchain.pem``` as ```wc_any_file.crt``` and ```privkey.pem``` as ```wc_any_file.key```
  ![406](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/406.png)

- Cert creation command for Naked domain, type yes to continue
  ```
  certbot certonly --manual --preferred-challenges=dns --key-type rsa --email anilreddy.m8@gmail.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d devopsbymak.xyz
  ```
- Here before creating cert, it will ask to validate domain by creating the text record in hosted zones by given name
  and value. And press enter to continue
  ![407](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/407.png)

- Cert created successfully.
- Public and private keys are saved at location given in screenshot.
- We will save the fullchain.pem as any_file.crt and privkey.pem as any_file.key
  ![408](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/408.png)

### 17.3.1 Third Party Certs import into AWS:

- Now we need to import the certs in the AWS
- Click on Import button. To import naked certificates
  ![409](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/409.png)


- Fill in the details with Certificate body(fullchain.pem first key), Certificate private key(privkey.pem) and
  Certificate chain(fullchain.pem second key) and click on Import certificate button.
  ![410](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/410.png)


- Cert imported successfully and status should be in issued state.
  ![411](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/411.png)

- Now we need to import the certs in the AWS
- Click on Import button. To import wild card certificates
  ![412](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/412.png)

- Fill in the details with Certificate body(fullchain.pem first key), Certificate private key(privkey.pem) and
  Certificate chain(fullchain.pem second key) and click on Import certificate button.
  ![413](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/413.png)

- Certificates imported two certificates successfully
  ![414](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/414.png)

### 17.3.2 Nginx Installation in Server:

- Installing Nginx in the server.
  ![415](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/415.png)

- Finding the public IP

  ![416](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/416.png)

- If you want to do the simple routing for one server you can do it without any Load Balancer, by adding the simple
  route A record in the Hosted zone.
  ![417](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/417.png)

- Routed the nginx in our server to ```nginx.devopsbymak.xyz``` to make this secure we will run the cert bot command.
  ![418](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/418.png)

- After running the ```certbot --nginx``` command we should give the domain name (nginx.devopsbymak.xyz) then enter you
  nginx will be secure now.
  ![419](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/419.png)

- Now nginx is secured.
- This way you can create, import and use the certificates in AWS or outside AWS.
  ![420](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/420.png)

- Command to check the website details.
  ![421](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/421.png)
