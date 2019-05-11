#!/bin/sh

export PATH=/sbin/:/opt/X11/bin/:$PATH

IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

if ! xhost + ${IP} >/dev/null; then
	echo "! Failed to add ${IP} to X access control list" >&2
	exit 1
fi
trap "xhost - ${IP} >/dev/null" EXIT TERM INT KILL

docker run -i --rm \
    --env DISPLAY=${IP}:0 \
    ${DKRT_REPOTAG} \
     /root/cli.sh "${@}"
