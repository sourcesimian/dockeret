FROM ubuntu:latest

WORKDIR /

RUN apt-get update && apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:dansmith/chirp-snapshots && apt-get update && apt-get install -y chirp-daily

COPY ./cli.sh .

COPY ./dockeret.sh /
LABEL "com.github.sourcesimian.dockeret.launcher"="/dockeret.sh"
