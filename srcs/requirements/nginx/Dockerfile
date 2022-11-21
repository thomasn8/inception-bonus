FROM debian:buster

RUN apt-get update && apt-get install -y \
        nginx \
        openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/ssl/tnanchen.42.fr.cert \
        -keyout /etc/ssl/tnanchen.42.fr.key \
        -subj "/C=CH/ST=VD/L=Lausanne/O=42/OU=student/CN=tnanchen.42.fr/UID=tnanchen" && \
    chown root:root /etc/ssl/tnanchen.42.fr.cert && \
    chmod 600 /etc/ssl/tnanchen.42.fr.cert

COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]