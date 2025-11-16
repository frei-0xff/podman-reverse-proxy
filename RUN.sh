#!/bin/sh

[ ! -f .env ] || export $(grep -v '^#' .env | xargs)

podman run --security-opt label=disable --rm -it -p 8080:8080 -e PORT=8080 -e HOST=$HOST -e UPSTREAM=$UPSTREAM reverse-proxy
