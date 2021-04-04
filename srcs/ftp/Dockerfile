FROM alpine:3.7

RUN		apk update && apk add openssl vsftpd openrc

RUN	mkdir -p /var/log/ftp && touch /var/log/ftp/xferlog

RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 \
		-subj "/C=RU/ST=Tatarstan/L=Kazan/O=21/OU=School/CN=localhost" \
		-keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem

COPY ./conf/ftp.conf /etc/vsftpd/vsftpd.conf

RUN		echo 'root:root' | chpasswd

EXPOSE 21

ENTRYPOINT	vsftpd /etc/vsftpd/vsftpd.conf