#!/bin/sh

[ "$1" == "complete" ] && exit 0

user_id() {
    case $OSTYPE in
        linux*) echo "$(id -u):$(id -g)";;
        darwin*) echo "$(id -u)";;
        *) echo "OSTYPE:\"$OSTYPE\" not supported"; return 1;;
    esac
}

unset MEDIA; [ -e /media ] && MEDIA="-v /media:/media"
unset MNT; [ -e /mnt ] && MNT="-v /mnt:/mnt"


exec docker run -i --rm \
    --user $(user_id) \
    --env HOME=$HOME \
    -v $HOME:$HOME \
    -v /tmp:/tmp \
    $MEDIA \
    $MNT \
    --workdir $PWD \
    ${DKRT_REPOTAG} \
    /cli.sh "$@"
