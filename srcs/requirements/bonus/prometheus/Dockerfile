FROM debian:buster

RUN apt-get update && apt-get install -y prometheus && \
    chmod +x /etc/prometheus/prometheus.yml && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./conf/prometheus.yml /etc/prometheus/prometheus.yml

EXPOSE 9090

ENTRYPOINT ["prometheus"]