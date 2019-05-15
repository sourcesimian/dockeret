FROM alpine:latest

WORKDIR /

RUN apk add perl

RUN wget https://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-11.42.tar.gz; tar -zxf Image-ExifTool-11.42.tar.gz; rm -rf Image-ExifTool-11.42.tar.gz

COPY ./cli.sh .

COPY ./dockeret.sh /
LABEL "com.github.sourcesimian.dockeret.launcher"="/dockeret.sh"
