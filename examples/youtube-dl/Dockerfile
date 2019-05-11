FROM python:2.7-alpine

WORKDIR /

RUN wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl; chmod a+rx /usr/local/bin/youtube-dl

RUN apk add ffmpeg

COPY ./cli.sh .

COPY ./dockeret.sh /
LABEL "com.github.sourcesimian.dockeret.launcher"="/dockeret.sh"
