FROM ubuntu:latest

WORKDIR /root/

ADD http://www.gpsdump.no/gpsdump.64bit.0.24 ./gpsdump
RUN chmod a+rx ./gpsdump

#RUN apt-get update && apt-get install -y software-properties-common
#RUN apt-add-repository -y ppa:dansmith/chirp-snapshots && apt-get update && apt-get install -y chirp-daily

COPY ./cli.sh .

COPY ./dockeret.sh /
LABEL "com.github.sourcesimian.dockeret.launcher"="/dockeret.sh"
