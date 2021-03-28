FROM alpine:3.12.0

RUN apk update && apk upgrade

RUN apk add mysql mysql-client openrc

VOLUME ["/var/lib"]

COPY ./conf/my.conf /etc/my.cnf
COPY ./conf/start.sh /start.sh
RUN chmod -x /start.sh

CMD sh /start.sh

EXPOSE 3306