#!/bin/sh

exec docker run \
     --user="$(id -u):$(id -g)" \
     --mount="type=bind,source=$HOME,destination=$HOME" \
     image:tag "$@"
