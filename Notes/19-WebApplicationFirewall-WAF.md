# 19. Web Application Firewall(WAF):

## 19.1. Creating IP Set:

- Click on the Create IP set button.
  ![509](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/509.png)

- Fill in the details like IP set name and IP addresses.
- Here we are adding some Public IPs to block or to allow in Web Application Firewall(WAF).
  ![510](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/510.png)

- IP Set created successfully.
  ![511](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/511.png)

## 19.2. Creating Rule Groups:

- Click on the Create rule group button to create rule group.
  ![512](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/512.png)

- Fill in the details like Name, CloudWatch metric name and Region, click on Next.
  ![513](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/513.png)

- Click on add rule button to add some rules.
  ![514](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/514.png)

- Fill in the details like Name, Type, Inspect and Country codes.
  ![515](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/515.png)

- Select Block if you want to block India, click on add rule.
  ![516](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/516.png)

- Block India Rule added successfully.
- Now Click on Add rule again to add the rate-based rule, as we have added one Regular rule before.
  ![517](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/517.png)

- Fill in the details like Name and type.
  ![518](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/518.png)

- Fill in Rate limit, and etc. and click on add rule button.
  ![519](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/519.png)

- Rate based rule added successfully.
  ![520](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/520.png)

- Fill in the Capacity, Click On Next.
  ![521](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/521.png)

- Click On Next.

  ![522](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/522.png)

- Click on Create button.

  ![523](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/523.png)

- Rule group created successfully.
  ![524](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/524.png)

- Now we will create the Web ACL

## 19.3. Creating the Web ACL:

- Click on Create button.
  ![525](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/525.png)

- Fill in the Details.

  ![526](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/526.png)

- Click on Add AWS resources and add the ALB
- ```Note:``` Post 20 min of ALB creation only you can add the ALB here.
  ![527](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/527.png)

- Select Application Load Balancer and Name. and click on add button.
  ![528](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/528.png)

- Click on Next Now.

  ![529](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/529.png)

- Click on Add my own rules and rule group
  ![530](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/530.png)

- Fill in the details, Select our IP List which we created earlier, Click on add rule

  ![531](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/531.png)

- Again, Click on Add my own rules and rule group
  ![532](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/532.png)

- Select Rule group. Fill the Name.
- Select Rule Group which we created earlier.
- Under rule group Enable the Override rulegroup action.
- Click on Add rule button.

  ![533](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/533.png)

- Added my own rules and Allow Default action, Click on Next.
  ![534](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/534.png)

- Click Next

  ![535](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/535.png)

- Click Next. And click on Create Web ACL button next.
  ![536](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/536.png)

- Web ACL created successfully
  ![537](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/537.png)

- Now when you browse from India it will come as forbidden. As we blocked India, try from outside India.
  ![538](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/538.png)

- Some may use proxies for browsing to bold those IPs we do this.
- Click on WebACL’s Add managed rule groups
  ![539](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/539.png)

- Expand AWS managed rule groups
  ![540](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/540.png)

- Enable Anonymous IP list, and click on Add rule button
  ![541](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/541.png)

- After adding the AWS rule click on save button.
  ![542](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/542.png)
  ![543](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/543.png)

- After adding AWS proxy rule now by VPN, we cannot browse it.
  ![544](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/500-939/544.png)
