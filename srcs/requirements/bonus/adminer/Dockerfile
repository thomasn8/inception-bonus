FROM debian:buster

RUN	apt-get update && apt-get install -y \
		mariadb-client \
        libapache2-mod-php \
        php-cgi \
        php-fpm \
        php \
        php-mysql \
        php-cli \
        curl && \
    mkdir /run/php && \
    curl -L -o ./adminer-4.8.1-mysql-en.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php && \
    mkdir -p /var/www/html && \
	mv ./adminer-4.8.1-mysql-en.php /var/www/html/index.php && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /var/www/html/

EXPOSE 9000

ENTRYPOINT ["/usr/sbin/php-fpm7.3", "-F"]