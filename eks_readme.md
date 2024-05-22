# terraform init 
```bash
terraform init
```



# How to setup cluster
```bash
terraform apply
```

# How to update kube config local file
```bash
aws sts get-caller-identity
aws eks update-kubeconfig --region ap-south-1 --name eks_cluster
```

# ECR 
```bash
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 397324722998.dkr.ecr.ap-south-1.amazonaws.com
```

# kubect basic command 

```bash
kubectl config view
kubectl config current-context
kubectl config get-contexts
# switch context
kubectl config use-context <context_name>

# How to get everything 
kubectl get all --namespace <NAME_SPACE>

# how to create resouce to kubectl
kubectl apply -f <file>.yml 

# How to get service/pod under spacefic namespace ( for all name space use --all-namespaces)
kubectl get <POD|SVC> -n <NAME_space_name>


```

# kubect pods commands
```bash
# which properties supports by pods
kubectl explain pods --recursive

# Deploying Pods from a manifest file
kubectl apply -f pod.yml 

# get list of pods try one by one
kubectl get pods
kubectl get pods -o wide
kubectl get pods -o yml

# get pod details for specific pods
kubectl get pods <POD_name>
kubectl get pods <POD_name> -o wide
kubectl get pods <POD_name> -o yml
kubectl describe pods <POD_name>


# how to get logs from pod (default fetch logs from first container)
kubectl logs <POD_name>
kubectl logs <multipod> --container <container_names>

# How to exceute command in container (default it execute command in first container)

kubectl exec <POD_name> -- <CMD>
kubectl exec <POD_name> --container <container_names> -- <CMD>



# How to get shell terminal from container  (default it execute command in first container)

kubectl exec -it <POD_name> -- sh
kubectl exec -it <POD_name> --container <container_names> -- sh


# run pod with command line
kubectl run my-first-pod --image 397324722998.dkr.ecr.ap-south-1.amazonaws.com/web:0.0.1


# How to delete pod 
kubectl delete pod <podname>


```


# kubectl service
```bash
# nodePort serivce port available 30000-32767
kubectl expose pod my-first-pod  --type=NodePort --port=80 --target-port=8080 --name=my-first-svc

kubectl get svc
```

# kubectl namespace
```
kubectl get namespaces
kubectl describe ns <NAME_space_name>

# How to create ns (imprative) 
kubectl create ns hydra

```




## EBS storage class & driver
```bash

# step 1 
  create policy to give permission to node on EBS
  assing policy to node group role You will find in this polices.tf 

#  step 2 (install ebs-csi driver )
kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.30"


# Verify ebs-csi pods running
kubectl get pods -n kube-system
```