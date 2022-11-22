#!/bin/sh

nginx -g 'daemon off;' &

prometheus-nginx-vts-exporter -nginx.scrape_uri=http://127.0.0.1:80/format/json

fg %1