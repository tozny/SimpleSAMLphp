docker-simplesamlphp
=============

Stable Docker container for [SimpleSAMLphp](https://simplesamlphp.org/) built on top of Alpine Linux.

Running
-------

Create a configuration file called `/params.yml` that defines your authentication sources and metadata:
 
```
# params.yml
entity_id:     This is a secret
secretsalt:    This is a secret
adminpassword: This is a secret
authsources:
  - name: This is a secret
    idp:  This is a secret
metadata:
  - entityid:       This is a secret
    metadata_set:   This is a secret
    ssos:
      binding:      This is a secret
      location:     This is a secret
    slo:
      binding:      This is a secret
      location:     This is a secret
    certdata:       This is a secret
    name_id_format: This is a secret
```


Then mount the file into the container and SimpleSAMLphp will automatically write its own configuration:

```
$ docker run -v $(pwd)/myparams.yml:/params.yml tozny/simplesamlphp
```

Credits
-------

Inspired heavily by:
* https://github.com/hcpss-banderson/docker-simplesamlphp
* https://github.com/Unicon/simplesamlphp-dockerized