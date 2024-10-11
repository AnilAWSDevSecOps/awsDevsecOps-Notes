# 19. Web Application Firewall(WAF):
## 19.1. Creating IP Set:
- Click on the Create IP set button.
  ![509](https://github.com/user-attachments/assets/608e5a0e-80cc-4d9c-bcb2-b14f79a158c8)

- Fill in the details like IP set name and IP addresses.
- Here we are adding some Public IPs to block or to allow in Web Application Firewall(WAF).
  ![510](https://github.com/user-attachments/assets/97a360ac-f143-4a94-89ae-19b28b61d78f)

- IP Set created successfully.
  ![511](https://github.com/user-attachments/assets/72eaaeb4-507e-4b8e-9725-ad0334241dd9)

## 19.2. Creating Rule Groups:
- Click on the Create rule group button to create rule group.
  ![512](https://github.com/user-attachments/assets/5bb72ed4-b782-4ea6-bb6a-7816449cfb78)

- Fill in the details like Name, CloudWatch metric name and Region, click on Next.
  ![513](https://github.com/user-attachments/assets/01ab3956-dc70-4016-97db-d7c567915fc8)

- Click on add rule button to add some rules.
  ![514](https://github.com/user-attachments/assets/6ebb368a-1868-4058-a7b7-819dd194656b)

- Fill in the details like Name, Type, Inspect and Country codes.
  ![515](https://github.com/user-attachments/assets/99b4e458-1af5-4ccd-8673-542021dcbf3a)

- Select Block if you want to block India, click on add rule.
  ![516](https://github.com/user-attachments/assets/d0a04f0d-931d-4a67-8073-e83ac5b2615d)

- Block India Rule added successfully.
- Now Click on Add rule again to add the rate-based rule, as we have added one Regular rule before.
  ![517](https://github.com/user-attachments/assets/b8f5b425-31ed-41aa-8ad5-faa162d2368f)

- Fill in the details like Name and type.
  ![518](https://github.com/user-attachments/assets/a4cbfc10-fd40-4eff-811e-e267388e6106)

- Fill in Rate limit, and etc. and click on add rule button.
  ![519](https://github.com/user-attachments/assets/d8d5ceae-c2e7-4714-987a-af388f0d3b94)

- Rate based rule added successfully.
  ![520](https://github.com/user-attachments/assets/380549d9-c337-405d-bd1d-a91e28a937b7)

- Fill in the Capacity, Click On Next.
  ![521](https://github.com/user-attachments/assets/761fe50c-8c4d-48aa-ad18-3f93c5698623)

- Click On Next.
  
  ![522](https://github.com/user-attachments/assets/121a5b85-fabb-4249-9748-bfcb4ecb213b)

- Click on Create button.
  
  ![523](https://github.com/user-attachments/assets/5c0a7e83-c06a-4706-959e-22bf8c49af32)

- Rule group created successfully.
  ![524](https://github.com/user-attachments/assets/8c361a3a-6c01-4cbc-82c7-148cc8199803)

- Now we will create the Web ACL

## 19.3. Creating the Web ACL:
- Click on Create button.
  ![525](https://github.com/user-attachments/assets/61392f66-431e-4d14-b700-87680e478c4c)

- Fill in the Details.
  
  ![526](https://github.com/user-attachments/assets/6a65cd6b-b924-4265-9d7c-9885128530d8)

- Click on Add AWS resources and add the ALB
- ```Note:``` Post 20 min of ALB creation only you can add the ALB here.
  ![527](https://github.com/user-attachments/assets/28e0ca16-5b48-4914-92dc-4377ae6ccd3f)

- Select Application Load Balancer and Name. and click on add button.
  ![528](https://github.com/user-attachments/assets/5050b8e9-15a2-4fd5-807b-96dd04d9afb1)

- Click on Next Now.
  
  ![529](https://github.com/user-attachments/assets/55f2ea3e-6bcf-439d-b5a4-e7a9a1a04a1b)

- Click on Add my own rules and rule group
  ![530](https://github.com/user-attachments/assets/3af05e8b-ddcc-4953-9470-0c39136d9ee3)

- Fill in the details, Select our IP List which we created earlier, Click on add rule
  
  ![531](https://github.com/user-attachments/assets/c8cbeca1-5cba-485a-ae60-0cf09832cb73)

- Again, Click on Add my own rules and rule group
  ![532](https://github.com/user-attachments/assets/f5a80d9d-11ec-4892-9bb3-164c6f7a1447)

- Select Rule group. Fill the Name.
- Select Rule Group which we created earlier.
- Under rule group Enable the Override rulegroup action.
- Click on Add rule button.
  
  ![533](https://github.com/user-attachments/assets/869dddd7-cb0d-41fa-858d-53f8e3bc77ab)

- Added my own rules and Allow Default action, Click on Next.
  ![534](https://github.com/user-attachments/assets/1277c039-ceac-4b50-8b65-948447f9eb30)

- Click Next
  
  ![535](https://github.com/user-attachments/assets/fd4a2775-0011-4d25-b246-1f06bfe96ed7)

- Click Next. And click on Create Web ACL button next.
  ![536](https://github.com/user-attachments/assets/17b9fe37-1789-45ad-84b3-8670aff3ff40)

- Web ACL created successfully
  ![537](https://github.com/user-attachments/assets/20a30bdb-fa80-4ec6-88a8-bda0166a6778)

- Now when you browse from India it will come as forbidden. As we blocked India, try from outside India.
  ![538](https://github.com/user-attachments/assets/d8c1771a-3c5d-45d5-9abe-fd0250712105)

- Some may use proxies for browsing to bold those IPs we do this.
- Click on WebACL’s Add managed rule groups
  ![539](https://github.com/user-attachments/assets/8700cc08-dea3-465d-a847-88df2148c2a8)

- Expand AWS managed rule groups
  ![540](https://github.com/user-attachments/assets/bdf91eeb-c204-459d-ab3b-89c47af9a4f7)

- Enable Anonymous IP list, and click on Add rule button
  ![541](https://github.com/user-attachments/assets/640c0047-af0b-4cf2-a264-cd5a2fd39da9)

- After adding the AWS rule click on save button.
  ![542](https://github.com/user-attachments/assets/efe050e6-19d1-4c2d-8b92-e4a0431efefe)

- After adding AWS proxy rule now by VPN, we cannot browse it.
  ![544](https://github.com/user-attachments/assets/09beb056-68ea-4cdc-850e-ba46891d9098)
