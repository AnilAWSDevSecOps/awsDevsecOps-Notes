# 9. Connecting to Instances:

  1. Download putty & Install Putty, click on next.
     ![49](https://github.com/user-attachments/assets/c1558ed1-a3e6-406b-8c2e-7d9f78595027)
     
     ![50](https://github.com/user-attachments/assets/be9fa891-40fe-4594-a6e5-c6356ab51187)

  3. Open Puttygen and click on load button, before this you need to convert the pem file into ppk file so that you can access it here.
     ![51](https://github.com/user-attachments/assets/f2bf057e-9352-468e-b12f-5d0d97bd7a8f)

  4. Select Our Pem Key File in the load options.
     ![52](https://github.com/user-attachments/assets/5ae97d3c-7b24-44f1-b487-7d04f67a4937)

  5. After loading click on save as private key button and save it in some name.ppk, Open Putty and load the .ppk file in the credentials section.
     ![53](https://github.com/user-attachments/assets/1ce29654-847c-45b2-9196-bd625b9de483)

  6. Save the settings in putty.
     ![54](https://github.com/user-attachments/assets/43ee5627-6af4-4c48-95be-519c444c3b91)

  7. Collect the Public IP of the instance and connect now.
     ![55](https://github.com/user-attachments/assets/86e6f0a1-fbc4-49ea-865f-a6c6ed5bfb42)
     
     ![56](https://github.com/user-attachments/assets/9bca4d31-e6b8-4904-a0ef-62f766201d1c)
     
     ![57](https://github.com/user-attachments/assets/eba727e4-5434-45e7-9402-ae7614b425e0)
     
     ![58](https://github.com/user-attachments/assets/5662b18f-e55e-4733-b42f-e53cd8644e7c)

  9. Now connect to the Private server using private IP through the Public server which we connected above. Bring pem data into the public server and save it as .pem file
     ![59](https://github.com/user-attachments/assets/c1f251d9-dc2c-43fd-b7b1-6923018a1503)
     
     ![60](https://github.com/user-attachments/assets/22392639-109c-4695-915a-6be1f748c418)
      ### ***Commands***
      ```
      vi july2024.pem
      chmod 400 july2024.pem
      ssh -i july2024.pem ubuntu@10.20.0.115
      ```
      ### July2024.pem
      ```
      -----BEGIN RSA PRIVATE KEY-----
      MIIEpAIBAAKCAQEAqmGfDevIdzKyMRpvmoyGnFsT6/POQUEXjQ3qefySalaHnd9q
      nubFsbRNuDEnKs9tWq1xhVAsEseN4PoDsXUkrQ3NbYbia3RV5gWw8zZiFR0lh4kI
      JmkfTdOM45oh4V5P4aLMI0kIphs1MGb3oB0F0I1yvuKw2xBcIvhTU22TeiAN19n8
      9onnaBz1l6FrI3c+kWhFE8mCrND50jeY0A3+1hHhNY3xOm6DxAuzj5nrLoENIjPJ
      7fxSGdby3H+yBuBIKxnymKRuuJPzXFMtuYH23ZBuT7SLB/IFTdmXp5sFxXHKtnQs
      TkqsNIy0rQQl/eeNHU9VCgRQWD07m/QI+MAEWQIDAQABAoIBAH5aqzQNubr8M73K
      lx2MPX/S43FGe51VAnwu58bTklmeFjD0MQPqrI3e4wxIF33eGoD2w4tUK3s51nQT
      tY1zDGHyLHifYWbC/bj6W4HiwNZbqStcaljh+L8ktgVMlvelk6QHsVAxp2JYJxfg
      JJ/vJhLF82SwhOvQtCOS+WiTiJ011hY2Ljd4CjSO3cIx/3jXKTc6i0wEtQvNXxl/
      4nplMoVA7JTZx6aOOA8PoLCTlXvyWxQeY3qeYe/KDQXRosovi/EANnHcUmePflSq
      epwKZj/n1a+81YEmaczdiMDn+j8MxuFnU8IVL9q4nu1hvKA1w0g9r00aesOCV7ho
      W+sLYUkCgYEA3HDdpsVs0qP6i9EDyVENp8rb96SHVaa8Z8rbFuiXzEFjlzjH6wMv
      HftNAANuiu47ZkqS0wk9ySz++/I13pKzTOgTg5vRDDeFwFIYlr+Z2aJ1SfAB+7dQ
      A9r4Hq+u5OmhU0IhC8KVJRKs+RA4BzVdFf1dkaPIAKKs3Yx0nNhu7OcCgYEAxd2K
      QX5J0AEHbAkBeEI7u1bEas//SVPQBHNNvPWXGkkmqwsZPpr//Kc3EgUwWRRaudgY
      WBHFCCEADgHyDIfqabwWWqqD6ShFVnd/27NqLBKMLg6sbsYanwc+BUEyY0CilBjM
      qymTJ2p5vT7N/B1MvwCBE+EPG7taI790skzMHL8CgYEAmR1oR9tfkBvH/m+q0p2S
      /5Y/HY7RVePff7R+YzYhogVVOId/DTUD+C5COJ0pniSFa7KmsyD7Io43eiat1jBN
      jECytTp4hKTYKVKcs7DYGzvlffrQVdfpIxRoPWBH+cZxgNQxAeshD0Qek0z5rcAa
      LRj0ciGx3QchTS2vHfaTbccCgYEAslHJQuMEtJ/ox3WKTI4sdNZqp/SSFsyhARHF
      MpGGvxrD7YxQEPrxzwoH+IaSnwVYCnr03ZIOJxhOi1E3ihGHsgjfgJCB10QC0T1b
      Dm4wNk305aE1x5Nj9IQ7YdLzDT34B04eTfdm9jPgSSxryVXCj7Rtn7PJwO1k/CiU
      jAfoP9MCgYBvvAgo7RHs4UC4LAhmMsu9kzEWL4aIjnyDkskj+bVYNTENdTfLZdXU
      YwQDI1gDQzuRZqv527ryFWYbEnHmGcqMt3SnyfOAvVreFc/jc5P0gKYSTpjgKkql
      CnezK1FBoN3k7b0Xbkyg1+lfOh2kWs4oye7E7ptHa1PHqR6JI8Eekg==
      -----END RSA PRIVATE KEY-----
      ```
     ![61](https://github.com/user-attachments/assets/617e3140-7c69-4577-b834-e4a7901c5104)
