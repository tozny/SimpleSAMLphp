#!/bin/sh

# Create a parameters file if it does not exist.
if [ ! -f /params.yml ] ; then
	cat /params.default.yml >> /params.yml
fi

twit /srv/templates/authsources.php.tpl /srv/simplesaml/config/authsources.php \
	--params=/params.default.yml --params=/params.yml --no-escape

twit /srv/templates/config.php.tpl /srv/simplesaml/config/config.php \
	--params=/params.default.yml --params=/params.yml --no-escape

twit /srv/templates/saml20-idp-remote.php.tpl \
	/srv/simplesaml/metadata/saml20-idp-remote.php \
	--params=/params.default.yml --params=/params.yml --no-escape

"$@"