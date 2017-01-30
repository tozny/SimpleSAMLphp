# Dockerfile written by Eric Mann <eric@tozny.com>
#
# Copyright (c) 2017 Tozny, LLC

FROM tozny/simplesamlphp

MAINTAINER Eric Mann <eric@tozny.com>

ENV TOZNYAYTH_VERSION 1.0.0

COPY templates /srv/templates
COPY params.yml.dist /params.default.yml

RUN set -x \
    && buildDeps="ca-certificates wget" \
    && apk add --no-cache $buildDeps && update-ca-certificates \
    && rm -rf /var/cache/apk/* \
    && wget https://github.com/tozny/simplesamlphp-toznyauth-external/releases/download/$TOZNYAUTH_VERSION/toznyauth.tgz -O /tmp/toznyauth.tgz \
    && tar -xzf /tmp/toznyauth.tgz -C /srv/simplesaml/modules \
    && mv /tmp/simplesamlphp-$SSP_VERSION /srv/simplesaml \
    && rm /tmp/toznyauth.tgz \
    && touch /srv/simplesaml/modules/toznyauth/enable \
    && apk del $buildDeps

WORKDIR /srv/simplesaml

VOLUME ["/srv/simplesaml"]

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]