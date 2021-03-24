#!/bin/bash

kubectl delete deployment phpmyadmin-deployment
docker build -t phpmyadmin-image srcs/phpmyadmin/.
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml