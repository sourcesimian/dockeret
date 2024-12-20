FROM python:2.7-alpine

WORKDIR /

RUN apk add ffmpeg

RUN wget https://codeload.github.com/ytdl-org/youtube-dl/zip/d55d1f423d6473ae6a9e13462d94bad1d71d28e0 -O /tmp/youtube-dl.zip
RUN unzip /tmp/youtube-dl.zip
RUN cp -r /youtube-dl-*/youtube_dl /usr/local/lib/python2.7/site-packages
RUN cp -r /youtube-dl-*/bin/youtube-dl /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl

COPY ./cli.sh .

COPY ./dockeret.sh /
LABEL "com.github.sourcesimian.dockeret.launcher"="/dockeret.sh"
