# Docker Tinyproxy

[![Build Master](https://img.shields.io/badge/branch-master-brightgreen.svg)](https://github.com/klibio/io.klib.tinyproxy/tree/master): 
[![Build Status Master branch](https://api.travis-ci.org/klibio/io.klib.tinyproxy.svg?branch=master)](https://travis-ci.org/klibio/io.klib.tinyproxy)

[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-io.klib.tinyproxy-blue)](https://hub.docker.com/r/klibio/io.klib.tinyproxy/)


[![Stars](https://img.shields.io/docker/stars/klibio/io.klib.tinyproxy.svg)](https://hub.docker.com/r/klibio/io.klib.tinyproxy/)
[![Pulls](https://img.shields.io/docker/pulls/klibio/io.klib.tinyproxy.svg)](https://hub.docker.com/r/klibio/io.klib.tinyproxy/)

> Docker implementation of [TinyProxy](https://github.com/tinyproxy/tinyproxy)

## Getting started

For testing purpose, you may want to change the **tinyproxy.conf** and switch the **LogLevel** value to **Info** and comment the Allow line.

```
# build docker image
docker build -t tinyproxy .

# run container in background
docker run -d --name tinyproxy -p 8888:8888 tinyproxy

# proxy request via the running container
http_proxy=127.0.0.1:8888 https_proxy=127.0.0.1:8888 curl https://www.google.com -v

# or
curl -x 127.0.0.1:8888 curl https://www.google.com -v

# or proxy all requests from linux based containers
docker run -t -i \
  -e "http_proxy=tinyproxy:8888" \
  -e "https_proxy=tinyproxy:8888" \
  --link tinyproxy \
  travix/toolbox \
  curl https://www.google.com
```

## Custom Tinyproxy configuration

```
docker run -t -i \
  -v $(pwd)/tinyxproxy.conf:/etc/tinyproxy.conf
  -p 8888:8888 \
  tinyproxy
```
