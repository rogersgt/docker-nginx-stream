#!/bin/bash

IFS=',' read -r -a HOST_ARRAY <<< "$TARGET_HOSTS"

NGINX_CONFIG=""

if [ -z "$PORT" ]; then
  PORT=3000
fi

for host in "$TARGET_HOSTS"
do
  # Spacing before "server" just for readability
  NGINX_CONFIG="$NGINX_CONFIG\n        server $host;"
done

sed -i "s/TARGET_HOSTS/$TARGET_HOSTS/g; s/PORT/$PORT/g" /etc/nginx/nginx.conf

nginx -g "daemon off;"
