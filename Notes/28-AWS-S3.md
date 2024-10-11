# 28. AWS Simple Storage Service (S3):
- Object storage.
- Bucket name should be unique.
- High availability and high Durability(99.999999)
  
## S3 Bucket Creation:
- Clcik on create bucket
  ![912](https://github.com/user-attachments/assets/aeaeb8dd-aa6c-417d-9ca5-b01f17676b07)

- Fill in the details and click on Create bucket button.
  ![913](https://github.com/user-attachments/assets/2f741fca-e035-4490-b776-d9296d8650d2)
  ![914](https://github.com/user-attachments/assets/ccc0d4d0-1312-4d06-8e3e-6f8ec3e9e421)
  ![915](https://github.com/user-attachments/assets/81693f04-d1cb-44b5-a88e-9a101443e504)

- After bucket creation.
  ![916](https://github.com/user-attachments/assets/9344fcf4-22e2-4b35-bfeb-265d72924154)

## S3 Data Upload:
- Click on Upload button
  ![917](https://github.com/user-attachments/assets/0939bbe0-9f7a-4af6-9cf1-ee551160a169)

- Fill in the details and click on upload button.
  ![918](https://github.com/user-attachments/assets/756b6fb2-a5cc-4f11-8184-c8ba751f552e)

- Select Standard storage class as it is best one in performance.
  ![919](https://github.com/user-attachments/assets/25499ca1-5f2f-4ea4-abeb-b115258aa6a2)
  ![920](https://github.com/user-attachments/assets/4f0b9a9f-97ed-432d-9a15-5c5aafffc2b5)

- Afte the upload it looks.
  ![921](https://github.com/user-attachments/assets/e80a74dc-879d-4291-8870-13657ca5e4e3)

- For S3 objects or files will have unique url so bucket name is unique.
  ![922](https://github.com/user-attachments/assets/0f23d2a7-d31a-4298-8a31-09f0ae6c8180)
  
### index.html
  ```
  <!-- Sample Html code for displaying S3 bucket images -->
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>madireddyanil.in</title>
  </head>
  <body>
      <h1>Madireddyanil.in Images</h1>
      <img src="https://s3.amazonaws.com/madireddyanil.in/910.png" alt="910"><br>
      <img src="https://s3.amazonaws.com/madireddyanil.in/911.png" alt="911"><br>
      <img src="https://s3.amazonaws.com/madireddyanil.in/912.png" alt="912"><br>
  </body>
  </html>
  ```
- Using the above code create one html file.
- If you open it in browser images will not be accessed.
  ![923](https://github.com/user-attachments/assets/70a165ea-1a33-4b5b-80bf-b43592f4b234)

- Through Direct URL also cant be accessed
  ```
  https://s3.amazonaws.com/madireddyanil.in/912.png
  ```
  ![924](https://github.com/user-attachments/assets/1efbc91a-f5f2-43f0-bbb1-682bb33aa260)
  
- You need to grant public access to the objects in S3 bucket.
- Goto BUcket > Permissions > Bucket policy > Paste the code below.
  ### S3 BUcket policy for Public access.
  ```
  {
      "Version": "2012-10-17",
      "Id": "Policy1684293895713",
      "Statement": [
          {
              "Sid": "Stmt1684293894915",
              "Effect": "Allow",
              "Principal": "*",
              "Action": "s3:GetObject",
              "Resource": "arn:aws:s3:::madireddyanil.in/*"
          }
      ]
  }
  ```
  ![925](https://github.com/user-attachments/assets/289bee08-7666-42fb-aa99-b2e90d7723a0)

- Copy the BUcket ARN Name.
  ![926](https://github.com/user-attachments/assets/d694969a-a6ff-4c24-9e2c-5d18a17d2e9e)

- Include that in S3 BUcket policy for Public access code and paste the code and save changes
  ![927](https://github.com/user-attachments/assets/8fc244de-9468-4d5a-a517-3de950e052f9)
  ![928](https://github.com/user-attachments/assets/df415406-5aaf-45eb-9e1c-6a6c75f9fb85)

- Now you will  be able to access the images in public in browser.
  ![929](https://github.com/user-attachments/assets/25053619-7c3f-486d-a0b2-35d11354f214)

### Monuting s3 in Instance:
- Now if you want to connect s3 to the instance
- Launch Amazon Linux instance
- Configure AWS CLI in it and access the S3
  ![930](https://github.com/user-attachments/assets/3464dab4-8ef7-40af-8f7c-907eb98d6835)

- Now we will try to mount the s3 into this Instance by 3rd party tools.
- Use below link for dcoumentation
  ```
  https://docs.aws.amazon.com/AmazonS3/latest/userguide/mountpoint-installation.html
  ```
- Now code is to install monut for s3
  ```
  wget https://s3.amazonaws.com/mountpoint-s3-release/latest/x86_64/mount-s3.rpm
  sudo yum install ./mount-s3.rpm
  mount-s3 --version
  ```
  ![931](https://github.com/user-attachments/assets/9f493131-1e29-45a5-88e6-11888b4c60eb)
  ![932](https://github.com/user-attachments/assets/3be7d58e-044c-4506-a079-9c5a2156cac8)
    
- Now make dir for s3 and mount it using below command
  ```
  mkdir /madireddyanil.in
  mount-s3 madireddyanil.in /maddireddyanil.in
  ```
  ![933](https://github.com/user-attachments/assets/fb8db7d2-02fb-4539-83af-ece3da5848dc)

- Listing s3 in server
  ![934](https://github.com/user-attachments/assets/7da67a46-5ecf-4db4-9f81-b6f4309b7ec9)

- Created some file in server location.
  ![935](https://github.com/user-attachments/assets/9b162fd5-36d5-42c2-8d80-caf602d97a39)
  ```
  touch /madireddyanil.in/s3-dummy{1..10}
  ```

- Now it will reflect in S3 in browser.
  ![936](https://github.com/user-attachments/assets/9e1a9074-a469-419d-9daa-f95ffd80f404)

- If you want to sync two buckets use bucket command
  ```
  aws s3 sync s3://SOURCE-BUCKETNAME s3://DESTINATION-BUCKETNAME
  ```

## Bucket Properties

- Bucket versioning enabling
  ![937](https://github.com/user-attachments/assets/623025f6-4e14-4bdc-98cd-e7ab47cdc97c)

- Enabling Static Website hosting.
  ![938](https://github.com/user-attachments/assets/3aac2302-6150-461f-8afe-6bada6e3aba9)

- Uploading the website into the S3
  ![939](https://github.com/user-attachments/assets/fae4c7f2-075d-4985-b193-f810541d8e31)
  ![940](https://github.com/user-attachments/assets/22cc0b1a-a817-4a92-9bb8-57193e811384)

- Copy the static url.
  ```
  http://madireddyanil.in.s3-website-us-east-1.amazonaws.com
  ```
  ![941](https://github.com/user-attachments/assets/82d80e6a-728b-41d0-a815-4d1098b6e455)
  ![942](https://github.com/user-attachments/assets/70a1396f-fb39-45c1-957e-06916b7aa79a)

- Browse it to get the app.
  ![943](https://github.com/user-attachments/assets/0c52146b-153d-4340-a324-e598d38527db)

- Before doing it you need to create the another bucket with name ```www.madireddyanil.in```
- now upload the app in ```www.madireddyanil.in``` s3 bucket and start the Distribution process.
- But i used the ```madireddyanil.in``` bucket instaed of it we should use the ```www.madireddyanil.in``` bucket
- Here infront of S3 bucket you cannot keep load balancer so we user cloud front.
- Click on Create a CloudFront distribution button
  ![944](https://github.com/user-attachments/assets/16158b59-f83d-4fcd-8308-2c745b8cc375)

- Select Domain, Name, Origin access is origin access control settings and click on Create new OAC button.
  ![945](https://github.com/user-attachments/assets/ba8aad5b-8d34-4181-9b4a-3443ac36da2c)
  ![946](https://github.com/user-attachments/assets/7a12c491-f8c0-4a0b-91f2-ed3429755b40)

- Select Https under viewer protocol policy.
  ![947](https://github.com/user-attachments/assets/73f05398-03f6-435e-b596-9c2632fa294b)

- Disable WAF, Select the certificate if no cert create one and validate.
- and also write the alternate domains as ```www.madireddyanil.in``` and ```cdn.madireddyanil.in```
  ![948](https://github.com/user-attachments/assets/7a61535b-c008-44f3-a47f-7e5bad981fd5)

- Default root to index.html and clcik on Create Distribution button.
  ![949](https://github.com/user-attachments/assets/fe0120a3-3feb-4aba-8ba1-fdf88ad18738)

- Now copy the policy
  ![950](https://github.com/user-attachments/assets/afde480a-9218-4d25-96dd-cfca2e3d95d3)

- Delete old policy
  ![951](https://github.com/user-attachments/assets/1c295650-43c4-4a6d-adac-ff1e8f8729d7)

- Update the copied policy in S3 and save changes
  ![952](https://github.com/user-attachments/assets/63fc0bc6-c483-49e3-be60-81aaba0a572c)

- Now copy the Domain Name of Distribution.
  ![953](https://github.com/user-attachments/assets/1cf78708-4f65-4112-9bfb-25a35a4f19e0)

- Browse it in browser to test the application from Content delivery network
  ![954](https://github.com/user-attachments/assets/13cd9963-eac8-4070-b9a2-cff49c77108c)
  
- Create a record in the Route53 with ```www.madireddyanil.in``` and ```cdn.madireddyanil.in```
  ![955](https://github.com/user-attachments/assets/8deb095e-43f1-445f-9f2a-69f5d34151d6)
  ![956](https://github.com/user-attachments/assets/4fb300d2-31b5-460a-a8ea-f768cca5670f)

- Now browse with ```www.madireddyanil.in``` and test the app
  ![957](https://github.com/user-attachments/assets/00a30980-2dfa-4d95-b2f1-5260b2ee8612)

- Now Browse with ```cdn.madireddyanil.in``` and test the app
  ![958](https://github.com/user-attachments/assets/dbd6ad2f-0ce2-41ac-8b1e-44ce13b1cafc)

- Now we will redirect the madireddyanil.in bucket to the ```www.madireddyanil.in bucket.```
- Click on madireddyanil.in bucket no need to put any data in this bucket you can delete it anyway.
  ![959](https://github.com/user-attachments/assets/162e8bf7-48ea-4ede-bc61-59df46c17a71)

- Give the redirection to ```www.madireddyanil.in``` bucket.
  ![960](https://github.com/user-attachments/assets/aefe4953-71b5-4872-bf6f-07e4fd572d37)

- Now create the record for naked domain.
  ![961](https://github.com/user-attachments/assets/32410ae4-b502-4892-ab4e-37090f7176d7)

- Now browse with ```madireddyanil.in``` it should be redirected to the ```www.madireddyanil.in``` bucket and cdn distribution.
  ![962](https://github.com/user-attachments/assets/2d7558d7-5f1f-43af-8605-baaea3db2106)

- To get the error page
  ![963](https://github.com/user-attachments/assets/5a72ef2b-441f-4314-9f14-aeba2b475937)
  ![964](https://github.com/user-attachments/assets/65ee4afa-23c2-4862-a781-02e59cd35f61)
  ![965](https://github.com/user-attachments/assets/cedbae1d-8ea4-4f76-a769-1cfedbc2bda7)
  ![966](https://github.com/user-attachments/assets/38122495-1421-4224-a989-568ae41ad939)

- Once you get error you will this page.
  ![967](https://github.com/user-attachments/assets/d9dcf565-9341-4505-964b-844ec428a381)
