FROM alpine:3.12.0

RUN apk update && apk upgrade

RUN apk add influxdb

RUN     mkdir -p /var/lib/influxdb

VOLUME ["/var/lib/influxdb"]

COPY ./conf/start.sh /start.sh
RUN chmod -x /start.sh

CMD sh /start.sh

EXPOSE 8086