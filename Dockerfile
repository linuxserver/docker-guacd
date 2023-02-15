# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-alpine:3.15 as guacbuilder

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

# add local files
COPY /root /

# ports
EXPOSE 4822
