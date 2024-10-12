# 28. AWS Simple Storage Service (S3):

- Object storage.
- Bucket name should be unique.
- High availability and high Durability(99.999999)

## S3 Bucket Creation:

- Clcik on create bucket
  ![912](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/912.png)

- Fill in the details and click on Create bucket button.
  ![913](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/913.png)
  ![914](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/914.png)
  ![915](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/915.png)

- After bucket creation.
  ![916](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/916.png)

## S3 Data Upload:

- Click on Upload button
  ![917](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/917.png)

- Fill in the details and click on upload button.
  ![918](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/918.png)

- Select Standard storage class as it is best one in performance.
  ![919](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/919.png)
  ![920](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/920.png)

- Afte the upload it looks.
  ![921](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/921.png)

- For S3 objects or files will have unique url so bucket name is unique.
  ![922](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/922.png)

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
  ![923](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/923.png)

- Through Direct URL also cant be accessed
  ```
  https://s3.amazonaws.com/madireddyanil.in/912.png
  ```
  ![924](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/924.png)

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
  ![925](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/925.png)

- Copy the BUcket ARN Name.
  ![926](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/926.png)

- Include that in S3 BUcket policy for Public access code and paste the code and save changes
  ![927](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/927.png)
  ![928](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/928.png)

- Now you will be able to access the images in public in browser.
  ![929](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/929.png)

### Monuting s3 in Instance:

- Now if you want to connect s3 to the instance
- Launch Amazon Linux instance
- Configure AWS CLI in it and access the S3
  ![930](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/930.png)

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
  ![931](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/931.png)
  ![932](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/932.png)

- Now make dir for s3 and mount it using below command
  ```
  mkdir /madireddyanil.in
  mount-s3 madireddyanil.in /maddireddyanil.in
  ```
  ![933](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/933.png)

- Listing s3 in server
  ![934](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/934.png)

- Created some file in server location.
  ![935](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/935.png)
  ```
  touch /madireddyanil.in/s3-dummy{1..10}
  ```

- Now it will reflect in S3 in browser.
  ![936](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/936.png)

- If you want to sync two buckets use bucket command
  ```
  aws s3 sync s3://SOURCE-BUCKETNAME s3://DESTINATION-BUCKETNAME
  ```

## Bucket Properties

- Bucket versioning enabling
  ![937](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/937.png)

- Enabling Static Website hosting.
  ![938](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/938.png)

- Uploading the website into the S3
  ![939](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/939.png)
  ![940](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/940.png)

- Copy the static url.
  ```
  http://madireddyanil.in.s3-website-us-east-1.amazonaws.com
  ```
  ![941](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/941.png)
  ![942](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/942.png)

- Browse it to get the app.
  ![943](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/943.png)

- Before doing it you need to create the another bucket with name ```www.madireddyanil.in```
- now upload the app in ```www.madireddyanil.in``` s3 bucket and start the Distribution process.
- But i used the ```madireddyanil.in``` bucket instaed of it we should use the ```www.madireddyanil.in``` bucket
- Here infront of S3 bucket you cannot keep load balancer so we user cloud front.
- Click on Create a CloudFront distribution button
  ![944](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/944.png)

- Select Domain, Name, Origin access is origin access control settings and click on Create new OAC button.
  ![945](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/945.png)
  ![946](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/946.png)

- Select Https under viewer protocol policy.
  ![947](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/947.png)

- Disable WAF, Select the certificate if no cert create one and validate.
- and also write the alternate domains as ```www.madireddyanil.in``` and ```cdn.madireddyanil.in```
  ![948](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/948.png)

- Default root to index.html and clcik on Create Distribution button.
  ![949](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/949.png)

- Now copy the policy
  ![950](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/950.png)

- Delete old policy
  ![951](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/951.png)

- Update the copied policy in S3 and save changes
  ![952](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/952.png)

- Now copy the Domain Name of Distribution.
  ![953](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/953.png)

- Browse it in browser to test the application from Content delivery network
  ![954](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/954.png)

- Create a record in the Route53 with ```www.madireddyanil.in``` and ```cdn.madireddyanil.in```
  ![955](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/955.png)
  ![956](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/956.png)

- Now browse with ```www.madireddyanil.in``` and test the app
  ![957](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/957.png)

- Now Browse with ```cdn.madireddyanil.in``` and test the app
  ![958](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/958.png)

- Now we will redirect the madireddyanil.in bucket to the ```www.madireddyanil.in bucket.```
- Click on madireddyanil.in bucket no need to put any data in this bucket you can delete it anyway.
  ![959](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/959.png)

- Give the redirection to ```www.madireddyanil.in``` bucket.
  ![960](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/960.png)

- Now create the record for naked domain.
  ![961](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/961.png)

- Now browse with ```madireddyanil.in``` it should be redirected to the ```www.madireddyanil.in``` bucket and cdn
  distribution.
  ![962](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/962.png)

- To get the error page
  ![963](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/963.png)
  ![964](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/964.png)
  ![965](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/965.png)
  ![966](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/966.png)

- Once you get error you will this page.
  ![967](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/967.png)
