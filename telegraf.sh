#!/bin/bash

eval $(minikube docker-env)
kubectl delete deployment telegraf-deployment
kubectl delete service telegraf-svc
docker build -t telegraf-image srcs/telegraf/.
kubectl apply -f srcs/telegraf/telegraf.yaml