FROM debian:stable-slim
WORKDIR /opt/clojure-lsp
RUN apt-get update && apt-get install --yes wget unzip
RUN wget https://github.com/clojure-lsp/clojure-lsp/releases/download/2021.05.27-17.42.34/clojure-lsp-native-linux-amd64.zip && \
    unzip clojure-lsp-native-linux-amd64.zip && \
    rm clojure-lsp-native-linux-amd64.zip && \
    chmod +x clojure-lsp
ENTRYPOINT ["/opt/clojure-lsp/clojure-lsp"]
