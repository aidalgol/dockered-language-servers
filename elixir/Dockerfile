ARG ELIXIR_VER
ARG OTP_VER
ARG ALPINE_VER=3.13.3
FROM hexpm/elixir:${ELIXIR_VER}-erlang-${OTP_VER}-alpine-${ALPINE_VER} AS build
WORKDIR /opt/
ARG ELIXIR_LS_VER=0.7.0
RUN wget https://github.com/elixir-lsp/elixir-ls/archive/refs/tags/v$ELIXIR_LS_VER.tar.gz
RUN apk add git
RUN tar -xf v$ELIXIR_LS_VER.tar.gz && \
    cd elixir-ls-$ELIXIR_LS_VER && \
    mix local.hex --force && mix local.rebar --force && \
    mix do deps.get, compile, elixir_ls.release -o /opt/elixir-ls

FROM hexpm/elixir:${ELIXIR_VER}-erlang-${OTP_VER}-alpine-${ALPINE_VER}
ARG ELIXIR_LS_VER
COPY --from=build /opt/elixir-ls /opt/elixir-ls
RUN chmod a+x /opt/elixir-ls/*.sh
ENTRYPOINT ["/opt/elixir-ls/language_server.sh"]
