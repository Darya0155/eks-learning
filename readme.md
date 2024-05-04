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


```

# kubectl namespace
```
kubectl get namespaces
kubectl describe ns <NAME_space_name>

# How to create ns (imprative) 
kubectl create ns hydra

```