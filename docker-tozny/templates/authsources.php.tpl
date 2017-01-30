<?php

$config = array(
	// This is a authentication source which handles admin authentication.
	'admin' => array(
		// The default is to use core:AdminPassword, but it can be replaced with
		// any authentication source.
		'core:AdminPassword',
	),

	{{ $entity_id := .entity_id }}
	{{ range $authsource := .authsources  }}
		'{{ $authsource.name }}' => array(
			'toznyauth:External',
			'realm_key_id'     => '{{ $authsource.realm_key_id }}',
			'realm_secret_key' => '{{ $authsource.realm_secret_key }}',
			'api_url'          => {{ if $authsource.api_url }}'{{ $authsource.api_url }}'{{ else }}'https://api.tozny.com/'{{ end }},
			'attributes'       => array(
				'IDPEmail' => 'urn:oasis:names:tc:SAML:2.0:attrname-format:emailAddress',
			),
		),
	{{ end }}
);
