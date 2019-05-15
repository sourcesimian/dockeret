#!/bin/sh

[ "$1" == "complete" ] && exit 0

user_id() {
    case $OSTYPE in
        linux*) echo "$(id -u):$(id -g)";;
        darwin*) echo "$(id -u)";;
        *) echo "OSTYPE:\"$OSTYPE\" not supported"; return 1;;
    esac
}

unset TTY; [ -t 1 ] && TTY="-t"
unset MEDIA; [ -e /media ] && MEDIA="-v /media:/media"
unset MNT; [ -e /mnt ] && MNT="-v /mnt:/mnt"

exec docker run -i $TTY --rm \
    --user $(user_id) \
    --env HOME=$HOME \
    --env http_proxy=$http_proxy --env https_proxy=$https_proxy --env no_proxy=$no_proxy \
    -v $HOME:$HOME \
    -v /tmp:/tmp \
    $MEDIA \
    $MNT \
    --workdir $PWD \
    ${DKRT_REPOTAG} \
    /cli.sh "$@"
