#!/bin/sh

# Create a parameters file if it does not exist.
if [ ! -f /params.yml ] ; then
	cat /params.default.yml >> /params.yml
fi

# only generate cert if the GEN_CERT env var is set (doesn't matter with what though)
if [ -z "$GEN_CERT" ]; then
  cd /srv/simplesaml/cert && openssl req -new -x509 -days 3652 -nodes -out server.cert -keyout server.pem -subj "/C=US/ST=Oregon/L=Portland/O=Tozny SimpleSAMLphp/OU=IT Department/CN=tozny.com"
fi

twit /srv/templates/authsources.php.tpl /srv/simplesaml/config/authsources.php \
	--params=/params.default.yml --params=/params.yml --no-escape

twit /srv/templates/config.php.tpl /srv/simplesaml/config/config.php \
	--params=/params.default.yml --params=/params.yml --no-escape

twit /srv/templates/saml20-idp-hosted.php.tpl \
	/srv/simplesaml/metadata/saml20-idp-hosted.php \
	--params=/params.default.yml --params=/params.yml --no-escape

"$@"
