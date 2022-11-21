FROM debian:buster

RUN	apt-get update && apt-get install -y \
		redis \
		cron && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./conf/redis.conf /etc/redis/redis.conf
COPY ./tools/backup-redis /etc/cron.hourly

RUN	chmod +x /etc/cron.hourly/backup-redis

EXPOSE 6379

ENTRYPOINT ["redis-server", "/etc/redis/redis.conf"]