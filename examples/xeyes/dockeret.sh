#!/bin/sh

[ "$1" == "complete" ] && exit 0

export PATH=/sbin/:/opt/X11/bin/:$PATH

IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}') 

if which xhost >/dev/null 2>/dev/null; then
    if ! xhost + ${IP} >/dev/null; then
        echo "! Failed to add ${IP} to X access control list" >&2
        exit 1
    fi
    trap "xhost - ${IP} >/dev/null" EXIT TERM INT KILL
fi

docker run -i --rm \
    -e DISPLAY=${IP}:0 \
    ${DKRT_REPOTAG} \
     /root/cli.sh "$@"
