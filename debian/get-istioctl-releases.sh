#!/bin/bash
set -xe

if [[ -z $1 ]];
then
    echo "usage: ${0} 1.6.14 1.10.1 .."
    exit 1
fi

mkdir -p _output/bin
pushd _output

for upstream_version in $1
do
    ISTIO_TAR_FILENAME="istio-${upstream_version}-linux-amd64.tar.gz"
    TAR_URL="https://github.com/istio/istio/releases/download/${upstream_version}/${ISTIO_TAR_FILENAME}"
    TAR_SHA_URL="${TAR_URL}.sha256"
    if [[ ! -f $ISTIO_TAR_FILENAME ]]; then wget ${TAR_URL}; fi
    if [[ ! -f "${ISTIO_TAR_FILENAME}.sha256" ]]; then wget ${TAR_SHA_URL}; fi
    sha256sum ${ISTIO_TAR_FILENAME}
    tar xvf ${ISTIO_TAR_FILENAME}
    chmod 755 istio-${upstream_version}/bin/istioctl
    cp istio-${upstream_version}/bin/istioctl bin/istioctl-${upstream_version}
done

popd