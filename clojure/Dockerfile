FROM ubuntu
WORKDIR /opt/clojure-lsp
RUN apt-get update && apt-get install --no-install-recommends -y wget unzip
RUN wget https://github.com/clojure-lsp/clojure-lsp/releases/download/2021.05.27-17.42.34/clojure-lsp-native-linux-amd64.zip --no-check-certificate && \
    unzip clojure-lsp-native-linux-amd64.zip && \
    rm clojure-lsp-native-linux-amd64.zip && \
    chmod +x clojure-lsp
ENTRYPOINT ["/opt/clojure-lsp/clojure-lsp"]
