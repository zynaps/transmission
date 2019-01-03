FROM alpine:latest
LABEL maintainer="Igor Vinokurov <zynaps@zynaps.ru>"

WORKDIR /

COPY . ./

RUN \
  set -xe && \
  apk add --no-cache transmission-daemon transmission-cli

VOLUME ["/config", "/downloads", "/watch"]

EXPOSE 9091/tcp 51413/tcp 51413/udp

ENV TRANSMISSION_WEB_HOME="/usr/share/transmission/web/"

CMD ["transmission-daemon", "-g", "/config", "-f"]
