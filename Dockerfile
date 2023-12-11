# syntax=docker/dockerfile:1

## Buildstage ##
FROM ghcr.io/linuxserver/baseimage-alpine:3.17 as buildstage

ARG MOD_VERSION

RUN apk add --no-cache git \
    && git clone --recurse-submodules=no https://github.com/KBlixt/subcleaner.git /root-layer/opt/subcleaner \
    && rm -rf /opt/subcleaner/.git

## Single layer deployed image ##
FROM scratch

# Add files from buildstage
COPY --from=buildstage /root-layer/ /
