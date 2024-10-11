# 16. Amazon Machine Images (AMI):

- Scanning EC2 Server with AWS Inspector
- Fix the Security Issues which can after scanning.
- Rescan the system and create Custom AMI with the machine.
- Connect to the Linux Machine, install nginx in it.
  ![382](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/382.png)

- Download the AWS Inspector using
  ```
  curl -O https://inspector-agent.amazonaws.com/linux/latest/install
  ```
- Install using the ```sudo bash install``` command.
  ![383](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/383.png)

- Create tag.

  ![384](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/384.png)

- Click on Create button
  ![385](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/385.png)

- Fill name and Tag which you have created for the server above and click on save button.
  ![386](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/386.png)

- Created.
  ![387](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/387png)

- Goto Assessment templates and create one.
  ![388](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/388.png)

- Fill in the name, target name, duration, rules Packages. And click on create and run
  ![389](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/389.png)

- Now go to Assessment runs and check your run.
  ![390](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/390.png)

  ## 16.1. Steps involved in Creating Custom AMI:
    1. Create a EC2 Machine.
    2. Install all necessary packages or applications.
    3. Shutdown the server.
    4. Create AMI from the server.
    5. Delete the server once AMI Creation is successful.

  To automate the proves of AMI we use HashiCorp Packer which is 3rd party tool
    1. Creating a Custom AMI automatically
    2. How to provide the access for the 3rd party tools(Packer) in AWS

