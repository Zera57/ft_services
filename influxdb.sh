#!/bin/bash

eval $(minikube docker-env)
kubectl delete deployment influxdb-deployment
docker build -t influxdb-image srcs/influxdb/.
kubectl apply -f srcs/influxdb/influxdb_volume.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml