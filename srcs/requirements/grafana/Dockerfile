FROM debian:buster

RUN apt-get update && apt-get install -y \
        wget && \
    wget https://dl.grafana.com/enterprise/release/grafana-enterprise-9.2.5.linux-amd64.tar.gz && \
    tar -zxvf grafana-enterprise-9.2.5.linux-amd64.tar.gz && \
    rm -rf grafana-enterprise-9.2.5.linux-amd64.tar.gz && \
    mv grafana-9.2.5/ grafana && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./conf/defaults.ini /grafana/conf
COPY ./conf/provisioning/datasources.yaml /grafana/conf/provisioning/datasources/sample.yaml

EXPOSE 3000

WORKDIR /grafana

ENTRYPOINT ["./bin/grafana-server"]