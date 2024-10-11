# 40. Amazon EventBridge
- If any user creates EBS VOlume other than gp2 & gp3, it should be deleted.(Event Driven)
- If any user creates EBS Volume and dont attach in a min, it should be deleted. (Scheduled Lambda run)
## 40.1. EventBridge:
- Open Event Bridge
  ![1398](https://github.com/user-attachments/assets/fd129403-5941-4aa6-953f-6c496cbf2478)
- If you see in cloud Trail Every event will be recorded.
  ![1399](https://github.com/user-attachments/assets/d5225d2a-330e-4bb4-8400-538f54cabd5a)
### 40.1.1. Volume Creation:
- Click on Create volume button
  ![1400](https://github.com/user-attachments/assets/e344750f-73f1-4b70-bddb-d971844f4465)
  ![1401](https://github.com/user-attachments/assets/00a854e5-f1dd-4b22-ba16-44d4fbb10908)
  ![1402](https://github.com/user-attachments/assets/64730a91-ad8a-4d74-847f-6b8bff7c1859)
  ![1403](https://github.com/user-attachments/assets/f039cd00-f7c5-424f-a784-e3a7ee9544a6)
- After volume creation you can see the event recorded.
  ![1404](https://github.com/user-attachments/assets/cab73b0b-1e1f-48f0-aa5b-792124ed0810)
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
  ![1405](https://github.com/user-attachments/assets/ad1347d2-ef48-44bb-9be7-698191efcc20)
  ![1406](https://github.com/user-attachments/assets/58ff9a74-904b-44f4-a051-232f5bc2d949)
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
  ![1407](https://github.com/user-attachments/assets/566c6cd4-d58d-49fc-b89e-34408e8114ed)
### 40.1.3. Lambda Role Permission providing: 
- Giving permissions to the role which is attached to lambda.
  ![1408](https://github.com/user-attachments/assets/f57470f9-c9f1-4108-9b21-bd59036afa45)
  ![1409](https://github.com/user-attachments/assets/75acc742-b391-47fb-974c-12d996c10cad)
  ![1410](https://github.com/user-attachments/assets/c5823c8f-3ec0-48dc-a248-c4f1c1d12f29)
  ![1411](https://github.com/user-attachments/assets/04060927-d0c2-403a-8b17-77d4728c80df)

### 40.1.4. Amazon EventBridge Rules Creation:
- Click on ```Create rule``` button
  ![1412](https://github.com/user-attachments/assets/1a21435f-63f8-4296-8f22-9dee60cbd32c)
  ![1413](https://github.com/user-attachments/assets/f2bffd78-a43d-491e-9ad0-02295d3c8fbf)
  ![1414](https://github.com/user-attachments/assets/ecab49f3-d991-49e4-8543-1c9cb21d249c)
  ![1415](https://github.com/user-attachments/assets/2b40eb25-22e9-4b0c-92c5-d3cee00ca0cd)
  ![1416](https://github.com/user-attachments/assets/70b23496-5461-47f0-8371-933854901872)
  ![1417](https://github.com/user-attachments/assets/af921121-4fa0-460a-9b46-a0794fdba79a)
  ![1418](https://github.com/user-attachments/assets/9886cb0c-46ab-4bfb-946d-eeacb759a104)
  ![1419](https://github.com/user-attachments/assets/dd88aac2-aa26-4448-8aee-919f6fb251e7)
  ![1420](https://github.com/user-attachments/assets/a4b3ad42-dcd0-4ad0-b70a-631613cdcd18)

- Log groups will be created
  ![1425](https://github.com/user-attachments/assets/7aad965a-e8a2-472b-9dd6-6be3725118e1)
- Changing the lambda time out to 1 min as it is mentioned in python code
  ![1424](https://github.com/user-attachments/assets/f115ab27-5fa9-47b6-ba29-a190c7e63f13)
  ![1426](https://github.com/user-attachments/assets/ea529e66-44f0-4014-b59e-879ae60d70f4)
  ![1427](https://github.com/user-attachments/assets/8f2d8765-67f1-44e9-9630-0644d0aca043)

### 40.1.5. Testing the Event Bridge:
- Now create a volume and see then the volume will get deleted
  ![1421](https://github.com/user-attachments/assets/eae5f5bf-8f59-4faf-865d-a566a156140e)
  ![1422](https://github.com/user-attachments/assets/4114d203-dfb9-4ffa-a031-d8f19675b000)
  ![1423](https://github.com/user-attachments/assets/00ce1b4a-37c8-4f9c-bf97-54330eecd792)
  ![1428](https://github.com/user-attachments/assets/19734d0a-0b42-4478-986d-22dd42aa526f)

## 40.2. Scheduled Events:
### 40.2.1 Lambda Function Creation:
- Click on ```Create function``` button.
  ![1429](https://github.com/user-attachments/assets/0c9b30fb-3177-44c9-bd0d-0b2bb970405b)
  ![1430](https://github.com/user-attachments/assets/f919f7d1-1569-4a4e-b0d3-d9a33a5b8066)

- Create volumes for testing the function.
  ![1430-1](https://github.com/user-attachments/assets/6379274b-02ec-495c-be9f-3d6d6d0a5668)

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
  ![1431](https://github.com/user-attachments/assets/bb1cb61c-9375-4618-8fda-425a23f6a97d)
  ![1432](https://github.com/user-attachments/assets/6c0b510d-680f-4df9-8e6f-17d1cea6220b)
  ![1433](https://github.com/user-attachments/assets/88994cc9-221b-401e-a375-0be7488d837b)
  ![1434](https://github.com/user-attachments/assets/0572f14c-6c12-4a85-bba4-3726c654494a)

### 40.2.2 Scheduling the Function:
- Click on create rule.
  ![1435](https://github.com/user-attachments/assets/5169ecdc-3a28-4d0f-a131-6aee09f18809)
  ![1436](https://github.com/user-attachments/assets/cedbe5a5-b461-49b5-802e-abdd6d6fbfec)
  ![1437](https://github.com/user-attachments/assets/afd24be2-5394-47d0-9621-2edc5c370607)
  ![1438](https://github.com/user-attachments/assets/ed04b187-5091-49c6-9a60-16c4f26ff081)
  ![1439](https://github.com/user-attachments/assets/e8370c20-b57c-442a-8cdf-90d8f6754d75)
  ![1440](https://github.com/user-attachments/assets/28503ce3-b8a6-4ed0-996e-ffa96089d000)
  ![1441](https://github.com/user-attachments/assets/875dac2a-3030-48a5-b77b-20f4ae635497)
  ![1442](https://github.com/user-attachments/assets/da306da2-90e9-45ee-bd0b-64401597ed5b)
  ![1443](https://github.com/user-attachments/assets/868ba3aa-e3e2-4905-ab46-ad5780712b73)
  ![1444](https://github.com/user-attachments/assets/65130196-c1ad-4674-ae7c-f02664cad9a7)
- Now create ther few volumes which are unattached all will be deleted in few min as scheduled.

  
