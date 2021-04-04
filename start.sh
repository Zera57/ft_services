#!/bin/bash

bash nginx.sh
bash wordpress.sh
bash phpmyadmin.sh
bash mysql.sh
bash influxdb.sh
bash telegraf.sh
bash grafana.sh
bash ftp.sh

minikube dashboard