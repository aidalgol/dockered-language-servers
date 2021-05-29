#!/bin/sh

exec docker run \
     --interactive \
     --user="$(id -u):$(id -g)" \
     --mount="type=bind,source=$HOME,destination=$HOME" \
     clojure-lsp:latest "$@"
