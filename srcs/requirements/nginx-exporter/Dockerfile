FROM debian:buster

# RUN apt-get update && apt-get install -y prometheus-nginx-exporter && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*

# RUN apt-get update && apt-get install -y curl make git golang-go \
RUN apt-get update && apt-get install -y wget daemon && \
    cd /tmp/ && \
    wget 'https://launchpad.net/ubuntu/+source/prometheus-nginx-vts-exporter/0.10.3+git20180501.43b4556+ds-2/+build/16378143/+files/prometheus-nginx-vts-exporter_0.10.3+git20180501.43b4556+ds-2_amd64.deb' && \
    dpkg -i prometheus-nginx-vts-exporter_0.10.3+git20180501.43b4556+ds-2_amd64.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
    # golang-github-prometheus-common golang-github-prometheus-client-golang \
    # golang-defaults dh-golang debhelper && \
    # curl -L -o nginx-vts-exporter.tar.gz  https://github.com/hnlq715/nginx-vts-exporter/archive/refs/tags/v0.10.7.tar.gz && \
    # curl -L -o nginx-vts-exporter.deb http://launchpadlibrarian.net/410834379/prometheus-nginx-vts-exporter_0.10.3+git20180501.43b4556+ds-2_amd64.deb && \
    # wget http://launchpadlibrarian.net/410834379/prometheus-nginx-vts-exporter_0.10.3+git20180501.43b4556+ds-2_amd64.deb && \
    # wget 'https://launchpad.net/ubuntu/+source/prometheus-nginx-vts-exporter/0.10.3+git20180501.43b4556+ds-2/+build/16378143/+files/prometheus-nginx-vts-exporter_0.10.3+git20180501.43b4556+ds-2_amd64.deb' && \
    # tar xf nginx-vts-exporter.tar.gz && \
    # rm nginx-vts-exporter.tar.gz && \
    # dpkg -i nginx-vts-exporter.deb && \
    # make
    # make rpm

EXPOSE 9113

# ENTRYPOINT ["prometheus-nginx-vts-exporter", "http://nginx:443/status/format/json"]
ENTRYPOINT ["prometheus-nginx-vts-exporter", "http://tnanchen.42.fr/status/format/json"]



# ENTRYPOINT ["/usr/bin/prometheus-nginx-exporter", "-nginx.scrape-uri=http://nginx:443/status"]
# nohup /bin/nginx-vts-exporter -nginx.scrape_uri=http://tnanchen.42.fr/status/format/json
# https://www.cyberciti.biz/faq/how-to-install-gol-ang-on-ubuntu-linux/\
# docker run  -ti --rm --env NGINX_STATUS="http://tnanchen.42.fr/status/format/json" sophos/nginx-vts-exporter




# docker build --rm -t exporter:debian .
# docker run --rm -it exporter:debian bash