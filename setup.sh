#!/bin/bash

minikube start --vm-driver=virtualbox
minikube addons enable metallb
eval $(minikube docker-env)
kubectl apply -f metallb.yaml

#NGINX
bash nginx.sh
bash wordpress.sh

