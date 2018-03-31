#!/bin/sh

VERSION=$1

cat <<EOF >/tmp/multi.yml
image: chrberger/cluon-livefeed-multi:$VERSION
manifests:	
  - image: chrberger/cluon-livefeed-amd64:$VERSION
    platform:
      architecture: amd64
      os: linux
  - image: chrberger/cluon-livefeed-armhf:$VERSION
    platform:
      architecture: arm
      os: linux
  - image: chrberger/cluon-livefeed-aarch64:$VERSION
    platform:
      architecture: arm64
      os: linux
EOF
manifest-tool-linux-amd64 push from-spec /tmp/multi.yml
