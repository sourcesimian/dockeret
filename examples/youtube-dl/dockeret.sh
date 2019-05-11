#!/bin/sh

user_id() {
    case $OSTYPE in
        linux*) echo "$(id -u):$(id -g)";;
        darwin*) echo "$(id -u)";;
        *) echo "OSTYPE:\"$OSTYPE\" not supported"; return 1;;
    esac
}

unset TTY; [ -t 1 ] && TTY="-t"

docker run -i $TTY --rm \
    --user $(user_id) \
    --env HOME=$HOME \
    -v $HOME:$HOME \
    -v /tmp:/tmp \
    --workdir $PWD \
    ${DKRT_REPOTAG} \
    /cli.sh "$@"
