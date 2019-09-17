# youtube-dl Dockeret

## Building
```sh
$ cd ./examples/youtube-dl/
$ make dockeret
...
Successfully tagged sourcesimian/youtube-dl:latest
```

## Usage
```sh
$ dkrt images
REPOSITORY                     TAG                 IMAGE ID            SIZE
sourcesimian/youtube-dl        latest              6905b635003f        109MB
...
```
```sh
$ dkrt sourcesimian/youtube-dl --help
Usage: youtube-dl [OPTIONS] URL [URL...]
...
```
```sh
$ dkrt sourcesimian/youtube-dl --extract-audio --audio-format mp3 https://www.youtube.com/watch?v=dQw4w9WgXcQ
...
```
