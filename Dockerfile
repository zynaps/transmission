FROM alpine:latest

WORKDIR /

COPY rootfs ./

RUN \
  set -xe && \
  apk add --no-cache transmission-daemon transmission-cli bash

ENV TRANSMISSION_WEB_HOME="/usr/share/transmission/web/"

CMD ["transmission-daemon", "-g", "/config", "-f"]
