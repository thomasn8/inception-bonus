#!/bin/sh

mysql_install_db

/etc/init.d/mysql start

# check si la database existe
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 
	echo "Database already exists"
else

# set root option pour empecher la connexion sans le root password
	mysql_secure_installation <<_EOF_

Y
mysql_root_pw
mysql_root_pw
Y
n
Y
Y
_EOF_

	# FLUSH PRIVILEGES update les tables après une query 
	# @'%'			pour se connecter au serveur MySQL à partir de n'importe quel serveur
	# @'localhost'	pour se connecter au serveur MySQL uniquement à partir de la machine hôte.

	# créer la database wordpress et accorde les privilèges à tnanchen sur cette db
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

	# importe les datas de wordpress.sql dans la database wordpress
	mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

fi

/etc/init.d/mysql stop

# lance mariadb et autorise le listen sur tous les ports
/usr/sbin/mysqld --bind-address=0.0.0.0