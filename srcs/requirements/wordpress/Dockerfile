FROM debian:buster

# copie la config pour communiquer avec nginx via le port 9000 au lieu du socket
COPY ./conf/www.conf /var/www/html/

# lance le script pour télécharger wordpress
COPY ./tools/init_wordpress.sh /usr/local/bin/

# installe les packets nécessaires pour php-fpm
# intalle wp-cli qui permettra d'installer le plugin redis et pho-redis qui permettra de store PHP sessions
# créer le dossier run/php pour lancer php
RUN	chmod +x /usr/local/bin/init_wordpress.sh && \
	apt-get update && apt-get install -y \
		wget \
		php \
		php-cgi \
		php-mysql \
		php-fpm \
		php-pdo \
		php-gd \
		php-cli \
		php-mbstring \
# -------------------- REDIS
		php-redis \
		curl && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
# --------------------
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	mkdir /run/php

WORKDIR /var/www/html/

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/init_wordpress.sh"]