FROM alpine:3.12.0

RUN apk add wget tar vim nginx

RUN mkdir -p /run/nginx

RUN 	wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN		wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN		apk add glibc-2.32-r0.apk
RUN		rm -f glibc-2.32-r0.apk

RUN		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.18.0_linux_amd64.tar.gz &&\
		tar -xzvf telegraf-1.18.0_linux_amd64.tar.gz --strip-components 1 &&\
		rm telegraf-1.18.0_linux_amd64.tar.gz

# RUN		./telegraf-1.18.0/usr/bin/telegraf -sample-config --input-filter docker \
# 		--output-filter influxdb > /telegraf-1.18.0/etc/telegraf/telegraf.conf

# RUN rm /telegraf-1.18.0/etc/telegraf/telegraf.conf
COPY conf/telegraf.conf /telegraf-1.18.0/etc/telegraf/telegrafnew.conf

COPY ./conf/start.sh /start.sh
RUN chmod -x /start.sh

CMD sh /start.sh