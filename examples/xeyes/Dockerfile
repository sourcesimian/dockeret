FROM python:2.7-alpine

WORKDIR /root/

RUN apk add xeyes

COPY ./cli.sh .

COPY ./dockeret.sh /
LABEL "com.github.sourcesimian.dockeret.launcher"="/dockeret.sh"
