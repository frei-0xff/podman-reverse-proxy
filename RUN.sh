#!/bin/sh

podman run --security-opt label=disable --rm -it -p 8080:8080 -e PORT=8080 -e HOST=rubanenko.inmak.net caddy
