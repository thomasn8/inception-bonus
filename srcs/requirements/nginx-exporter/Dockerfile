FROM debian:buster

RUN apt-get update && apt-get install -y wget daemon && \
    cd /tmp/ && \
    wget 'https://launchpad.net/ubuntu/+source/prometheus-nginx-vts-exporter/0.10.3+git20180501.43b4556+ds-2/+build/16378143/+files/prometheus-nginx-vts-exporter_0.10.3+git20180501.43b4556+ds-2_amd64.deb' && \
    dpkg -i prometheus-nginx-vts-exporter_0.10.3+git20180501.43b4556+ds-2_amd64.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 9913

# ENTRYPOINT ["prometheus-nginx-vts-exporter", "http://nginx:443/status/format/json"]
ENTRYPOINT ["prometheus-nginx-vts-exporter", "http://tnanchen.42.fr/status/format/json"]

# docker build --rm -t exporter:debian .
# docker run --rm -it exporter:debian bash