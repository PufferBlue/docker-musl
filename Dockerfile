FROM    alpine:3.16 AS builder
ARG     TARGETARCH=amd64
ARG     TARGETVARIANT=
RUN     case $TARGETARCH$TARGETVARIANT in \
                amd64)   export arch=x86_64;; \
                386)     export arch=x86;; \
                ppc64le) export arch=ppc64le;; \
                s390x)   export arch=s390x;; \
                arm64)   export arch=aarch64;; \
                armv7)   export arch=armhf;; \
                *)       echo "Unsupported Architecture: $TARGETARCH$TARGETVARIANT" && exit 1;; esac &&\
        apk --arch $arch -X http://dl-cdn.alpinelinux.org/alpine/v3.16/main/ -U --allow-untrusted --root /tmp/target --initdb add alpine-baselayout-data musl &&\
        rm -rf /tmp/target/dev/* /tmp/target/var/* /tmp/target/etc/apk /tmp/target/lib/apk

FROM    scratch
MAINTAINER PufferOverflow
COPY    --from=builder /tmp/target/ /
