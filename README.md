Multipathd in a container
=========================

Overview
--------

Provide HA access to SAN LUNs via a tiny container
based on [Alpine Linux](https://www.alpinelinux.org/).

* Github repo: https://github.com/jumanjihouse/docker-multipathd
* Images: https://quay.io/repository/jumanjiman/multipathd


Pull an already-built image
---------------------------

We publish images for master branch plus each (clean) pull request.
The following tags are available:

* `quay.io/jumanjiman/multipathd:latest`, which always points to the most recent build on master
* `quay.io/jumanjiman/multipathd:<version>-YYYYMMDDTHHMM-git-<hash>`, where...
   - `<version>` is the version of multipath-tools
   - `<hash>` is a git hash of master branch


Contribute
----------

Fork [this repo](https://github.com/jumanjihouse/docker-multipathd)
and see [CONTRIBUTING.md](CONTRIBUTING.md).

We use a [`.editorconfig`](.editorconfig) file to help maintain
consistent style across files in this repo. We recommend you install
an [editorconfig plugin](http://editorconfig.org/#download) for
your favorite editor.


### Open a pull request to get started

![simplified workflow](assets/docker_workflow.png)

You can smoke-test your images after CircleCI marks your PR green:

    # On a test host...
    #
    # docker pull quay.io/jumanjiman/multipathd:<handle>_pull_<number>
    #
    docker pull quay.io/jumanjiman/multipathd:jumanjiman_pull_1

    # Then run your smoke-tests to verify the image works.

:warning: **You must `docker pull` after every test build when working in a PR.**

We don't currently have an automated way to delete pull tags on quay.io
after a PR is closed (abandoned or merged), so we have to delete stale tags
manually.


### Operational status of SaaS providers

CircleCI: [http://status.circleci.com/](http://status.circleci.com/)

Quay registry: [http://status.quay.io/](http://status.quay.io/)


Build and test images locally
-----------------------------

On a host, such as devenv:

    # Build image.
    script/build

    # Run the simplest of tests.
    script/test


License
-------

See [LICENSE.md](LICENSE.md).
