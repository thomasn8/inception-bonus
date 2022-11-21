FROM debian:buster

RUN apt-get update && apt-get install -y \
        nginx \
        openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/ssl/tnanchen.42.fr.cert \
        -keyout /etc/ssl/tnanchen.42.fr.key \
        -subj "/C=CH/ST=VD/L=Lausanne/O=42/OU=student/CN=tnanchen.42.fr/UID=tnanchen" && \
    chown root:root /etc/ssl/tnanchen.42.fr.cert && \
    chmod 600 /etc/ssl/tnanchen.42.fr.cert

COPY conf/conf.d/nginx.conf /etc/nginx/conf.d

# -- BONUS
# -------------------- Prometheus
RUN apt-get update && apt-get install -y \
    wget \
    git \
    make \
    libpcre3 libpcre3-dev zlib1g zlib1g-dev \
    build-essential libxml2-dev libxslt-dev libgd-dev libgeoip-dev \
    libluajit-5.1-dev libpam0g-dev libssl-dev libluajit-5.1-dev libpam0g-dev libexpat1-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    wget https://nginx.org/download/nginx-1.14.2.tar.gz && \
    tar xf nginx-1.14.2.tar.gz && \
    rm nginx-1.14.2.tar.gz && \
    wget https://github.com/vozlt/nginx-module-vts/archive/v0.1.18.tar.gz && \
    tar xf v0.1.18.tar.gz && \
    rm v0.1.18.tar.gz

RUN cd /nginx-1.14.2 && \
    ./configure \
    --with-cc-opt='-g -O2 -fdebug-prefix-map=/build/nginx-m1Thpq/nginx-1.14.2=. -fstack-protector-strong -Wformat -Werror=format-security -fPIC -Wdate-time -D_FORTIFY_SOURCE=2' \
    --with-ld-opt='-Wl,-z,relro -Wl,-z,now -fPIC' \
    --prefix=/usr/share/nginx --conf-path=/etc/nginx/nginx.conf \
    --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log \
    --lock-path=/var/lock/nginx.lock --pid-path=/run/nginx.pid \
    --modules-path=/usr/lib/nginx/modules --http-client-body-temp-path=/var/lib/nginx/body \
    --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy \
    --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi \
    --with-debug --with-pcre-jit --with-http_ssl_module --with-http_stub_status_module \
    --with-http_realip_module --with-http_auth_request_module --with-http_v2_module \
    --with-http_dav_module --with-http_slice_module --with-threads --with-http_addition_module \
    --with-http_geoip_module=dynamic --with-http_gunzip_module --with-http_gzip_static_module \
    --with-http_image_filter_module=dynamic --with-http_sub_module --with-http_xslt_module=dynamic \
    --with-stream=dynamic --with-stream_ssl_module --with-stream_ssl_preread_module \
    --with-mail=dynamic --with-mail_ssl_module \
    --add-dynamic-module=../nginx-module-vts-0.1.18

RUN cd /nginx-1.14.2 && \
    make && \
    cp objs/ngx_http_vhost_traffic_status_module.so /usr/share/nginx/modules/ && \
    cp objs/ngx_http_vhost_traffic_status_module.so /etc/nginx/modules-enabled/ && \
    echo "load_module modules/ngx_http_vhost_traffic_status_module.so;" > /usr/share/nginx/modules-available/mod-http-vhost-traffic-status.conf && \
    rm -rf /nginx-1.14.2/ /nginx-module-vts-0.1.18/

COPY conf/nginx.conf /etc/nginx/
# --------------------

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
