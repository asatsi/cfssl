#!/bin/bash
export GOOS="linux"
ARCH=("amd64" "386" "arm" "arm64")
for a in "${ARCH[@]}"
do
  echo "GOOS=${GOOS} GOARCH=${a}"
  GOARCH=${a} make
  find bin/ -type f -not -name "*_*" -exec mv {} {}"_${GOOS}-${a}" \;
done
