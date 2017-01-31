Dockerized SimpleSAMLphp
========================

Docker container configuration for [SimpleSAMLphp](https://simplesamlphp.org/) built on top of Alpine Linux

Includes build routines for both vanilla SimpleSAMLphp and a container preconfigured with the [Tozny IDP module](https://tozny.com/blog/simplesamlphp-tozny/).

Building
--------

This project builds two Docker images, one each for:

- a vanilla SimpleSAMLphp server
- a Tozny Authentication-enabled SimpleSAMLphp server

To build either project, `cd` into the appropriate directory and run `docker build .`. Both containers are otherwise available on Docker Hub.

Running the Examples
--------------------

There are two example Docker Compose projects available to illustrate how the new containers can be used with Nginx as a front-end proxy. To run either project, `cd` into the appropriate directory, configure your parameters, and run `docker-compose up`.

### Configuration

Create a configuration file called `/params.yml` that defines your authentication sources and metadata (feel free to use `params.yml.dist` as an example):
 
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

This file needs to be mounted into the container, either directly via:

```
$ docker run -v $(pwd)/myparams.yml:/params.yml tozny/simplesamlphp
```

or as a volume in `docker-compose.yml`. Either way, upon first run the container will automatically write SimpleSAMLphp's configuration files for you based on this document.

The two stacks will run on `localhost`, the vanilla server will be exposed on port 8080 and the one with Tozny integrated on port 8090.

Credits
-------

Docker files inspired heavily by:
* https://github.com/hcpss-banderson/docker-simplesamlphp
* https://github.com/Unicon/simplesamlphp-dockerized