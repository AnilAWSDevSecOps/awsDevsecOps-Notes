# 4. Internet Gateway Creation:

  1. Click on Create internet gateway button.
     ![09](https://github.com/user-attachments/assets/4d8f8058-159d-457e-8b45-6442431fd7ec)

  2. Fill in the details like Name tag and click on Create internet gateway button.
     ![10](https://github.com/user-attachments/assets/59b1e119-cfd7-493c-b614-47b0d19b3e8e)

  3. IGW created successfully, by default after internet gateway creation it will be in Detached state, click on Attach to a VPC if you want to attach it to VPC now.
     ![11](https://github.com/user-attachments/assets/ac115a3e-59ed-4c47-9f2d-b87271dde145)

  4. Select VPC that you want to attach in the dropdown and click on Attach internet gateway button, by this internet gateway is attached to the VPC so we can use this internet gateway with in VPC.
     ![12](https://github.com/user-attachments/assets/34aaf969-b3e4-4243-816a-888648e11160)

  5. Alternatively, you can attach Internet gateway to VPC as below.
     ![13](https://github.com/user-attachments/assets/bf6b0bfb-e5e3-4c0b-a07c-e3372a20eb8e)

  6. After VPC attachment it looks like below.
     ![14](https://github.com/user-attachments/assets/09bb1925-7e16-4e57-a705-6530ae73b218)

  ## 4.1. Attaching the Internet Gateway to Route table:

   1. Adding Internet Gateway in Route table’s Routes, click on Edit routes button.
      ![15](https://github.com/user-attachments/assets/60f22459-f213-4c91-b1b8-858593de1c5b)

   2. Click on Add route button.
      ![16](https://github.com/user-attachments/assets/f8e30ebc-365a-421c-ac65-cc00b8647299)

   3. Fill the details like Destination & Target, click on Save Changes button.
      ![17](https://github.com/user-attachments/assets/ccba87fb-2138-47e7-a071-b7b181cc7851)

   4. By doing this we can access the instances under this route can be accessed over the internet and instances can access the internet from inside.
      ![18](https://github.com/user-attachments/assets/7d5e670f-7ef1-4c36-a40d-6bb6dd66a70a)
