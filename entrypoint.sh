#!/bin/sh

set -e

allowed=""
for rule in ${ALLOW_CIDRS}
do
  allowed="${allowed}Allow ${rule}\n"
done

sed -i "s|Allow 127.0.0.1|${allowed}|" /etc/tinyproxy/tinyproxy.conf
sed -i "s|LogLevel Warning|LogLevel ${LOG_LEVEL}|" /etc/tinyproxy/tinyproxy.conf

exec "$@"
