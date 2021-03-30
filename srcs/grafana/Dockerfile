FROM alpine:3.12.0

RUN apk add wget tar vim

RUN 	wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN		wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN		apk add glibc-2.32-r0.apk
RUN		rm -f glibc-2.32-r0.apk

RUN wget https://dl.grafana.com/oss/release/grafana-7.5.1.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.5.1.linux-amd64.tar.gz

WORKDIR /grafana-7.5.1/bin

CMD ./grafana-server

EXPOSE 3000