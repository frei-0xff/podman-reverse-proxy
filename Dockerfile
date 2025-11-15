FROM docker.io/library/caddy:2-alpine

COPY Caddyfile /etc/caddy/Caddyfile
RUN setcap -r /usr/bin/caddy

EXPOSE 8080

# Start Caddy (default entrypoint is fine)
