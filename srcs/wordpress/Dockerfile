FROM alpine:3.12.0

RUN apk update && apk upgrade

RUN apk add wget vim tar&&\
	apk add nginx &&\
	apk add openssl &&\
	apk add openssh &&\
	apk add openrc &&\
	apk add php7 php7-fpm php7-json php7-mysqli &&\
	apk add supervisor

#Setting up nginx
RUN adduser -D -g 'www' www
RUN mkdir -p /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx
RUN mkdir -p /var/run/php
RUN rm /etc/nginx/conf.d/*.conf
COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

#Installing WordPress
RUN mkdir -p /var/www && \
	wget https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz --strip-components 1 -C /var/www && \
	rm -rf latest.tar.gz
COPY ./conf/wp.php  /var/www/wp-config.php

#Adding CSR
RUN mkdir -p /etc/ssl/certs/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj "/C=RU/ST=Tatarstan/L=Kazan/O=21/OU=School/CN=localhost" \
		-keyout /etc/ssl/certs/localhost.key \
		-out /etc/ssl/certs/localhost.crt

COPY ./conf/supervisor.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord"]

EXPOSE 5050