FROM travix/base-alpine:3.5

MAINTAINER Travix

# ALLOW_CIDRS, use space separacted list of CIDRS
# LOG_LEVEL should be one of these: Critical, Error, Warning, Notice, Connect or Info
ENV ALLOW_CIDRS="127.0.0.1" \
    LOG_LEVEL="Warning"

RUN apk --update add tinyproxy \
  && rm -rf /var/cache/apk/*

COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf
COPY entrypoint.sh /entrypoint.sh

EXPOSE 8888

ENTRYPOINT ["/entrypoint.sh"]

CMD ["tinyproxy", "-d"]
