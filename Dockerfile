# Dockerfile written by Eric Mann <eric@tozny.com>
#
# Copyright (c) 2017 Tozny, LLC

FROM php:7.1-fpm-alpine

MAINTAINER Eric Mann <eric@tozny.com>

ENV SSP_VERSION 1.14.11
ENV SSP_HASH 4899cae8e66967ad9fbf8dd0efe605b3a7c0f7a7c2c7a09e61470d623ca3a878

RUN set -x \
    && wget https://github.com/simplesamlphp/simplesamlphp/releases/download/v$SSP_VERSION/simplesamlphp-$SSP_VERSION.tar.gz \
    && echo "$SSP_HASH simplesamlphp-$SSP_VERSION.tar.gz" | sha256sum -c - \
    && cd /var \
    && tar xzf /simplesamlphp-$SSP_VERSION.tar.gz \
    && mv simplesamlphp-$SSP_VERSION simplesamlphp \
    && rm /simplesamlphp-$SSP_VERSION.tar.gz

