#!/bin/bash

eval $(minikube docker-env)
kubectl delete deployment ftp-deployment
docker build -t ftp-image srcs/ftp/.
kubectl apply -f srcs/ftp/ftp.yaml