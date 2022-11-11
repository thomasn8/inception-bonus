# BUILD REACT APP
FROM debian:buster as build

WORKDIR /app
ENV 	PATH /app/node_modules/.bin:$PATH
COPY react-app/package.json ./
RUN apt update && apt install -y nodejs npm && \
    npm install --silent --only=production --no-optional
COPY react-app/src ./src
COPY react-app/public ./public
RUN npm run build



# IMPORT REACT APP FROM APP IMAGE WITHOUT ALL HEAVY DEPEDENCIES
FROM debian:buster as server

RUN	apt-get update && apt-get install -y \
		vim \
        nginx && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/www/html && \
    mv /var/www/html/index.nginx-debian.html /var/www/html/index.html

COPY --from=build /app/build /var/www/html
COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 4000

WORKDIR /var/www/html/

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]