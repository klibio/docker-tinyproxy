FROM travix/base-alpine:3.5

MAINTAINER Travix

ENV TINYPROXY_VERSION=1.8

RUN apk --update add -t build-dependencies \
    make \
    automake \
    autoconf \
    g++ \
    asciidoc \
    git \
  && rm -rf /var/cache/apk/* \
  && git clone -b ${TINYPROXY_VERSION} --depth=1 https://github.com/tinyproxy/tinyproxy.git \
  && cd tinyproxy \
  && ./autogen.sh \
  && ./configure --enable-transparent --prefix=/ \
  && make \
  && make install \
  && cd / \
  && apk del build-dependencies

# ALLOW_CIDRS, use space separacted list of CIDRS
# LOG_LEVEL should be one of these: Critical, Error, Warning, Notice, Connect or Info
ENV ALLOW_CIDRS="127.0.0.1" \
    LOG_LEVEL="Warning"

COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf
COPY entrypoint.sh /entrypoint.sh

EXPOSE 8888

ENTRYPOINT ["/entrypoint.sh"]

CMD ["tinyproxy", "-d"]
