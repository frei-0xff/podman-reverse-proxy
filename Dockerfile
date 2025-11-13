# Use official Caddy image
FROM docker.io/library/caddy:2-alpine

# Copy our Caddy configuration file into the container
COPY Caddyfile /etc/caddy/Caddyfile

# Expose port 80 for HTTP
EXPOSE 80

# Start Caddy (default entrypoint is fine)
