Login to bastion host and configure aws profile
```
aws configure
```
Update kubeconfig to connect k8s cluster
```
aws eks update-kubeconfig --region=us-east-1 --name=roboshop-dev
```
SetUp
```
helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver
helm repo update

```
Install Latest Driver
```
helm upgrade --install aws-ebs-csi-driver \
    --namespace kube-system \
    aws-ebs-csi-driver/aws-ebs-csi-driver
```