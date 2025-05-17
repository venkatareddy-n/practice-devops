# practice-devops
* This Repo is to Practice Devops

# ec2-server_k8s

* go to inside ec2-server_k8s and run terraform commands to create Ec2 instance with required softwares
* terraform init
* terraform plan
* terraform apply -auto-approve

init and terraform apply
* it will create once ec2 server and install below softwares inside that server
* docker
* eksctl
* kubectl
* kubens
* Helm installation
* kubernetes metrics
* K9S Installation

* connect the above created server with public ip using putty or mobaxterm

# kubernetes cluster
* go to inside k8s-cluster and run kubernetes commands to create cluster for your kubernetes practice

connect to server with putty

install eksctl
==============
1. aws configure --> need to set this 1st in your server

2nd Step- install eksclt --> already done using terraform if not follow below steps


https://eksctl.io/installation/# --> website link for eksctl steps, below are the steps

ARCH=amd64

PLATFORM=$(uname -s)_$ARCH

curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

sudo mv /tmp/eksctl /usr/local/bin

eksctl version
0.194.0
-------------

install kubectl on linux server
=========================
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.31.0/2024-09-12/bin/linux/amd64/kubectl

chmod +x ./kubectl

sudo mv kubectl /usr/local/bin/

kubectl version
Client Version: v1.31.0-eks-a737599
-----------------------------------
AWS configure

create yaml file and do below steps

https://eksctl.io/getting-started/

apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig

metadata:
  name: expense
  region: us-east-1

managedNodeGroups:
  - name: expense
    instanceType: t2.medium 
    desiredCapacity: 2
    spot: true

================
go to cluster-k8s

eks.yaml file

eksctl create cluster --config-file=eks.yaml

--------------------------------------------

kubectl get nodes --> to see how nodes information in the cluster

if nodes are in problem use below command to apply again

# aws eks --region region_name update-kubeconfig --name cluster_name

aws eks --region us-east-1 update-kubeconfig --name expense

[ ec2-user@ip-172-31-89-76 ~/k8s-eksctl ]$ kubectl get nodes
NAME                             STATUS   ROLES    AGE   VERSION
ip-192-168-18-207.ec2.internal   Ready    <none>   10m   v1.30.4-eks-a737599
ip-192-168-2-254.ec2.internal    Ready    <none>   26m   v1.30.4-eks-a737599
----------------------------------------------------------------------------

to delete nodes
===============
eksctl delete cluster --config-file=eks.yaml

