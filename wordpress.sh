#!/bin/bash

kubectl delete deployment wordpress-deployment
docker build -t wordpress-image srcs/wordpress/.
kubectl apply -f srcs/wordpress/wordpress.yaml