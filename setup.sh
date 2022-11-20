#!/bin/bash

# fait pointer le nom de domaine sur localhost
FILE="/etc/hosts"
LINE_1='127.0.0.1 tnanchen.42.fr'
if ! grep -q "$LINE_1" "$FILE" ; 
then
    echo "$LINE_1" | sudo tee -a "$FILE"
fi

DIR="/home/$USER/data"
if [ ! -e "$DIR" ]; 
then
    echo "Setting up volumes:"
    mkdir /home/$USER/data
    mkdir /home/$USER/data/mysql
    mkdir /home/$USER/data/wordpress
    mkdir /home/$USER/data/redis
    mkdir /home/$USER/data/prometheus
    mkdir /home/$USER/data/nginx-exporter
    echo "created: /home/$USER/data, /home/$USER/data/mysql, /home/$USER/data/wordpress, /home/$USER/data/redis, /home/$USER/data/prometheus, /home/$USER/data/nginx-exporter"
    echo "volumes installed"
fi