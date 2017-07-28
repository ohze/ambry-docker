FROM azul/zulu-openjdk-alpine:8

MAINTAINER "thanhbv" <thanhbv@sandinh.net>

WORKDIR /opt/ambry

RUN addgroup -S -g 500 ambry && \
    mkdir -p /opt/ambry && \
    adduser -S -D -G ambry -u 500 -h /opt/ambry -s /bin/sh ambry && \
    wget --progress=bar:force:noscroll https://github.com/ohze/ambry/releases/download/v0.3-ohze/ambry.jar && \
    chown ambry:ambry /opt/ambry/ambry.jar && \
#    util-linux provides `/usr/bin/fallocate` for using in com.github.ambry.utils.Utils.preAllocateFileIfNeeded
    apk add --no-cache util-linux

USER ambry
