#!/bin/bash

eval $(minikube docker-env)
kubectl delete deployment nginx-deployment
docker build -t nginx-image srcs/nginx/.
kubectl apply -f srcs/nginx/nginx.yaml