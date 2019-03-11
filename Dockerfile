FROM alpine:latest

LABEL "com.github.actions.name"="Hugo Actions"
LABEL "com.github.actions.description"="Commands to help with building Hugo based static sites"
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="yellow"

LABEL "repository"="http://github.com/srt32/hugo-actions"
LABEL "homepage"="http://github.com/srt32/hugo-actions"

RUN apk add --no-cache hugo bash

RUN apk add --no-cache --update \
        curl \
        git \
        optipng \
        jpegoptim \
        ca-certificates \
  && curl -L https://github.com/gohugoio/hugo/releases/download/v0.54.0/hugo_0.54.0_Linux-64bit.tar.gz | \
        tar -xz hugo -C /usr/local/bin/

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
