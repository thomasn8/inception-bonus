all: run

run:
		@sh setup.sh
		@docker-compose -f ./srcs/docker-compose.yml up -d --build
		@sh loader.sh &
		@docker stop ftp
		@docker start ftp
		@docker exec -d ftp chown -R $(FTP_USER):$(FTP_USER) /home/$(FTP_USER)/ftp/wordpress
		@docker exec -d ftp chmod -R 774 /home/$(FTP_USER)/ftp/wordpress
		@docker exec -d redis /usr/sbin/cron

stop:
		@docker-compose -f ./srcs/docker-compose.yml stop

start:
		@docker-compose -f ./srcs/docker-compose.yml start

down:
		@docker-compose -f ./srcs/docker-compose.yml down

create:
		@sh setup.sh
		@docker-compose -f ./srcs/docker-compose.yml create --build

clean:	down
		sudo rm -rf /home/$(USER)/data
		@echo "Deleting all images : "
		@docker image rmi -f `docker images -qa`;
		@echo "Deleting all volumes : "
		@docker volume rm -f `docker volume ls -q`;

prune: 	down
		docker system prune;

nginx:
		@docker exec -it nginx bash
wordpress:
		@docker exec -it wordpress bash
mariadb:
		@docker exec -it mariadb bash
redis:
		@docker exec -it redis bash
ftp:
		@docker exec -it ftp bash
adminer:
		@docker exec -it adminer bash
static:
		@docker exec -it static bash
prometheus:
		@docker exec -it prometheus bash
grafana:
		@docker exec -it grafana bash
nginx-exporter:
		@docker exec -it nginx-exporter bash
ps:
		@docker ps
img:
		@docker image ls -a

re:		clean run

.PHONY: all run stop start down create clean prune nginx wordpress mariadb redis ftp adminer prometheus grafana nginx-exporter static ps img re