# 40. Amazon EventBridge

- If any user creates EBS VOlume other than gp2 & gp3, it should be deleted.(Event Driven)
- If any user creates EBS Volume and dont attach in a min, it should be deleted. (Scheduled Lambda run)

## 40.1. EventBridge:

- Open Event Bridge
  ![1398](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1398.png)
- If you see in cloud Trail Every event will be recorded.
  ![1399](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1399.png)

### 40.1.1. Volume Creation:

- Click on Create volume button
  ![1400](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1400.png)
  ![1401](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1401.png)
  ![1402](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1402.png)
  ![1403](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1403.png)
- After volume creation you can see the event recorded.
  ![1404](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1404.png)
- Now if you list volumes in CLI
  ***Command:***
  ```
  (BOTO3) madireddydevops@MadireddyOmen:~$ aws ec2 describe-volumes --region us-east-1
  
  ```
  ***Output:***
  ```
  {
      "Volumes": [
          {
              "Attachments": [],
              "AvailabilityZone": "us-east-1a",
              "CreateTime": "2024-09-10T07:22:01.312000+00:00",
              "Encrypted": false,
              "Size": 100,
              "SnapshotId": "",
              "State": "available",
              "VolumeId": "vol-03a7457d79e70246e",
              "Iops": 3000,
              "VolumeType": "io1",
              "MultiAttachEnabled": false
          }
      ]
  }
  ```

### IPYTHON Test Executions:

- Sample IPYTHON Executions for testing.
  ***IPython Commands:***
  ```
  (BOTO3) madireddydevops@MadireddyOmen:~$ python -m IPython
  Python 3.12.3 (main, Jul 31 2024, 17:43:48) [GCC 13.2.0]
  Type 'copyright', 'credits' or 'license' for more information
  IPython 8.27.0 -- An enhanced Interactive Python. Type '?' for help.
  
  In [1]: import boto3
  
  In [2]: r = boto3.client('ec2', region_name="us-east-1")
  
  In [3]: r.describe_volumes()
  ```
  ***Output:***
  ```
  Out[3]:
  {'Volumes': [{'Attachments': [],
     'AvailabilityZone': 'us-east-1a',
     'CreateTime': datetime.datetime(2024, 9, 10, 7, 22, 1, 312000, tzinfo=tzlocal()),
     'Encrypted': False,
     'Size': 100,
     'SnapshotId': '',
     'State': 'available',
     'VolumeId': 'vol-03a7457d79e70246e',
     'Iops': 3000,
     'VolumeType': 'io1',
     'MultiAttachEnabled': False}],
   'ResponseMetadata': {'RequestId': '2e4d7b29-201f-4724-a454-18ad3422ac40',
    'HTTPStatusCode': 200,
    'HTTPHeaders': {'x-amzn-requestid': '2e4d7b29-201f-4724-a454-18ad3422ac40',
     'cache-control': 'no-cache, no-store',
     'strict-transport-security': 'max-age=31536000; includeSubDomains',
     'content-type': 'text/xml;charset=UTF-8',
     'content-length': '562',
     'date': 'Tue, 10 Sep 2024 07:52:24 GMT',
     'server': 'AmazonEC2'},
    'RetryAttempts': 0}}
  ```
  ***IPython Commands:***
  ```
  In [4]: r.describe_volumes().keys()
  
  ```
  ***Output:***
  ```
  Out[4]: dict_keys(['Volumes', 'ResponseMetadata'])
  ```
  ***IPython Commands:***
  ```
  In [5]: r.describe_volumes().get('Volumes')
  
  ```
  ***Output:***
  ```
  Out[5]:
  [{'Attachments': [],
    'AvailabilityZone': 'us-east-1a',
    'CreateTime': datetime.datetime(2024, 9, 10, 7, 22, 1, 312000, tzinfo=tzlocal()),
    'Encrypted': False,
    'Size': 100,
    'SnapshotId': '',
    'State': 'available',
    'VolumeId': 'vol-03a7457d79e70246e',
    'Iops': 3000,
    'VolumeType': 'io1',
    'MultiAttachEnabled': False}]
  ```
  ***IPython Commands:***
  ```
  In [9]: for volumes in r.describe_volumes().get('Volumes'):
     ...:     print(volumes['VolumeId'])
     ...:
  ```
  ***Output:***
  ```
  vol-03a7457d79e70246e
  
  ```

### 40.1.2. AWS Lambda Creation:

- Click on ```Create a function``` button
  ![1405](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1405.png)
  ![1406](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1406.png)
- Add the below code in the function.
  ***Delete-EBS-Volume.py***
  ```
  # program to delete the Volumes other than gp2 and gp3 next minute when they have created.
  import json
  import boto3
  import time
  
  def lambda_handler(event, context):
      time.sleep(4)
      print(event)
      string = " ".join(event['resources'])
      volid = string.split("/", 1)[1]
      print(volid)
      client = boto3.client('ec2', region_name='us-east-1')
      vols = client.describe_volumes(VolumeIds=[volid])
      vsize = vols['Volumes'][0]['Size']
      vid = vols['Volumes'][0]['VolumeId']
      vtype = vols['Volumes'][0]['VolumeType']
      if vtype == "gp2" or vtype == "gp3":
          print(f"The Volume {vid} is {vtype} Volume and hence is a valid Volume.")
      else:
          print(f"The Volume {vid} don't belong to gp2 or gp3 and hence will be deleted.")
          client.delete_volume( VolumeId=vid)
  ```
  ![1407](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1407.png)

### 40.1.3. Lambda Role Permission providing:

- Giving permissions to the role which is attached to lambda.
  ![1408](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1408.png)
  ![14089](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1409.png)
  ![1410](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1410.png)
  ![1411](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1411.png)

### 40.1.4. Amazon EventBridge Rules Creation:

- Click on ```Create rule``` button
  ![1412](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1412.png)
  ![1413](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1413.png)
  ![1414](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1414.png)
  ![1415](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1415.png)
  ![1416](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1416.png)
  ![1417](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1417.png)
  ![1418](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1418.png)
  ![1419](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1419.png)
  ![1420](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1420.png)

- Log groups will be created
  ![1425](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1425.png)
- Changing the lambda time out to 1 min as it is mentioned in python code
  ![1424](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1424.png)
  ![1426](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1426.png)
  ![1427](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1427.png)

### 40.1.5. Testing the Event Bridge:

- Now create a volume and see then the volume will get deleted
  ![1421](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1421.png)
  ![1422](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1422.png)
  ![1423](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1423.png)
  ![1428](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1428.png)

## 40.2. Scheduled Events:

### 40.2.1 Lambda Function Creation:

- Click on ```Create function``` button.
  ![1429](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1429.png)
  ![1430](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1430.png)

- Create volumes for testing the function.
  ![1430-1](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1430-1.png)

- paste the below code for Testing the function.

  ***03-delete-ebs-unatt-multi-region.py***
  ```
  import json
  import boto3
  import time
  regions = ['us-east-1','us-east-2','ap-south-1']
  def lambda_handler(event, context):
      for reg in regions:
          client = boto3.client('ec2',region_name=reg)
          resp = client.describe_volumes().get('Volumes',[])
          unattachedvols = []
          for vol in resp:
            if len(vol['Attachments']) == 0:
               volid = vol['VolumeId']
               print(f"Volume {volid} is not attached and will be deleted.")
               unattachedvols.append(vol['VolumeId'])
            else:
               volid = vol['VolumeId']
               """print(f"Volume {volid} is attached")"""
          
          ec2_resource = boto3.resource('ec2', region_name=reg)
          if  len(unattachedvols) != 0:
              print(f"The Volumes which are not attached and will be deleted are {unattachedvols} in {reg}.")
              for vol in unattachedvols:
                volume = ec2_resource.Volume(vol)
                volume.delete()
          else:
              print(f'NO UNATTACHED VOLUME TO DELETE IN REGION {reg}')
  ```
  ![1431](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1431.png)
  ![1432](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1432.png)
  ![1433](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1433.png)
  ![1434](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1434.png)

### 40.2.2 Scheduling the Function:

- Click on create rule.
  ![1435](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1435.png)
  ![1436](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1436.png)
  ![1437](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1437.png)
  ![1438](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1438.png)
  ![1439](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1439.png)
  ![1440](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1440.png)
  ![1441](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1441.png)
  ![1442](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1442.png)
  ![1443](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1443.png)
  ![1444](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/1408-1444/1444.png)
- Now create ther few volumes which are unattached all will be deleted in few min as scheduled.

  
