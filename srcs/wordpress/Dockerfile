FROM alpine:3.12.0

RUN apk update && apk upgrade

RUN apk add wget vim tar&&\
	apk add nginx &&\
	apk add openssl &&\
	apk add openssh &&\
	apk add openrc &&\
	apk add php7-common php7-session php7-iconv\
			php7-json php7-gd php7-curl php7-xml php7-mysqli\
			php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql\
			php7-soap php7-xmlrpc php7-posix php7-mcrypt\
			php7-gettext php7-ldap php7-ctype php7-dom


EXPOSE 80 443 22

#Setting up nginx
RUN adduser -D -g 'www' www
RUN mkdir -p /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN mkdir -p /run/nginx
RUN rm /etc/nginx/conf.d/*.conf
COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

#Installing WordPress
RUN mkdir -p /var/www/wordpress && \
	wget https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz --strip-components 1 -C /var/www/wordpress && \
	rm -rf latest.tar.gz
COPY ./conf/wp.php  /var/www/wordpress/wp-config.php
#Adding CSR
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj "/C=RU/ST=Tatarstan/L=Kazan/O=21/OU=School/CN=localhost" \
		-keyout /etc/ssl/certs/localhost.key \
		-out /etc/ssl/certs/localhost.crt

COPY ./conf/start.sh /
RUN chmod -x /start.sh

CMD sh start.sh