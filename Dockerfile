FROM alpine:edge

ARG scheme=texlive

COPY \
  LICENSE \
  README.md \
  /

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing">> /etc/apk/repositories
RUN cat /etc/apk/repositories

RUN apk update && apk add texmf-dist ${scheme}
RUN apk update && apk add texmaker