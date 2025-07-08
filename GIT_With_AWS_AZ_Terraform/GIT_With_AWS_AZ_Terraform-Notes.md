# 4. Versioncontrol with GIT:

## 4.1. Terraform Setup in Windows:

- We will perform Git with Terraform.
- Download the terraform for windows and keep it in ```C:\Tools``` location.
- Now ```Run > sysdm.cpl > Advanced > Environmental Variables > Path > Edit > New > C:\Tools``` & Save
- Now Restart the powershell you can see the terraform in the shell.
  ![016](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/016.png)
  ***Command***
  ```
  PS C:\Users\madir\Documents\WorkSpace\DevSecOps2024\02-PythonScripting> terraform --version
  
  ```
  ***Output:***
  ```
  Terraform v1.9.5
  on windows_amd64
  ```
- Terraform First file is providers file  
  ***01-providers.tf***
  ```tf
  # Defining the Terraform providers for aws, azurerm and google cloud platform
  # We strongly recommend using the required_providers block to set the
  # Azure Provider source and version being used
  terraform {
    required_providers {
      azurerm = {
        source  = "hashicorp/azurerm"
        version = "~> 4.2.0"
      }
    }
  }
  
  # Configure the Microsoft Azure Provider
  provider "azurerm" {
    features {}
  }
  
  # azure provider block with the subscription_id and client_id and client_secret and tenant_id values
  /* provider "azurerm" {
    features {}
    subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    client_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    client_secret   = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    tenant_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  } */
  ```
- Terraform first command is initialisation command.
  ```
  terraform init

  ```
  ***.gitignore***
  ```
  .terraform/*
  *.tfstate
  *.tfstate.backup
  *.tfstate.backup.*
  .terraform.lock.hcl
  .gitignore
  ```
- Now ResourceGroup CReation in Azure  
  ***02-reourceGroup.tf***
  ```tf
  # resourceGroup Syntax
  
  /*resource "resourceGroup_Name" "resourceGroup_Name_in_Terraform_Code" {
      arguments
      arg1 = "value1"
      arg2 = "value2"
  } */
  
  resource "azurerm_resource_group" "rg1" {
    name     = "resourceGroup1-westus"
    location = "West Europe"
  }
  
  resource "azurerm_resource_group" "rg2" {
    name     = "resourceGroup2-centralus"
    location = "Central US"
  }
  
  resource "azurerm_resource_group" "rg3" {
    name     = "resourceGroup3-eastus"
    location = "East US"
  }
  ```
  ***Command:***
  ```
  terraform fmt
  terraform validate
  ```
  ***Output:***
  ```
  Success! The configuration is valid.
  
  ```
- Before the Plan command we need to add the credentials in the system.
- In Azure Portal ```Azure > Microsoft Entra ID > Manage > App Registrations > New Registration```
  ![017](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/017.png)
  ![018](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/018.png)
  ![019](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/019.png)
- Secret Creation in the azure for the Authentication.
  ![020](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/020.png)
  ![021](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/021.png)
  ![022](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/022.png)
  ![023](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/023.png)
- Role assignment in the subscription in the azure.
  ![024](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/024.png)
  ![025](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/025.png)
  ![026](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/026.png)
  ![027](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/027.png)
- Now collect all values and assign in the below order
  ```
  Application (client) ID
  b6b9f2db-292e-4a26-9150-43938e4333d2
  
  Object ID
  fbc66c6c-9ca1-439c-979e-2170e264ea89
  
  Directory (tenant) ID
  0c6cef32-c913-4983-a793-7c597ef4f82e
  
  
  AnilDevlopment
  ae2812b8-a4a2-4fa8-8c4f-b2b0df170677
  
  Secrets/Passwords(c9e4dd67-b7b8-48e9-92f5-f8d0b218b8a2)
  WYA8Q~UnyjZTrdEctR8j8uasezeaFS8zxEypIcgn
  
  ```
- Copy and paste these in the Power shell to authenticate.
  ```
  $Env:ARM_CLIENT_ID="b6b9f2db-292e-4a26-9150-43938e4333d2"
  $Env:ARM_CLIENT_SECRET="WYA8Q~UnyjZTrdEctR8j8uasezeaFS8zxEypIcgn"
  $Env:ARM_TENANT_ID="0c6cef32-c913-4983-a793-7c597ef4f82e"
  $Env:ARM_SUBSCRIPTION_ID="ae2812b8-a4a2-4fa8-8c4f-b2b0df170677"
  ```
- Now we will execute the plan command  
  ***Command:***
  ```shell
  terraform plan
  
  terraform apply
  (OR)
  terraform apply --auto-approve
  ```
  ***Output:***
  ```
  Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
    + create
  
  Terraform will perform the following actions:
  
    # azurerm_resource_group.rg1 will be created
    + resource "azurerm_resource_group" "rg1" {
        + id       = (known after apply)
        + location = "westeurope"
        + name     = "resourceGroup1-westus"
      }
  
    # azurerm_resource_group.rg2 will be created
    + resource "azurerm_resource_group" "rg2" {
        + id       = (known after apply)
        + location = "centralus"
        + name     = "resourceGroup2-centralus"
      }
  
    # azurerm_resource_group.rg3 will be created
    + resource "azurerm_resource_group" "rg3" {
        + id       = (known after apply)
        + location = "eastus"
        + name     = "resourceGroup3-eastus"
      }
  
  Plan: 3 to add, 0 to change, 0 to destroy.
  
  Do you want to perform these actions?
    Terraform will perform the actions described above.
    Only 'yes' will be accepted to approve.
  
    Enter a value: yes
  
  azurerm_resource_group.rg1: Creating...
  azurerm_resource_group.rg3: Creating...
  azurerm_resource_group.rg2: Creating...
  azurerm_resource_group.rg3: Still creating... [10s elapsed]
  azurerm_resource_group.rg2: Still creating... [10s elapsed]
  azurerm_resource_group.rg1: Still creating... [10s elapsed]
  azurerm_resource_group.rg3: Creation complete after 10s [id=/subscriptions/65ed8652-e22d-4ba7-bb13-239cf38bf058/resourceGroups/resourceGroup3-eastus]
  azurerm_resource_group.rg1: Creation complete after 12s [id=/subscriptions/65ed8652-e22d-4ba7-bb13-239cf38bf058/resourceGroups/resourceGroup1-westus]
  azurerm_resource_group.rg2: Creation complete after 13s [id=/subscriptions/65ed8652-e22d-4ba7-bb13-239cf38bf058/resourceGroups/resourceGroup2-centralus]
  ```
- Terraform statefile stores all info of creating and destroying in terraform.  
  ***03-random_password.tf***
  ```tf
  resource "random_password" "password1" {
    length           = 16
    special          = true
    min_lower        = 3
    min_upper        = 3
    min_numeric      = 3
    min_special      = 3
    override_special = "_%@"
  
  }
  
  resource "random_password" "password2" {
    length           = 16
    special          = true
    min_lower        = 3
    min_upper        = 3
    min_numeric      = 3
    min_special      = 3
    override_special = "_%@"
  
  }
  
  resource "random_password" "password3" {
    length           = 16
    special          = true
    min_lower        = 3
    min_upper        = 3
    min_numeric      = 3
    min_special      = 3
    override_special = "_%@"
  
  }
  ```
- Now we run the below commands to apply randompasswords
  ```shell
  terraform init
  terraform plan
  
  terraform apply
  (OR)
  terraform apply --auto-approve
  ```
  ***Note:*** Terraform cannot be stored in local or git but it will be stored in shared repository for security
  reasons.
  ***04-virtualNetwork.tf***
  ```tf
  # Azure Virtual Network Resource Creation
  
  resource "azurerm_virtual_network" "az-vnet-1" {
    name                = "${azurerm_resource_group.az-rg-1.name}-vnet1"
    resource_group_name = azurerm_resource_group.az-rg-1.name
    location            = azurerm_resource_group.az-rg-1.location
    address_space       = var.vnet_address_space
  
  }
  ```
  ***05-storageAccount.tf***
  ```tf
  # Azurerm Storage Account
  
  resource "azurerm_storage_account" "az-sto-acc-1" {
    name                     = "teststoacc1151"
    resource_group_name      = azurerm_resource_group.az-rg-1.name
    location                 = var.resource_group_location
    account_tier             = var.storage_account_tier
    account_replication_type = var.storage_account_replication_type
  
  }
  ```
  ***15-variables.tf***
  ```tf
  # Declaring the Variables

  variable "resource_group_name" {}
  variable "resource_group_location" {}
  variable "resource_group_environment" {}
  variable "resource_group_source" {}
  variable "vnet_address_space" {}
  variable "storage_account_tier" {}
  variable "storage_account_replication_type" {}
  ```
  ***terraform.tfvars***
  ```tf
  # Varaible Values
  
  resource_group_name              = "test_rg_1"
  resource_group_location          = "East US"
  resource_group_environment       = "staging"
  resource_group_source            = "terraform"
  vnet_address_space               = ["10.10.0.0/16", "10.11.0.0/16", "10.12.0.0/16"]
  storage_account_tier             = "Standard"
  storage_account_replication_type = "LRS"
  ```

### The Order of Precedence

- The order of precedence for variable sources is as follows with later sources taking precedence over earlier ones:
    - Environment variables
    - The terraform.tfvars file, if present.
    - The terraform.tfvars.json file, if present.
    - Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
    - Any -var and -var-file options on the command line, in the order they are provided.
- Now State file securing method in azure.
- in Storage account > Containers > New Container(Private)  >  
  ![028](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/028.png)
- Now we will add the backend details in the terraform providers code.  
  ***01-providers.tf***
  ```tf
  # Defining the Terraform providers for aws, azurerm and google cloud platform
  # We strongly recommend using the required_providers block to set the
  # Azure Provider source and version being used
  terraform {
    required_providers {
      azurerm = {
        source  = "hashicorp/azurerm"
        version = "~> 4.2.0"
      }
    }
    # Terraform backend configuration for storing the state file in Azure Blob Storage
    backend "azurerm" {
      resource_group_name  = "test_rg_1"
      storage_account_name = "teststoacc1151"
      container_name       = "teststoacc1151containers"
      key                  = "terraform.tfstate"
    }
  }
  
  # Configure the Microsoft Azure Provider
  provider "azurerm" {
    features {}
  }
  
  # azure provider block with the subscription_id and client_id and client_secret and tenant_id values
  # This way you can use the Creds in Powershell.
  /* provider "azurerm" {
    features {}
    subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    client_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    client_secret   = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    tenant_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  } */
  ```
- Now we will reinitiate the init, validate and plan commands to store the backend state file.
- Now if you see the state fiel is moved to container.
  ![029](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/029.png)
- Now if you list the state file you should see the data from container.
  ```
  terraform state list
  
  ```
- Git Commands
  ```shell
  # Listing the local branches
  $ git branch -l
  
  # Creating a new branch named mainf and switching to it
  $ git checkout -b mainf
  
  # Listing the local branches
  $ git branch -l
  
  # Listing the remote branches
  $ git branch --remote -l
  
  # Checking the status of the repository
  $ git status
  
  # Adding all the files to the staging area
  $ git add .
  
  # Committing the changes
  $ git commit -m "Test"
  
  # Pushing the changes to the remote repository in the mainf branch
  $ git push origin mainf
  
  # Switching back to the main branch
  $ git checkout main
  
  # Listing the local branches
  $ git branch -l
  
  # Merging the changes from the mainf branch to the main branch
  $ git pull origin mainf
  
  # Status of the repository
  $ git status
  
  # Adding all the files to the staging area
  $ git log
  $ git add .
  $ git commit -m "Test"
  
  # Pushing the changes to the remote repository in the main branch
  $ git push origin main
    
  # Deleting the local branch mainf
  $ git branch -D mainf
  $ git branch --delete mainf
  
  # Listing the local branches
  $ git branch -l
  
  # Listing the remote branches
  $ git branch --remote -l
  
  # Listing the local branches
  $ git branch -l
  
  # Checking log
  $ git log --oneline
  
  # Deleting the remote branch mainf
  $ git push origin -d mainf
  
  # Listing the remote branches
  $ git branch --remote -l

  # git pull = git fetch + git merge
  $ git pull origin main
  ```
  ***05-storageAccount.tf***
  ```tf
  # Azurerm Storage Account
  
  resource "azurerm_storage_account" "az-sto-acc-1" {
    name                     = "teststoacc1151"
    resource_group_name      = azurerm_resource_group.az-rg-1.name
    location                 = var.resource_group_location
    account_tier             = var.storage_account_tier
    account_replication_type = var.storage_account_replication_type
  
  }
  ```
  ***06-keyVault.tf***
  ```tf
  /* azurerm_client_config is a data source that retrieves the current Azure client configuration. This data source is used to get the tenant_id and object_id of the current Azure client. 
  The tenant_id and object_id are used to set the tenant_id and object_id in the access_policy block of the azurerm_key_vault resource. The access_policy block defines the permissions for the key vault. 
  In this case, the permissions are set to get, create, delete, and purge for keys, get, set, delete, and purge for secrets, and get, list, delete, and purge for storage. 
  The soft_delete_retention_days attribute is set to 7, and the purge_protection_enabled attribute is set to false. The tags attribute is set to the environment and source tags. 
  The environment tag is set to the value of the resource_group_environment variable, and the source tag is set to the value of the resource_group_source variable. */
  
  
  data "azurerm_client_config" "current" {}
  
  resource "azurerm_key_vault" "az-kv-1" {
    name                        = "${var.resource_group_name1}kv1"
    resource_group_name         = azurerm_resource_group.az-rg-1.name
    location                    = azurerm_resource_group.az-rg-1.location
    sku_name                    = "standard"
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    enabled_for_disk_encryption = true
    access_policy {
      tenant_id = data.azurerm_client_config.current.tenant_id
      object_id = data.azurerm_client_config.current.object_id
      key_permissions = [
        "Get",
        "List"
      ]
      secret_permissions = [
        "Get",
        "Set",
        "Delete",
        "Purge",
        "Recover",
        "Backup",
        "Restore",
        "List"
      ]
      storage_permissions = [
        "Get",
        "List",
        "Delete",
        "Purge",
        "Backup",
        "Restore",
        "Set",
        "Recover"
      ]
    }
    tags = {
      environment = var.resource_group_environment
      source      = var.resource_group_source
    }
  
  }
  
  resource "azurerm_key_vault_secret" "az-kv-secret-1" {
    name         = "SecretPassword1"
    value        = random_password.password1.result
    key_vault_id = azurerm_key_vault.az-kv-1.id
  
  }
  
  resource "azurerm_key_vault_secret" "az-kv-secret-2" {
    name         = "SecretPassword2"
    value        = random_password.password2.result
    key_vault_id = azurerm_key_vault.az-kv-1.id
  }
  
  resource "azurerm_key_vault_secret" "az-kv-secret-3" {
    name         = "SecretPassword3"
    value        = random_password.password3.result
    key_vault_id = azurerm_key_vault.az-kv-1.id
  }
  
  resource "azurerm_key_vault_access_policy" "az-kv-ap-1" {
    key_vault_id = azurerm_key_vault.az-kv-1.id
    tenant_id    = data.azurerm_client_config.current.tenant_id
    object_id    = "cf0066f0-df0b-4a02-b056-1f8bea4856bc"
    # Above object id fetched from Microsoft Entra ID > Azure Active Directory > Users > User > Object ID  
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Purge",
      "Recover",
      "Restore",
  
    ]
  
  }
  
  ```
- To rename a applied resource-name in terraform is to do below and apply the changes.
  ```shell
  terraform state list
  terraform state mv azurerm_key_vault_access_policy.az-kv-ap-1 azurerm_key_vault_access_policy.new-name
  ```
- To apply or delete only specific resources
  ```shell
  terraform apply -target resource-name
  terraform destroy -target resource-name
  ```
- Some times we cannot destroy frw resources only we need to skip it from deleting then we can use the below.

  ```shell
  terraform state list
  terraform state rm azurerm_key_vault.az-kv-1
  terraform state rm azurerm_key_vault_access_policy.az-kv-ap-1
  terraform state rm azurerm_key_vault_secret.az-kv-secret-1
  terraform state rm azurerm_key_vault_secret.az-kv-secret-2
  terraform state rm azurerm_key_vault_secret.az-kv-secret-3
  terraform apply
  terraform state list
  ```
- after removing you need to comment the code for ref.
- Even if you comment if resource group is destroyed after the terraform destroy command then Key vault also destroyes.
- so better move keyvault to the another resource group from console manually and run destroy command.
- Once moving the Keyvault to another Resource group now to create the services to it we can use the datasouces in the
  terraform
  ***07-keyVaultDatasources.tf***
  ```tf
  data "azurerm_key_vault" "az-kv-2" {
    name                = "testrg1kv1"
    resource_group_name = "testxrg"
  }
  
  resource "azurerm_key_vault_secret" "az-kv-secret-4" {
    name         = "SecretPassword4"
    value        = random_password.password1.result
    key_vault_id = data.azurerm_key_vault.az-kv-2.id
  
  }
  
  resource "azurerm_key_vault_secret" "az-kv-secret-5" {
    name         = "SecretPassword5"
    value        = random_password.password2.result
    key_vault_id = data.azurerm_key_vault.az-kv-2.id
  }
  
  resource "azurerm_key_vault_secret" "az-kv-secret-6" {
    name         = "SecretPassword6"
    value        = random_password.password3.result
    key_vault_id = data.azurerm_key_vault.az-kv-2.id
  }
  ```
  ***GIT RESET***
  ```
  $ git log --oneline
  $ git reset --hard HEAD~2
  $ git log --oneline
  $ git status
  $ git add .;git commit -m "$(date)-$(hostname)";git push origin main
  $ git add .;git commit -m "$(date)-$(hostname)";git push origin main --force
  $ git log --oneline
  $ git reset --soft HEAD~3
  $ git status
  $ git add .;git commit -m "$(date)-$(hostname)";git push origin main --force
  $ git log --oneline
  $ git reset --mixed HEAD~4
  $ git status
  $ git log --oneline
  $ git add .;git commit -m "$(date)-$(hostname)";git push origin main --force
  ```

## 4.2 GitHUb Actions:

- Create dir with ```GITREPOHOME/.github/workflows/sample.yaml``` in terraform code dir to start with github actions
- Add your azure creds as here below under RepoSettings > Secret and Variables > Actions > Secrets  
  ***Azure Creds***
  ```
  ARM_CLIENT_ID="b6b9f2db-292e-4a26-9150-43938e4333d2"
  ARM_CLIENT_SECRET="WYA8Q~UnyjZTrdEctR8j8uasezeaFS8zxEypIcgn"
  ARM_TENANT_ID="0c6cef32-c913-4983-a793-7c597ef4f82e"
  ARM_SUBSCRIPTION_ID="ae2812b8-a4a2-4fa8-8c4f-b2b0df170677"
  ```
  ![030](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/030.png)
- Now use below code to run the Actions.  
  ***sample.yaml***
  ```yml
  # GIT HUB ACTIONS CODE to run terraform code in azure cloud using github actions
  name: workflow for running azure terraform code
  on:
    pull_request:
      branches: [ main ]
      types: [closed]
    push:
      branches: [ main ]
  env:
    # TERRAFORM_DESTROY: true
    ENVIRONMENT: dev
    ARM_CLIENT_ID: ${{ secrets.ARM_CLIENT_ID }}
    ARM_CLIENT_SECRET: ${{ secrets.ARM_CLIENT_SECRET }}
    ARM_SUBSCRIPTION_ID: ${{ secrets.ARM_SUBSCRIPTION_ID }}
    ARM_TENANT_ID: ${{ secrets.ARM_TENANT_ID }}
    ACTIONS_STEP_DEBUG: true
    PACKER_VERSION: "1.11.2"
    TERRAFORM_VERSION: "1.9.5"
  
  jobs:
    tools_check:
      name: Checking the Tolls Status
      runs-on: ubuntu-latest
      defaults:
        run:
          shell: bash
      steps:
        - name: Print Runner Hostname
          run: echo "Runner hostname is $HOSTNAME"
          shell: bash
        - name: Print Runner IP Address
          run : echo "Runner IP Address is $(curl -sL https://ipconfig.io/ip)"
          shell: bash
        - name: Set up Terraform with Specific Version on the Runner
          uses: hashicorp/setup-terraform@v2
          with:
            terraform_version: ${{ env.TERRAFORM_VERSION }}
        - name: Setup packer
          uses: hashicorp/setup-packer@main
          id: setup
          with:
            version: ${{ env.PACKER_VERSION }}
        - name: Check Terraform Version and Packer Version
          run: terraform --version && packer --version
          shell: bash
  ```
- Now as soon as you push the code into github.
  ![031](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/031.png)
  ![032](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/032.png)
  ![033](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/033.png)
- Now we will add the extra code for Terraform initialisation.  
  ***sample.yaml***
  ```yml
  # GIT HUB ACTIONS CODE to run terraform code in azure cloud using github actions
  name: workflow for running azure terraform code
  on:
    pull_request:
      branches: [ main ]
      types: [closed]
    push:
      branches: [ main ]
  env:
    # TERRAFORM_DESTROY: true
    ENVIRONMENT: main
    ARM_CLIENT_ID: ${{ secrets.ARM_CLIENT_ID }}
    ARM_CLIENT_SECRET: ${{ secrets.ARM_CLIENT_SECRET }}
    ARM_SUBSCRIPTION_ID: ${{ secrets.ARM_SUBSCRIPTION_ID }}
    ARM_TENANT_ID: ${{ secrets.ARM_TENANT_ID }}
    ACTIONS_STEP_DEBUG: true
    PACKER_VERSION: "1.11.2"
    TERRAFORM_VERSION: "1.9.5"
  
  jobs:
    Tools_check:
      name: Checking the Tools Status
      runs-on: ubuntu-latest
      defaults:
        run:
          shell: bash
      steps:
        - name: Print Runner Hostname
          run: echo "Runner hostname is $HOSTNAME"
          shell: bash
        - name: Print Runner IP Address
          run : echo "Runner IP Address is $(curl -sL https://ipconfig.io/ip)"
          shell: bash
        - name: Set up Terraform with Specific Version on the Runner
          uses: hashicorp/setup-terraform@v2
          with:
            terraform_version: ${{ env.TERRAFORM_VERSION }}
        - name: Setup packer
          uses: hashicorp/setup-packer@main
          id: setup
          with:
            version: ${{ env.PACKER_VERSION }}
        - name: Check Terraform Version and Packer Version
          run: terraform --version && packer --version
          shell: bash
    
    Terraform_Initialize:
      needs: Tools_check
      name: Files Check && Terraform Init, validate and fmt
      runs-on: ubuntu-latest
      defaults:
        run:
          shell: bash
      steps:
        - name: Checkout the repository.
          uses: actions/checkout@v3
        - name: Listing Repository Files
          run:  ls -la; pwd
        - name: Terraform init, validate and format.
          run: terraform init && terraform validate && terraform fmt -check
        - name: Terraform Plan.
          run: terraform plan
          shell: bash
  ```
  ![034](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/034.png)
  ![035](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/035.png)
- This code will do terraform init, fmt, validate, plan, apply -auto-approve and finally destroy -auto-approve.  
  ***sample.yaml***
  ```yml
  # GIT HUB ACTIONS CODE to run terraform code in azure cloud using github actions
  name: workflow for running azure terraform code
  on:
    pull_request:
      branches: [ main ]
      types: [closed]
    push:
      branches: [ main ]
  env:
    # TERRAFORM_DESTROY: true
    ENVIRONMENT: main
    ARM_CLIENT_ID: ${{ secrets.ARM_CLIENT_ID }}
    ARM_CLIENT_SECRET: ${{ secrets.ARM_CLIENT_SECRET }}
    ARM_SUBSCRIPTION_ID: ${{ secrets.ARM_SUBSCRIPTION_ID }}
    ARM_TENANT_ID: ${{ secrets.ARM_TENANT_ID }}
    ACTIONS_STEP_DEBUG: true
    PACKER_VERSION: "1.11.2"
    TERRAFORM_VERSION: "1.9.5"
  
  jobs:
    Tools_check:
      name: Checking the Tools Status
      runs-on: ubuntu-latest
      defaults:
        run:
          shell: bash
      steps:
        - name: Print Runner Hostname
          run: echo "Runner hostname is $HOSTNAME"
          shell: bash
        - name: Print Runner IP Address
          run : echo "Runner IP Address is $(curl -sL https://ipconfig.io/ip)"
          shell: bash
        - name: Set up Terraform with Specific Version on the Runner
          uses: hashicorp/setup-terraform@v2
          with:
            terraform_version: ${{ env.TERRAFORM_VERSION }}
        - name: Setup packer
          uses: hashicorp/setup-packer@main
          id: setup
          with:
            version: ${{ env.PACKER_VERSION }}
        - name: Check Terraform Version and Packer Version
          run: terraform --version && packer --version
          shell: bash
    
    Terraform_Initialize:
      needs: Tools_check
      name: Files Check && Terraform Init, validate and fmt
      runs-on: ubuntu-latest
      defaults:
        run:
          shell: bash
      steps:
        - name: Checkout the repository.
          uses: actions/checkout@v3
        - name: Listing Repository Files
          run:  ls -la; pwd
        - name: Terraform init, validate and format.
          run: terraform init && terraform validate && terraform fmt -check
        - name: Terraform Plan.
          run: terraform plan    
  
    Terraform_Apply:
      needs: Terraform_Initialize
      name: Terraform Apply
      runs-on: ubuntu-latest
      defaults:
        run:
          shell: bash
      steps:
        - name: Checkout the repository.
          uses: actions/checkout@v3
        - name: Terraform Apply.
          shell: bash
          run: terraform init && terraform apply -auto-approve && terraform state list && sleep 100 && terraform destroy -auto-approve
  ```
- Added if condition to the terragotm destroy.  
  ***sample.yaml***
  ```yml
  # GIT HUB ACTIONS CODE to run terraform code in azure cloud using github actions
  name: workflow for running azure terraform code
  on:
    pull_request:
      branches: [ main ]
      types: [closed]
    push:
      branches: [ main ]
  env:
    TERRAFORM_DESTROY: true
    ENVIRONMENT: main
    ARM_CLIENT_ID: ${{ secrets.ARM_CLIENT_ID }}
    ARM_CLIENT_SECRET: ${{ secrets.ARM_CLIENT_SECRET }}
    ARM_SUBSCRIPTION_ID: ${{ secrets.ARM_SUBSCRIPTION_ID }}
    ARM_TENANT_ID: ${{ secrets.ARM_TENANT_ID }}
    ACTIONS_STEP_DEBUG: true
    PACKER_VERSION: "1.11.2"
    TERRAFORM_VERSION: "1.9.5"
  
  jobs:
    Tools_check:
      name: Checking the Tools Status
      runs-on: ubuntu-latest
      defaults:
        run:
          shell: bash
      steps:
        - name: Print Runner Hostname
          run: echo "Runner hostname is $HOSTNAME"
          shell: bash
        - name: Print Runner IP Address
          run : echo "Runner IP Address is $(curl -sL https://ipconfig.io/ip)"
          shell: bash
        - name: Set up Terraform with Specific Version on the Runner
          uses: hashicorp/setup-terraform@v2
          with:
            terraform_version: ${{ env.TERRAFORM_VERSION }}
        - name: Setup packer
          uses: hashicorp/setup-packer@main
          id: setup
          with:
            version: ${{ env.PACKER_VERSION }}
        - name: Check Terraform Version and Packer Version
          run: terraform --version && packer --version
          shell: bash
    
    Terraform_Initialize:
      needs: Tools_check
      name: Files Check && Terraform Init, validate and fmt
      runs-on: ubuntu-latest
      defaults:
        run:
          shell: bash
      steps:
        - name: Checkout the repository.
          uses: actions/checkout@v3
        - name: Listing Repository Files
          run:  ls -la; pwd
        - name: Terraform init, validate and format.
          run: terraform init && terraform validate && terraform fmt -check
        - name: Terraform Plan.
          run: terraform plan    
  
    Terraform_Apply:
      needs: Terraform_Initialize
      name: Terraform Apply
      runs-on: ubuntu-latest
      defaults:
        run:
          shell: bash
      steps:
        - name: Checkout the repository.
          uses: actions/checkout@v3
        - name: Terraform Apply.
          shell: bash
          run: terraform init && terraform apply -auto-approve && terraform state list && sleep 100
        - name: Terraform Destroy.
          shell: bash
          if : ${{ env.TERRAFORM_DESTROY }}
          run: terraform destroy -auto-approve
  ```

## 4.3 Runner Config in GitHUb Actions:

- Repository Settings > Actions > Runner > new self-hosted runner
  ![036](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/036.png)
- Select Linux and follow the below steps in the ec2 instance.  
  ![037](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/037.png)
- Launch the EC2 instance install the terraform and nodejs
  ```
  wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  sudo apt update && sudo apt install terraform
  
  sudo apt install -y nodejs
  ```
- Now follow the below steps in Ubuntu machine.    
  ***Download***
    - Create a folder
      ```
      mkdir actions-runner && cd actions-runner
    
      ```
    - Download the latest runner package
      ```
      curl -o actions-runner-linux-x64-2.319.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.319.1/actions-runner-linux-x64-2.319.1.tar.gz
    
      ```
    - Optional: Validate the hash
      ```
      echo "3f6efb7488a183e291fc2c62876e14c9ee732864173734facc85a1bfb1744464  actions-runner-linux-x64-2.319.1.tar.gz" | shasum -a 256 -c
    
      ```
    - Extract the installer
      ```
      tar xzf ./actions-runner-linux-x64-2.319.1.tar.gz
    
      ```
  ***Configure***
    - Create the runner and start the configuration experience
      ```
      ./config.sh --url https://github.com/anilmadireddy/GitHubActions --token BDRPAKOVDTEFM3CREFWFHI3G575SO
    
      ```
    - Last step, run it!
      ```
      $ ./run.sh
    
      ```
- Steps ran in the ec2 which are same as above.  
  ***Command:***
  ```
  ubuntu@ip-10-1-1-247:~$ mkdir actions-runner && cd actions-runner
  ubuntu@ip-10-1-1-247:~/actions-runner$ curl -o actions-runner-linux-x64-2.319.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.319.1/actions-runner-linux-x64-2.319.1.tar.gz
  ```
  ***Output:***
  ```
    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                   Dload  Upload   Total   Spent    Left  Speed
    0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  100  208M  100  208M    0     0   114M      0  0:00:01  0:00:01 --:--:--  116M
  ```
  ***Command:***
  ```
  ubuntu@ip-10-1-1-247:~/actions-runner$ echo "3f6efb7488a183e291fc2c62876e14c9ee732864173734facc85a1bfb1744464  actions-runner-linux-x64-2.319.1.tar.gz" | shasum -a 256 -c
  
  ```
  ***Output:***
  ```
  actions-runner-linux-x64-2.319.1.tar.gz: OK
  
  ```
  ***Command:***
  ```
  ubuntu@ip-10-1-1-247:~/actions-runner$ tar xzf ./actions-runner-linux-x64-2.319.1.tar.gz
  
  ```
  ***Command:***
  ```
  ubuntu@ip-10-1-1-247:~/actions-runner$ ls
  
  ```
  ***Output:***
  ```
  actions-runner-linux-x64-2.319.1.tar.gz  bin  config.sh  env.sh  externals  run-helper.cmd.template  run-helper.sh.template  run.sh  safe_sleep.sh
  
  ```
  ***Command:***
  ```
  ubuntu@ip-10-1-1-247:~/actions-runner$ ./config.sh --url https://github.com/anilmadireddy/GitHubActions --token BDRPAKOVDTEFM3CREFWFHI3G575SO
  
  ```
  ***Output:***
  ```
  --------------------------------------------------------------------------------
  |        ____ _ _   _   _       _          _        _   _                      |
  |       / ___(_) |_| | | |_   _| |__      / \   ___| |_(_) ___  _ __  ___      |
  |      | |  _| | __| |_| | | | | '_ \    / _ \ / __| __| |/ _ \| '_ \/ __|     |
  |      | |_| | | |_|  _  | |_| | |_) |  / ___ \ (__| |_| | (_) | | | \__ \     |
  |       \____|_|\__|_| |_|\__,_|_.__/  /_/   \_\___|\__|_|\___/|_| |_|___/     |
  |                                                                              |
  |                       Self-hosted runner registration                        |
  |                                                                              |
  --------------------------------------------------------------------------------
  
  # Authentication
  
  
  √ Connected to GitHub
  
  # Runner Registration
  
  Enter the name of the runner group to add this runner to: [press Enter for Default]
  
  Enter the name of runner: [press Enter for ip-10-1-1-247]
  
  This runner will have the following labels: 'self-hosted', 'Linux', 'X64'
  Enter any additional labels (ex. label-1,label-2): [press Enter to skip] terraform
  
  √ Runner successfully added
  √ Runner connection is good
  
  # Runner settings
  
  Enter name of work folder: [press Enter for _work]
  
  √ Settings Saved.
  ```
  ***Command:***
  ```
  ubuntu@ip-10-1-1-247:~/actions-runner$ sudo ./svc.sh install
  
  ```
  ***Output:***
  ```
  Creating launch runner in /etc/systemd/system/actions.runner.anilmadireddy-GitHubActions.ip-10-1-1-247.service
  Run as user: ubuntu
  Run as uid: 1000
  gid: 1000
  Created symlink /etc/systemd/system/multi-user.target.wants/actions.runner.anilmadireddy-GitHubActions.ip-10-1-1-247.service → /etc/systemd/system/actions.runner.anilmadireddy-GitHubActions.ip-10-1-1-247.service.
  ```
  ***Command:***
  ```
  ubuntu@ip-10-1-1-247:~/actions-runner$ sudo ./svc.sh start
  
  ```
  ***Output:***
  ```
  /etc/systemd/system/actions.runner.anilmadireddy-GitHubActions.ip-10-1-1-247.service
  ● actions.runner.anilmadireddy-GitHubActions.ip-10-1-1-247.service - GitHub Actions Runner (anilmadireddy-GitHubActions.ip-10-1-1-247)
       Loaded: loaded (/etc/systemd/system/actions.runner.anilmadireddy-GitHubActions.ip-10-1-1-247.service; enabled; preset: enabled)
       Active: active (running) since Sun 2024-09-22 10:43:08 UTC; 16ms ago
     Main PID: 21384 (runsvc.sh)
        Tasks: 1 (limit: 1130)
       Memory: 276.0K (peak: 708.0K)
          CPU: 3ms
       CGroup: /system.slice/actions.runner.anilmadireddy-GitHubActions.ip-10-1-1-247.service
               ├─21384 /bin/bash /home/ubuntu/actions-runner/runsvc.sh
               └─21387 "[node]"
  
  Sep 22 10:43:08 ip-10-1-1-247 systemd[1]: Started actions.runner.anilmadireddy-GitHubActions.ip-10-1-1-247.service - GitHub Actions Runner (anilmadireddy-GitHubActions.ip-10-1-1-247).
  Sep 22 10:43:08 ip-10-1-1-247 runsvc.sh[21384]: .path=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
  
  ```
- After starting to confirm it you can check in Settings > Actions > Runner.
  ![038](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/038.png)
- Now use the below code to github action workflow dispatches.  
  ***sample1.yaml***
  ```yml
  # This is a demo workflow file to test github actions.
  name: 'Terraform Workflow Dispatch'
  on:
  workflow_dispatch:
    inputs:
      TERRAFORM:
        description: 'Select Terraform Operation To Perform'     
        required: true
        default: 'PLAN'
        type: choice
        options:
        - PLAN
        - APPLY
        - DESTROY
      ENVIRONMENT:
        description: 'Select Subscription To Deploy'
        required: true
        default: 'AnilDevlopment'
        type: choice
        options:
        - AnilProduction
        - AnilDevlopment
        
  env:
  TERRAFORM_DESTROY: true
  ENVIRONMENT: "Dev"
  ARM_CLIENT_ID: ${{secrets.ARM_CLIENT_ID}}
  ARM_CLIENT_SECRET: ${{secrets.ARM_CLIENT_SECRET}}
  # ARM_SUBSCRIPTION_ID: ${{secrets.ARM_SUBSCRIPTION_ID}}
  ARM_TENANT_ID: ${{secrets.ARM_TENANT_ID}}
  ACTIONS_STEP_DEBUG: true
  
  jobs:
  Anil_Production:
    if: ${{ github.event.inputs.ENVIRONMENT == 'AnilProduction' }}
    name: 'Anil Production Job - Terraform'
    # runs-on: ubuntu-latest
    runs-on: [self-hosted]
    defaults:
     run:
       shell: bash
    steps:
    - name: Checkout
      uses: actions/checkout@v3
    - name: Print Runner Hostname
      run: hostname
      shell: bash
    - name: Print Runner IP Address
      run: curl -sL https://ipconfig.io
      shell: bash
    - name: Setup Terraform with specified version on the runner
      uses: hashicorp/setup-terraform@v3
      with:
        terraform_version: 1.9.5
    - name: Check Terraform Version
      run: terraform --version
      shell: bash
    - name: List Repository Files
      run: |
       echo "List of Files in Repository"
       ls -al
       echo "Current Working Directory:"
       pwd
       echo "Free Space in the Runner:"
       free -h
       echo "Terraform Version is:"
       terraform --version
    - name: Perform Terraform init, validate and format
      id: init
      shell: bash
      run: |
       echo ${{ github.event.inputs.ENVIRONMENT }}
       echo ${{ github.event.inputs.TERRAFORM_DESTROY }}
       export ARM_SUBSCRIPTION_ID='81f49a85-9bbd-4697-893c-eca28e53dc99'
       # rm -rf 1.ProdProvider.tf
       terraform init && terraform validate && terraform fmt
    - name: Perform Terraform Plan
      if: ${{ (steps.init.exit_code == 0) && (github.event.inputs.TERRAFORM == 'PLAN') }}
      id: plan
      shell: bash
      run: |
       export ARM_SUBSCRIPTION_ID='81f49a85-9bbd-4697-893c-eca28e53dc99'
       export TF_LOG="ERROR"
       # terraform plan -var="rg_env=${{ github.event.inputs.ENVIRONMENT }}" -var="rg_suffix=dev"
       terraform plan
    - name: Perform Terraform Apply
      if: ${{ (steps.init.exit_code == 0) && (github.event.inputs.TERRAFORM == 'APPLY') }}
      id: apply
      shell: bash
      run: |
       export ARM_SUBSCRIPTION_ID='81f49a85-9bbd-4697-893c-eca28e53dc99'
       export TF_LOG="ERROR"
       # terraform apply -var="rg_env=${{ github.event.inputs.ENVIRONMENT }}" -var="rg_suffix=dev" --auto-approve
       terraform apply --auto-approve
    - name: List Terraform Resources
      if: success()  # success() || failure()
      shell: bash
      run: |
        export ARM_SUBSCRIPTION_ID='81f49a85-9bbd-4697-893c-eca28e53dc99'
        terraform state list     
    - name: Perform Terraform Destory
      if: ${{ (steps.init.exit_code == 0) && (github.event.inputs.TERRAFORM == 'DESTROY') }}
      id: destroy
      shell: bash
      run: |
       export ARM_SUBSCRIPTION_ID='81f49a85-9bbd-4697-893c-eca28e53dc99'
       # terraform destroy -var="rg_env=${{ github.event.inputs.ENVIRONMENT }}" -var="rg_suffix=dev" --auto-approve
       terraform destroy --auto-approve
    
  Anil_Development:
    if: ${{ github.event.inputs.ENVIRONMENT == 'AnilDevlopment' }}
    name: 'Anil Development Job - Terraform'
    # runs-on: ubuntu-latest
    runs-on: [self-hosted]
    defaults:
     run:
       shell: bash
    steps:
    - name: Checkout
      uses: actions/checkout@v3
    - name: Print Runner Hostname
      run: hostname
      shell: bash
    - name: Print Runner IP Address
      run: curl -sL https://ipconfig.io
      shell: bash
    - name: Setup Terraform with specified version on the runner
      uses: hashicorp/setup-terraform@v3
      with:
        terraform_version: 1.9.5
    - name: List Repo Files
      run: |
       echo "List of Files in Repository"
       ls -al
       echo "Current Working Directory:"
       pwd
       echo "Free Space in the Runner:"
       free -h
       echo "Terraform Version is:"
       terraform --version
    - name: Perform Terraform Init validate Format
      id: init
      shell: bash
      run: |
       echo ${{ github.event.inputs.ENVIRONMENT }}
       echo ${{ github.event.inputs.TERRAFORM_DESTROY }}
       export ARM_SUBSCRIPTION_ID='ae2812b8-a4a2-4fa8-8c4f-b2b0df170677'
       # rm -rf 2.DevProvider.tf
       terraform init && terraform validate && terraform fmt
    - name: Perform Terraform Plan
      if: ${{ (steps.init.exit_code == 0) && (github.event.inputs.TERRAFORM == 'PLAN') }}
      id: plan
      shell: bash
      run: |
       export ARM_SUBSCRIPTION_ID='ae2812b8-a4a2-4fa8-8c4f-b2b0df170677'
       # terraform plan -var="rg_env=${{ github.event.inputs.ENVIRONMENT }}" -var="rg_suffix=prod"
       terraform plan
    - name: Perform Terraform Apply
      if: ${{ (steps.init.exit_code == 0) && (github.event.inputs.TERRAFORM == 'APPLY') }}
      id: apply
      shell: bash
      run: |
       export ARM_SUBSCRIPTION_ID='ae2812b8-a4a2-4fa8-8c4f-b2b0df170677'
       # terraform apply -var="rg_env=${{ github.event.inputs.ENVIRONMENT }}" -var="rg_suffix=prod" --auto-approve
       terraform apply --auto-approve
    - name: List Terraform Resources
      if: success()  # success() || failure() - Depends on previous step.
      shell: bash
      run: |
        export ARM_SUBSCRIPTION_ID='ae2812b8-a4a2-4fa8-8c4f-b2b0df170677'
        terraform state list
    - name: Perform Terraform Destroy
      if: ${{ (steps.init.exit_code == 0) && (github.event.inputs.TERRAFORM == 'DESTROY') }}
      id: destroy
      shell: bash
      run: |
       export ARM_SUBSCRIPTION_ID='ae2812b8-a4a2-4fa8-8c4f-b2b0df170677'
       # terraform destroy -var="rg_env=${{ github.event.inputs.ENVIRONMENT }}" -var="rg_suffix=prod" --auto-approve
       terraform destroy --auto-approve
  ```
- Now Job will be shown in actions workflow, then use it to deploy.
  ![039](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/039.png)
- Here if you select the prod or dev that job will run.
  ![040](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/040.png)
  ![041](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/041.png)
- Additionally we have added the drift in above code.  
  ***sample1.yaml***
  ```yml
  # This is a demo workflow file to test github actions.
  name: 'Terraform Workflow Dispatch'
  on:
    workflow_dispatch:
      inputs:
        TERRAFORM:
          description: 'Select Terraform Operation To Perform'     
          required: true
          default: 'PLAN'
          type: choice
          options:
          - PLAN
          - APPLY
          - DESTROY
          - DRIFT
        ENVIRONMENT:
          description: 'Select Subscription To Deploy'
          required: true
          default: 'AnilDevlopment'
          type: choice
          options:
          - AnilProduction
          - AnilDevlopment
          
  env:
    TERRAFORM_DESTROY: true
    ENVIRONMENT: "Dev"
    ARM_CLIENT_ID: ${{secrets.ARM_CLIENT_ID}}
    ARM_CLIENT_SECRET: ${{secrets.ARM_CLIENT_SECRET}}
    # ARM_SUBSCRIPTION_ID: ${{secrets.ARM_SUBSCRIPTION_ID}}
    ARM_TENANT_ID: ${{secrets.ARM_TENANT_ID}}
    ACTIONS_STEP_DEBUG: true
  
  jobs:
    Anil_Production:
      if: ${{ github.event.inputs.ENVIRONMENT == 'AnilProduction' }}
      name: 'Anil Production Job - Terraform'
      # runs-on: ubuntu-latest
      runs-on: [self-hosted]
      defaults:
       run:
         shell: bash
      steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Print Runner Hostname
        run: hostname
        shell: bash
      - name: Print Runner IP Address
        run: curl -sL https://ipconfig.io
        shell: bash
      - name: Setup Terraform with specified version on the runner
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: 1.9.5
      - name: Check Terraform Version
        run: terraform --version
        shell: bash
      - name: List Repository Files
        run: |
         echo "List of Files in Repository"
         ls -al
         echo "Current Working Directory:"
         pwd
         echo "Free Space in the Runner:"
         free -h
         echo "Terraform Version is:"
         terraform --version
      - name: Perform Terraform init, validate and format
        id: init
        shell: bash
        run: |
         echo ${{ github.event.inputs.ENVIRONMENT }}
         echo ${{ github.event.inputs.TERRAFORM_DESTROY }}
         export ARM_SUBSCRIPTION_ID='81f49a85-9bbd-4697-893c-eca28e53dc99'
         # rm -rf 1.ProdProvider.tf
         terraform init && terraform validate && terraform fmt
      - name: Perform Terraform Plan
        if: ${{ (steps.init.exit_code == 0) && (github.event.inputs.TERRAFORM == 'PLAN') }}
        id: plan
        shell: bash
        run: |
         export ARM_SUBSCRIPTION_ID='81f49a85-9bbd-4697-893c-eca28e53dc99'
         export TF_LOG="ERROR"
         # terraform plan -var="rg_env=${{ github.event.inputs.ENVIRONMENT }}" -var="rg_suffix=dev"
         terraform plan
      - name: Perform Terraform Apply
        if: ${{ (steps.init.exit_code == 0) && (github.event.inputs.TERRAFORM == 'APPLY') }}
        id: apply
        shell: bash
        run: |
         export ARM_SUBSCRIPTION_ID='81f49a85-9bbd-4697-893c-eca28e53dc99'
         export TF_LOG="ERROR"
         # terraform apply -var="rg_env=${{ github.event.inputs.ENVIRONMENT }}" -var="rg_suffix=dev" --auto-approve
         terraform apply --auto-approve
      - name: Perform Terraform Drift
        if: ${{ (steps.init.exit_code == 0) && (github.event.inputs.TERRAFORM == 'DRIFT') }}
        id: drift
        shell: bash
        run: |
         export ARM_SUBSCRIPTION_ID='81f49a85-9bbd-4697-893c-eca28e53dc99'
         export TF_LOG="ERROR"
         # terraform apply -var="rg_env=${{ github.event.inputs.ENVIRONMENT }}" -var="rg_suffix=dev" --auto-approve
         terraform apply --refresh-only       
      - name: List Terraform Resources
        if: success()  # success() || failure()
        shell: bash
        run: |
          export ARM_SUBSCRIPTION_ID='81f49a85-9bbd-4697-893c-eca28e53dc99'
          terraform state list     
      - name: Perform Terraform Destory
        if: ${{ (steps.init.exit_code == 0) && (github.event.inputs.TERRAFORM == 'DESTROY') }}
        id: destroy
        shell: bash
        run: |
         export ARM_SUBSCRIPTION_ID='81f49a85-9bbd-4697-893c-eca28e53dc99'
         # terraform destroy -var="rg_env=${{ github.event.inputs.ENVIRONMENT }}" -var="rg_suffix=dev" --auto-approve
         terraform destroy --auto-approve
      
    Anil_Development:
      if: ${{ github.event.inputs.ENVIRONMENT == 'AnilDevlopment' }}
      name: 'Anil Development Job - Terraform'
      # runs-on: ubuntu-latest
      runs-on: [self-hosted]
      defaults:
       run:
         shell: bash
      steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Print Runner Hostname
        run: hostname
        shell: bash
      - name: Print Runner IP Address
        run: curl -sL https://ipconfig.io
        shell: bash
      - name: Setup Terraform with specified version on the runner
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: 1.9.5
      - name: List Repo Files
        run: |
         echo "List of Files in Repository"
         ls -al
         echo "Current Working Directory:"
         pwd
         echo "Free Space in the Runner:"
         free -h
         echo "Terraform Version is:"
         terraform --version
      - name: Perform Terraform Init validate Format
        id: init
        shell: bash
        run: |
         echo ${{ github.event.inputs.ENVIRONMENT }}
         echo ${{ github.event.inputs.TERRAFORM_DESTROY }}
         export ARM_SUBSCRIPTION_ID='ae2812b8-a4a2-4fa8-8c4f-b2b0df170677'
         # rm -rf 2.DevProvider.tf
         terraform init && terraform validate && terraform fmt
      - name: Perform Terraform Plan
        if: ${{ (steps.init.exit_code == 0) && (github.event.inputs.TERRAFORM == 'PLAN') }}
        id: plan
        shell: bash
        run: |
         export ARM_SUBSCRIPTION_ID='ae2812b8-a4a2-4fa8-8c4f-b2b0df170677'
         # terraform plan -var="rg_env=${{ github.event.inputs.ENVIRONMENT }}" -var="rg_suffix=prod"
         terraform plan
      - name: Perform Terraform Drift
        if: ${{ (steps.init.exit_code == 0) && (github.event.inputs.TERRAFORM == 'DRIFT') }}
        id: drift
        shell: bash
        run: |
         export ARM_SUBSCRIPTION_ID='ae2812b8-a4a2-4fa8-8c4f-b2b0df170677'
         export TF_LOG="ERROR"
         # terraform apply -var="rg_env=${{ github.event.inputs.ENVIRONMENT }}" -var="rg_suffix=dev" --auto-approve
         terraform apply --refresh-only        
      - name: Perform Terraform Apply
        if: ${{ (steps.init.exit_code == 0) && (github.event.inputs.TERRAFORM == 'APPLY') }}
        id: apply
        shell: bash
        run: |
         export ARM_SUBSCRIPTION_ID='ae2812b8-a4a2-4fa8-8c4f-b2b0df170677'
         # terraform apply -var="rg_env=${{ github.event.inputs.ENVIRONMENT }}" -var="rg_suffix=prod" --auto-approve
         terraform apply --auto-approve
      - name: List Terraform Resources
        if: success()  # success() || failure() - Depends on previous step.
        shell: bash
        run: |
          export ARM_SUBSCRIPTION_ID='ae2812b8-a4a2-4fa8-8c4f-b2b0df170677'
          terraform state list
      - name: Perform Terraform Destroy
        if: ${{ (steps.init.exit_code == 0) && (github.event.inputs.TERRAFORM == 'DESTROY') }}
        id: destroy
        shell: bash
        run: |
         export ARM_SUBSCRIPTION_ID='ae2812b8-a4a2-4fa8-8c4f-b2b0df170677'
         # terraform destroy -var="rg_env=${{ github.event.inputs.ENVIRONMENT }}" -var="rg_suffix=prod" --auto-approve
         terraform destroy --auto-approve
  ```

## AWS Terraform with GitLab:

## GitLab Pipeline:

- Launch one Ubuntu Machine.
- install tfenv by below in Ubuntu Machine's USERHOME.
  ```shell
  $ git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
  $ echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile
  $ ln -s ~/.tfenv/bin/* /usr/local/bin
  $ sudo ln -s ~/.tfenv/bin/* /usr/local/bin
  $ tfenv list-remote
  ```
- Runner Configuration in gitlab
    - Go to Project -> Settings ->CI/CD -> Expand Runners.
    - Provide the tags and click on create the runner button
      ![041-0](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/041-0.png)
      ```
      $ curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_amd64.deb"
      $ dpkg -i gitlab-runner_amd64.deb
      $ sudo dpkg -i gitlab-runner_amd64.deb
      ```
    - Click on Linux and follow the steps
      ![042](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/042.png)

      ***Command:***
    - RUN THE COMMAND WITH SUDO.
      ```shell
      ubuntu@ip-10-1-1-247:~$ sudo gitlab-runner register  --url https://gitlab.com  --token glrt-bfbRfJRonkf4g9uxrZod
  
      ```
      ***Output:***
      ```shell
      Runtime platform                                    arch=amd64 os=linux pid=65117 revision=b92ee590 version=17.4.0
      Running in system-mode.
      
      Enter the GitLab instance URL (for example, https://gitlab.com/):
      [https://gitlab.com]:
      Verifying runner... is valid                        runner=bfbRfJRon
      Enter a name for the runner. This is stored only in the local config.toml file:
      [ip-10-1-1-247]:
      Enter an executor: docker, docker-windows, docker+machine, instance, custom, shell, ssh, virtualbox, parallels, kubernetes, docker-autoscaler:
      shell
      Runner registered successfully. Feel free to start it, but if it's running already the config should be automatically reloaded!
      
      Configuration (with the authentication token) was saved in "/etc/gitlab-runner/config.toml"
      ```
      ![043](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/043.png)

    - Runner Registered Successfully now check the runner in the gitlab. By Clicking on Vire Runner Button.
      ![044](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/044.png)
    - Check the runner status if not started start it.
      ```shell
      ps -ef|grep -i runner
  
      ```
- Now we will add the VAriables for SECRET_KEY AND ACCESS_KEYS
- Go to Project -> Settings ->CI/CD -> Expand Variables > Add Variables.
- Now generate the token in Terraform in app.terraform.io link
  ![047](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/047.png)

- Now add token in variables in Gitlab.  
  ![045](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/045.png)
  ![046](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/046.png)
  ![048](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/048.png)
- Now upload the pem file in the Gitlab
- Go to Project -> Settings ->CI/CD -> Expand Secure Files > Upload the pem file.
  ![049](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/049.png)
- To start the pipe line you need to add the pipeline script in the name .gitlab-ci.yml
- use below code to the yml and for terraform script used REPO: https://gitlab.com/devsecops9465739/gitlabpipeline
  ***.gitlab-ci.yaml***
  ```yml
  # git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
  # ln -s /home/gitlab-runner/.tfenv/bin/ /home/gitlab-runner/
  # echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc
  # source .bashrc
  
  
  default:
    tags:
    - Terraform
    - AWS
  
  variables:
    TERRAFORM_DESTROY: "NO"
    TERRAFORM_APPLY: "YES"
    TERRAFORM_VERSION: '1.9.6'
  
  stages:
    - terraform-version-check
    - terraform-init
    - terraform-fmt-validate
    - terraform-plan
    - terraform-apply
    - terraform-destroy
  
  job-check-terraform-version:
    stage: terraform-version-check
    rules:
      - if: $TERRAFORM_DESTROY == "NO" && $TERRAFORM_APPLY == "YES"
    script:
    - pwd && ls -al
    - tfenv install $TERRAFORM_VERSION && tfenv use $TERRAFORM_VERSION
    - terraform version
  
  job-run-terraform-init:
    stage: terraform-init
    rules:
      - if: $TERRAFORM_DESTROY == "NO" && $TERRAFORM_APPLY == "YES"
    script:
      - curl --silent "https://gitlab.com/gitlab-org/incubation-engineering/mobile-devops/download-secure-files/-/raw/main/installer" | bash
      - pwd
      - ls -al .secure_files
      - mv .secure_files/July2024.pem .
      - echo $AWS_ACCESS_KEY_ID
      - echo $AWS_SECRET_ACCESS_KEY
      - terraform init
  
  job-run-terraform-fmt-validate:
    stage: terraform-fmt-validate
    rules:
      - if: $TERRAFORM_DESTROY == "NO" && $TERRAFORM_APPLY == "YES"
    script:
      - curl --silent "https://gitlab.com/gitlab-org/incubation-engineering/mobile-devops/download-secure-files/-/raw/main/installer" | bash
      - pwd
      - ls -al
      - mv .secure_files/July2024.pem .
      - echo $AWS_ACCESS_KEY_ID
      - echo $AWS_SECRET_ACCESS_KEY
      - terraform init 
      - terraform fmt && terraform validate
  
  job-run-terraform-plan:
    stage: terraform-plan
    #allow_failure: true
    rules:
      - if: $TERRAFORM_DESTROY == "NO" && $TERRAFORM_APPLY == "YES"
    script:
      - curl --silent "https://gitlab.com/gitlab-org/incubation-engineering/mobile-devops/download-secure-files/-/raw/main/installer" | bash
      - pwd
      - ls -al
      - mv .secure_files/July2024.pem .
      - echo $AWS_ACCESS_KEY_ID
      - echo $AWS_SECRET_ACCESS_KEY
      - echo $TERRAFORM_DESTROY
      - terraform init 
      - terraform plan
  
  job-run-terraform-apply:
    variables: {}
    stage: terraform-apply
    needs: ["job-run-terraform-plan"]
    variables:
    rules:
      - if: $TERRAFORM_DESTROY == "NO" && $TERRAFORM_APPLY == "YES"
    script:
      - curl --silent "https://gitlab.com/gitlab-org/incubation-engineering/mobile-devops/download-secure-files/-/raw/main/installer" | bash
      - pwd
      - ls -al
      - mv .secure_files/July2024.pem .
      - echo $TERRAFORM_DESTROY
      - echo $AWS_ACCESS_KEY_ID
      - echo $AWS_SECRET_ACCESS_KEY
      - terraform init 
      - terraform apply --auto-approve
  
  job-run-terraform-destroy:
    stage: terraform-destroy
    #needs: ["job-run-terraform-plan"]
    variables:
      JOB_VAR: "A job variable"
    rules:
      - if: $TERRAFORM_DESTROY == "YES"
    script:
      - curl --silent "https://gitlab.com/gitlab-org/incubation-engineering/mobile-devops/download-secure-files/-/raw/main/installer" | bash
      - pwd
      - ls -al
      - mv .secure_files/July2024.pem .
      - echo $AWS_ACCESS_KEY_ID
      - echo $AWS_SECRET_ACCESS_KEY
      - terraform init 
      - terraform destroy --auto-approve
  ```
- Now according to the above code when you push the code pipeline starts and PLAN=YES & DESTROY=NO so only applies
- Now we will go to pipeline Build > Pipelines.
  ![050](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/050.png)
  ![051](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/051.png)

- Now we will destroy the code by PLAN=NO & DESTROY=YES
  ![052](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/052.png)

## Hashicorp Vault:

- Launch one t2.medium instance from the AWS.
- Now we will create the role for kms and assign to above instance.
  ![053](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/053.png)
  ![054](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/054.png)
  ![055](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/055.png)
  ![056](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/056.png)
  ![057](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/057.png)
  ```
  { "Version": "2012-10-17", 
    "Statement": {
      "Effect": "Allow", 
      "Action": "kms:*", 
      "Resource": "*"
    } 
  }
  ```
  ![058](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/058.png)
  ![059](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/059.png)
- Now assign it to above created istance. EC2 > Instances > i-0368021bd32777846 > Modify IAM role
  ![060](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/060.png)
- Run the below commands in the ec2 instance.  
  ***Commands:***
  ```shell
  apt update && apt install -y net-tools unzip
  sudo snap install --classic certbot
  ```
  ![061](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/061.png)
  ***Command:***
  ```shell
  root@ip-10-1-1-56:~# certbot certonly --manual --preferred-challenges=dns --key-type rsa --email anilreddy.m8@gmail.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d *.madireddyanil.in
  ```
  ***Output:***
  ```
  Saving debug log to /var/log/letsencrypt/letsencrypt.log
  
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Would you be willing, once your first certificate is successfully issued, to
  share your email address with the Electronic Frontier Foundation, a founding
  partner of the Let's Encrypt project and the non-profit organization that
  develops Certbot? We'd like to send you email about our work encrypting the web,
  EFF news, campaigns, and ways to support digital freedom.
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  (Y)es/(N)o: Y
  Account registered.
  Requesting a certificate for *.madireddyanil.in
  
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Please deploy a DNS TXT record under the name:
  
  _acme-challenge.madireddyanil.in.
  
  with the following value:
  
  9h_XkpS3cK20P4wz7pLruaN7_ICL_oyqhofTm0cTCi0
  
  Before continuing, verify the TXT record has been deployed. Depending on the DNS
  provider, this may take some time, from a few seconds to multiple minutes. You can
  check if it has finished deploying with aid of online tools, such as the Google
  Admin Toolbox: https://toolbox.googleapps.com/apps/dig/#TXT/_acme-challenge.madireddyanil.in.
  Look for one or more bolded line(s) below the line ';ANSWER'. It should show the
  value(s) you've just added.
  
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Press Enter to Continue
  
  Successfully received certificate.
  Certificate is saved at: /etc/letsencrypt/live/madireddyanil.in/fullchain.pem
  Key is saved at:         /etc/letsencrypt/live/madireddyanil.in/privkey.pem
  This certificate expires on 2024-12-29.
  These files will be updated when the certificate renews.
  
  NEXT STEPS:
  - This certificate will not be renewed automatically. Autorenewal of --manual certificates requires the use of an authentication hook script (--manual-auth-hook) but one was not provided. To renew this certificate, repeat this same certbot command before the certificate's expiry date.
  
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  If you like Certbot, please consider supporting our work by:
   * Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   * Donating to EFF:                    https://eff.org/donate-le
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ```
  ![069](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/062.png)
  ![062](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/062.png)
  ![063](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/063.png)

### Creating KMS:

- While creating use the KMS role and admin role to manage the KMS.
  ![064](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/064.png)
  ![065](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/065.png)
  ![066](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/066.png)
  ![067](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/067.png)
  ![068](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/068.png)
- Now check the version in vaultproject.io/download
  or https://developer.hashicorp.com/vault/install?product_intent=vault
  ![070](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/070.png)
  ![071](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/071.png)
  ***Commands:***
  ```
  root@ip-10-1-1-56:~# wget https://releases.hashicorp.com/vault/1.17.6/vault_1.17.6_linux_amd64.zip
  root@ip-10-1-1-56:~# unzip vault_1.17.6_linux_amd64.zip
  ```
  ***Command:***
  ```
  root@ip-10-1-1-56:~# ls
  
  ```
  ***Output:***
  ```
  LICENSE.txt  snap  vault  vault_1.17.6_linux_amd64.zip
  
  ```
  ***Commands:***
  ```
  root@ip-10-1-1-56:~# cp vault /usr/bin/vault
  root@ip-10-1-1-56:~# mkdir -p /etc/vault && mkdir -p /var/lib/vault/data
  ```
  ***Command:***
  ```
  root@ip-10-1-1-56:~# vault version
  
  ```
  ***Output:***
  ```
  Vault v1.17.6 (69a720d5d940bfcd590d7c24f3c98f178673d796), built 2024-09-24T19:48:40Z
  
  ```
- Now we will create the file below by modifying or adding the above created ```certbot(cert and key)```, above created
  ```KMS keyID```, s3 bucket and api_addr and paste in the below code.
  ![072](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/072.png)
- Now for this configuration we need one s3 bucket.
  ![073](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/073.png)
- Now we will create the ```config.hcl``` file.
  ```
  root@ip-10-1-1-56:~# vi /etc/vault/config.hcl
  
  ```
  ***config.hcl***
  ```
  disable_cache = true
  disable_mlock = true
  ui            = true
  listener "tcp" {
    address                  = "0.0.0.0:8200"
    tls_disable              = 0
    tls_cert_file            = "/etc/letsencrypt/live/madireddyanil.in/fullchain.pem"
    tls_key_file             = "/etc/letsencrypt/live/madireddyanil.in/privkey.pem"
    tls_disable_client_certs = "true"
  
  }
  storage "s3" {
    bucket = "madireddykmsbucket"
  }
  
  seal "awskms" {
    region     = "us-east-1"
    kms_key_id = "a21f7f7c-99f1-48fe-a89f-90dfd86f12b9"
    endpoint   = "kms.us-east-1.amazonaws.com"
  }
  
  api_addr                = "https://vault.madireddyanil.in:8200"
  max_lease_ttl           = "10h"
  default_lease_ttl       = "10h"
  cluster_name            = "vault"
  raw_storage_endpoint    = true
  disable_sealwrap        = true
  disable_printable_check = true
  ```
  ![074](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/074.png)
- Now we will create the ```vault.service``` file.
  ```
  root@ip-10-1-1-56:~# vi /etc/systemd/system/vault.service
  
  ```
  ***vault.service***
  ```
  [Unit]
  Description="HashiCorp Vault - A tool for managing secrets"
  Documentation=https://www.vaultproject.io/docs/
  Requires=network-online.target
  After=network-online.target
  ConditionFileNotEmpty=/etc/vault/config.hcl
  
  [Service]
  ProtectSystem=full
  ProtectHome=read-only
  PrivateTmp=yes
  PrivateDevices=yes
  SecureBits=keep-caps
  AmbientCapabilities=CAP_IPC_LOCK
  NoNewPrivileges=yes
  ExecStart=/usr/bin/vault server -config=/etc/vault/config.hcl
  ExecReload=/bin/kill --signal HUP
  KillMode=process
  KillSignal=SIGINT
  Restart=on-failure
  RestartSec=5
  TimeoutStopSec=30
  StartLimitBurst=3
  LimitNOFILE=6553
  
  [Install]
  WantedBy=multi-user.target
  ```
- Exporting ```VAULT_ADDR``` in the shell.
  ```
  root@ip-10-1-1-56:~# export VAULT_ADDR=https://vault.madireddyanil.in:8200

  ```
- Better to add above export in .bashrc file.
  ```
  root@ip-10-1-1-56:~# vi ~/.bashrc

  ```
  ```
  export VAULT_ADDR=https://vault.madireddyanil.in:8200

  ```
  ```
  source .bashrc

  ```
- Now we will reload the vault by below command.  
  ***Command:***
  ```
  sudo systemctl daemon-reload &&  sudo systemctl stop vault && sudo systemctl start vault && sudo systemctl enable vault &&  sudo systemctl status vault --no-pager

  ```
  ***Output:***
  ```
   vault.service - "HashiCorp Vault - A tool for managing secrets"
       Loaded: loaded (/etc/systemd/system/vault.service; enabled; preset: enabled)
       Active: active (running) since Mon 2024-09-30 16:23:43 UTC; 246ms ago
         Docs: https://www.vaultproject.io/docs/
     Main PID: 7225 (vault)
        Tasks: 7 (limit: 4676)
       Memory: 24.8M (peak: 25.1M)
          CPU: 110ms
       CGroup: /system.slice/vault.service
               └─7225 /usr/bin/vault server -config=/etc/vault/config.hcl
  ```
- Now browse it.
  ```
  https://vault.madireddyanil.in:8200

  ```
  ![075](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/075.png)
- Now we need to initialise using the command.  
  ***Command:***
  ```
  root@ip-10-1-1-56:/etc/systemd/system# vault operator init | tee -a /etc/vault/init.file
  
  ```
  ***Output:***
  ```
  Recovery Key 1: ui/xwgJJoTOc2oCIR1uNkDsn0fkCL4Uq+6D2NaQ9S7Ex
  Recovery Key 2: NwglIMH10vbr5IAK4ksSTiwUQp0Tc4Q0fcIFB5p0LNgJ
  Recovery Key 3: NwCXtPSVKqO8v6mLiIkTaR6VPaYeOkRk+IZo5Ir/ZJzt
  Recovery Key 4: e7CK5n8nGfZbTCIo7OUODBZFgSXLvIGJ6RqKfSPbAR9c
  Recovery Key 5: c3pbGSQY9cecvTRU98mhvFvcDgmWF4V9kyp/3e0Mq5+l
  
  Initial Root Token: hvs.A8d1vizteY2Ec7rv9XqtGLUu
  
  Success! Vault is initialized
  
  Recovery key initialized with 5 key shares and a key threshold of 3. Please
  securely distribute the key shares printed above.
  ```
  ![076](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/076.png)
- Now use below from the above initialisation and login in vault.
  ```
  Initial Root Token: hvs.A8d1vizteY2Ec7rv9XqtGLUu
  
  ```
- Now it looks like this in vault app.
  ![077](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/077.png)
- NOw we will write the terraform code to create the secrtes.
  ***providers.tf***
  ```tf
  provider "aws" {
  }
  
  provider "vault" {
    address         = var.vault_addr
    token           = var.vault_token
    skip_tls_verify = true
  }
  ```
  ***hashi-vault-passwords.tf***
  ```tf
  resource "vault_mount" "java-app-dev" {
    path        = "java-app-dev"
    type        = "kv"
    options     = { version = "1" }
    description = "KV Version 1 secret engine mount"
  }
  
  resource "vault_kv_secret" "linux-machine-1" {
    path = "${vault_mount.java-app-dev.path}/linux-machine-1"
    data_json = jsonencode(
      {
        linux-machine-1 = random_password.linux-machine-passwords.0.result
      }
    )
  }
  
  resource "vault_kv_secret" "linux-machine-2" {
    path = "${vault_mount.java-app-dev.path}/linux-machine-2"
    data_json = jsonencode(
      {
        linux-machine-2 = random_password.linux-machine-passwords.1.result
      }
    )
  }
  
  resource "vault_kv_secret" "linux-machine-3" {
    path = "${vault_mount.java-app-dev.path}/linux-machine-3"
    data_json = jsonencode(
      {
        linux-machine-3 = random_password.linux-machine-passwords.2.result
      }
    )
  }
  ```
  ***megastar-superstar.tf***
  ```tf
  resource "random_password" "vm-passwords" {
    count            = 3
    length           = 16
    special          = true
    override_special = "!#$%&*()-_=+[]{}<>:?"
  }
  
  resource "vault_mount" "megastar" {
    path        = "megastar"
    type        = "kv-v2"
    description = "This Container Megastar Family Secrets"
  }
  
  resource "vault_mount" "superstar" {
    path        = "superstar"
    type        = "kv-v2"
    description = "This Container superstar Family Secrets"
  }
  
  #Creating Megastar Secrets
  resource "vault_kv_secret_v2" "mega-secrets" {
    count               = 3
    mount               = vault_mount.megastar.path
    name                = "linux-machine-${count.index + 1}"
    cas                 = 1
    delete_all_versions = true
    data_json = jsonencode(
      {
        username = "adminsree",
        password = element(random_password.vm-passwords.*.result, count.index)
      }
    )
    custom_metadata {
      max_versions = 5
      data = {
        foo = "vault@megastar.com"
      }
    }
  }
  
  
  #Creating Superstar Secrets
  resource "vault_kv_secret_v2" "super-secrets" {
    count               = 3
    mount               = vault_mount.superstar.path
    name                = "super-linux-machine-${count.index + 1}"
    cas                 = 1
    delete_all_versions = true
    data_json = jsonencode(
      {
        username = "adminsree",
        password = element(random_password.vm-passwords.*.result, count.index)
      }
    )
    custom_metadata {
      max_versions = 5
      data = {
        foo = "vault@superstar.com"
      }
    }
  }
  ```
  ***random-passwords.tf***
  ```tf
  #Generating random password for Linux Machines
  resource "random_password" "linux-machine-passwords" {
    count            = var.vm_count
    length           = 16
    special          = true
    override_special = "!@#$%^"
    min_upper        = 4
    min_lower        = 4
    min_special      = 4
    min_numeric      = 4
  }
  ```
  ***variables.tf***
  ```tf
  variable "vault_addr" {
    default = "https://vault.madireddyanil.in:8200"
  }
  variable "vault_token" {
    default = "hvs.A8d1vizteY2Ec7rv9XqtGLUu"
  }
  
  variable "vm_count" {
    default = 3
  }
  ```

  ***Commands:***
  ```shell
  $ terraform init
  $ terraform validate
  $ terraform apply
  ```
- Now we can see the Vault app in browser. so that secrets engines are created.
  ![078](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/078.png)
  ![079](https://github.com/AnilAWSDevSecOps/awsDevsecOps-Notes/blob/main/GIT_With_AWS_AZ_Terraform/Notes_Images/079.png)
  


