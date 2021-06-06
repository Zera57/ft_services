# ft_services

In cluster
6 pods:
* HomePage (nginx)
* WordPress (nginx)
* PhpMyAdmin (nginx)
* Grafana - to visualize statistics
* Telegraf - to collect data from every pod
* FTP-server

2 volumes:
* InfluxDB - works with Grafana and Telegraf
* MySQL - works with WordPress and PhpMyAdmin

![Illustration](https://github.com/Zera57/ft_services/raw/master/illustration/ft_services.png)

# Installation

To run this project you have to install [minikube](https://kubernetes.io/ru/docs/tasks/tools/install-minikube/).

Then just run

	./setup.sh

And visit [192.168.99.120:443](https://192.168.99.120:443)
