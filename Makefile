all: run

run:
		@sh ./prepare/setup.sh
		@docker-compose -f ./srcs/docker-compose.yml up -d --build

bonus:
		@sh ./prepare/setup.sh
		@docker-compose -f ./srcs/docker-compose-bonus.yml up -d --build
		@sh ./prepare/loader.sh &
		@docker stop ftp
		@docker start ftp
		@docker exec -d ftp chown -R $(FTP_USER):$(FTP_USER) /home/$(FTP_USER)/ftp/wordpress
		@docker exec -d ftp chmod -R 774 /home/$(FTP_USER)/ftp/wordpress
		@docker exec -d redis /usr/sbin/cron

down:
		@if docker container ls -a | grep -q grafana ; then\
		    docker-compose -f ./srcs/docker-compose-bonus.yml down --remove-orphans;\
		else\
		    docker-compose -f ./srcs/docker-compose.yml down --remove-orphans;\
		fi

clean:	down
		sudo rm -rf /home/$(USER)/data
		@echo "Deleting all images : "
		@docker image rmi -f `docker images -qa`;
		@echo "Deleting all volumes : "
		@docker volume rm -f `docker volume ls -q`;

create:
		@sh setup.sh
		@docker-compose -f ./srcs/docker-compose.yml create --build

start:
		@if docker container ls -a | grep -q grafana ; then\
		    docker-compose -f ./srcs/docker-compose-bonus.yml start;\
		else\
		    docker-compose -f ./srcs/docker-compose.yml start;\
		fi

stop:
		@if docker container ls -a | grep -q grafana ; then\
			docker-compose -f ./srcs/docker-compose-bonus.yml stop;\
		else\
			docker-compose -f ./srcs/docker-compose.yml stop;\
		fi

re:		clean run

# START containers in interactive mode
# mandatory containers
nginx:
		@docker exec -it nginx bash
wordpress:
		@docker exec -it wordpress bash
mariadb:
		@docker exec -it mariadb bash

# bonus containers
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

# docker usefull cmds
prune: 	down
		docker system prune;
ps:
		@docker ps
img:
		@docker image ls -a

.PHONY: all run bonus stop start down create clean prune nginx wordpress mariadb redis ftp adminer static prometheus grafana ps img re