FROM node:current-alpine

RUN apk add bash
RUN npm install --global bash-language-server

ENTRYPOINT ["/usr/local/bin/bash-language-server"]
