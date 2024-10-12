# AWS DynamoDB:

- DynamoDB Home
  ![1032](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1032.png)

- DynamoDB > Tables > Create table
  ![1033](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1033.png)

- Fill in the details as below.
  ![1034](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1034.png)
  ![1035](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1035.png)

- After table creation.
  ![1036](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1036.png)

- AWS Lambda creation.
  ![1037](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1037.png)

- Lambda > Functions > Create function
  ![1038](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1038.png)
  ![1039](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1039.png)
  ![1040](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1040.png)

- Now We have created one table and one lambda function so to make access between services we have to create one role.
- Now under Lambda function > configuration > Permissions
  ![1041](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1041.png)

- There will be one role created, for that role we give Dynamo DB permissions as lambda-function access the DynamoDB
- So click on the role and open it.
  ![1042](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1042.png)

- Goto attach policies and add the DynamoDB full access.
  ![1043](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1043.png)
  ![1044](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1044.png)
  ![1045](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1045.png)

- Now we will test the role. Lambda functio > Test
- create new event and save then test.
  ![1046](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1046.png)

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
  ![1047](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1047.png)

- After saving click on test button, if it returns code 200, its success.
  ![1048](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1048.png)

- Now in the above same code change the id to 20 and then save it and test it again.
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
  ![1049](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1049.png)

- Now in the above same code change the id to 30 and then save it and test it again.
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
  ![1050](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1050.png)

- Now if you see in the Dynamodb (```Bookstore```) > Explore items you can see some entries which we pushed from lambda.
  ![1051](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1051.png)
  ![1052](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1052.png)

- So as Testing completed we will delete the all entries in bookstore.
  ![1053](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1053.png)
  ![1054](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1054.png)

- Now we need to Expose the above setup to the outside world we setup the API Gateway. as shown in the below diagram.
  ![1055](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1055.png)

- Now We will create the API Gateway.
  ![1056](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1056.png)

- Click on REST API as we are using it for lambda function
  ![1057](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1057.png)

- Fill in the details and create API
  ![1058](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1058.png)
  ![1059](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1059.png)

- Click on create resources and create multiple resources if required as below.
- we create 3 resources ```orders, payments and books```
  ![1060](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1060.png)
  ![1061](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1061.png)
  ![1062](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1062.png)
  ![1063](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1063.png)
  ![1064](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1064.png)
  ![1065](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1065.png)
  ![1066](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1066.png)
  ![1067](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1067.png)
  ![1068](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1068.png)

- Now under the resource we can create the methods.
- Now we will create the methods ```PUT, POST and DELETE``` to ```books``` resource.
  ![1069](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1069.png)
  ![1070](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1070.png)
  ![1071](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1071.png)
  ![1072](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1072.png)
  ![1073](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1073.png)
  ![1074](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1074.png)
  ![1071](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1071.png)
  ![1075](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1075.png)
  ![1076](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1076.png)
  ![1077](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1077.png)
  ![1071](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1071.png)
  ![1078](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1078.png)

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

![1079](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1079.png)

- Statis code 200 is success.
  ![1080](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1080.png)

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
  ![1081](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1081.png)

- Statis code 200 is success.
  ![1082](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1082.png)

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
  ![1083](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1083.png)

- Statis code 200 is success.
  ![1084](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1084.png)

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
  ![1085](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1085.png)

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
  ![1086](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1086.png)

- Now if you check the DynamoDB > Explore items > bookstore, our Test Methos PUT data is written.
  ![1087](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1087.png)

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
  ![1088](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1088.png)

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
  ![1089](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1089.png)

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
  ![1090](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1090.png)

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
  ![1091](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1091.png)

- Similarly repeat till id 50

- After deleting ids now it empty
  ![1092](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1092.png)

- Now All methods testing is fully successfull, so we will deploy the API
  ![1093](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1093.png)
  ![1094](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1094.png)

- Now Once the stage Dev is created we will test the url shown below.
  ![1095](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1095.png)

- If any issue you can enable cors in the API
  ![1096](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1096.png)

- For testing API we use the Postman tool, copy the url from API > APIs > OurAPI > Stage
  ![1097](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1097.png)

- Paste in the Postman app.
  ![1098](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1098.png)

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
  ![1099](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1099.png)
  ![1100](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1100.png)
  ![1101](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1101.png)

- Now if you check the explore items in DB
  ![1102](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1102.png)

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
  ![1103](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1103.png)
  ![1104](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1104.png)
  ![1105](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1105.png)

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
  ![1106](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1106.png)
