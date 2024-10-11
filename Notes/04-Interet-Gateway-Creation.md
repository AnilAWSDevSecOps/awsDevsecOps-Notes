# 4. Internet Gateway Creation:

1. Click on Create internet gateway button.
   ![09](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/09.jpg)

2. Fill in the details like Name tag and click on Create internet gateway button.
   ![10](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/10.jpg)

3. IGW created successfully, by default after internet gateway creation it will be in Detached state, click on Attach to
   a VPC if you want to attach it to VPC now.
   ![11](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/11.jpg)

4. Select VPC that you want to attach in the dropdown and click on Attach internet gateway button, by this internet
   gateway is attached to the VPC so we can use this internet gateway with in VPC.
   ![12](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/12.jpg)

5. Alternatively, you can attach Internet gateway to VPC as below.
   ![13](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/13.jpg)

6. After VPC attachment it looks like below.
   ![14](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/14.jpg)

## 4.1. Attaching the Internet Gateway to Route table:

1. Adding Internet Gateway in Route table’s Routes, click on Edit routes button.
   ![15](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/15.jpg)

2. Click on Add route button.
   ![16](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/16.jpg)

3. Fill the details like Destination & Target, click on Save Changes button.
   ![17](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/17.jpg)

4. By doing this we can access the instances under this route can be accessed over the internet and instances can access
   the internet from inside.
   ![18](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/01-499/18.jpg)
