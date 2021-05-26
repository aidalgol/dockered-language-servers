#!/bin/sh

exec docker run \
     --interactive \
     --user="$(id -u):$(id -g)" \
     --env="MIX_HOME=$HOME/.mix" \
     --mount="type=bind,source=$HOME,destination=$HOME" \
     elixir-ls:1.10 "$@"
