FROM azul/zulu-openjdk-alpine:8

MAINTAINER "thanhbv" <thanhbv@sandinh.net>

WORKDIR /opt/ambry

RUN wget --progress=bar:force:noscroll https://github.com/ohze/ambry/releases/download/v0.3-ohze/ambry.jar && \
    # util-linux provides `/usr/bin/fallocate` for using in com.github.ambry.utils.Utils.preAllocateFileIfNeeded
    apk add --no-cache util-linux
