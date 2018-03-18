#!/bin/bash
set -eEu
set -o pipefail

if [[ -z "${CIRCLECI}" ]]; then
  echo This only runs on circleci. >&2
  exit 1
fi

# shellcheck disable=SC1091
. test/vars.bash

if [[ "${CIRCLE_BRANCH}" == "master" ]]; then
  TAG="${VERSION}-$(date +%Y%m%dT%H%M)-git-${GIT_HASH:0:7}"
  tags="${TAG} latest"
else
  TAG="${CIRCLE_PR_USERNAME}_pull_${CIRCLE_PR_NUMBER}"
  tags="${TAG}"
fi

# shellcheck disable=SC2154
docker login -u "${user}" -p "${pass}" quay.io

for tag in ${tags}; do
  docker tag -f "${IMAGE}" "${IMAGE}:${tag}"
  docker push "${IMAGE}:${tag}"
done

docker logout
