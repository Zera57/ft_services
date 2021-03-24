FROM alpine:3.12.0

RUN apk update && apk upgrade

RUN apk add wget &&\
	apk add vim &&\
	apk add nginx &&\
	apk add openssl &&\
	apk add openssh &&\
	apk add openrc &&\
	apk add supervisor

EXPOSE 80 443 22

#Setting up nginx
RUN adduser -D -g 'www' www
RUN mkdir -p /www/img
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN mkdir -p /run/nginx
RUN rm /etc/nginx/conf.d/*.conf
COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

#Adding CSR
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj "/C=RU/ST=Tatarstan/L=Kazan/O=21/OU=School/CN=localhost" \
		-keyout /etc/ssl/certs/localhost.key \
		-out /etc/ssl/certs/localhost.crt

COPY ./conf/start.sh /
#Landing page
COPY ./conf/img/* /www/img/
COPY ./conf/index.html /www/


RUN chmod -x /start.sh

CMD sh start.sh