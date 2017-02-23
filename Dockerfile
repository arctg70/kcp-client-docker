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

#/opt/kcptun/client_linux_amd64 -l :29900 -t 127.0.0.1:8989 -crypt "salsa20" --mtu 1400 --sndwnd 1024 --rcvwnd 1024 --mode "fast2"

ENV SERVER 0.0.0.0:29900
ENV LOCAL_ADDR 0.0.0.0:8999
ENV PASSWORD default
ENV CRYPY salsa20
ENV MTU 1400
ENV SNDWND 1024
ENV RCVWND 1024
ENV MODE fast2

EXPOSE $LOCAL_PORT

CMD /opt/kcptun/client_linux_amd64 -r $SERVER \
            -l $LOCAL_ADDR \
            -crypt "$CRYPY" \
            --mtu $MTU \
            --sndwnd $SNDWND \
            --rcvwnd $RCVWND \
            --mode "$MODE"
