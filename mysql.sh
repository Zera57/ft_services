#!/bin/bash

kubectl delete deployment mysql-deployment
docker build -t mysql-image srcs/mysql/.
kubectl apply -f srcs/mysql/mysql_volume.yaml
kubectl apply -f srcs/mysql/mysql.yaml

sh