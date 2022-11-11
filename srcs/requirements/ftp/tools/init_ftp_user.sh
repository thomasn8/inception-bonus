#!/bin/sh

if [ -f /etc/vsftpd_default.myconf ]
then
	echo "container restarted"
else
    cp /etc/vsftpd.conf /etc/vsftpd.myconf
    useradd -mU $FTP_USER
    mkdir -p /home/$FTP_USER/ftp/wordpress
    chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/
    echo $FTP_USER:$FTP_PASSWORD | chpasswd
    echo $FTP_USER > /etc/vsftpd.userlist
    chmod a-w /home/$FTP_USER/ftp
fi

/usr/sbin/vsftpd /etc/vsftpd.conf