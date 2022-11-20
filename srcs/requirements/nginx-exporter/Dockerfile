FROM debian:buster

RUN apt-get update && apt-get install -y prometheus-nginx-exporter && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 9113

ENTRYPOINT ["/usr/bin/prometheus-nginx-exporter", "-nginx.scrape-uri=nginx:443/metrics"]