# 16. Amazon Machine Images (AMI):
- Scanning EC2 Server with AWS Inspector
- Fix the Security Issues which can after scanning.
- Rescan the system and create Custom AMI with the machine.
- Connect to the Linux Machine, install nginx in it.
  ![382](https://github.com/user-attachments/assets/d8bb3eac-f7b4-4754-9dab-b5a82978a5ee)

- Download the AWS Inspector using
  ```
  curl -O https://inspector-agent.amazonaws.com/linux/latest/install
  ```
- Install using the ```sudo bash install``` command.
  ![383](https://github.com/user-attachments/assets/24770d83-64dd-473a-8c81-a9e73b329d61)

- Create tag.
  
  ![384](https://github.com/user-attachments/assets/7bdfa3da-53a7-4983-88aa-cad0f7f6b688)

- Click on Create button
  ![385](https://github.com/user-attachments/assets/cfb31b03-e250-4d80-849a-cbcebc27aada)

- Fill name and Tag which you have created for the server above and click on save button.
  ![386](https://github.com/user-attachments/assets/aa590a2c-37f0-437c-82c9-c795101b97a3)

- Created.
  ![387](https://github.com/user-attachments/assets/56e09c42-84f7-4953-b41b-73544e192e12)

- Goto Assessment templates and create one.
  ![388](https://github.com/user-attachments/assets/28b094b8-872f-4e12-8bbe-3cabc1e1618c)

- Fill in the name, target name, duration, rules Packages. And click on create and run
  ![389](https://github.com/user-attachments/assets/7cc302a6-a1a1-4230-8c93-946d5b480f23)

- Now go to Assessment runs and check your run.
  ![390](https://github.com/user-attachments/assets/c2b5f1d7-71f0-4cec-82b3-619fcc7abafa)

  ## 16.1. Steps involved in Creating Custom AMI:
    1. Create a EC2 Machine.
    2. Install all necessary packages or applications.
    3. Shutdown the server.
    4. Create AMI from the server.
    5. Delete the server once AMI Creation is successful.
    
    To automate the proves of AMI we use HashiCorp Packer which is 3rd party tool
    1. Creating a Custom AMI automatically
    2. How to provide the access for the 3rd party tools(Packer) in AWS

