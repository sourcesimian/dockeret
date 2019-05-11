# dockeret
Dockeret - Lightweight Launcher for Dockerised Applications

Run containerised apps directly from the CLI as though they are natively installed on your system. No need to remember the `docker run` invocation.
_

## Install
```
wget https://raw.githubusercontent.com/sourcesimian/dockeret/master/dkrt -O ~/bin/dkrt; chmod +x ~/bin/dkrt
```

## Usage
```
Dockeret - Containerised applet runner framework
Usage: dkrt <command>

Commands:
    <image> [args ...]    Run Dockeret image followed by any args
    images                List Dockeret images
    cleanup               Cleaup dangling Dockeret artifacts
    completion [bash]     Cat shell completion code. e.g. use in ~/.bashrc:
                            eval "$(dkrt completion bash)"
    ps ...                Show running Dockeret containers
    kill <name> ...       Kill running Dockeret containers
    logs <name> ...       View Dockeret container logs
    exec <name> [cmd] ... Exec into running Dockeret container
```

## Dockeretizing an app
Start with a Dockerized app, and then add a few more things:
 - A launcher script, and include it in your Docker image, e.g.: `/dockeret.sh`, e.g.:
   ```
    #!/bin/sh
    docker run -it --rm \
        ${DKRT_REPOTAG} \
        /usr/bin/the_app "${@}"
    ```
    ```COPY ./dockeret.sh /```
 - A Docker label that references your launcher script, e.g.:
   ```LABEL "com.github.sourcesimian.dockeret.launcher"="/dockeret.sh"```

Congratulations! Your Dockerized app is now a Dockeret and will work in the Dockeret framework.

## Examples
* [youtube-dl](./examples/youtube-dl)
* [chirp](./examples/chirp)
* [xeyes](./examples/xeyes)

## Dockeret Docker Labels
 - `com.github.sourcesimian.dockeret.launcher` reference the launcher script.
 - `com.github.sourcesimian.dockeret.man` reference a man file.
