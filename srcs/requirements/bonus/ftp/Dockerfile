FROM debian:buster

COPY ./tools/init_ftp_user.sh /usr/local/bin/

RUN	apt-get update && apt-get install -y \
        vsftpd \
        openssl && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
    chmod +x /usr/local/bin/init_ftp_user.sh && \
    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/ssl/vsftpd.cert \
        -keyout /etc/ssl/vsftpd.key \
        -subj "/C=CH/ST=VD/L=Lausanne/O=42/OU=student/CN=tnanchen.42.fr/UID=tnanchen" && \
    chown root:root /etc/ssl/vsftpd.cert && \
    chmod 600 /etc/ssl/vsftpd.cert && \
    mkdir /var/run/vsftpd/ /var/run/vsftpd/empty && \
    chmod a-w /var/run/vsftpd/empty

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

EXPOSE 21

ENTRYPOINT ["/usr/local/bin/init_ftp_user.sh"]