#!/bin/sh

if [ "$1" = "complete" ]; then
    exit 0
fi

user_id() {
    case "$(uname)" in
        Linux*) echo "$(id -u):$(id -g)";;
        Darwin*) echo "$(id -u)";;
        *) echo "\"$(uname)\" not supported"; return 1;;
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
