# Elastic Kubernetes Services:

### 1. Install The Kubectl

- Launching New instance with ubuntu linux and t2.medium
  ```
  curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
  sudo mv ./kubectl /usr/local/bin/kubectl
  chmod 700 /usr/local/bin/kubectl
  kubectl version -short
  ```

### 2. Install the EKSCtl

- install the eksctl in the server
  ```
  curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
  sudo mv /tmp/eksctl /usr/local/bin
  sudo chmod 700 /usr/local/bin/eksctl
  eksctl version
  ```

### 3. Installing the AWS CLI

- installing the AWS Cli in the server
  ```
  apt install unzip -y
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  ```

### 4. Configure the AWS CLI:

- Create one Admin CLI user and Create access key
  ![1392](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1392.png)
- configure the AWS CLI in server
  ```
  aws configure
  
  ```

### 5. Generating the key

- Now we will generate the one key.
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# ssh-keygen
      
      ```
    - ***Output***
      ```
      Generating public/private ed25519 key pair.
      Enter file in which to save the key (/root/.ssh/id_ed25519):
      Enter passphrase (empty for no passphrase):
      Enter same passphrase again:
      Your identification has been saved in /root/.ssh/id_ed25519
      Your public key has been saved in /root/.ssh/id_ed25519.pub
      The key fingerprint is:
      SHA256:YGDg7eiMDN1NGewQQq4j1dZ7VmDdafrE36qX1apa49A root@ip-10-1-1-246
      The key's randomart image is:
      +--[ED25519 256]--+
      | .+.+o. o. . .   |
      | o =.o.+ .. +    |
      |  + +o*   .+     |
      | + = +.o .. o    |
      |= o o o S  o . ..|
      |+=     o   .. . +|
      |..o       . E  = |
      |           + .=  |
      |          ..++   |
      +----[SHA256]-----+
      ```

### 6. EKS Cluster creation code:

- match the public key path with the key which you created above
    - ***eksctl-ipv4-cluster.yml***
      ```
      ---
      apiVersion: eksctl.io/v1alpha5
      kind: ClusterConfig
      
      metadata:
        name: eks-test-cluster-01
        region: us-east-2
        version: "1.27"
      
      kubernetesNetworkConfig:
        ipFamily: IPv4
      addons:
        - name: vpc-cni
          version: latest
        - name: coredns
          version: latest
        - name: kube-proxy
          version: latest
        - name: aws-ebs-csi-driver
          version: latest
      
      iam:
        withOIDC: true
      
      managedNodeGroups:
        - name: nodegroup1
          instanceType: t3.medium
          minSize: 2
          desiredCapacity: 3
          maxSize: 4
          availabilityZones: ["us-east-2a", "us-east-2b", "us-east-2c"]
          volumeSize: 30
          ssh:
            allow: true
            publicKeyPath: ~/.ssh/id_ed25519.pub
      ```
- Now use the below command to create the nodegroups with eks cluster using the above code.

    - ***Command:***
      ```
      eksctl create cluster -f eksctl-ipv4-cluster.yml &
      ```
    - ***Output:***
      ```
      root@ip-10-1-1-246:~# 2024-09-04 05:12:13 [ℹ]  eksctl version 0.189.0
      2024-09-04 05:12:13 [ℹ]  using region us-east-2
      2024-09-04 05:12:13 [ℹ]  setting availability zones to [us-east-2a us-east-2c us-east-2b]
      2024-09-04 05:12:13 [ℹ]  subnets for us-east-2a - public:192.168.0.0/19 private:192.168.96.0/19
      2024-09-04 05:12:13 [ℹ]  subnets for us-east-2c - public:192.168.32.0/19 private:192.168.128.0/19
      2024-09-04 05:12:13 [ℹ]  subnets for us-east-2b - public:192.168.64.0/19 private:192.168.160.0/19
      2024-09-04 05:12:13 [ℹ]  nodegroup "nodegroup1" will use "" [AmazonLinux2/1.27]
      2024-09-04 05:12:13 [ℹ]  using SSH public key "/root/.ssh/id_ed25519.pub" as "eksctl-eks-test-cluster-01-nodegroup-nodegroup1-YGDg7eiMDN1NGewQQq4j1dZ7VmDdafrE36qX1apa49A"
      2024-09-04 05:12:13 [ℹ]  using Kubernetes version 1.27
      2024-09-04 05:12:13 [ℹ]  creating EKS cluster "eks-test-cluster-01" in "us-east-2" region with managed nodes
      2024-09-04 05:12:13 [ℹ]  1 nodegroup (nodegroup1) was included (based on the include/exclude rules)
      2024-09-04 05:12:13 [ℹ]  will create a CloudFormation stack for cluster itself and 0 nodegroup stack(s)
      2024-09-04 05:12:13 [ℹ]  will create a CloudFormation stack for cluster itself and 1 managed nodegroup stack(s)
      2024-09-04 05:12:13 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-2 --cluster=eks-test-cluster-01'
      2024-09-04 05:12:13 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "eks-test-cluster-01" in "us-east-2"
      2024-09-04 05:12:13 [ℹ]  CloudWatch logging will not be enabled for cluster "eks-test-cluster-01" in "us-east-2"
      2024-09-04 05:12:13 [ℹ]  you can enable it with 'eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=us-east-2 --cluster=eks-test-cluster-01'
      2024-09-04 05:12:13 [ℹ]
      2 sequential tasks: { create cluster control plane "eks-test-cluster-01",
          2 sequential sub-tasks: {
              5 sequential sub-tasks: {
                  1 task: { create addons },
                  wait for control plane to become ready,
                  associate IAM OIDC provider,
                  no tasks,
                  update VPC CNI to use IRSA if required,
              },
              create managed nodegroup "nodegroup1",
          }
      }
      2024-09-04 05:12:13 [ℹ]  building cluster stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:12:13 [ℹ]  deploying stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:12:43 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:13:13 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:14:13 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:15:14 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:16:14 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:17:14 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:18:14 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:19:14 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:20:14 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:21:14 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-cluster"
      2024-09-04 05:21:15 [!]  recommended policies were found for "vpc-cni" addon, but since OIDC is disabled on the cluster, eksctl cannot configure the requested permissions; the recommended way to provide IAM permissions for "vpc-cni" addon is via pod identity associations; after addon creation is completed, add all recommended policies to the config file, under `addon.PodIdentityAssociations`, and run `eksctl update addon`
      2024-09-04 05:21:15 [ℹ]  creating addon
      2024-09-04 05:21:16 [ℹ]  successfully created addon
      2024-09-04 05:21:16 [ℹ]  creating addon
      2024-09-04 05:21:16 [ℹ]  successfully created addon
      2024-09-04 05:21:17 [ℹ]  creating addon
      2024-09-04 05:21:17 [ℹ]  successfully created addon
      2024-09-04 05:23:18 [ℹ]  deploying stack "eksctl-eks-test-cluster-01-addon-vpc-cni"
      2024-09-04 05:23:18 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-addon-vpc-cni"
      2024-09-04 05:23:48 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-addon-vpc-cni"
      2024-09-04 05:23:48 [ℹ]  updating addon
      2024-09-04 05:23:59 [ℹ]  addon "vpc-cni" active
      2024-09-04 05:23:59 [ℹ]  building managed nodegroup stack "eksctl-eks-test-cluster-01-nodegroup-nodegroup1"
      2024-09-04 05:23:59 [ℹ]  deploying stack "eksctl-eks-test-cluster-01-nodegroup-nodegroup1"
      2024-09-04 05:24:00 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-nodegroup-nodegroup1"
      2024-09-04 05:24:30 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-nodegroup-nodegroup1"
      2024-09-04 05:25:15 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-nodegroup-nodegroup1"
      2024-09-04 05:27:05 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-nodegroup-nodegroup1"
      2024-09-04 05:27:05 [ℹ]  waiting for the control plane to become ready
      2024-09-04 05:27:06 [✔]  saved kubeconfig as "/root/.kube/config"
      2024-09-04 05:27:06 [ℹ]  no tasks
      2024-09-04 05:27:06 [✔]  all EKS cluster resources for "eks-test-cluster-01" have been created
      2024-09-04 05:27:06 [✔]  created 0 nodegroup(s) in cluster "eks-test-cluster-01"
      2024-09-04 05:27:06 [ℹ]  nodegroup "nodegroup1" has 3 node(s)
      2024-09-04 05:27:06 [ℹ]  node "ip-192-168-11-102.us-east-2.compute.internal" is ready
      2024-09-04 05:27:06 [ℹ]  node "ip-192-168-50-148.us-east-2.compute.internal" is ready
      2024-09-04 05:27:06 [ℹ]  node "ip-192-168-64-113.us-east-2.compute.internal" is ready
      2024-09-04 05:27:06 [ℹ]  waiting for at least 2 node(s) to become ready in "nodegroup1"
      2024-09-04 05:27:06 [ℹ]  nodegroup "nodegroup1" has 3 node(s)
      2024-09-04 05:27:06 [ℹ]  node "ip-192-168-11-102.us-east-2.compute.internal" is ready
      2024-09-04 05:27:06 [ℹ]  node "ip-192-168-50-148.us-east-2.compute.internal" is ready
      2024-09-04 05:27:06 [ℹ]  node "ip-192-168-64-113.us-east-2.compute.internal" is ready
      2024-09-04 05:27:06 [✔]  created 1 managed nodegroup(s) in cluster "eks-test-cluster-01"
      2024-09-04 05:27:06 [!]  IRSA has been deprecated; the recommended way to provide IAM permissions for "aws-ebs-csi-driver" addon is via pod identity associations; after addon creation is completed, run `eksctl utils migrate-to-pod-identity`
      2024-09-04 05:27:06 [ℹ]  creating role using recommended policies for "aws-ebs-csi-driver" addon
      2024-09-04 05:27:07 [ℹ]  deploying stack "eksctl-eks-test-cluster-01-addon-aws-ebs-csi-driver"
      2024-09-04 05:27:07 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-addon-aws-ebs-csi-driver"
      2024-09-04 05:27:37 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-addon-aws-ebs-csi-driver"
      2024-09-04 05:28:31 [ℹ]  waiting for CloudFormation stack "eksctl-eks-test-cluster-01-addon-aws-ebs-csi-driver"
      2024-09-04 05:28:31 [ℹ]  creating addon
      2024-09-04 05:29:26 [ℹ]  addon "aws-ebs-csi-driver" active
      2024-09-04 05:29:27 [ℹ]  kubectl command should work with "/root/.kube/config", try 'kubectl get nodes'
      2024-09-04 05:29:27 [✔]  EKS cluster "eks-test-cluster-01" in "us-east-2" region is ready
      
      [1]+  Done                    eksctl create cluster -f eksctl-ipv4-cluster.yml
      ```
- ***Sample Diagram Explaining the Kubernetes Architecture***
  ![1393](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1393.png)

- Resources created after deploying kubernetes cluster
  ![1394](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1394.png)
  ![1395](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1395.png)

- Checking Nodes in Kubernetes Cluster
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get nodes
    
      ```
    - ***Output:***
      ```
      NAME                                           STATUS   ROLES    AGE   VERSION
      ip-192-168-11-102.us-east-2.compute.internal   Ready    <none>   66m   v1.27.15-eks-1552ad0
      ip-192-168-50-148.us-east-2.compute.internal   Ready    <none>   66m   v1.27.15-eks-1552ad0
      ip-192-168-64-113.us-east-2.compute.internal   Ready    <none>   66m   v1.27.15-eks-1552ad0
      ```
- Checking all pods in the all name spaces
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get pods -A
      
      ```
    - ***Output:***
      ```
      NAMESPACE     NAME                                 READY   STATUS    RESTARTS   AGE
      kube-system   aws-node-f7sfl                       2/2     Running   0          80m
      kube-system   aws-node-hkr7h                       2/2     Running   0          80m
      kube-system   aws-node-s22l7                       2/2     Running   0          80m
      kube-system   coredns-6d6cd5c79b-dw7n6             1/1     Running   0          84m
      kube-system   coredns-6d6cd5c79b-dwz9p             1/1     Running   0          84m
      kube-system   ebs-csi-controller-5f94c4bbf-cxgbs   6/6     Running   0          77m
      kube-system   ebs-csi-controller-5f94c4bbf-lvjdx   6/6     Running   0          77m
      kube-system   ebs-csi-node-hknz7                   3/3     Running   0          77m
      kube-system   ebs-csi-node-krqv5                   3/3     Running   0          77m
      kube-system   ebs-csi-node-rj955                   3/3     Running   0          77m
      kube-system   kube-proxy-ccdmt                     1/1     Running   0          80m
      kube-system   kube-proxy-dbcfv                     1/1     Running   0          80m
      kube-system   kube-proxy-tdrgl                     1/1     Running   0          80m
      ```
- ***Deploying pods using our image which is in ECR***
    - ***deployment.yml***
      ```
      apiVersion: apps/v1
      kind: Deployment
      metadata:
        name: myapp1
      spec:
        replicas: 3
        selector:
          matchLabels:
            app: myapp1
        template:
          metadata:
            labels:
              app: myapp1
          spec:
            containers:
            - name: nginx
              image: 559050220397.dkr.ecr.us-east-1.amazonaws.com/devopsbymak:ngtestv1
              ports:
              - containerPort: 80
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl apply -f deployment.yml
      
      ```
    - ***Output:***
      ```
      deployment.apps/myapp1 created
      
      ```
- Now to check the deployment
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get pods
      
      ```
    - ***Output:***
      ```
      NAME                      READY   STATUS    RESTARTS   AGE
      myapp1-86548bdd76-8xc4z   1/1     Running   0          2m47s
      myapp1-86548bdd76-9sqkt   1/1     Running   0          2m47s
      myapp1-86548bdd76-zrpvs   1/1     Running   0          2m47s
      ```
- Now to expose the application to the outer world we run below command
    - ***Comand:***
      ```
      root@ip-10-1-1-246:~# kubectl expose deployment myapp1 --port 80 --type Nodeport --dry-run -o yaml
      
      ```
    - ***Output:***
      ```
      W0904 07:05:15.132039    2530 helpers.go:703] --dry-run is deprecated and can be replaced with --dry-run=client.
      apiVersion: v1
      kind: Service
      metadata:
        creationTimestamp: null
        name: myapp1
      spec:
        ports:
        - port: 80
          protocol: TCP
          targetPort: 80
        selector:
          app: myapp1
        type: Nodeport
      status:
        loadBalancer: {}
      ```
- Now we use the above code and we do the expose.
    - ***deployment-service.yml***
      ```
      apiVersion: v1
      kind: Service
      metadata:
        name: myapp1
      spec:
        ports:
        - port: 80
          protocol: TCP
          targetPort: 80
          nodePort: 31111
        selector:
          app: myapp1
        type: NodePort
      ```
    - ***COmmand:***
      ```
      kubectl apply -f deployment-service.yml
      
      ```
    - ***Output:***
      ```
      service/myapp1 created
      
      ```
- Now we check the service deployed or not.
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get svc
      
      ```
    - ***OutPut:***
      ```
      NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
      kubernetes   ClusterIP   10.100.0.1       <none>        443/TCP        138m
      myapp1       NodePort    10.100.138.188   <none>        80:31111/TCP   3m5s
      ```
- Checking the service description which ip and etc..
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl describe svc myapp1
      
      ```
    - ***Output:***
      ```
      Name:                     myapp1
      Namespace:                default
      Labels:                   <none>
      Annotations:              <none>
      Selector:                 app=myapp1
      Type:                     NodePort
      IP Family Policy:         SingleStack
      IP Families:              IPv4
      IP:                       10.100.138.188
      IPs:                      10.100.138.188
      Port:                     <unset>  80/TCP
      TargetPort:               80/TCP
      NodePort:                 <unset>  31111/TCP
      Endpoints:                192.168.49.33:80,192.168.9.10:80,192.168.64.131:80
      Session Affinity:         None
      External Traffic Policy:  Cluster
      Internal Traffic Policy:  Cluster
      Events:                   <none>
      ```
- Once Check the Inbound Traffic rules in Security group for the created cluster.
- Browse with the instance ip and exposed port
  ```
  http://ec2-3-19-55-183.us-east-2.compute.amazonaws.com:31111
  
  ```
  ![1396](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1396.png)

- Checking deploy
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get deploy
      
      ```
    - ***Output:***
      ```
      NAME     READY   UP-TO-DATE   AVAILABLE   AGE
      myapp1   3/3     3            3           90m
      ```
- We will watch the change by below commad
    - ***Command:***
      ```
      #watch the deployment edit
      root@ip-10-1-1-246:~# watch -n 1 kubectl get pods
      ```
    - ***Output:***
      ```
      Every 1.0s: kubectl get pods                                     ip-10-1-1-246: Wed Sep  4 08:45:13 2024
      
      NAME                      READY   STATUS    RESTARTS   AGE
      myapp1-7569765bd9-2k845   1/1     Running   0          97s
      myapp1-7569765bd9-b77fx   1/1     Running   0          101s
      myapp1-7569765bd9-mxjc5   1/1     Running   0          99s
      ```
- Now we will edit the deployment by below command and change the image to ```nginx:latest``` and you can see the pods
  getting updated in above watch command.
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# export KUBE_EDITOR=nano
      root@ip-10-1-1-246:~# kubectl edit deploy myapp1
      deployment.apps/myapp1 edited
      ```
  ![1397](https://github.com/DevopsAllInOne/01-AWS-2024/blob/main/Notes-Images/940-1407/1397.png)

- Just change the grep and ping the url you can see the load balancing.
  ```
  while true; do curl -sL http://ec2-3-19-55-183.us-east-2.compute.amazonaws.com:31111|grep nginx; sleep 1; done
  ```

- Now we will do Scaling-up the deployment
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl scale deploy myapp1 --replicas 6
      
      ```
    - ***Output:***
      ```
      deployment.apps/myapp1 scaled
      
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get deploy
      
      ```
    - ***Output:***
      ```
      NAME     READY   UP-TO-DATE   AVAILABLE   AGE
      myapp1   6/6     6            6           117m
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get pods
      
      ```
    - ***Output:***
      ```
      NAME                      READY   STATUS    RESTARTS   AGE
      myapp1-7569765bd9-2k845   1/1     Running   0          12m
      myapp1-7569765bd9-b2mgw   1/1     Running   0          29s
      myapp1-7569765bd9-b77fx   1/1     Running   0          12m
      myapp1-7569765bd9-b9gnb   1/1     Running   0          29s
      myapp1-7569765bd9-hfzdk   1/1     Running   0          29s
      myapp1-7569765bd9-mxjc5   1/1     Running   0          12m
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get svc
      
      ```
    - ***Output:***
      ```
      NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
      kubernetes   ClusterIP   10.100.0.1       <none>        443/TCP        3h44m
      myapp1       NodePort    10.100.138.188   <none>        80:31111/TCP   88m
      ```
- Now Deleting the Deployment and service
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl delete deploy myapp1
      
      ```
    - ***Output:***
      ```
      deployment.apps "myapp1" deleted
      
      ```
    - ***Command:***
      ```
      
      root@ip-10-1-1-246:~# kubectl get deploy
      ```
    - ***Output:***
      ```
      No resources found in default namespace.
      
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl delete svc myapp1
      
      
      ```
    - ***Output:***
      ```
      service "myapp1" deleted
      
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get svc
      
      ```
    - ***Output:***
      ```
      NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
      kubernetes   ClusterIP   10.100.0.1   <none>        443/TCP   3h54m
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# kubectl get pods
      
      ```
    - ***Output:***
      ```
      No resources found in default namespace.
      
      ```

- Now We need to delete the Amazon EKS Cluster
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# eksctl get cluster --region=us-east-2
      
      ```
    - ***Output:***
      ```
      NAME                    REGION          EKSCTL CREATED
      eks-test-cluster-01     us-east-2       True
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# eksctl get nodegroups  --cluster=eks-test-cluster-01 --region=us-east-2
      
      ```
    - ***Output:***
      ```
      CLUSTER                 NODEGROUP       STATUS  CREATED                 MIN SIZE        MAX SIZE        DESIRED CAPACITY        INSTANCE TYPE   IMAGE ID        ASG NAME                                          TYPE
      eks-test-cluster-01     nodegroup1      ACTIVE  2024-09-04T05:24:22Z    2               4               3                       t3.medium       AL2_x86_64      eks-nodegroup1-e2c8ddbe-d49a-f95e-c527-31b227eddcafmanaged
      ```
    - ***Command:***
      ```
      root@ip-10-1-1-246:~# eksctl delete cluster --region=us-east-2 --name=eks-test-cluster-01 &
      
      ```

  ```NOTE:```FInally check all EKS are deleted and Cloud Formations services should be delete if not it will cost


