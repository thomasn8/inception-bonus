FROM debian:buster

COPY ./tools/init_database.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/

# installe les packets nécessaires 
# définit le user mysql comme proprio de tous les dossier relatifs à mysql (compgen -u)
RUN	apt-get update && apt-get install -y \
		mariadb-server \
		mariadb-client && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 777 /var/run/mysqld && \
	chmod +x /usr/local/bin/init_database.sh

EXPOSE 3306

# lance  le script pour créer la database wordpress
ENTRYPOINT ["/usr/local/bin/init_database.sh"]