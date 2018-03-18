#!/bin/bash
set -eEu
set -o pipefail

# shellcheck disable=SC1091
. test/vars.bash

echo "Build images."
docker build --rm --build-arg VERSION="${VERSION}" -t "${IMAGE}" src/

echo "Show image sizes."
docker images | grep -E 'multipathd\b' | sort
