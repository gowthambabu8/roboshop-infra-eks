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


AWS Load Balancer controller setup
1. Download IAM Policy
```
curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v3.2.1/docs/install/iam_policy.json

```
2. Create IAM Policy
```
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam-policy.json
```
3. Create Service Account
```
eksctl create iamserviceaccount \
--cluster=roboshop \
--namespace=kube-system \
--name=aws-load-balancer-controller \
--attach-policy-arn=arn:aws:iam::<AWS_ACCOUNT_ID>:policy/AWSLoadBalancerControllerIAMPolicy \
--override-existing-serviceaccounts \
--region us-east-1 \
--approve
```
4. Install controller via Helm
```
helm repo add eks https://aws.github.io/eks-charts
helm repo update

helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=roboshop \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller
```