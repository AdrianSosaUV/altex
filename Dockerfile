FROM alpine:edge

ARG scheme=texlive

COPY \
  LICENSE \
  README.md \
  /

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing">> /etc/apk/repositories
RUN cat /etc/apk/repositories

RUN apk update && apk add texmf-dist ${scheme}
RUN if [ "$scheme"="texlive" ]; then apk update && apk add texmaker ; else echo "${scheme} It's complete"; fi 