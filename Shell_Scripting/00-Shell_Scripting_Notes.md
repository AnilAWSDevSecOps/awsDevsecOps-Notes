# 2. ShellScriting:

## 2.1. Requirements

- Below are the requirements for the Shell Scripting practice in AWS

### 2.1.1 Launching the Instance:

- Launch the new instance with the below script.  
  ***Launch Script:***
  ```bash
  #!/bin/bash
  sudo hostnamectl set-hostname shellscripting
  sudo apt update
  sudo apt install -y net-tools jq unzip nginx
  ```

- Now make changes to nginx's index.nginx-debian.html  
  ***Command:***
  ```shell
  ubuntu@shellscripting:~$ sudo vi /var/www/html/index.nginx-debian.html

  ```
  ***Edit the Title and h1:***
  ```
  <!DOCTYPE html>
  <html>
  <head>
  <title>Welcome to Nginx!!!</title>
  <style>
  html { color-scheme: light dark; }
  body { width: 35em; margin: 0 auto;
  font-family: Tahoma, Verdana, Arial, sans-serif; }
  </style>
  </head>
  <body>
  <h1>Welcome to DevSecOps2024!!!</h1>
  <p>If you see this page, the nginx web server is successfully installed and
  working. Further configuration is required.</p>
  
  <p>For online documentation and support please refer to
  <a href="http://nginx.org/">nginx.org</a>.<br/>
  Commercial support is available at
  <a href="http://nginx.com/">nginx.com</a>.</p>
  
  <p><em>Thank you for using nginx.</em></p>
  </body>
  </html>
  ```
- Now you can grep the nginx using curl  
  ***Command:***
  ```
  ubuntu@shellscripting:~$ curl -sL http://ec2-3-82-28-32.compute-1.amazonaws.com |grep -i 2024
  
  ```

  ***Output:***
  ```shell
  <h1>Welcome to DevSecOps2024!!!</h1>
  
  ```
- Now you can run that in loop  
  ***Command:***
  ```
  ubuntu@shellscripting:~$ while true;
  > do
  > curl -sL http://ec2-3-82-28-32.compute-1.amazonaws.com |grep -i 2024
  > sleep 1
  > done
  ```
  ***Output:***
  ```
  <h1>Welcome to DevSecOps2024!!!</h1>
  <h1>Welcome to DevSecOps2024!!!</h1>
  <h1>Welcome to DevSecOps2024!!!</h1>
  <h1>Welcome to DevSecOps2024!!!</h1>
  <h1>Welcome to DevSecOps2024!!!</h1>
  <h1>Welcome to DevSecOps2024!!!</h1>
  ...
  .....
  ......
  ```

### 2.1.2. Installing and Configuring the AWS CLI:

- Use below commands to install the aws cli  
  ***Commands:***
  ```shell
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  aws --version
  ```
  ***Output:***
  ```
  aws-cli/2.27.42 Python/3.13.4 Linux/6.1.140-154.222.amzn2023.x86_64 exec-env/CloudShell exe/x86_64.amzn.2023
  ```
    
- Use aws configure to configure.
  ***Commands:***
  ```
  ubuntu@shellscripting:~$ aws configure
  
  ```
  ***Output:***
  ```
  AWS Access Key ID [None]: XXXXXXXXXXXXXXX
  AWS Secret Access Key [None]: XXXXXXXXXXXXXXX
  Default region name [None]: 
  Default output format [None]:
  ```

### 2.1.3. Installing Azure Cli:

- Use below command to install the azure CLI    
  ***Command:***
  ```
  ubuntu@shellscripting:~$ curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
  
  ```

### 2.1.4. Sample Shellscript:

- Write the script to print from 1 to 10  
  ***01-print-1-to-10.sh***
  ```shell
  # Printing 1 to 10 using for loop
  for i in {1..10}; do
      echo $i
  done
  ```

### 2.1.5. Installing the GIT:

- Download the windows git and install it
    ***Command:***
  ```
  ubuntu@shellscripting:~$ git --version
  
  ```
  ***Output:***
  ```
  git version 2.47.1
  ```
- Now in the any poweshell or the git bash or linux configure the git by below commands.
- in EC2 instance use the below command to generate the public aand private keys  
  ***Command:***
  ```
  ubuntu@shellscripting:~$ ssh-keygen
  
  ```
  ***Output:***
  ```
  Generating public/private ed25519 key pair.
  Enter file in which to save the key (/home/ubuntu/.ssh/id_ed25519): 
  Enter passphrase (empty for no passphrase): 
  Enter same passphrase again: 
  Your identification has been saved in /home/ubuntu/.ssh/id_ed25519
  Your public key has been saved in /home/ubuntu/.ssh/id_ed25519.pub
  The key fingerprint is:
  SHA256:KWgc4diWqpsM4KwefaVMuDVTUQWksfrYsQ9+3WFjDS0 ubuntu@shellscripting
  The key's randomart image is:
  +--[ED25519 256]--+
  |    .  oo+o.     |
  |   + o  =        |
  |  . *  +      .  |
  |   +.oo  .   E . |
  |. ..+*.oS     +  |
  |+...= O.o    = . |
  |o+ o = =  . + o  |
  |+o. . . o. . .   |
  |=o     ...       |
  +----[SHA256]-----+
  ```
- in POwershell use the below command to generate the public aand private keys  
  ***Command:***
  ```
  PS C:\Users\madir\Documents\WorkSpace> ssh-keygen.exe
  
  ```
  ***Output:***
  ```
  Generating public/private rsa key pair.
  Enter file in which to save the key (C:\Users\madir/.ssh/id_rsa): 
  Created directory 'C:\\Users\\madir/.ssh'.
  Enter passphrase (empty for no passphrase): 
  Enter same passphrase again: 
  Your identification has been saved in C:\Users\madir/.ssh/id_rsa
  Your public key has been saved in C:\Users\madir/.ssh/id_rsa.pub
  The key fingerprint is:
  SHA256:uCQTIHzpN8HGdCUjf8DfqlbWzxUENIKECSiIKzDHrVk madir@MadireddyOmen
  The key's randomart image is:
  +---[RSA 3072]----+
  |=...*+o==o...+.  |
  |=+o=E=+++.  . .. |
  |.+++o .....   .  |
  |o o. + ... .   . |
  |.   + + S o     .|
  |     + . + .   . |
  |      . +   o .  |
  |       o     o   |
  |      .          |
  +----[SHA256]-----+
  ```
- In gitbash use the below command to generate the public aand private keys   
  ***Command:***
  ```
  madir@MadireddyOmen MINGW64 ~/Documents/WorkSpace/DevSecOps2024 (main)
  $ ssh-keygen
  
  ```
  ***Output:***
  ```
  Generating public/private ed25519 key pair.
  Enter file in which to save the key (/c/Users/madir/.ssh/id_ed25519): 
  Enter passphrase (empty for no passphrase): 
  Enter same passphrase again: 
  Your identification has been saved in /c/Users/madir/.ssh/id_ed25519
  Your public key has been saved in /c/Users/madir/.ssh/id_ed25519.pub
  The key fingerprint is:
  SHA256:SYRSR9c4KtWNoJ5hSzqCEo+WDokwj1QS39c4VXjh7dA madir@MadireddyOmen
  The key's randomart image is:
  +--[ED25519 256]--+
  | o.. ..o=++B.    |
  |  + o .+=o*.=    |
  |+. . o==.o.+ E   |
  |+X.  =o=o.  o    |
  |Oo+ o +.S    .   |
  |=  . .           |
  | .               |
  |                 |
  |                 |
  +----[SHA256]-----+
  ```
- Now add the public keys in git under Settings > SSH and GPG Keys
  ![001](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Shell_Scripting/Shell_Scripting_Notes_images/001.png)
- Now Configure the Existing repo as below.  
  ***Commands:***
  ```
  ubuntu@shellscripting:~$ mkdir WorkSpace
  ubuntu@shellscripting:~$ cd WorkSpace/
  ubuntu@shellscripting:~/WorkSpace$ mkdir DevSecOps2024
  ubuntu@shellscripting:~/WorkSpace$ cd DevSecOps2024/
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024$ git init
  ```
  ***Output:***
  ```
  hint: Using 'master' as the name for the initial branch. This default branch name
  hint: is subject to change. To configure the initial branch name to use in all
  hint: of your new repositories, which will suppress this warning, call:
  hint: 
  hint:   git config --global init.defaultBranch <name>
  hint: 
  hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
  hint: 'development'. The just-created branch can be renamed via this command:
  hint: 
  hint:   git branch -m <name>
  Initialized empty Git repository in /home/ubuntu/WorkSpace/DevSecOps2024/.git/
  ```
  ***Commands:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024$ git remote -v
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024$ git remote add origin git@github.com:anilmadireddy/DevSecOps2024.git
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024$ git remote -v
  git branch -m master main
  ```
  ***Output:***
  ```
  origin  git@github.com:anilmadireddy/DevSecOps2024.git (fetch)
  origin  git@github.com:anilmadireddy/DevSecOps2024.git (push)
  ```
  ***Commands:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024$ git pull origin main

  ```
  ***Output:***
  ```
  remote: Enumerating objects: 45, done.
  remote: Counting objects: 100% (45/45), done.
  remote: Compressing objects: 100% (38/38), done.
  remote: Total 45 (delta 10), reused 0 (delta 0), pack-reused 0 (from 0)
  Unpacking objects: 100% (45/45), 14.39 KiB | 313.00 KiB/s, done.
  From github.com:anilmadireddy/DevSecOps2024
   * branch            main       -> FETCH_HEAD
   * [new branch]      main       -> origin/main
  ```
  ***PUSH COMMANDS:***
  ```shell
  git config --global user.email "anilreddy.m8@gmail.com"
  git config --global user.name "anilmadireddy"
  git branch --set-upstream-to=origin/main main
  git pull
  git add .
  git commit -m "Message"
  git push origin main
  ```

- To make SSH session keep alive and to login fast
- Create the config file if not exist  
  ***Commands:***
  ```
  cat .ssh/config
  ```
  ***Output:***
  ```
  Host ubuntu-ec2
          Hostname ec2-3-82-28-32.compute-1.amazonaws.com
          Port 22
          User ubuntu
          ServerAliveInterval 120
          ServerAliveCountMax 2
  ```

- to add the alias commands you can use below. so that command short cuts are created, add the commands in last line  
  ***Command:***
  ```
  vi ~/.bashrc
  ```
  ***Output:***
  ```
  alias push='git pull;git add .;git commit -m "$(hostname)-$(date)";git push origin main'
  alias pull='git pull'
  ```
- for windows do as below for aliases  
  ***Command:***
  ```
  vi /c/Users/madir/.bashrc
  source /c/Users/madir/.bashrc
  ```
  ***Output:***
  ```
  alias push='git pull;git add .;git commit -m "$(hostname)-$(date)";git push origin main'
  alias pull='git pull'
  ```
- Describing the VPCs in the AWS  
  ***Commands:***
  ```
  aws ec2 describe-vpcs --region us-east-1 | jq
  
  ```
  ***Output:***
  ```
  {
    "Vpcs": [
      {
        "CidrBlock": "10.1.0.0/16",
        "DhcpOptionsId": "dopt-06aa3b5012341d1fe",
        "State": "available",
        "VpcId": "vpc-02b48296aa54f91c7",
        "OwnerId": "559050220397",
        "InstanceTenancy": "default",
        "CidrBlockAssociationSet": [
          {
            "AssociationId": "vpc-cidr-assoc-0eb3cf3b7f1069884",
            "CidrBlock": "10.1.0.0/16",
            "CidrBlockState": {
              "State": "associated"
            }
          }
        ],
        "IsDefault": false,
        "Tags": [
          {
            "Key": "Name",
            "Value": "Master-01-vpc"
          }
        ]
      }
    ]
  }
  ```
  ***Commands:***
  ```
  aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId" -r
  
  ```
  ***Output:***
  ```
  vpc-02b48296aa54f91c7
  
  ```
- Pokemon API user list fetching  
  ***Command:***
  ```
  curl -sL https://pokeapi.co/api/v2/pokemon?limit=1400|jq ".results[].name" -r
  
  ```
  ***Output:***
  ```
  ponyta-galar
  rapidash-galar
  slowpoke-galar
  slowbro-galar
  farfetchd-galar
  weezing-galar
  mr-mime-galar
  .
  .
  till1400 will come
  ```
  ***Command:***
  ```
  curl -sL https://pokeapi.co/api/v2/pokemon?limit=1400|jq ".results[].name" -r | wc -l
  
  ```
  ***Output:***
  ```
  1302
  
  ```

- runnun it in the loop  
  ***Command:***
  ```
  for pok in $(curl -sL https://pokeapi.co/api/v2/pokemon?limit=1400|jq ".results[].name" -r)
  > do
  > echo "pok name is : $pok"
  > sleep 1
  > done
  ```
  or
  ```
  for pok in $(curl -sL https://pokeapi.co/api/v2/pokemon?limit=1400|jq ".results[].name" -r); do  echo "pok name is : $pok"; sleep 1; done
  ```
  ***Output:***
  ```
  pok name is : bulbasaur
  pok name is : ivysaur
  pok name is : venusaur
  pok name is : charmander
  pok name is : charmeleon
  pok name is : charizard
  pok name is : squirtle
  pok name is : wartortle
  pok name is : blastoise
  pok name is : caterpie
  pok name is : metapod
  pok name is : butterfree
  pok name is : weedle
  pok name is : kakuna
  pok name is : beedrill
  ```

### 2.1.6. Scripts:

***01-printing-1-to-10.sh***

  ```shell
  # Printing 1 to 10 using for loop
  for i in {1..10}; do
      echo $i
      sleep 2
  done
  ```

***02-evenOddNumber.sh***

  ```shell
  # Check the even Number
  for i in {1..10}; do
      if [ $((i % 2)) -eq 0 ]; then
          echo "$i is even number"
      else
          echo "$i is odd number"
      fi
      sleep 2
  done
  ```

***03-pokmaon-unames.sh***

  ```shell
  #!/bin/bash
  # This script will fetch all the pokemon user names from the pokeapi.co
  all_pokeusers=$(curl -sL https://pokeapi.co/api/v2/pokemon?limit=1400 | jq ".results[].name" -r)
  for pokeuser in $all_pokeusers; do
      echo "poke-user-name is : $pokeuser"
      sleep 1
  done
  ```

***04-ListVpcs.sh***

  ```shell
  # Listing the VPCs in the account
  Region=$1
  # aws ec2 describe-vpcs --region $Region --query "Vpcs[].VpcId" --output text
  aws ec2 describe-vpcs --region $Region | jq ".Vpcs[].VpcId" -r
  ```

## 2.2. Environmental Variables in Linux:

### 2.2.1 Setting Environmental Variables instantly

- you can set the env as below, but once you exit they will be deleted

  ***Commands:***
  ```
  export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
  export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
  export AWS_DEFAULT_REGION=us-west-2
  ```

### 2.2.2. Setting Environmental Variables in Linux permanantly:

- in user home there is one file called .bashrc you can add the Variables in that file to keep it permanatly.

  ***Command:***
  ```
  vi ~/.bashrc
  
  ```
- Add the variables in end of the file.
  ```
  export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
  export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
  export AWS_DEFAULT_REGION=us-west-2
  ```
- Now run the below command to start using variables immediately.
  ***Command:***
  ```
  source ~/.bashrc
  
  ```
- But this can be stolen if they have root permissions so configure the variables in user level using below.
- For example if you have two projects Proj1 and Proj2

  ***Proj1 Variables:***
  ```
  #Proj1 Variables
  export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLEProj1
  export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEYProj1
  export AWS_DEFAULT_REGION=us-east-1
  ```
  ***Proj2 Variables:***
  ```
  #Proj2 Variables
  export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLEProj2
  export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEYProj2
  export AWS_DEFAULT_REGION=us-west-1
  ```
- if you add these two in the .bashrc the last one will be considered. but not the both.
- Now these can be configured in the user level with installing ```direnv```

  ***Command:*** To Install in Amazon Linux
  ```bash
  # Download the latest direnv release
  curl -sfL https://github.com/direnv/direnv/releases/latest/download/direnv.linux-amd64 -o direnv
  
  # Make it executable and move to /usr/local/bin
  chmod +x direnv
  sudo mv direnv /usr/local/bin/
  ```
  ***Command:***
  ```
  sudo apt-get install direnv
  
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/ShellScripting$ ls /home/ubuntu/WorkSpace/Projects/
  ```
  ***Output:***
  ```
  Projrct-1  Projrct-2
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/ShellScripting$ direnv

  ```
  ***Output:***
  ```
  direnv v2.32.1
  Usage: direnv COMMAND [...ARGS]
  
  Available commands
  ------------------
  allow [PATH_TO_RC]:
  permit [PATH_TO_RC]:
  grant [PATH_TO_RC]:
    Grants direnv permission to load the given .envrc or .env file.
  block [PATH_TO_RC]:
  deny [PATH_TO_RC]:
  revoke [PATH_TO_RC]:
    Revokes the authorization of a given .envrc or .env file.
  edit [PATH_TO_RC]:
    Opens PATH_TO_RC or the current .envrc or .env into an $EDITOR and allow
    the file to be loaded afterwards.
  exec DIR COMMAND [...ARGS]:
    Executes a command after loading the first .envrc or .env found in DIR
  fetchurl <url> [<integrity-hash>]:
    Fetches a given URL into direnv's CAS
  help [SHOW_PRIVATE]:
    shows this help
  hook SHELL:
    Used to setup the shell hook
  prune:
    removes old allowed files
  reload:
    triggers an env reload
  status:
    prints some debug status information
  stdlib:
    Displays the stdlib available in the .envrc execution context
  version [VERSION_AT_LEAST]:
    prints the version or checks that direnv is older than VERSION_AT_LEAST.
  ```
- add the creds in the .envrc file in every project and do the below you can use the Variables user level.

  ***Command:***
  ```
  # add the creds in the .envrc file in every project and do the below you can use the Variables user level.
  ubuntu@shellscripting:~/WorkSpace/Projects/Projrct-1$ source /home/ubuntu/WorkSpace/Projects/Projrct-1/.envrc 
  ubuntu@shellscripting:~/WorkSpace/Projects/Projrct-1$ env |grep -i AWS
  ```
  ***Output:***
  ```
  AWS_DEFAULT_REGION=us-east-1
  AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEYProj1
  AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLEProj1
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/Projects/Projrct-1$ source /home/ubuntu/WorkSpace/Projects/Projrct-2/.envrc 
  ubuntu@shellscripting:~/WorkSpace/Projects/Projrct-1$ env |grep -i AWS
  ```
  ***Output:***
  ```
  AWS_DEFAULT_REGION=us-west-1
  AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEYProj2
  AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLEProj2
  ```
- Now when you enter into the Projects it should automatically load the .envrc of that project for that we need to add
  it in .bashrc

  ***Command:***
  ```
  vi ~/.bashrc
  
  ```
  ```
  # direnv valuation
  eval "$(direnv hook bash)"
  ```
  ```
  source ~/.bashrc
  
  ```
  ```
  cd  proj1 
  direvn allow
  cd proj2
  direnv allow
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/Projects/Projrct-1$ env |grep -i AWS

  ```
  ***Output:***
  ```
  AWS_DEFAULT_REGION=us-east-1
  AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEYProj1
  AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLEProj1
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/Projects/Projrct-1$ cd -

  ```
  ***Output:***
  ```
  /home/ubuntu/WorkSpace/Projects/Projrct-2
  direnv: loading ~/WorkSpace/Projects/Projrct-2/.envrc
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/Projects/Projrct-2$ env |grep -i AWS

  ```
  ***Output:***
  ```
  AWS_DEFAULT_REGION=us-west-1
  AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEYProj2
  AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLEProj2
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/Projects/Projrct-2$ echo $AWS_SECRET_ACCESS_KEY

  ```
  ***Output:***
  ```
  wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEYProj2
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/Projects/Projrct-2$ cd -

  ```
  ***Output:***
  ```
  /home/ubuntu/WorkSpace/Projects/Projrct-1
  direnv: loading ~/WorkSpace/Projects/Projrct-1/.envrc
  direnv: export ~AWS_ACCESS_KEY_ID ~AWS_DEFAULT_REGION ~AWS_SECRET_ACCESS_KEY
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/Projects/Projrct-1$ echo $AWS_SECRET_ACCESS_KEY

  ```
  ***Output:***
  ```
  wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEYProj1
  
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/Projects/Projrct-1$ cd -

  ```
  ***Output:***
  ```
  /home/ubuntu/WorkSpace/Projects/Projrct-2
  direnv: loading ~/WorkSpace/Projects/Projrct-2/.envrc
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/Projects/Projrct-2$ echo $AWS_SECRET_ACCESS_KEY

  ```
  ***Output:***
  ```
  wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEYProj2
  
  ```

## 2.3 Parameters in Shell Scripting:

- Parameters will be parsed as below.

  ***05-parameters-passing.sh***
  ```shell
  # Parameters passing
  echo "The script name is: $0"
  echo "The first parameter is: $1"
  echo "The second parameter is: $2"
  echo "The third parameter is: $3"
  echo "The fourth parameter is: $4"
  echo "The fifth parameter is: $5"
  echo "The sixth parameter is: $6"
  echo "The parameters are: $@"
  echo "The parameters are: $*"
  echo "The number of parameters are: $#"
  echo "The process id is: $$"
  echo "The last process id is: $!"
  echo "The exit status is: $?"
  echo "The current working directory is: $PWD"
  echo "The home directory is: $HOME"
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/ShellScripting$ ./05-parameters-passing.sh anil sunil vinil kunil danil jonil
  
  ```
  ***Output:***
  ```
  The script name is: ./05-parameters-passing.sh
  The first parameter is: anil
  The second parameter is: sunil
  The third parameter is: vinil
  The fourth parameter is: kunil
  The fifth parameter is: danil
  The sixth parameter is: jonil
  The parameters are: anil sunil vinil kunil danil jonil
  The parameters are: anil sunil vinil kunil danil jonil
  The number of parameters are: 6
  The process id is: 21328
  The last process id is: 
  The exit status is: 0
  The current working directory is: /home/ubuntu/WorkSpace/DevSecOps2024/ShellScripting
  The home directory is: /home/ubuntu
  ```
  ***06-ListVpcs-allReg.sh***
  ```shell
  # Listing the VPCs in all the regions using parameters.
  Regions=$@
  for Region in $Regions; do
      echo "Listing VPCs in region $Region"
      # aws ec2 describe-vpcs --region $Region --query "Vpcs[].VpcId" --output text
      aws ec2 describe-vpcs --region $Region | jq ".Vpcs[].VpcId" -r
  done
  # End of the script
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/ShellScripting$ ./06-ListVpcs-allReg.sh us-east-1 us-west-1 us-east-2 us-west-2

  ```
  ***Output:***
  ```
  Listing VPCs in region us-east-1
  vpc-02b48296aa54f91c7
  Listing VPCs in region us-west-1
  vpc-0b7c13d6119f67226
  Listing VPCs in region us-east-2
  vpc-0c291bff74ff23073
  Listing VPCs in region us-west-2
  vpc-08815e8601b5dfb89
  ```
  ***Command:*** To print vpc list with line numbers
  ```
  Shell_Scripts $ ./06-ListVpcs-allReg.sh us-east-1 us-west-1 us-east-2 us-west-2|awk '{print NR,$0}'

  ```
  ***Output:***
  ```
  1 Listing VPCs in region us-east-1
  2 vpc-015a92ad1076c1fba
  3 Listing VPCs in region us-west-1
  4 vpc-08a19485a98b6b441
  5 Listing VPCs in region us-east-2
  6 vpc-028a70445745a1c8c
  7 Listing VPCs in region us-west-2
  8 vpc-02ed782285e5ff28d
  ```
  ***Command:*** To print vpc list with line numbers
  ```
  Shell_Scripts $ ./06-ListVpcs-allReg.sh us-east-1 us-west-1 us-east-2 us-west-2|awk 'NR % 2 == 0 { print ++count,$0 }'

  ```
  ***Output:***
  ```
  1 vpc-015a92ad1076c1fba
  2 vpc-08a19485a98b6b441
  3 vpc-028a70445745a1c8c
  4 vpc-02ed782285e5ff28d
  ```

## 2.4 Shell Data Operators

### 2.4.1. Basic Operators in Shell Scripting

- There are 5 basic operators in bash/shell scripting:
    - Arithmetic Operators
    - Relational Operators
    - Boolean Operators
    - Bitwise Operators
    - File Test Operators

#### 1. Arithmetic Operators:

- These operators are used to perform normal arithmetics/mathematical operations. There are 7 arithmetic operators:
    - ***Addition (+):*** Binary operation used to add two operands.
    - ***Subtraction (-):*** Binary operation used to subtract two operands.
    - ***Multiplication (*):*** Binary operation used to multiply two operands.
    - ***Division (/):*** Binary operation used to divide two operands.
    - ***Modulus (%):*** Binary operation used to find remainder of two operands.
    - ***Increment Operator (++):*** Unary operator used to increase the value of operand by one.
    - ***Decrement Operator (- -):*** Unary operator used to decrease the value of a operand by one.
    - ![006](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Shell_Scripting/Shell_Scripting_Notes_images/006.png)
      ```shell
      #!/bin/bash

      # reading data from the user
      read -r -p "Enter a: " a

      read -r -p "Enter b: " b

      add=$((a+b))
      echo "Addition of a and b are: "${add}

      sub=$((a-b))
      echo "Subtraction of a and b are: "${sub}

      mul=$((a*b))
      echo "Multiplication of a and b are: "${mul}

      div=$((a/b))
      echo "Division of a and b are: "${div}

      mod=$((a%b))
      echo "Modulis of a and b are: "${mod}

      ((++a))
      echo "Increment operator when applied on $a results into a :" "${a}"

      ((--b))
      echo "Decrement operator when applied on 'b' results into b :" "${b}"

      ```

#### 2. Relational Operators:

- Relational operators are those operators which define the relation between two operands. They give either true or
  false depending upon the relation. They are of 6 types:
    - ***‘==’ Operator:*** Double equal to operator compares the two operands. Its returns true is they are equal
      otherwise returns false.
    - ***‘!=’ Operator:*** Not Equal to operator return true if the two operands are not equal otherwise it returns
      false.
    - ***‘<‘ Operator:*** Less than operator returns true if first operand is less than second operand otherwise returns
      false.
    - ***‘<=’ Operator:*** Less than or equal to operator returns true if first operand is less than or equal to second
      operand otherwise returns false
    - ***‘>’ Operator:*** Greater than operator return true if the first operand is greater than the second operand
      otherwise return false.
    - ***‘>=’ Operator:*** Greater than or equal to operator returns true if first operand is greater than or equal to
      second operand otherwise returns false
    - ![007](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Shell_Scripting/Shell_Scripting_Notes_images/007.png)
      ```shell
      #!/bin/bash

      #reading data from the user
      read -p 'Enter a : ' a
      read -p 'Enter b : ' b

      if(( $a==$b ))
      then
          echo a is equal to b.
      else
          echo a is not equal to b.
      fi

      if(( $a!=$b ))
      then
          echo a is not equal to b.
      else
          echo a is equal to b.
      fi

      if(( $a<$b ))
      then
          echo a is less than b.
      else
          echo a is not less than b.
      fi

      if(( $a<=$b ))
      then
          echo a is less than or equal to b.
      else
          echo a is not less than or equal to b.
      fi

      if(( $a>$b ))
      then
          echo a is greater than b.
      else
          echo a is not greater than b.
      fi

      if(( $a>=$b ))
      then
          echo a is greater than or equal to b.
      else
          echo a is not greater than or equal to b.
      fi
      ```

#### 3. Logical Operators :

- They are also known as boolean operators. These are used to perform logical operations. They are of 3 types:
    - ***Logical AND (&&):*** This is a binary operator, which returns true if both the operands are true otherwise
      returns false.
    - ***Logical OR (||):*** This is a binary operator, which returns true if either of the operands is true or if both
      the operands are true. It returns false only if both operands are false.
    - ***Not Equal to (!):*** This is a unary operator which returns true if the operand is false and returns false if
      the operand is true.
    - ![005](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Shell_Scripting/Shell_Scripting_Notes_images/005.png)
      ```shell
      #!/bin/bash

      #reading data from the user
      read -p 'Enter a : ' a
      read -p 'Enter b : ' b

      if(($a == "true" & $b == "true" ))
      then
          echo Both are true.
      else
          echo Both are not true.
      fi

      if(($a == "true" || $b == "true" ))
      then
          echo Atleast one of them is true.
      else
          echo None of them is true.
      fi

      if(( ! $a == "true"  ))
      then
          echo "a" was initially false.
      else
           echo "a" was initially true.
       fi
      ```

#### 4. Bitwise Operators:

- A bitwise operator is an operator used to perform bitwise operations on bit patterns. They are of 6 types:
    - ***Bitwise And (&):*** Bitwise & operator performs binary AND operation bit by bit on the operands.
    - ***Bitwise OR (|):*** Bitwise | operator performs binary OR operation bit by bit on the operands.
    - ***Bitwise XOR (^):*** Bitwise ^ operator performs binary XOR operation bit by bit on the operands.
    - ***Bitwise complement (~):*** Bitwise ~ operator performs binary NOT operation bit by bit on the operand.
    - ***Left Shift (<<):*** This operator shifts the bits of the left operand to left by number of times specified by
      right operand.
    - ***Right Shift (>>):*** This operator shifts the bits of the left operand to right by number of times specified by
      right operand.
      ```shell
      #!/bin/bash

      #reading data from the user
      read -p 'Enter a : ' a
      read -p 'Enter b : ' b

      bitwiseAND=$(( a&b ))
      echo Bitwise AND of a and b is $bitwiseAND

      bitwiseOR=$(( a|b ))
      echo Bitwise OR of a and b is $bitwiseOR

      bitwiseXOR=$(( a^b ))
      echo Bitwise XOR of a and b is $bitwiseXOR

      bitiwiseComplement=$(( ~a ))
      echo Bitwise Compliment of a is $bitiwiseComplement

      leftshift=$(( a<<1 ))
      echo Left Shift of a is $leftshift

      rightshift=$(( b>>1 ))
      echo Right Shift of b is $rightshift
      ```

#### 5. File Test Operator:

- These operators are used to test a particular property of a file.
    - ***-b operator:*** This operator check whether a file is a block special file or not. It returns true if the file
      is a block special file otherwise false.
    - ***-c operator:*** This operator checks whether a file is a character special file or not. It returns true if it
      is a character special file otherwise false.
    - ***-d operator:*** This operator checks if the given directory exists or not. If it exists then operators returns
      true otherwise false.
    - ***-e operator:*** This operator checks whether the given file exists or not. If it exits this operator returns
      true otherwise false.
    - ***-r operator:*** This operator checks whether the given file has read access or not. If it has read access then
      it returns true otherwise false.
    - ***-w operator:*** This operator check whether the given file has write access or not. If it has write then it
      returns true otherwise false.
    - ***-x operator:*** This operator check whether the given file has execute access or not. If it has execute access
      then it returns true otherwise false.
    - ***-s operator:*** This operator checks the size of the given file. If the size of given file is greater than 0
      then it returns true otherwise it is false.
    - ![009](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Shell_Scripting/Shell_Scripting_Notes_images/009.png)
      ```shell
      #!/bin/bash

      #reading data from the user
      read -p 'Enter file name : ' FileName

      if [ -e $FileName ]
      then
          echo File Exist
      else
          echo File doesnot exist
      fi

      if [ -s $FileName ]
      then
          echo The given file is not empty.
      else
          echo The given file is empty.
      fi

      if [ -r $FileName ]
      then
          echo The given file has read access.
      else
          echo The given file does not has read access.
      fi

      if [ -w $FileName ]
      then
          echo The given file has write access.
      else
          echo The given file does not has write access.
      fi

      if [ -x $FileName ]
      then
          echo The given file has execute access.
      else
          echo The given file does not has execute access.
      fi
      ```

### 2.4.2 Realtime Examples:

***Command:***

   ```
   ubuntu@shellscripting:~/WorkSpace/DevSecOps2024$ free -m
   
   ```

***Output:***

   ```
                  total        used        free      shared  buff/cache   available
   Mem:            3912         503        1440           0        2268        3408
   Swap:              0           0           0
   ```

***07-findMemUtilization.sh***

   ```shell
   # Shellscript to find the memory utilization of the system
   # <<'##COMMENT'
   # The script in 07-findMemUtilization.sh calculates the memory utilization by dividing
   # the used memory by the total memory. The script in 08-findMemUtil.sh calculates the
   # memory utilization by subtracting the available memory from the total memory and then
   # dividing the result by the total memory. The script in 08-findMemUtil.sh provides a
   # more accurate representation of memory utilization as it takes into account the memory
   # that is available for use by the system.
   # ##COMMENT
   
   #!/bin/bash
   Available_Mem=$(free -m | grep Mem | awk '{print $7}')
   Total_Mem=$(free -m | grep Mem | awk '{print $2}')
   Used_Mem=$(free -m | grep Mem | awk '{print $3}')
   Mem_Utilization=$(echo "scale=2; $Used_Mem/$Total_Mem*100" | bc)
   echo "Available Memory: $Available_Mem MB"
   echo "Total Memory: $Total_Mem MB"
   echo "Used Memory: $Used_Mem MB"
   echo "Memory Utilization: $Mem_Utilization %"
   if [ $(echo "$Mem_Utilization > 90" | bc) -eq 1 ]; then
       echo "Memory utilization is high"
   else
       echo "Memory utilization is normal"
   fi
   ```

***08-findMemUtil.sh***

   ```shell
   #!/bin/bash
   # Script to find the memory utilization of the system
   # <<'##COMMENT'
   # The script in 08-findMemUtil.sh calculates the memory utilization by subtracting the
   # available memory from the total memory and then dividing the result by the total memory.
   # The script in 08-findMemUtil.sh provides a more accurate representation of memory
   # utilization as it takes into account the memory that is available for use by the system.
   # ##COMMENT
   
   Total_Mem=$(free -m | grep Mem | awk '{print $2}')
   Total_Available_Mem=$(free -m | grep Mem | awk '{print $7}')
   Used_Mem=$(($Total_Mem - $Total_Available_Mem))
   Mem_Utilization=$(echo "scale=2; $Used_Mem/$Total_Mem*100" | bc)
   echo "Total Memory: $Total_Mem MB"
   echo "Available Memory: $Total_Available_Mem MB"
   echo "Used Memory: $Used_Mem MB"
   echo "Memory Utilization: $Mem_Utilization %"
   if [ $(echo "$Mem_Utilization > 90" | bc) -eq 1 ]; then
       echo "Memory utilization is high"
   else
       echo "Memory utilization is normal"
   fi
   ```

### 2.4.3 Configuring Slack Webhook for alerts:

- Go to slack > Apps > Incomming Webhooks > Add to slack > Select Channel > hook-link-created > copy link
  ```
  https://hooks.slack.com/services/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
  
  ```
- We need to test the above webhook with curl.  
  ***Command:***
  ```
  curl -X POST -H 'Content-type: application/json' --data '{"text": "TEST ALERT"}'  https://hooks.slack.com/services/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
  curl -X POST -H 'Content-type: application/json' --data '{"text": "TEST 1 2 3"}'  https://hooks.slack.com/services/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
  ```
- Now after using above curl command
  ![002](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Shell_Scripting/Shell_Scripting_Notes_images/002.png)
- Now we will integrate this in Script for Memory Notification  
  ***11-MemUtilSlackNotify.sh***
  ```shell
  #!/bin/bash
  # Script to find the memory utilization of the system
  WebHook='https://hooks.slack.com/services/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'
  Total_Mem=$(free -m | grep Mem | awk '{print $2}')
  Available_Mem=$(free -m | grep Mem | awk '{print $7}')
  Used_Mem=$(($Total_Mem - $Available_Mem))
  Mem_Utilization=$(echo "scale=2; $Used_Mem/$Total_Mem*100" | bc)
  echo "Total Memory: $Total_Mem MB"
  echo "Available Memory: $Available_Mem MB"
  echo "Used Memory: $Used_Mem MB"
  echo "Memory Utilization: $Mem_Utilization %"
  if [ $(echo "$Mem_Utilization > 90" | bc) -eq 1 ]; then
      echo "Memory utilization is high"
      curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"Memory utilization is high. Memory Utilization: $Mem_Utilization %\"}" $WebHook
      curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Memory utilization is high. Memory Utilization: $Mem_Utilization %\"}" >>/dev/null
  else
      echo "Memory utilization is normal"
  fi
  ```
- memtester will be used to test  
  ***Command:***
  ```
  ubuntu@shellscripting:~$ sudo memtester 3500
  
  ```
  ***Output:***
  ```
  memtester version 4.6.0 (64-bit)
  Copyright (C) 2001-2020 Charles Cazabon.
  Licensed under the GNU General Public License version 2 (only).
  
  pagesize is 4096
  pagesizemask is 0xfffffffffffff000
  want 3500MB (3670016000 bytes)
  got  3500MB (3670016000 bytes), trying mlock ...locked.
  Loop 1:
    Stuck Address       : ok
    Random Value        : ok
    Compare XOR         : ok
    Compare SUB         : ok
    Compare MUL         : ok
    Compare DIV         : ok
    Compare OR          : ok
    Compare AND         : ok
    Sequential Increment: ok
    Solid Bits          : testing  28
  ```
- Here you can see the alert notification for memory high.
- Now Execute the above code to get notification.
  ![003](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Shell_Scripting/Shell_Scripting_Notes_images/003.png)
- To get the ec2 ip address automatically we can configure it as below.
- Right click on Instance > Instance Settings > Modify metadata options >
  ![004](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Shell_Scripting/Shell_Scripting_Notes_images/004.png)
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ curl http://169.254.169.254/latest/meta-data
  
  ```
  ***Output:***
  ```
  ami-id
  ami-launch-index
  ami-manifest-path
  block-device-mapping/
  events/
  hostname
  identity-credentials/
  instance-action
  instance-id
  instance-life-cycle
  instance-type
  local-hostname
  local-ipv4
  mac
  metrics/
  network/
  placement/
  profile
  public-hostname
  public-ipv4
  public-keys/
  reservation-id
  security-groups
  services/
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ curl http://169.254.169.254/latest/meta-data/local-hostname

  ```
  ***Output:***
  ```
  ip-10-1-1-37.ec2.internal

  ```
- Update the hostname details in the code.  
  ***11-MemUtilSlackNotify.sh***
  ```shell
  #!/bin/bash
  # Script to find the memory utilization of the system
  WebHook='https://hooks.slack.com/services/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'
  HostName=$(curl -sL http://169.254.169.254/latest/meta-data/local-hostname)
  Total_Mem=$(free -m | grep Mem | awk '{print $2}')
  Available_Mem=$(free -m | grep Mem | awk '{print $7}')
  Used_Mem=$(($Total_Mem - $Available_Mem))
  Mem_Utilization=$(echo "scale=2; $Used_Mem/$Total_Mem*100" | bc)
  echo "Total Memory of $HostName: $Total_Mem MB"
  echo "Available Memory of $HostName: $Available_Mem MB"
  echo "Used Memory of $HostName: $Used_Mem MB"
  echo "Memory Utilization of $HostName: $Mem_Utilization %"
  if [ $(echo "$Mem_Utilization > 90" | bc) -eq 1 ]; then
      echo "Memory utilization is high of $HostName"
      curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"Memory utilization of $HostName is high. Memory Utilization of $HostName: $Mem_Utilization %\"}" $WebHook
      curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"Memory utilization of $HostName is high. Memory Utilization of $HostName: $Mem_Utilization %\"}" >>/dev/null
  else
      echo "Memory utilization is normal of $HostName"
  fi
  ```
- Configuring this code in the crontab to run every minute or every 5 minutes
  ```
  * * * * * sudo bash /PATH/11-MemUtilSlackNotify.sh

  or
  
  */5 * * * * sudo bash /PATH/11-MemUtilSlackNotify.sh
  ```
- for crontab queries reach crontab guru ```https://crontab.guru```
- Now Boolean Operators  
  ![005](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Shell_Scripting/Shell_Scripting_Notes_images/005.png)
- Now we will weite an example for ```$?```  
  ***12-NginxStatus.sh***
  ```shell
  # Script to check nginx status and start nginx if it is not running
  systemctl status nginx --no-pager | grep "Active: active (running)" >>/dev/null
  if [ $? -ne 0 ]; then
      systemctl start nginx
      echo "Nginx is not running. Started Nginx !!!"
  else
      echo "Nginx is alredy running on the server and the status is active !!!"
  fi
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ ./12-NginxStatus.sh 
  
  ```
  ***Output:***
  ```
  Nginx is alredy running on the server and the status is active !!!
  
  ```
- Now we will write an example for ```$#, $@, $*```  
  ***13-ListVPCsParRegions.sh***
  ```shell
  #!/bin/bash
  # Script to list VPCs in all given parameters regions
  # For Debugging uncomment the below line
  # set -x
  if [ $# -eq 0 ]; then
      # If no arguments are provided to the script
      echo "you have provided $# regions"
      echo "Please provide the region names as arguments to the script"
      exit 1
  else
      echo "you have provided $# regions"
      # you use $* instead of $@ both will give the same output
      for region in $@; do
          echo "=============================="
          echo "VPCs in region $region"
          aws ec2 describe-vpcs --region $region --query "Vpcs[*].VpcId" --output text
          echo "=============================="
      done
  fi
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ ./13-ListVPCsParRegions.sh us-east-1 us-east-2 us-west-1 us-west-2
  
  ```
  ***Outout:***
  ```
  you have provided 4 regions
  ==============================
  VPCs in region us-east-1
  vpc-02b48296aa54f91c7
  ==============================
  ==============================
  VPCs in region us-east-2
  vpc-0c291bff74ff23073
  ==============================
  ==============================
  VPCs in region us-west-1
  vpc-0b7c13d6119f67226
  ==============================
  ==============================
  VPCs in region us-west-2
  vpc-08815e8601b5dfb89
  ==============================
  ```

## 2.5. Output Redirections:

- These are the assigned numbers for outputs in shell Stdin ```0```, Stdout ```1```, Stderr ```2```
- ```>, >>, 1>, 2>, 2>&1``` are the redirections used after the command to redirect the outputs/errors.  
  ***Tee Command:***
    - without appending.
      ```
      $ date | tee /tmp/tee
      Thu Sep 12 19:51:00 UTC 2024
      $ date | tee /tmp/tee
      Thu Sep 12 19:51:05 UTC 2024
      $ date | tee /tmp/tee
      Thu Sep 12 19:51:06 UTC 2024
      $ cat /tmp/tee
      Thu Sep 12 19:51:06 UTC 2024
      ```
    - with appending
      ```
      $ date | tee -a /tmp/tee
      Thu Sep 12 19:54:11 UTC 2024
      $ date | tee -a /tmp/tee
      Thu Sep 12 19:54:14 UTC 2024
      $ cat /tmp/tee
      Thu Sep 12 19:51:06 UTC 2024
      Thu Sep 12 19:54:11 UTC 2024
      Thu Sep 12 19:54:14 UTC 2024
      ```

## 2.6 Shell Arrays:

***14-Shellarray.sh***

   ```shell
   #!/bin/bash
   # Shell array to check the ip address of the given domain names
   ipaddress=()
   for domain in $@; do
       ipaddress+=($(dig +short $domain))
   done
   echo "The IP address of the given domain names are: ${ipaddress[@]}"
   # Run the script with the below command
   # ./14-Shellarray.sh google.com yahoo.com facebook.com github.com twitter.com linkedin.com
   for ip in ${ipaddress[@]}; do
       echo "The IP address is: $ip"
   done
   for ((i = 0; i < ${#ipaddress[@]}; i++)); do
       echo "The IP address of $i: ${ipaddress[$i]}"
   done
   
   for ip in ${ipaddress[@]}; do
       echo "Testing connectivity for: $ip"
       timeout 1 ping -c 1 $ip >>/dev/null
       timeout 2 telnet $ip 80 >>/dev/null
   done
   ```

***15-shell-IP-Array.sh***

   ```shell
   #!/bin/bash
   # Shell array to telnet the ip address of the given IP addresses
   ipaddress=('142.251.16.102' '142.251.16.138' '142.251.16.100' '142.251.16.101' '20.21.22.21')
   for ip in ${ipaddress[@]}; do
       echo "Testing ping connectivity for: $ip"
       timeout 1 ping -c 1 $ip 2>&1 | grep "64 bytes"
       echo "Testing telnet connectivity for: $ip"
       timeout 2 telnet $ip 80 2>&1 | grep "Connected to"
   done
   ```

***16-shellArrayNetcat.sh***

   ```shell
   #!/bin/bash
   # Shell array to netcat the ip address of the given IP addresses
   ipaddress=('142.251.16.102' '142.251.16.138' '142.251.16.100' '142.251.16.101' '20.21.22.21')
   for ip in ${ipaddress[@]}; do
       echo "Testing ping connectivity for: $ip"
       timeout 2 netcat -z -n -v $ip 80 2>&1 | grep succeeded >>/tmp/netcat_success.log || echo "Failed to connect to $ip" >>/tmp/netcat_failed.log
   done
   echo "-------success--------"
   cat /tmp/netcat_success.log | cut -d " " -f 3
   echo "-------failed--------"
   cat /tmp/netcat_failed.log | cut -d " " -f 5
   sleep 10
   rm -f /tmp/netcat_success.log /tmp/netcat_failed.log
   ```

***16-Command:***

   ```
   ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ ./16-shellArrayNetcat.sh
   
   ```

***16-Output:***

   ```
   Testing ping connectivity for: 142.251.16.102
   Testing ping connectivity for: 142.251.16.138
   Testing ping connectivity for: 142.251.16.100
   Testing ping connectivity for: 142.251.16.101
   Testing ping connectivity for: 20.21.22.21
   -------success--------
   142.251.16.102
   142.251.16.138
   142.251.16.100
   142.251.16.101
   -------failed--------
   20.21.22.21
   ```

## 2.6. User Automation:

   ```
   sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
   
   sed -i "57 s/.*PasswordAuthentication.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config
   
   ```

***18-userAutomation.sh***

   ```shell
   # Check if user exist and if not create it, generate random password and assign it to the user.
   # expire the password and force the user to change it on first login
   # Make sure user is in the sudo group
   #!/bin/bash
   WebHook='https://hooks.slack.com/services/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'
   #USER=$1
   if [ $# -gt 0 ]; then
       for USER in $@; do
           EXISTING_USER=$(sudo cat /etc/passwd | grep -i -w $USER | cut -d ":" -f 1)
           if [ "${EXISTING_USER}" = "${USER}" ]; then
               echo "User $USER already exists try another username"
           else
               echo "User $USER does not exist, creating user"
               sudo useradd -m -s /bin/bash $USER -d /home/$USER
               sudo usermod -aG sudo $USER
               sudo echo "$USER ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers
               specialChar=$(echo '!@#$%^&*()_+=' | fold -w1 | shuf | head -c1)
               PASSWORD="India@$(date +%Y)${specialChar}"
               echo "$USER:$PASSWORD" | sudo chpasswd
               sudo passwd -e $USER
               echo "The password for $USER is $PASSWORD"
               curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"User: $USER has been created with password: $PASSWORD reset password immediately\"}" >>/dev/null
   
           fi
       done
   else
       echo "you have given $# arguments, please provide at least one argument"
   fi
   ```

***Output:***

   ```
   ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ sudo ./18-userAutomation.sh omen1 omen2 omen3
   
   ```

   ```
   User omen1 does not exist, creating user
   passwd: password changed.
   The password for omen1 is India@2024=
   User omen2 does not exist, creating user
   passwd: password changed.
   The password for omen2 is India@2024$
   User omen3 does not exist, creating user
   passwd: password changed.
   The password for omen3 is India@2024(
   ```

![010](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Shell_Scripting/Shell_Scripting_Notes_images/010.png)

## 2.7. Regular Expressions in SHELL:

- Refer below lionk for any quireies
  ```
  https://www3.ntu.edu.sg/home/ehchua/programming/howto/Regexe.html
  
  ```
  ***Meta-characters:***
    - matches a character
      ```
      . (dot): ANY ONE character except newline. Same as [^\n]
      \d, \D: ANY ONE digit/non-digit character. Digits are [0-9]
      \w, \W: ANY ONE word/non-word character. For ASCII, word characters are [a-zA-Z0-9_]
      \s, \S: ANY ONE space/non-space character. For ASCII, whitespace characters are [ \n\r\t\f]
      ```
  ***Position Anchors:****
    - does not match character, but position such as start-of-line, end-of-line, start-of-word and end-of-word.
      ```
      ^, $: start-of-line and end-of-line respectively. E.g., ^[0-9]$ matches a numeric string.
      \b: boundary of word, i.e., start-of-word or end-of-word. E.g., \bcat\b matches the word "cat" in the input string.
      \B: Inverse of \b, i.e., non-start-of-word or non-end-of-word.
      \<, \>: start-of-word and end-of-word respectively, similar to \b. E.g., \<cat\> matches the word "cat" in the input string.
      \A, \Z: start-of-input and end-of-input respectively.
      ```
      ***20-userAutoRegEx.sh***
      ```shell
      # Check if user exist and if not create it, generate random password and assign it to the user.
      # expire the password and force the user to change it on first login
      # Make sure user is in the sudo group
      #!/bin/bash
      WebHook='https://hooks.slack.com/services/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'
      #USER=$1
      if [ $# -gt 0 ]; then
          for USER in $@; do
              if [[ $USER =~ ^[a-z][a-z][a-z][a-z][0-9][0-9][0-9][0-9]$ ]]; then
                  EXISTING_USER=$(sudo cat /etc/passwd | grep -i -w $USER | cut -d ":" -f 1)
                  if [ "${EXISTING_USER}" = "${USER}" ]; then
                      echo "User $USER already exists try another username"
                  else
                      echo "User $USER does not exist, creating user"
                      sudo useradd -m -s /bin/bash $USER -d /home/$USER
                      sudo usermod -aG sudo $USER
                      sudo echo "$USER ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers
                      specialChar=$(echo '!@#$%^&*()_+=' | fold -w1 | shuf | head -c1)
                      PASSWORD="India@$(date +%Y)${specialChar}"
                      echo "$USER:$PASSWORD" | sudo chpasswd
                      sudo passwd -e $USER
                      echo "The password for $USER is $PASSWORD"
                      curl -X POST $WebHook -sL -H 'Content-type: application/json' --data "{\"text\":\"User: $USER has been created with password: $PASSWORD reset password immediately\"}" >>/dev/null

                  fi
              else
                  echo "Username $USER is invalid, please provide a valid username with 4 alphabets and 4 digits e.g. abcd1234"
              fi
          done
      else
          echo "you have given $# arguments, please provide at least one argument"
      fi
      ```
      ***Command:***
      ```
      ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ ./20-userAutoRegEx.sh anilkumar

      ```
      ***Output:***
      ```
      Username anilkumar is invalid, please provide a valid username with 4 alphabets and 4 digits e.g. abcd1234

      ```
      ***Command:***
      ```
      ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ ./20-userAutoRegEx.sh anil1151 anil8088

      ```
      ***Output:***
      ```
      User anil1151 does not exist, creating user
      ./20-userAutoRegEx.sh: line 17: /etc/sudoers: Permission denied
      passwd: password changed.
      The password for anil1151 is India@2024=
      User anil8088 does not exist, creating user
      ./20-userAutoRegEx.sh: line 17: /etc/sudoers: Permission denied
      passwd: password changed.
      The password for anil8088 is India@2024)
      ```
      ![011](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/Shell_Scripting/Shell_Scripting_Notes_images/011.png)

## 2.8. Functions in Shell:

- Suntax of the function in shell script.  
  ***Function Syntax:***
  ```shell
  # Functions in Shell Scripting
  #!/bin/bash
  
  # Functions-syntax 1
  function_name() {
      # commands
  }

  # Calling a function
  hello
  
  # Functions-syntax 1 Example
  hello() {
      echo "Hello World"
  }
  
  # Functions-syntax 2
  function function_name {
      # commands
  }
  
  # Functions-syntax 2 Example
  function hello {
      echo "Hello World"
  }
  
  # Calling a function
  hello  
  ```
  ***22-FunctionSample.sh***
  ```shell
  # Simple Function Sample
  #!/bin/bash
  # Declaring a function
  function hello {
      echo "I am from hello function"
  }
  # Declaring a function
  hello1() {
      echo "I am from hello1 function"
  }
  
  # Calling a function
  hello
  hello1
  # Note: The function name should be unique in the script.
  # Note: The function will not execute until it is called.
  ```
  ***Output:***
  ```
  $ ./22-FunctionSample.sh 
  I am from hello function
  I am from hello1 function
  ```
  ***23-FunctionwithAWS.sh***
  ```shell
  # Using functions in AWS CLI
  #!/bin/bash
  regions=$(aws ec2 describe-regions --query 'Regions[].RegionName' --output text)
  function get_instance_id {
      for region in $regions; do
          instance_id=$(aws ec2 describe-instances --region $region --query 'Reservations[].Instances[].InstanceId' --output text)
          echo "Instance ID in $region is $instance_id"
      done
  }
  function get_vpc_id {
      for region in $regions; do
          vpc_id=$(aws ec2 describe-vpcs --region $region --query 'Vpcs[].VpcId' --output text)
          echo "VPC ID in $region is $vpc_id"
      done
  }
  # Calling a function
  get_vpc_id
  get_instance_id
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ ./23-FunctionwithAWS.sh
  
  ```
  ***Output:***
  ```
  VPC ID in ap-south-1 is vpc-0471febd7c5844ce8
  VPC ID in eu-north-1 is vpc-0b93e9e809362000a
  VPC ID in eu-west-3 is vpc-0506d62bec218afc9
  VPC ID in eu-west-2 is vpc-0c2b4827dc0683349
  VPC ID in eu-west-1 is vpc-07aab6270e86f86b8
  VPC ID in ap-northeast-3 is vpc-0fcab97bb3e74e44b
  VPC ID in ap-northeast-2 is vpc-04e8052d89bc16231
  VPC ID in ap-northeast-1 is vpc-0eec83afeda89edae
  VPC ID in ca-central-1 is vpc-0181d58473b9af32b
  VPC ID in sa-east-1 is vpc-09333555a54eb07c7
  VPC ID in ap-southeast-1 is vpc-0ac23815b1a3bd722
  VPC ID in ap-southeast-2 is vpc-0cc729daba17f34c2
  VPC ID in eu-central-1 is vpc-0c804487de4885a6c
  VPC ID in us-east-1 is vpc-02b48296aa54f91c7
  VPC ID in us-east-2 is vpc-0c291bff74ff23073
  VPC ID in us-west-1 is vpc-0b7c13d6119f67226
  VPC ID in us-west-2 is vpc-08815e8601b5dfb89
  Instance ID in ap-south-1 is 
  Instance ID in eu-north-1 is 
  Instance ID in eu-west-3 is 
  Instance ID in eu-west-2 is 
  Instance ID in eu-west-1 is 
  Instance ID in ap-northeast-3 is 
  Instance ID in ap-northeast-2 is 
  Instance ID in ap-northeast-1 is 
  Instance ID in ca-central-1 is 
  Instance ID in sa-east-1 is 
  Instance ID in ap-southeast-1 is 
  Instance ID in ap-southeast-2 is 
  Instance ID in eu-central-1 is 
  Instance ID in us-east-1 is i-07ce1361e3fde8c05
  Instance ID in us-east-2 is 
  Instance ID in us-west-1 is 
  Instance ID in us-west-2 is
  ```
  ***24-ShellFuncDelVols.sh***
  ```shell
  # Shell Function to delete volumes size lessthan than 10GB and unattached volumes
  ##!/bin/bash
  regions=$(aws ec2 describe-regions --query 'Regions[].RegionName' --output text)
  function delete_volumes {
      for region in $regions; do
          volume_ids=$(aws ec2 describe-volumes --region $region --query 'Volumes[?Size<`10` && Attachments[0].State==`null`].VolumeId' --output text)
          for volume_id in $volume_ids; do
              aws ec2 delete-volume --region $region --volume-id $volume_id
              echo "Volume $volume_id deleted in $region"
          done
      done
  }
  
  # Calling a function
  delete_volumes
  ```
  ***25-FunDelVol.sh***
  ```shell
  # Function to delete the volumes in given region which are unattached.
  # #!/bin/bash
  function delete_unattached_volumes {
      volume_ids=$(aws ec2 describe-volumes --region us-east-1 | jq ".Volumes[].VolumeId" -r)
      for volume_id in $volume_ids; do
          volume_state=$(aws ec2 describe-volumes --region us-east-1 --volume-ids $volume_id | jq ".Volumes[].State" -r)
          volume_size=$(aws ec2 describe-volumes --region us-east-1 --volume-ids $volume_id | jq ".Volumes[].Size" -r)
          if [ $volume_state == "available" ] && [ $volume_size -gt 10 ]; then
              aws ec2 delete-volume --region us-east-1 --volume-id $volume_id
              echo "Volume $volume_id deleted in us-east-1"
          else
              echo "Volume $volume_id is attached or size is less than 10GB"
          fi
      done
  }
  
  # Calling a function
  delete_unattached_volumes
  ```
  ***26-FunDevVolallRegions.sh***
  ```shell
  # Deleting the volumes in all regions which are unattached.
  #!/bin/bash
  function delete_unattached_volumes {
      regions=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
      for region in $regions; do
          volume_ids=$(aws ec2 describe-volumes --region $region | jq ".Volumes[].VolumeId" -r)
          if [ -z "$volume_ids" ]; then
              echo "No volumes found in $region"
          else
              for volume_id in $volume_ids; do
                  volume_state=$(aws ec2 describe-volumes --region $region --volume-ids $volume_id | jq ".Volumes[].State" -r)
                  volume_size=$(aws ec2 describe-volumes --region $region --volume-ids $volume_id | jq ".Volumes[].Size" -r)
                  if [ $volume_state == "available" ]; then
                      aws ec2 delete-volume --region $region --volume-id $volume_id
                      echo "Volume $volume_id deleted in $region"
                  else
                      echo "Volume $volume_id is attached"
                  fi
              done
          fi
      done
  }
  
  # Calling a function
  delete_unattached_volumes
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ ./27-MultiFunDevVolallRegions.sh
  
  ```
  ***Output:***
  ```
  No volumes found in ap-south-1
  No volumes found in eu-north-1
  No volumes found in eu-west-3
  No volumes found in eu-west-2
  No volumes found in eu-west-1
  No volumes found in ap-northeast-3
  No volumes found in ap-northeast-2
  No volumes found in ap-northeast-1
  No volumes found in ca-central-1
  No volumes found in sa-east-1
  No volumes found in ap-southeast-1
  No volumes found in ap-southeast-2
  No volumes found in eu-central-1
  Volume vol-0243f54184411dae7 deleted in us-east-1
  Volume vol-0e1385f3769a275e8 deleted in us-east-1
  Volume vol-07edf587d1c17d7d6 deleted in us-east-1
  Volume vol-02a37f29b6e4c05ee is attached
  No volumes found in us-east-2
  No volumes found in us-west-1
  No volumes found in us-west-2
  ```
  ***27-MultiFunDevVolallRegions.sh***
  ```shell
  # Deleting the volumes in all regions which are unattached.
  #!/bin/bash
  function delete_unattached_volumes {
      # Getting the regions
  
      volume_ids=$(aws ec2 describe-volumes --region $region | jq ".Volumes[].VolumeId" -r)
      # Checking if volumes are present in the region or not
  
      if [ -z "$volume_ids" ]; then
          echo "No volumes found in $region"
      else
  
          # Looping through the volumes to check if they are unattached
          for volume_id in $volume_ids; do
  
              # Getting the state and size of the volume to check if it is unattached
              volume_state=$(aws ec2 describe-volumes --region $region --volume-ids $volume_id | jq ".Volumes[].State" -r)
              volume_size=$(aws ec2 describe-volumes --region $region --volume-ids $volume_id | jq ".Volumes[].Size" -r)
  
              # Checking if the volume is unattached
              if [ $volume_state == "available" ]; then
  
                  # Deleting the volume if it is unattached
                  aws ec2 delete-volume --region $region --volume-id $volume_id
                  echo "Volume $volume_id deleted in $region"
              else
                  echo "Volume $volume_id is attached"
              fi
          done
      fi
  }
  
  # Getting the regions and looping through them to delete the unattached volumes
  regions=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
  for region in $regions; do
  
      # Calling a function
      delete_unattached_volumes
  done
  ```
  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ ./27-MultiFunDevVolallRegions.sh
  
  ```
  ***Output:***
  ```
  No volumes found in ap-south-1
  No volumes found in eu-north-1
  No volumes found in eu-west-3
  No volumes found in eu-west-2
  No volumes found in eu-west-1
  No volumes found in ap-northeast-3
  No volumes found in ap-northeast-2
  No volumes found in ap-northeast-1
  No volumes found in ca-central-1
  No volumes found in sa-east-1
  No volumes found in ap-southeast-1
  No volumes found in ap-southeast-2
  No volumes found in eu-central-1
  Volume vol-0243f54184411dae7 deleted in us-east-1
  Volume vol-0e1385f3769a275e8 deleted in us-east-1
  Volume vol-07edf587d1c17d7d6 deleted in us-east-1
  Volume vol-02a37f29b6e4c05ee is attached
  No volumes found in us-east-2
  No volumes found in us-west-1
  No volumes found in us-west-2
  ```
  ***28-multifunction.sh***
  ```shell
  # Shell multi-function library
  #!/bin/bash
  # Function to list subnets , security groups and route tables in a VPC for all Regions
  function list_subnets {
      subnets=$(aws ec2 describe-subnets --region $region --filters "Name=vpc-id,Values=$vpc" | jq ".Subnets[].SubnetId" -r)
      for subnet in $subnets; do
          echo SubnetId: $subnet in VpcId: $vpc
      done
  }
  
  function list_route_tables {
      route_tables=$(aws ec2 describe-route-tables --region $region --filters "Name=vpc-id,Values=$vpc" | jq ".RouteTables[].RouteTableId" -r)
      for route_table in $route_tables; do
          echo RouteTableId: $route_table in VpcId: $vpc
      done
  }
  
  function list_security_groups {
      security_groups=$(aws ec2 describe-security-groups --region $region --filters "Name=vpc-id,Values=$vpc" | jq ".SecurityGroups[].GroupId" -r)
      for security_group in $security_groups; do
          echo SecurityGroupId: $security_group in VpcId: $vpc
      done
  }
  
  function list_vpcs {
      vpcs=$(aws ec2 describe-vpcs --region $region | jq ".Vpcs[].VpcId" -r)
      for vpc in $vpcs; do
          echo VpcId: $vpc in Region: $region
          list_subnets
          list_route_tables
          list_security_groups
      done
  }
  
  function list_regions {
      regions=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
      for region in $regions; do
          list_vpcs
      done
  }
  
  # Calling the function
  list_regions
  
  ```

  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ ./28-multifunction.sh
  
  ```
  ***Output:***
  ```
  VpcId: vpc-02b48296aa54f91c7 in Region: us-east-1
  SubnetId: subnet-03c95872f5e38a8c1 in VpcId: vpc-02b48296aa54f91c7
  SubnetId: subnet-0e4d6ca11f2d62b8b in VpcId: vpc-02b48296aa54f91c7
  SubnetId: subnet-0b3aa2bed30ad06ea in VpcId: vpc-02b48296aa54f91c7
  SubnetId: subnet-0c77ec3d99f5cc89b in VpcId: vpc-02b48296aa54f91c7
  SubnetId: subnet-02430457b816e9dfb in VpcId: vpc-02b48296aa54f91c7
  SubnetId: subnet-092824e416696e1aa in VpcId: vpc-02b48296aa54f91c7
  RouteTableId: rtb-0e70802970027889b in VpcId: vpc-02b48296aa54f91c7
  RouteTableId: rtb-0b07648f082a69a8c in VpcId: vpc-02b48296aa54f91c7
  RouteTableId: rtb-0c47e411130d0e6c0 in VpcId: vpc-02b48296aa54f91c7
  RouteTableId: rtb-0c001b523edbf8012 in VpcId: vpc-02b48296aa54f91c7
  RouteTableId: rtb-05f68a4991fbd0ee1 in VpcId: vpc-02b48296aa54f91c7
  SecurityGroupId: sg-0fd659c576b871936 in VpcId: vpc-02b48296aa54f91c7
  .
  .
  LIKE WISE IT WILL LIST  IN ALL REGIONS
  ```
  ***29-break-continue.sh***
  ```shell
  # Listing VPCs in given regions and if region is not valid then skipping the region and moving to next region by using continue statement.
  #!/bin/bash
  
  # Function to list VPCs in all regions
  aws_regions=(us-east-1 us-east-2 hyd-india-1 eu-north-1 ap-south-1 eu-west-3 eu-west-2 eu-west-1 ap-northeast-2)
  #aws_regions=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
  # Function to list VPCs in all regions
  function list_vpcs {
  
      # Getting the VPCs in the region
      vpcs=$(aws ec2 describe-vpcs --region $region | jq ".Vpcs[].VpcId" -r)
  
      # Checking if VPCs are present in the region or not
      if [ ${#vpcs[@]} -eq 0 ]; then
          echo "No VPCs found in $region region continue to next region"
  
          # Skipping the region if no VPCs are present
          # continue
  
          # Breaking the loop if no VPCs are present
          # break
      else
  
          # Looping through the VPCs to list them
          for vpc in $vpcs; do
              echo VpcId: $vpc in Region: $region
          done
  
      fi
  }
  
  # Function to list VPCs in all regions
  function list_regions {
      #aws_regions=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
      # Looping through the regions
      for region in ${aws_regions[@]}; do
  
          echo Checking vpcs in Region: $region
  
          # Calling the function to list VPCs
          list_vpcs
      done
  }
  
  # Calling the function
  list_regions
  ```

  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ ./29-break-continue.sh
  ```
  ***Output:***
  ```
  Checking vpcs in Region: us-east-1
  VpcId: vpc-02b48296aa54f91c7 in Region: us-east-1
  Checking vpcs in Region: us-east-2
  VpcId: vpc-0c291bff74ff23073 in Region: us-east-2
  Checking vpcs in Region: hyd-india-1
  
  Could not connect to the endpoint URL: "https://ec2.hyd-india-1.amazonaws.com/"
  Checking vpcs in Region: eu-north-1
  VpcId: vpc-0b93e9e809362000a in Region: eu-north-1
  Checking vpcs in Region: ap-south-1
  VpcId: vpc-0471febd7c5844ce8 in Region: ap-south-1
  Checking vpcs in Region: eu-west-3
  VpcId: vpc-0506d62bec218afc9 in Region: eu-west-3
  Checking vpcs in Region: eu-west-2
  VpcId: vpc-0c2b4827dc0683349 in Region: eu-west-2
  Checking vpcs in Region: eu-west-1
  VpcId: vpc-07aab6270e86f86b8 in Region: eu-west-1
  Checking vpcs in Region: ap-northeast-2
  VpcId: vpc-04e8052d89bc16231 in Region: ap-northeast-
  ```
  ***30-break.sh***
  ```shell
  # listing all availability zones in all regions and if region is not valid then skipping the region and moving to next region by using continue statement.
  # if availability zone is us-east-1* then breaking the loop and moving to next region by using break statement.
  # #!/bin/bash
  aws_regions=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
  # Function to list availability zones in all regions
  
  function list_azs {
  
      # Getting the availability zones in the region
      azs=$(aws ec2 describe-availability-zones --region $region | jq ".AvailabilityZones[].ZoneName" -r)
  
      # Checking if availability zones are present in the region or not
      if [ ${#azs[@]} -eq 0 ]; then
          echo "No Availability Zones found in $region region continue to next region"
  
      else
  
          # Looping through the availability zones to list them
          for az in $azs; do
              echo AvailabilityZone in Region: $region is $az
  
              # Breaking the loop if availability zone is us-east-1*
              if [[ $az == us-east-1a ]]; then
                  echo "Breaking the loop as availability zone is $az"
                  break
              fi
          done
  
      fi
  }
  
  function list_regions {
      # Looping through the regions
      for region in ${aws_regions[@]}; do
  
          echo Checking Availability Zones in Region: $region
  
          # Calling the function to list availability zones
          list_azs
      done
  }
  
  # Calling the function
  list_regions
  
  ```

  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ ./30-break.sh 
  ```
  ***Output:***
  ```
  Checking Availability Zones in Region: ap-south-1
  AvailabilityZone in Region: ap-south-1 is ap-south-1a
  AvailabilityZone in Region: ap-south-1 is ap-south-1b
  AvailabilityZone in Region: ap-south-1 is ap-south-1c
  Checking Availability Zones in Region: eu-north-1
  AvailabilityZone in Region: eu-north-1 is eu-north-1a
  AvailabilityZone in Region: eu-north-1 is eu-north-1b
  AvailabilityZone in Region: eu-north-1 is eu-north-1c
  Checking Availability Zones in Region: eu-west-3
  AvailabilityZone in Region: eu-west-3 is eu-west-3a
  AvailabilityZone in Region: eu-west-3 is eu-west-3b
  AvailabilityZone in Region: eu-west-3 is eu-west-3c
  Checking Availability Zones in Region: eu-west-2
  AvailabilityZone in Region: eu-west-2 is eu-west-2a
  AvailabilityZone in Region: eu-west-2 is eu-west-2b
  AvailabilityZone in Region: eu-west-2 is eu-west-2c
  Checking Availability Zones in Region: eu-west-1
  AvailabilityZone in Region: eu-west-1 is eu-west-1a
  AvailabilityZone in Region: eu-west-1 is eu-west-1b
  AvailabilityZone in Region: eu-west-1 is eu-west-1c
  Checking Availability Zones in Region: ap-northeast-3
  AvailabilityZone in Region: ap-northeast-3 is ap-northeast-3a
  AvailabilityZone in Region: ap-northeast-3 is ap-northeast-3b
  AvailabilityZone in Region: ap-northeast-3 is ap-northeast-3c
  Checking Availability Zones in Region: ap-northeast-2
  AvailabilityZone in Region: ap-northeast-2 is ap-northeast-2a
  AvailabilityZone in Region: ap-northeast-2 is ap-northeast-2b
  AvailabilityZone in Region: ap-northeast-2 is ap-northeast-2c
  AvailabilityZone in Region: ap-northeast-2 is ap-northeast-2d
  Checking Availability Zones in Region: ap-northeast-1
  AvailabilityZone in Region: ap-northeast-1 is ap-northeast-1a
  AvailabilityZone in Region: ap-northeast-1 is ap-northeast-1c
  AvailabilityZone in Region: ap-northeast-1 is ap-northeast-1d
  Checking Availability Zones in Region: ca-central-1
  AvailabilityZone in Region: ca-central-1 is ca-central-1a
  AvailabilityZone in Region: ca-central-1 is ca-central-1b
  AvailabilityZone in Region: ca-central-1 is ca-central-1d
  Checking Availability Zones in Region: sa-east-1
  AvailabilityZone in Region: sa-east-1 is sa-east-1a
  AvailabilityZone in Region: sa-east-1 is sa-east-1b
  AvailabilityZone in Region: sa-east-1 is sa-east-1c
  Checking Availability Zones in Region: ap-southeast-1
  AvailabilityZone in Region: ap-southeast-1 is ap-southeast-1a
  AvailabilityZone in Region: ap-southeast-1 is ap-southeast-1b
  AvailabilityZone in Region: ap-southeast-1 is ap-southeast-1c
  Checking Availability Zones in Region: ap-southeast-2
  AvailabilityZone in Region: ap-southeast-2 is ap-southeast-2a
  AvailabilityZone in Region: ap-southeast-2 is ap-southeast-2b
  AvailabilityZone in Region: ap-southeast-2 is ap-southeast-2c
  Checking Availability Zones in Region: eu-central-1
  AvailabilityZone in Region: eu-central-1 is eu-central-1a
  AvailabilityZone in Region: eu-central-1 is eu-central-1b
  AvailabilityZone in Region: eu-central-1 is eu-central-1c
  Checking Availability Zones in Region: us-east-1
  AvailabilityZone in Region: us-east-1 is us-east-1a
  Breaking the loop as availability zone is us-east-1a
  Checking Availability Zones in Region: us-east-2
  AvailabilityZone in Region: us-east-2 is us-east-2a
  AvailabilityZone in Region: us-east-2 is us-east-2b
  AvailabilityZone in Region: us-east-2 is us-east-2c
  Checking Availability Zones in Region: us-west-1
  AvailabilityZone in Region: us-west-1 is us-west-1b
  AvailabilityZone in Region: us-west-1 is us-west-1c
  Checking Availability Zones in Region: us-west-2
  AvailabilityZone in Region: us-west-2 is us-west-2a
  AvailabilityZone in Region: us-west-2 is us-west-2b
  AvailabilityZone in Region: us-west-2 is us-west-2c
  AvailabilityZone in Region: us-west-2 is us-west-2d
  ```
    - Sample Find and other commands.
  ```
  #!/bin/bash
  # regex samples
  cat ServiceTags_Public_20240909.json | jq ".values[0].properties.addressPrefixes[]" -r | grep -i "^2[0]\|^5[1-2]"
  
  cat ServiceTags_Public_20240909.json | jq ".values[0].properties.addressPrefixes[]" -r | grep -i "^2[0]"
  
  cat ServiceTags_Public_20240909.json | jq ".values[0].properties.addressPrefixes[]" -r | grep -i "^5[1-9]"
  
  cat /etc/passwd | grep -i "^h[a-o]"
  
  cat ServiceTags_Public_20240909.json | jq ".values[0].properties.addressPrefixes[]" -r | grep -i "^2[0]\|^5[1-2]" | head
  
  cat ServiceTags_Public_20240909.json | jq ".values[0].properties.addressPrefixes[]" -r | grep -i "^2[0]\|^5[1-2]" | tail
  
  cat ServiceTags_Public_20240909.json | jq ".values[0].properties.addressPrefixes[]" -r | grep -i "^2[0]"
  
  cat ServiceTags_Public_20240909.json | jq ".values[0].properties.addressPrefixes[]" -r | grep -i "^2[0]" | head
  
  cat ServiceTags_Public_20240909.json | jq ".values[0].properties.addressPrefixes[]" -r | grep -i "^2[0]" | tail
  
  #Command to fetch >30M and <40M
  find / -size +30M -size -40M
  
  #- exact 40M size
  find / -name *.zip -size 40M
  
  #- above 40M size
  find / -name *.zip -size +40M
  
  #- below 40M size
  find / -name *.zip -size -40M
  
  find / -type f -size +100M -a -size -200M -exec du -sh {} \;
  
  find / -type f -name "*.log" -exec grep '404' {} \;
  
  #https://medium.com/@nirbhaysingh281/use-of-mtime-in-linux-ef59cb175546
  #Delete files greater than size 30MB
  find . -type f -mtime +30 -delete
  find . -mtime +30 | xargs rm
  find /home/amit/log/ -mtime +30 -exec rm {} \;
  ```

  ***32-palindrome.sh***
  ```shell
  # Shell script to identify the given name and number is palindrome or not.
  #!/bin/bash
  
  string_list=$@
  
  # Function to check if the given string is palindrome or not
  function is_palindrome {
  
      # Looping through the given strings
      for string in $string_list; do
  
          # Reversing the string
          reverse_string=$(echo $string | rev)
  
          # Checking if the string is palindrome or not
          if [ $string == $reverse_string ]; then
              echo "$string is a palindrome"
          else
              echo "$string is not a palindrome"
          fi
      done
  }
  
  # Main function to check if the given string is palindrome or not
  function main {
  
      # Checking if the string is provided or not
      if [ $# -eq 0 ]; then
          echo "Please provide the string to check if it is palindrome or not"
          exit 1
      else
          echo "Checking if the given string is palindrome or not"
          is_palindrome
      fi
  }
  
  # Calling the main function
  main $@
  
  ```

  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ ./32-palindrome.sh anna madam malayalam anilkumar
  
  ```
  ***Output:***
  ```
  Checking if the given string is palindrome or not
  anna is a palindrome
  madam is a palindrome
  malayalam is a palindrome
  anilkumar is not a palindrome
  ```

  ***34-Palindrome-oldlogic.sh***
  ```shell
  # Palindrome Logic
  #!/bin/bash
  WORDS=$@
  
  # Function to check if the given string is palindrome or not
  function is_palindrome {
  
      # Looping through the given strings
      for WORD in $WORDS; do
  
          # Reversing the string
          # reverse_string=$(echo $string | rev)
  
          # Length of the word
          WORD_LEN=${#WORD}
  
          # Reversing the word
          REVERSE=''
          LENGTH=$(expr $WORD_LEN - 1)
  
          # Looping through the word to reverse it
          for ((i = $LENGTH; i >= 0; i--)); do
              REVERSE=${REVERSE}${WORD[@]:$i:1}
          done
  
          echo reverse of $WORD is: $REVERSE
  
          # Checking if the word is palindrome or not
          if [[ $WORD = $REVERSE ]]; then
              echo "$WORD is a Palindrome"
          else
              echo "$WORD is not a Palindrome"
          fi
      done
  }
  function main {
      if [ $# -eq 0 ]; then
          echo "Please provide the strings to check if it is palindrome or not"
          exit 1
      else
          echo "Checking if the given strings are palindrome or not"
          is_palindrome
      fi
  }
  main $@
  
  ```

  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ ./34-Palindrome-oldlogic.sh madam sravanil malayalam satorarepotenetoperarotas
  
  ```
  ***Output:***
  ```
  Checking if the given strings are palindrome or not
  reverse of madam is: madam
  madam is a Palindrome
  reverse of sravanil is: linavars
  sravanil is not a Palindrome
  reverse of malayalam is: malayalam
  malayalam is a Palindrome
  reverse of satorarepotenetoperarotas is: satorarepotenetoperarotas
  satorarepotenetoperarotas is a Palindrome
  ```
  ***35-FunPortlistening.sh***
  ```shell
  # Shell Script to check if the port is listening or not
  #!/bin/bash
  PORTS=$@
  function is_port_listening {
      for PORT in $PORTS; do
          # Checking if the port is listening or not
          netstat -tuln | grep -q $PORT
          if [ $? -eq 0 ]; then
              echo "$PORT is listening"
          else
              echo "$PORT is not listening"
          fi
      done
  }
  
  function main {
      if [ $# -eq 0 ]; then
          echo "Please provide the ports to check if it is listening or not"
          exit 1
      else
          echo "Checking if the given ports are listening or not"
          is_port_listening
      fi
  }
  main $@
  # Run the script with the ports to check if it is listening or not
  # $ bash 35-FunPortlistening.sh 22 80 443 3306 8080 27017 27018 27019
      
  ```

  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ bash 35-FunPortlistening.sh 22 80 443 3306 8080 27017 27018 27019
  
  ```
  ***Output:***
  ```
  Checking if the given ports are listening or not
  22 is listening
  80 is listening
  443 is not listening
  3306 is not listening
  8080 is not listening
  27017 is not listening
  27018 is not listening
  27019 is not listening
  ```
  ***36-FunPortLIstnetcat.sh***
  ```shell
  # Shell Script to check if the IP port is listening or not using netcat
  #!/bin/bash
  SERVERS=$@
  function is_port_listening {
      for SERVER in $SERVERS; do
  
          # Checking if the port is listening or not
          timeout 2 nc -zv $SERVER 22 2>&1 | grep succeeded >/dev/null
  
          # Checking the exit status of the previous command
          if [ $? -eq 0 ]; then
              echo "$SERVER is listening on port 22"
          else
              echo "$SERVER is not listening  on port 22"
          fi
      done
  }
  
  function main {
  
      # Checking if the user has provided the server IP
      if [ $# -eq 0 ]; then
          echo "Please provide the server IP to check if it is listening or not"
          exit 1
      else
          echo "Checking if the given servers are listening or not"
          is_port_listening
      fi
  }
  
  # Calling the main function
  main $@
  ```

  ***Command:***
  ```
  ubuntu@shellscripting:~/WorkSpace/DevSecOps2024/01-ShellScripting$ ./36-FunPortLIstnetcat.sh 3.82.28.32 3.82.28.32 3.82.28.34
  
  ```
  ***Output:***
  ```
  Checking if the given servers are listening or not
  3.82.28.32 is listening on port 22
  3.82.28.32 is listening on port 22
  3.82.28.34 is not listening  on port 22
  ```
