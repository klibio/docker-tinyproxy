FROM travix/base-alpine:3.5

MAINTAINER Travix

RUN apk --update add tinyproxy \
  && rm -rf /var/cache/apk/*

COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

EXPOSE 8888

CMD ["tinyproxy", "-d"]
