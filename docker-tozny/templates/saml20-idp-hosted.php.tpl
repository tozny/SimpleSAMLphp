<?php
/**
 * SAML 2.0 IdP configuration for SimpleSAMLphp.
 *
 * See: https://simplesamlphp.org/docs/stable/simplesamlphp-reference-idp-hosted
 */

{{ range $metadata := .metadata }}
$metadata['{{ $metadata.entityid }}'] = array(
    // The hostname of the server this SAML entity will use.
    'host'        =>  '{{ $metadata.host }}',
    // X.509 key and certificate. Relative to the /cert directory.
    'privatekey'  => '{{ $metadata.privatekey }}',
    'certificate' => '{{ $metadata.certificate }}',
    'auth'        => '{{ $metadata.authsource }}',
);

{{ end }}
