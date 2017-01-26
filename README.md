docker-simplesamlphp
=============

Stable Docker container for [SimpleSAMLphp](https://simplesamlphp.org/) built on top of Alpine Linux.


Usage
-----

Run the image manually using:

    docker run -it --rm -v $(pwd):/workdir tozny/simplesamlphp jsduck [parameters]

Alternatively, add the following function to `~/.bash_profile`:

    jsduck() {
        docker run -it --rm -v $(pwd):/workdir tozny/jsduck jsduck $@
    }
    export -f jsduck

Once your Bash profile is reloaded, you can execute `jsduck` from the command line as if it were installed natively.