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
			'saml:SP',
			'entityID' => '{{ $entity_id }}',
			'idp' => '{{ $authsource.idp }}',
			'discoURL' => {{ if $authsource.disco_url }}'{{ $authsource.disco_url }}'{{ else }}NULL{{ end }},
		),
	{{ end }}
);
