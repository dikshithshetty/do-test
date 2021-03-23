FROM elixir:1.11-alpine as builder

RUN apk add --update git build-base nodejs yarn python3 py3-pip npm

RUN mkdir /source
WORKDIR /source

RUN mix local.hex --force && mix local.rebar --force

ENV MIX_ENV=prod
ARG SECRET_KEY_BASE
ARG APP_VERSION

COPY mix.exs mix.lock config/ ./

RUN mix deps.get --only prod && mix deps.compile

COPY . . 

RUN mix compile
RUN mix release

FROM alpine:3.9
RUN apk add --update bash openssl

RUN mkdir /app
WORKDIR /app

COPY --from=builder /source/_build/prod/rel/do ./
RUN chown -R nobody: /app
USER nobody

ENV HOME=/app

CMD ["./bin/do", "start"]
