# youtube-dl Dockeret

## Building
```
cd ./apps/youtube-dl/
make dockeret
```

## Usage
```
$ dkrt images
REPOSITORY                     TAG                 IMAGE ID            SIZE
sourcesimian/youtube-dl        latest              6905b635003f        109MB
...
```
```
$ dkrt sourcesimian/youtube-dl --help
Usage: youtube-dl [OPTIONS] URL [URL...]
...
```
```
$ dkrt sourcesimian/youtube-dl --extract-audio --audio-format mp3 https://www.youtube.com/watch?v=dQw4w9WgXcQ
...
```