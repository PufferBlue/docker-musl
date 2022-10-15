# *Puffer's* musl libc base image

> Saving space is a virtue

### How to use:

#### Example: build a *dnsmasq* image using musl base image

`Dockerfile`
```
FROM alpine
RUN apk add --no-cache dnsmasq

FROM pufferoverflow/musl
COPY --from=0 /usr/sbin/dnsmasq /sbin/dnsmasq
EXPOSE 53/udp
ENTRYPOINT ["/sbin/dnsmasq","-d"]
```
#### Comparison with other base images
```
REPOSITORY                   TAG                            IMAGE ID       CREATED              SIZE
dnsmasq                      musl                           27c0623671d2   2 minutes ago        948kB
dnsmasq                      alpine                         1bdfa96d4056   2 minutes ago        5.93MB
dnsmasq                      debian-slim                    236d52ecfe62   2 minutes ago        83.6MB
dnsmasq                      ubuntu                         1d54fed64a9f   2 minutes ago        80.8MB
```

### Supported architecture
+ linux/amd64
+ linux/386
+ linux/arm64
+ linux/armv7
+ linux/ppc64le
+ linux/s390x

### Github link
[PufferBlue/docker-musl](https://github.com/PufferBlue/docker-musl)
