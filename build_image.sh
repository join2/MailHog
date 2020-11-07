#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

show_help()
{
    echo "Usage: $0 [--help]"
    echo "This script builds a mailhog container listening on port 25"
    exit 255
}

if [ x"$1" == x"--help" ]; then
    show_help
fi 

pushd .
cd $SCRIPTPATH
# Also label the tag "latest"
docker build -t repository.desy.de/join2-mailhog:`date +%F_%H-%M-%S` \
             -t repository.desy.de/join2-mailhog \
             .
popd 



