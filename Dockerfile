FROM alpine:edge

ENV KCP_VER 20161222

RUN \
    apk add --no-cache --virtual .build-deps curl \
    && mkdir -p /opt/kcptun \
    && cd /opt/kcptun \
    && curl -fSL https://github.com/xtaci/kcptun/releases/download/v$KCP_VER/kcptun-linux-amd64-$KCP_VER.tar.gz | tar xz \
    && cd ~ \
    && apk del .build-deps 
    

EXPOSE 8889/tcp 29900/udp

# ENTRYPOINT ["/usr/bin/supervisord"]
