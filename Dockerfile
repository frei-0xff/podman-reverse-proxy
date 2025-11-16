FROM docker.io/library/caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/caddyserver/replace-response

FROM docker.io/library/caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

RUN setcap -r /usr/bin/caddy

COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 8080

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
