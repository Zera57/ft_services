#!/bin/bash

eval $(minikube docker-env)
kubectl delete deployment grafana-deployment
docker build -t grafana-image srcs/grafana/.
kubectl apply -f srcs/grafana/grafana.yaml