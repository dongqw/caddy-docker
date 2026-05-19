FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/caddy-dns/tencentcloud \
    --with github.com/caddy-dns/huaweicloud \
    --with github.com/caddy-dns/alidns \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
