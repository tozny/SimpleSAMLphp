<?php
/**
 * SAML 2.0 remote SP metadata for SimpleSAMLphp.
 *
 * See: https://simplesamlphp.org/docs/stable/simplesamlphp-reference-sp-remote
 */

{{ range $spremote := .spremote }}
$metadata['{{ $spremote.entityid }}'] = array(
   'AssertionConsumerService'      => '{{ $spremote.assertionconsumerservice }}',
   'NameIDFormat'                  => '{{ $spremote.nameidformat }}',
   'simplesaml.nameidattribute'    => '{{ $spremote.ssnameidattribute }}',
   'simplesaml.attributes'         =>  {{ $spremote.ssattributes | yesno "true" "false" }},
);

{{ end }}
