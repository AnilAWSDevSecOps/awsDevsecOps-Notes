# AWS DynamoDB:

- DynamoDB Home
  ![1032](https://github.com/user-attachments/assets/c8a8633b-50ad-4536-8eca-2c05ff7ef7be)

- DynamoDB > Tables > Create table
  ![1033](https://github.com/user-attachments/assets/e568ddc7-fbfe-441b-8b08-0aa39e860ed6)

- Fill in the details as below.
  ![1034](https://github.com/user-attachments/assets/e4377a18-67cb-48c0-8b84-3a166e369cef)
  ![1035](https://github.com/user-attachments/assets/807dd91b-3c36-457f-8f83-7194f42b162e)

- After table creation.
  ![1036](https://github.com/user-attachments/assets/9b7b32b0-a7f7-4ace-b58e-a071ad9cdcb9)

- AWS Lambda creation.
  ![1037](https://github.com/user-attachments/assets/44f9d2b8-0bc9-40b2-a937-318dbb33e8f5)

- Lambda > Functions > Create function
  ![1038](https://github.com/user-attachments/assets/04efd881-32e4-4f03-b49b-b1b87e595afc)
  ![1039](https://github.com/user-attachments/assets/a9feb99f-83a0-40be-bcef-e2586a58b5c5)
  ![1040](https://github.com/user-attachments/assets/c44c1e7e-7497-4ccf-9d59-89a9480d9941)

- Now We have created one table and one lambda function so to make access between services we have to create one role.
- Now under Lambda function > configuration > Permissions
  ![1041](https://github.com/user-attachments/assets/fe19340b-4a11-4be9-af66-3f8a07bdd9af)

- There will be one role created, for that role we give Dynamo DB permissions as lambda-function access the DynamoDB
- So click on the role and open it.
  ![1042](https://github.com/user-attachments/assets/9abfe61a-a2f9-4588-afde-8a1d277291a0)

- Goto attach policies and add the DynamoDB full access.
  ![1043](https://github.com/user-attachments/assets/59e030f7-0796-41ea-b9ce-e4226a6860c5)
  ![1044](https://github.com/user-attachments/assets/09c0af79-0fe5-44a5-89ed-2d0ac4e07ec4)
  ![1045](https://github.com/user-attachments/assets/ace504df-f23e-4706-9ed1-ab79a51b12b5)

- Now we will test the role. Lambda functio > Test
- create new event and save then test.
  ![1046](https://github.com/user-attachments/assets/5679a4aa-08a0-4f4f-b22e-ed15a04d17e0)
  
- Use the below to test the access.
  ### Test Code:
  ```
  {
    "operation": "create",
    "payload":{
    	"TableName":"bookstore",
    	"Item":{
        	"Id":10,
        	"author":"Robert K",
        	"bookname":"Rich Dad & Poor Dad",
        	"Location":"USA",
        	"State":"Hawaii",
     	   "Hobbies": {
     	 	"Act1": "Swimming",
     		 "Act2": "Cycling",
     		 "Act3": "Writing"
     	   }
     	   
    	}
    }
  }
  ```
  ![1047](https://github.com/user-attachments/assets/f3f41171-92b5-4041-b002-d5ae483e039f)

- After saving click on test button, if it returns code 200, its success.
  ![1048](https://github.com/user-attachments/assets/d8755092-7dba-4efb-b47a-418515de5013)

- Now in the above same code change the id to 20  and then save it and test it again.
  ### Test Code:
  ```
  {
    "operation": "create",
    "payload":{
    	"TableName":"bookstore",
    	"Item":{
        	"Id":20,
        	"author":"Robert K",
        	"bookname":"Rich Dad & Poor Dad",
        	"Location":"USA",
        	"State":"Hawaii",
     	   "Hobbies": {
     	 	"Act1": "Swimming",
     		 "Act2": "Cycling",
     		 "Act3": "Writing"
     	   }
     	   
    	}
    }
  }
  ```
  ![1049](https://github.com/user-attachments/assets/5debac5a-382a-441d-8f9a-87cb9a6f2f30)
  
- Now in the above same code change the id to 30  and then save it and test it again.
  ### Test Code:
  ```
  {
    "operation": "create",
    "payload":{
    	"TableName":"bookstore",
    	"Item":{
        	"Id":30,
        	"author":"Robert K",
        	"bookname":"Rich Dad & Poor Dad",
        	"Location":"USA",
        	"State":"Hawaii",
     	   "Hobbies": {
     	 	"Act1": "Swimming",
     		 "Act2": "Cycling",
     		 "Act3": "Writing"
     	   }
     	   
    	}
    }
  }
  ```
  ![1050](https://github.com/user-attachments/assets/16e2fb27-bd4a-415f-afee-61c08df79a16)

- Now if you see in the Dynamodb (```Bookstore```) > Explore items you can see some entries which we pushed from lambda.
  ![1051](https://github.com/user-attachments/assets/54a6b117-bdc4-4bfd-aece-2262e38f318e)
  ![1052](https://github.com/user-attachments/assets/5e25ebfc-2a58-460a-94ce-26a7ff76d610)

- So as Testing completed we will delete the all entries in bookstore.
  ![1053](https://github.com/user-attachments/assets/521a856c-48f5-4982-9546-7a0900a91a56)
  ![1054](https://github.com/user-attachments/assets/a01b7815-5e41-4988-ab7a-f0a19a02b1a0)
  
- Now we need to Expose the above setup to the outside world we setup the API Gateway. as shown in the below diagram.
  ![1055](https://github.com/user-attachments/assets/f0197df8-acb7-4fa1-9f2f-66c84cde9c11)

- Now We will create the API Gateway.
  ![1056](https://github.com/user-attachments/assets/055e3912-32d0-46d7-b688-416dc27d0f2f)

- Click on REST API as we are using it for lambda function
  ![1057](https://github.com/user-attachments/assets/db9baaa1-6022-4d12-82c1-0781954288f4)

- Fill in the details and create API
  ![1058](https://github.com/user-attachments/assets/5f979ad1-b2b6-4907-8908-9952244af76f)
  ![1059](https://github.com/user-attachments/assets/62ba28e5-2e32-45c2-a5b2-44111023ae6c)

- Click on create resources and create multiple resources if required as below.
- we create 3 resources ```orders, payments and books```
  ![1060](https://github.com/user-attachments/assets/92fa454f-1b8a-41a4-8e82-acf4f9927707)
  ![1061](https://github.com/user-attachments/assets/8f86a098-cd3d-46bf-aa39-6b4cedf64f7c)
  ![1062](https://github.com/user-attachments/assets/14477863-e098-4c07-813b-49b331eadf31)
  ![1063](https://github.com/user-attachments/assets/a34fd63d-f9ac-4251-992a-73ea049a510a)
  ![1064](https://github.com/user-attachments/assets/15734971-0088-40c2-a617-c9204d327c65)
  ![1065](https://github.com/user-attachments/assets/ce71d3e3-629b-4308-bba5-a9ace498d9c6)
  ![1066](https://github.com/user-attachments/assets/f10558bf-20db-4207-b971-2b6193043e7e)
  ![1067](https://github.com/user-attachments/assets/164b5bc7-fcb1-49b2-80de-ef5b6d82e76f)
  ![1068](https://github.com/user-attachments/assets/944436bb-4aa8-45c9-946e-0ccdb3922fff)

- Now under the resource we can create the methods.
- Now we will create the methods ```PUT, POST and DELETE``` to ```books``` resource.
  ![1069](https://github.com/user-attachments/assets/348dd315-ef4b-437f-9c32-e42e662316ee)
  ![1070](https://github.com/user-attachments/assets/9fd15f5a-07fd-483b-99d4-0a74b97f66ef)
  ![1071](https://github.com/user-attachments/assets/4a8b0807-8ff8-4587-aecc-d77f49fe8844)
  ![1072](https://github.com/user-attachments/assets/24c89a2e-e36f-409a-a92a-c13b9c674e18)
  ![1073](https://github.com/user-attachments/assets/3321c681-9693-45de-a0c8-50e9177afc88)
  ![1074](https://github.com/user-attachments/assets/4c876808-384a-4df9-8565-5adbf2fc1837)
  ![1071](https://github.com/user-attachments/assets/4a8b0807-8ff8-4587-aecc-d77f49fe8844)
  ![1075](https://github.com/user-attachments/assets/25422d07-cba3-4085-9e26-187bc6a12180)
  ![1076](https://github.com/user-attachments/assets/f8b4dc26-33bf-4de6-9072-3da0b76b6d3c)
  ![1077](https://github.com/user-attachments/assets/2d28bd9e-8765-44d8-b9e0-29f29818d6d6)
  ![1071](https://github.com/user-attachments/assets/4a8b0807-8ff8-4587-aecc-d77f49fe8844)
  ![1078](https://github.com/user-attachments/assets/36334d41-787d-43e8-a86b-d519effc7395)

- Now we will test all 3 methods(```PUT, POST and DELETE```) in ```books``` resource
### Testing PUT 1:
- Under PUT > Test >Request body , paste the below code and click on Test button.
```
{
  "operation": "create",
  "payload":{
    "TableName":"bookstore",
    "Item":{
        "Id":10,
        "author":"Robert K",
        "bookname":"Rich Dad & Poor Dad",
        "Location":"USA",
        "State":"Hawaii",
       "Hobbies": {
      "Act1": "Swimming",
       "Act2": "Cycling",
       "Act3": "Writing"
       }
       
    }
  }
}
```
![1079](https://github.com/user-attachments/assets/73eb171b-c34b-45f6-814a-211d85e5b4cf)

- Statis code 200 is success.
![1080](https://github.com/user-attachments/assets/89b9850a-b5f6-45a6-b546-b05dd60c390f)

### Testing PUT 2:
- Under PUT > Test >Request body , paste the below code and click on Test button.
  ```
  {
    "operation": "create",
    "payload":{
      "TableName":"bookstore",
      "Item":{
          "Id":20,
          "author":"Robert K",
          "bookname":"Rich Dad & Poor Dad",
          "Location":"USA",
          "State":"Hawaii"	   
      }
    }
  }
  ```
  ![1081](https://github.com/user-attachments/assets/c5f9169b-5649-465f-82fe-09ed35cd1271)

- Statis code 200 is success.
  ![1082](https://github.com/user-attachments/assets/74450b20-226d-474e-8a97-8984fd2b0c1a)

### Testing PUT 3:
- Under PUT > Test >Request body , paste the below code and click on Test button.
  ```
  {
    "operation": "create",
    "payload":{
      "TableName":"bookstore",
      "Item":{
          "Id":30,
          "author":"Robert K",
          "bookname":"Rich Dad & Poor Dad",
          "Location":"USA"   
      }
    }
  }
  ```
  ![1083](https://github.com/user-attachments/assets/a013d2b3-9756-44be-be3d-6a9d65837184)

- Statis code 200 is success.
  ![1084](https://github.com/user-attachments/assets/5e90832c-b482-4551-9080-d265a4817624)

### Testing PUT 4:
- Under PUT > Test >Request body , paste the below code and click on Test button.
  ```
  {
    "operation": "create",
    "payload":{
      "TableName":"bookstore",
      "Item":{
          "Id":40,
          "author":"Robert K",
          "bookname":"Rich Dad & Poor Dad"
          "Location":"USA"   
      }
    }
  }
  ```
- Statis code 200 is success.
  ![1085](https://github.com/user-attachments/assets/aba2e318-39c8-4a9a-87c0-0142d91f1fe2)

### Testing PUT 5:
- Under PUT > Test >Request body , paste the below code and click on Test button.
  ```
  {
    "operation": "create",
    "payload":{
      "TableName":"bookstore",
      "Item":{
          "Id":50,
          "author":"Robert K"   
      }
    }
  }
  ```
- Statis code 200 is success.
  ![1086](https://github.com/user-attachments/assets/7c6a1cb1-e199-4621-b5f1-a380535d028c)

- Now if you check the DynamoDB > Explore items > bookstore, our Test Methos PUT data is written.
  ![1087](https://github.com/user-attachments/assets/5a5496ef-0801-4b93-83f4-83b849d91877)

- Now we will test the POST Method.
  ### Testing POST 1:
  ```
  {
    "operation": "read",
    "payload":{
      "TableName":"bookstore",
      "Key":{
          "Id":10
      }
    }
  }
  ```
  ![1088](https://github.com/user-attachments/assets/050b8d65-8601-4a72-bb01-cd07fddc57a6)
  
  ### Testing POST 2:
  ```
  {
    "operation": "read",
    "payload":{
      "TableName":"bookstore",
      "Key":{
          "Id":20
      }
    }
  }
  ```
  ![1089](https://github.com/user-attachments/assets/e75267b1-ae28-48d2-ab8e-d871c4156bed)

- Now we will test the DELETE Method.
  ### Testing DELETE 1:
  ```
  {
    "operation": "delete",
    "payload":{
      "TableName":"bookstore",
      "Key":{
          "Id":10
      }
    }
  }
  ```
  ![1090](https://github.com/user-attachments/assets/4c0e4062-9d6d-4d89-a2d8-65485b5d2ec2)
  
  ### Testing DELETE 2:
  ```
  {
    "operation": "delete",
    "payload":{
      "TableName":"bookstore",
      "Key":{
          "Id":20
      }
    }
  }
  ```
  ![1091](https://github.com/user-attachments/assets/05da8fe2-c37c-4a28-9c21-32e8979b84a8)

- Similarly repeat till id 50

- After deleting ids now it empty
  ![1092](https://github.com/user-attachments/assets/509395ba-737c-4e72-85bb-e0c1be4ec4b4)

- Now All methods testing is fully successfull, so we will deploy the API
  ![1093](https://github.com/user-attachments/assets/d8e1b6b1-842e-4ad0-ab33-3441991d8c35)
  ![1094](https://github.com/user-attachments/assets/b2745c50-de05-4d15-9d8f-d3adbe06be43)

- Now Once the stage Dev is created we will test the url shown below.
  ![1095](https://github.com/user-attachments/assets/cbcd5fae-b374-4d91-a0db-cdca4877382d)

- If any issue you can enable cors in the API
  ![1096](https://github.com/user-attachments/assets/48ecf106-944c-4e9e-a145-e427390dc96b)

- For testing API we use the Postman tool, copy the url from API > APIs > OurAPI > Stage
  ![1097](https://github.com/user-attachments/assets/5deef98d-79f3-404e-a96a-4a2d7b8603e8)

- Paste in the Postman app.
  ![1098](https://github.com/user-attachments/assets/9d1855c1-b242-4158-b2b5-65872c2c4b1f)

  ### Testing PUT method:
  ```
  {
    "operation": "create",
    "payload":{
      "TableName":"bookstore",
      "Item":{
          "Id":10,
          "author":"Robert K",
          "bookname":"Rich Dad & Poor Dad",
          "Location":"USA",
          "State":"Hawaii",
         "Hobbies": {
        "Act1": "Swimming",
         "Act2": "Cycling",
         "Act3": "Writing"
         }
         
      }
    }
  }
  ```
  ![1099](https://github.com/user-attachments/assets/47375d4b-c0a0-4170-977b-abe5116d43e9)
  ![1100](https://github.com/user-attachments/assets/93e61384-df12-4fb5-a677-ef9d1b9e05e9)
  ![1101](https://github.com/user-attachments/assets/266d7aab-8520-401c-8d91-43fd09637dbc)

- Now if you check the explore items in DB
  ![1102](https://github.com/user-attachments/assets/35ef4a48-bbdd-46ba-9e32-3018ba620732)

  ### Testing POST method:
  ```
  {
    "operation": "read",
    "payload":{
      "TableName":"bookstore",
      "Key":{
          "Id":30
      }
    }
  }
  ```
  ![1103](https://github.com/user-attachments/assets/5d264fcd-baa2-4c94-bff3-997260f7bd44)
  ![1104](https://github.com/user-attachments/assets/38eed561-37d3-4f3b-bb7f-14158c57d24e)
  ![1105](https://github.com/user-attachments/assets/4282986e-c924-4fb8-91b6-1be6e0d3fdc5)

  ### Testing DELETE method:
  ```
  {
    "operation": "delete",
    "payload":{
      "TableName":"bookstore",
      "Key":{
          "Id":30
      }
    }
  }
  ```
- delete all entries one by on as we deleted earlier.    
  ![1106](https://github.com/user-attachments/assets/c4d58837-7e8b-4cad-9efa-3582c0a6aa1a)
