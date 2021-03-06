#!/bin/bash

IFS=',' read -r -a HOST_ARRAY <<< "$TARGET_HOSTS"

NGINX_CONFIG=""

if [ -z "$PORT" ]; then
  PORT=3000
fi

for host in "$HOST_ARRAY"
do
  # Spacing before "server" just for readability
  NGINX_CONFIG="$NGINX_CONFIG\n        server $host;"
done

cp /home/nginx.conf /etc/nginx/

sed -i "s/TARGET_HOSTS/$NGINX_CONFIG/g; s/PORT/$PORT/g" /etc/nginx/nginx.conf

nginx -g "daemon off;"
