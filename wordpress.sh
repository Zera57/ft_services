#!/bin/bash

eval $(minikube docker-env)
kubectl delete deployment wordpress-deployment
docker build -t wordpress-image srcs/wordpress/.
kubectl apply -f srcs/wordpress/wordpress.yaml