FROM alpine:3.12.0

RUN apk update && apk upgrade

RUN apk add wget vim tar&&\
	apk add nginx &&\
	apk add openssl &&\
	apk add openssh &&\
	apk add openrc &&\
	apk add php7 php7-session php7-fpm php7-json php7-mysqli php7-xml php7-iconv &&\
	apk add supervisor

#Setting up nginx
RUN adduser -D -g 'www' www
RUN mkdir -p /www/
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx
RUN mkdir -p /var/run/php
RUN rm /etc/nginx/conf.d/*.conf
COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

#Installing PhpMyAdmin
RUN mkdir -p var/www/phpmyadmin &&\
	wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz && \
	tar -xzvf phpMyAdmin-5.1.0-all-languages.tar.gz --strip-components 1 -C /var/www/phpmyadmin && \
	rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz
COPY ./conf/config.inc.php /var/www/phpmyadmin/config.inc.php
RUN chown -R www:www /var/www/* && \
	chmod -R 755 /var/www/*

#Adding CSR
RUN mkdir -p /etc/ssl/certs/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj "/C=RU/ST=Tatarstan/L=Kazan/O=21/OU=School/CN=localhost" \
		-keyout /etc/ssl/certs/localhost.key \
		-out /etc/ssl/certs/localhost.crt

COPY ./conf/supervisor.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord"]

EXPOSE 5000