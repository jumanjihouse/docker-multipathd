# The simplest of tests.

load vars

@test "image exists" {
  run docker images
  [[ $output =~ $IMAGE ]]
}

@test "multipath-tools is installed" {
  run docker run --rm --entrypoint=apk ${IMAGE} info -d multipath-tools
  [[ $output =~ $VERSION ]]
}
