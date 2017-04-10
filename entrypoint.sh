#!/bin/sh

set -ex

allowed=""
for rule in ${ALLOW_CIDRS}
do
  allowed="${allowed}Allow ${rule}\n"
done

sed "s|Allow 127.0.0.1|${allowed}|" /etc/tinyproxy/tinyproxy.conf

exec "$@"
