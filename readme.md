# Mario on Civo K8s with Terraform
> :warning: Civo K8s clusters are not free, so you may incur charges by running this tutorial.

## 1. 📝 Preparation
- Install **Terraform**. For that you can use the [official link](https://developer.hashicorp.com/terraform/install)
- Install **kubectl**. For that you can use the [official link](https://kubernetes.io/docs/tasks/tools/)

## 2. 🪂 Deploying the k8s cluster and Mario chart
- Save Civo API key as environment variable:
> Replace **** with your actual Civo API key
```sh
export TF_VAR_api_key=****
```
- Initialize Terraform, plan the deployment, and apply the configuration
```sh
terraform init; terraform plan; terraform apply --auto-approve
```

## 3. 🧪 Testing the game
- Configure `KUBECONFIG` environment variable to point to the Kubernetes configuration file:
```sh
export KUBECONFIG=`terraform output -raw kubeconfig_path`
```
- Display the URL of the game:
```sh
echo http://`kubectl get service | grep mario-bros | awk '{print $4}'`:80
```
- Copy the displayed URL and paste it into your web browser to play the game.

## 4. 🚿 Cleaning up
- Destroy terraform resources
```sh
terraform destroy --auto-approve
```
