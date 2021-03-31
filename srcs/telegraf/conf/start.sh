#!bin/sh

#/telegraf-1.18.0/usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /telegraf-1.18.0/etc/telegraf/telegrafnew.conf
#/telegraf-1.18.0/usr/bin/telegraf -sample-config /telegraf-1.18.0/etc/telegraf/telegrafnew.conf

nginx -g 'daemon off;'
sh